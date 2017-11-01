/*!
 * FileUpload v1.0
 * Copyright 2011-2014 Wecenter, Inc.
 * Date: 2014-06-02
 */
function FileUpload (type, element, container, url, options, callback)
{
    var _this = this;
    this.type = type;
    this.element = element;
    this.container = container;
    this.url = url;
    this.options = {
        'multiple' : true,
        'deleteBtn' : true,
        'insertBtn' : true,
        'insertTextarea' : '.wmd-input',
        'template' : '<li>'+
        '<div class="img"></div>'+
        '<div class="content">'+
        '<p class="title"></p>'+
        '<p class="size"></p>'+
        '<p class="meta"></p>'+
        '</div>'+
        '</li>',
        'deleteBtnTemplate' : '<a class="delete-file">删除</a>' ,
        'insertBtnTemplate' : '<a class="insert-file">插入</a>'
    };
    if (options.editor)
    {
        this.editor = options.editor;
    }

    this.options = $.extend(this.options, options);

    this.callback = callback;

    if (type == 'file')
    {
        this.init(element, container);
    }
    else
    {
        var form = this.createForm(),
            input = this.createInput();

        $(element).prepend($(form).append(input));
    }
}

FileUpload.prototype =
{
    // 初始化上传器
    init : function (element, container)
    {
        var form = this.createForm(),
            input = this.createInput();

        $(element).prepend($(form).append(input));

        $(container).append('<ul class="upload-list"></ul>');
    },

    // 创建表单
    createForm : function ()
    {
        var form = this.toElement('<form method="post" enctype="multipart/form-data"><input type="submit" class="submit" /></form>');

        $(form).attr({
            'id' : 'upload-form',
            'action' : this.url,
            'target' : 'ajaxUpload'
        });

        this.form = form;

        return form;
    },

    // 创建input
    createInput : function ()
    {
        var _this = this, input = this.toElement('<input type="file" />');

        $(input).attr({
            'class' : 'file-input',
            'name' : 'aws_upload_file',
            'multiple' : this.options.multiple ? 'multiple' : false
        });

        // 创建input file
        // 当此input改变时触发addFileList事件
        $(input).change(function()
        {
            _this.addFileList(this);
        });

        return input;
    },

    // 创建隐藏域 (wecenter定制)
    createHiddenInput : function(attach_id)
    {
        var _this = this, input = this.toElement('<input type="hidden" name="attach_ids[]" class="hidden-input" />');

        $(input).val(attach_id);

        return input;
    },

    // 创建iframe
    createIframe : function ()
    {
        var iframe = this.toElement('<iframe></iframe>');
        $(iframe).attr({
            'class': 'hide upload-iframe',
            'name': 'ajaxUpload'
        });
        return iframe;
    },

    // 添加文件列表
    addFileList : function (input)
    {

        var files = $(input)[0].files;
        if (files && this.type == 'file')
        {
            for (i = 0; i < files.length; i++)
            {
                this.li = this.toElement(this.options.template);
                this.file = files[i];
                $(this.container).find('.upload-list').append(this.li);
                this.upload(files[i], this.li);//文件上传 
            }
        }
        else
        {
            if (this.type == 'file')
            {
                this.li = this.toElement(this.options.template);
                $(this.container).find('.upload-list').append(this.li);
                this.upload('', this.li);
            }
            else
            {
                this.upload('');
            }
        }

    },

    // 上传功能
    upload : function (file, li)
    {
        var _this = this;
        if(file){
            var new_data = '';
            var reader = new FileReader();

            reader.onload = function(){
                function callback(){
                    var data = '';
                    if(img.src.length>102400){
                        data = compress(img);
                        new_data = imgUpload(data,file.type);
                    }
                    if(new_data.length==0){
                        new_data = file;
                    }

                    if (new_data)
                    {
                        var xhr = new XMLHttpRequest(), status = false;

                        xhr.upload.onprogress = function(event)
                        {
                            if (event.lengthComputable)
                            {
                                var percent = Math.round(event.loaded * 100 / event.total);
                            }
                            $(li).find('.title').html(file.name);
                            $(li).find('.size').html(percent + '%');
                        };

                        xhr.onreadystatechange = function()
                        {
                            _this.oncomplete(xhr, li, file, data.length);
                        };
                        var url = _this.url + '&aws_upload_file=' + new_data.name + '&timestamp=' + new Date().getTime() + '&fname='+file.name;
                        xhr.open("POST", url);
                        xhr.send(new_data);
                    }
                    img = null;
                }
                var result = this.result;
                var img = new Image();
                img.src = result;
                if(img.complete){
                    callback();
                }else{
                    img.onload = callback;  
                }
            }
            reader.readAsDataURL(file);
        }else{
            //低版本ie上传
            var iframe = this.createIframe();

            if (this.options.loading_status)
            {
                $(this.options.loading_status).show();
            }

            if (iframe.addEventListener)
            {
                iframe.addEventListener('load', function()
                {
                    _this.getIframeContentJSON(iframe, _this.container);
                }, false);
            } else if (iframe.attachEvent)
            {
                iframe.attachEvent('onload', function()
                {
                    _this.getIframeContentJSON(iframe, _this.container);
                });
            }

            $('#aw-ajax-box').append(iframe);

            $(this.form).find('.submit').click();
        }
        
    },

    // 从iframe获取json内容
    getIframeContentJSON : function (iframe, container)
    {
        var doc = iframe.contentDocument ? iframe.contentDocument: iframe.contentWindow.document,response, filename;

        if (doc.body.innerHTML) {
        	response = eval("(" + doc.body.innerHTML + ")");
        } else {
            return;
        }

        if (this.type == 'file')
        {
            this.render(this.li, response);

            filename = this.getName($('#upload-form .file-input')[0].value);

            $(this.li).find('.title').html(filename);
        }
        else
        {
            $(this.options.loading_status).hide();

            if ($(this.container).attr('src'))
            {
                $(this.container).attr('src', response.thumb + '?' + Math.round(Math.random() * 10000));
                $('#img_url').html(response.thumb);
            }
            else
            {
                $(this.container).css(
                    {
                        'background' : 'url(' + response.thumb + '?' + Math.round(Math.random() * 10000) + ')'
                    });
            }
        }

        $('.upload-iframe').detach();

        this.oncallback();
    },

    // ajax完成callback
    oncomplete : function (xhr, li, file ,length)
    {
        var _this = this, response, filesize = this.getFIleSize(file);
        if(length>0 && length<1024*1024*4){
            filesize = this.getSize(length);
        }else{
            // 文件太大特殊处理 - by yake
             if (file.size > 1024 * 1024 * 4) {
                 response = eval("({'error':'文件尺寸过大，不能超过4M'})");
                this.render(li, response, filesize);
                return;
             }
        }
        
        
        if (xhr.readyState == 4 && xhr.status == 200)
        {
            try
            {
                response = eval("(" + xhr.responseText + ")");

                this.render(li, response, filesize);
            }
            catch(err)
            {
                response = {};
            }
        }
    },

    // 此功能配合编辑器
    oncallback : function ()
    {
        if (this.callback)
        {
            this.callback();
        }
    },

    // 渲染缩略列表
    render : function (element, json, filesize)
    {
        if (json)
        {
            if (!json.error)
            {
                switch (json.class_name)
                {
                    case 'txt':
                        $(element).find('.img').addClass('file').html('<i class="icon icon-file"></i>');
                        break;

                    default :
                        $(element).find('.img').css(
                            {
                                'background': 'url("' + json.thumb + '")'
                            }).addClass('active').attr('data-img', json.thumb);
                        break;
                }

                if (filesize)
                {
                    $(element).find('.size').html(filesize);
                }

                if (this.options.deleteBtn && json.delete_url)
                {
                    var btn = this.createDeleteBtn(json.delete_url);

                    $(element).find('.meta').append(btn);
                }

                if (this.options.insertBtn && json.delete_url && !json.class_name)
                {
                    var btn = this.createInsertBtn(json.attach_id);

                    $(element).find('.meta').append(btn);
                }

                // 插入隐藏域(wecenter定制)
                $(element).append(this.createHiddenInput(json.attach_id));

                this.oncallback();
            }
            else
            {
                // $(element).addClass('error').find('.img').addClass('error').html('<i class="icon icon-delete"></i>');
                $(element).addClass('error').find('.img').addClass('error').html('');

                $(element).find('.size').text(json.error);
            }
        }
    },

    toElement : function (html)
    {
        var div = document.createElement('div');
        div.innerHTML = html;
        var element = div.firstChild;
        div.removeChild(element);
        return element;
    },

    // 获取文件名
    getName : function (filename)
    {
        return filename.replace(/.*(\/|\\)/, "");
    },

    // 获取文件大小
    getFIleSize : function (file)
    {
        var filesize;
        if (file.size > 1024 * 1024)
        {
            filesize = (Math.round(file.size * 100 / (1024 * 1024)) / 100).toString() + 'MB';
        }
        else
        {
            filesize = (Math.round(file.size * 100 / 1024) / 100).toString() + 'KB';
        }
        return filesize;
    },

    getSize : function(size)
    {
        var filesize;
        if (size > 1024 * 1024)
        {
            filesize = (Math.round(size * 100 / (1024 * 1024)) / 100).toString() + 'MB';
        }
        else
        {
            filesize = (Math.round(size * 100 / 1024) / 100).toString() + 'KB';
        }
        return filesize;
    },

    // 创建插入按钮
    createInsertBtn : function (attach_id)
    {
        var btn = this.toElement(this.options.insertBtnTemplate), _this = this;

        $(btn).click(function()
        {
            if (typeof CKEDITOR != 'undefined')
            {
                _this.editor.insertText("\n[attach]" + attach_id + "[/attach]\n");
            }
            else
            {
                _this.editor.val( _this.editor.val() + "\n[attach]" + attach_id + "[/attach]\n");
            }
        });

        return btn;
    },

    // 创建删除按钮
    createDeleteBtn : function (url)
    {
        var btn = this.toElement(this.options.deleteBtnTemplate);

        $(btn).click(function()
        {
            if (confirm('确认删除?'))
            {
                var _this = this;
                $.get(url, function (result)
                {
                    if (result.errno == "-1")
                    {
                        AWS.alert(result.err);
                    }
                    else
                    {
                        $(_this).parents('li').detach();
                    }
                }, 'json');
            }
        });

        return btn;
    },

    // 初始化文件列表
    setFileList : function (json)
    {
        var template = '<li>';

        if (!json.is_image)
        {
            template += '<div class="img file"><i class="icon icon-file"></i></div>';
        }
        else
        {
            template += '<div class="img" data-img="' + json.thumb + '" style="background:url(' + json.thumb + ')"></div>';
        }

        template += '<div class="content">'+
        '<p class="title">' + json.file_name + '</p>'+
        '<p class="size"></p>'+
        '<p class="meta"></p>'+
        '</div>'+
        '</li>';
        var insertBtn = this.createInsertBtn(json.attach_id),
            deleteBtn = this.createDeleteBtn(json.delete_link),
            hiddenInput = this.createHiddenInput(json.attach_id);

        template = this.toElement(template), _this = this;

        $(template).find('.meta').append(deleteBtn);
        $(template).find('.meta').append(insertBtn);
        $(template).find('.meta').append(hiddenInput);
        $(this.container).find('.upload-list').append(template);
    }
}

function uploadFileDone(android_delete_url,android_attach_id,android_thumb,android_orig_name,android_file_size)
{
    $("#upload_img").append("<li>"+
        "<div class='img active' style='background: url("+android_thumb+")'></div>"+
        "<div class='content'><p class='title'>"+android_orig_name+"</p><p class='size'>"+android_file_size+"KB</p></div>"+
        "<input type='hidden' name='attach_ids[]' class='hidden-input' value="+android_attach_id+">"+
        "</li>");
}

function uploadPortraitFileDone()
{
    window.location.reload();
}

// 压缩
    function compress(img) {
        var initSize = img.src.length;
        var width = img.width;
        var height = img.height;

        var canvas = document.createElement("canvas");
        var ctx = canvas.getContext("2d");

        // 瓦片canvas
        var tCanvas = document.createElement("canvas");
        var tctx = tCanvas.getContext("2d");

        //如果图片大于四百万像素，计算压缩比并将大小压至400万以下
        var ratio;
        if ((ratio = width * height / 4000000)>1) {
            if(width>1024){
                ratio = width/1024;
                width = 1024;
                height /= ratio;
            }else{
                ratio = Math.sqrt(ratio);
                width /= ratio;
                height /= ratio;
            }
           
        }else {
            ratio = 1;
        }

        canvas.width = width;
        canvas.height = height;

    //        铺底色
        ctx.fillStyle = "#fff";
        ctx.fillRect(0, 0, canvas.width, canvas.height);

        //如果图片像素大于100万则使用瓦片绘制
        var count;
        if ((count = width * height / 1000000) > 1) {
            count = ~~(Math.sqrt(count)+1); //计算要分成多少块瓦片

            //计算每块瓦片的宽和高
            var nw = ~~(width / count);
            var nh = ~~(height / count);

            tCanvas.width = nw;
            tCanvas.height = nh;

            for (var i = 0; i < count; i++) {
                for (var j = 0; j < count; j++) {
                    tctx.drawImage(img, i * nw * ratio, j * nh * ratio, nw * ratio, nh * ratio, 0, 0, nw, nh);

                    ctx.drawImage(tCanvas, i * nw, j * nh, nw, nh);
                }
            }
        } else {
            ctx.drawImage(img, 0, 0, width, height);
        }

        //进行最小压缩
        var ndata = canvas.toDataURL("image/jpeg", 0.7);

        tCanvas.width = tCanvas.height = canvas.width = canvas.height = 0;

        return ndata;
    }

 //    图片上传，将base64的图片转成二进制对象，塞进formdata上传
    function imgUpload(basestr, type) {
        var text = window.atob(basestr.split(",")[1]);
        var buffer = new ArrayBuffer(text.length);
        var ubuffer = new Uint8Array(buffer);
        var pecent = 0 , loop = null;

        for (var i = 0; i < text.length; i++) {
            ubuffer[i] = text.charCodeAt(i);
        }

        var Builder = window.WebKitBlobBuilder;
        var blob1;

        if (Builder) {
            var builder = new Builder();
            builder.append(buffer);
            blob1 = builder.getBlob(type);
        } else {
            blob1 = new window.Blob([buffer], {type: type});
        }

        var formdata = new FormData();
        formdata.append("imagefile", blob1);
        return formdata;
    }
    // 获取blob对象的兼容性写法
    function getBlob(buffer, format){
        var Builder = window.WebKitBlobBuilder || window.MozBlobBuilder;
        if(Builder){
            var builder = new Builder;
            builder.append(buffer);
            return builder.getBlob(format);
        } else {
            return new window.Blob([ buffer ], {type: format});
        }
    }
