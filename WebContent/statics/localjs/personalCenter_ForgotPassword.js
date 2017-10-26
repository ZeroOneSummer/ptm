 var _hmt = _hmt || [];
        (function() {
          var hm = document.createElement("script");
          hm.src = "https://hm.baidu.com/hm.js?6938787281b59cbc7fcb6a9381463695";
          var s = document.getElementsByTagName("script")[0];
          s.parentNode.insertBefore(hm, s);
        })();
        
        var action_type = 'find_pay_pwd';
        $(document).ready(function(){
            checkInput();
            $('#newpassword').focus(function(){
                $("body").keydown(function(event){
                    if (event.keyCode == 13){
                        form_submit();
                    }  
                    //回车键的键值为13
                });
            });
        });

        function form_submit(){
            if ( checkForm() ){
                var url = '';
                var data = '';
                if (action_type == 'find_pwd') {
                    url = "https://deposit.koudailc.com/user/reset-password?clientType=pc";
                    data = {
                        phone:$('#phone').val(),
                        realname:$('#realname').val(),
                        id_card:$('#id_card').val(),
                        code:$('#code').val(),
                        password:$('#password').val()
                    };
                }else{
                    url = "https://deposit.koudailc.com/user/reset-paypassword?clientType=pc";
                    data = {
                        phone:'14760701657',
                        realname:'吴涛',
                        id_card:$('#id_card').val(),
                        code:$('#code').val(),
                        password:$('#password').val()
                    };
                }

                AjaxJsonP(callResetPwd,url,data);
            }
        }

        function callResetPwd(data){
            if (data.code == 0){
                // $('#notification').html('操作成功');
                alert('操作成功');
                history.go(-1);
            }else{
                $('#notification').html(data.message);
            }
        }


        function checkForm(){
            $('#notification').html('');
            var bool = true;
            if (action_type == 'find_pwd'){
                if ( '' == $.trim($('#phone').val())){
                    $('#notification').html('手机号不能为空');
                    bool = false;
                }

                if ( '' == $.trim($('#realname').val())){
                    $('#notification').html('真名不能为空');
                    bool = false;
                }

                if (!reglx_phone($('#phone').val()) ){
                    $('#notification').html('请输入正确的手机号');
                    bool = false;
                }
            }


            if ( '' == $.trim($('#id_card').val())){
                $('#notification').html('身份证不能为空');
                bool = false;
            }

            if ('' == $.trim($('#code').val()) ){
                $('#notification').html('验证码不能为空');
                bool = false;
            }

            if ('' == $.trim($('#password').val()) ){
                $('#notification').html('新密码不能为空');
                bool = false;
            }

            if ('' == $.trim($('#newpassword').val()) ){
                $('#notification').html('确认密码不能为空');
                bool = false;
            }

            if ($.trim($('#password').val()) != $.trim($('#newpassword').val()) ){
                $('#notification').html('密码不一致');
                bool = false;
            }
            if ( $('#password').val().length < 6 || $('#password').val().length > 16 ){
                $('#notification').html('密码长度应为大于6位小于16位');
                bool = false;
            }

            if (!reglx_idcard15($('#id_card').val()) && !reglx_idcard18($('#id_card').val())){
                $('#notification').html('请输入正确的身份证号');
                bool = false;
            }


            return bool;
        }

        function checkInput(){
            var string_reg = /[^0-9.]/g;
            perg_str("money",string_reg);
        }


        $('#getcode').click(function(){
            $_this = $(this);
            var url = "https://deposit.koudailc.com/user/reset-pwd-code?clientType=pc";
            if( !$_this.hasClass("btn_eb4444") ){
                var phone = '';
                if (action_type == 'find_pwd'){
                    phone = $('#phone').val();
                }else if (action_type == 'find_pay_pwd'){
                    phone = '14760701657';
                }
                var data = {
                    phone:phone,
                    type:action_type
                };

                AjaxJsonP(CallgetCode,url,data);


            }
        });

        function CallgetCode(data){
            if(data.code == 0){
                $("#notification").html('');
                var total = 60;
                $_this.html(total+"秒重新获取");
                $_this.addClass("btn_eb4444");
                var interId = setInterval(function () {
                    total--;
                    $_this.html(total + "秒重新获取");
                    if (total <= 0) {
                        clearInterval(interId);
                        $_this.html("重新获取");
                        $_this.removeClass("btn_eb4444");
                    }
                } , 1000);
            }else{
                $("#notification").html(data.message);
            }
        }


        $(document).ready(function(){
            // 底部相关 begin
            $('.site-info .logo').addClass("_hidden");
            $('.site-info .logo').parent("a").mouseover(function(){
                $(this).find("img").addClass("_hidden");
                $(this).find(".logo").removeClass("_hidden");
            });
            $('.site-info .logo').parent("a").mouseout(function(){
                $(this).find("img").addClass("_hidden");
                $(this).find(".logo_hover").removeClass("_hidden");
            });
            // 底部相关 end

            $('.download_app').mouseover(function() {
                $(this).css("background","url(https://www.koudailc.com/image/site/index/201611/app_download.png?ver=0622) no-repeat scroll left center");
                $(this).children('#download_qrcode').show();
            });
            $('.download_app').mouseout(function() {
                $(this).css("background","url(https://www.koudailc.com/image/site/index/201611/app_download.png?ver=0622) no-repeat scroll left center");
                $(this).children('#download_qrcode').hide();
            });
            $('.weixin_dyh').mouseover(function() {
                $(this).css("background","url(https://www.koudailc.com/image/site/main/weixin_hover.png) no-repeat scroll right center");
                $(this).children('#weixin_qrcode').show();
            });
            $('.weixin_dyh').mouseout(function() {
                $(this).css("background","url(https://www.koudailc.com/image/site/main/weixin.png) no-repeat scroll right center");
                $(this).children('#weixin_qrcode').hide();
            });
            $('.dropdown-nav').hover(function() {
                $(this).css('backgroundColor', '#fff');
                $(this).find('.dropdown').show();
            }, function() {
                $(this).css('backgroundColor', '#fff');
                $(this).find('.dropdown').hide();
            });

            $('.mobile,.wechat,.weibo,.qq').hover(function() {
                $(this).children('img').toggle();
            });
            $('.site-map ul').find('li:last').addClass('on');
            $('.topNav-left').find('a').click(function() {
                $(this).addClass('on').siblings('a').removeClass('on');
            });

            // 右侧导航
            $('.one,.two').hover(function() {
                $(this).children('div').toggle();
            });
            $(window).on('resize load scroll',function(){
                var winWidth = $(window).width();
                if (winWidth > 1328) {
                    $('.nav-right').css('visibility', 'visible');
                } else {
                    $('.nav-right').css('visibility', 'hidden');
                }
                if ($(window).scrollTop() > 192) {
                    $('.gotop').show();
                } else {
                    $('.gotop').hide();
                }
            });
            $('.gotop').click(function(e){
                e.stopPropagation();
                $('html,body').animate({
                    scrollTop: 0
                }, 300);
            })
        });

        //退出登录
        function loginOut(){
            var url = "https://deposit.koudailc.com/user/logout?clientType=pc";
            var url_redirect = "https://www.koudailc.com/site/index";
            var params = {};
            KD.util.post(url, params, function(data){
                if (data.code == 0 && data.result == true){
                    delCookie('SESSIONID');
                    location = url_redirect;
                }
            });
        }
        if (/*@cc_on!@*/true) {
            document.documentElement.className += ' ie' + document.documentMode;
        }