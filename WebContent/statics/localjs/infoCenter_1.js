
        var page_index = 0;
        $(function(){
            $(".group1").colorbox({rel:'group1',width:"80%", height:"80%"});
            $(".group2").colorbox({rel:'group2',width:"80%", height:"80%"});
            $(".group3").colorbox({rel:'group3',width:"80%", height:"80%"});

            $(".list1 a").hover(function(){
                $(this).find('span').animate({
                    bottom: '0px'
                },400);
            },function(){
                $(this).find('span').animate({
                    bottom: '-60px'
                },400);
            });

            $(".list-position").not($(".list-position:eq(0)")).css('left','100%');
            $(".list-page .page-p").click(function(){
                if(page_index == $(this).index()){
                    return;
                }
                $(".list-page .page-p").removeClass("page-curr");
                $(this).addClass("page-curr");
                if(page_index > $(this).index()){
                    $("#honor-module .honor-list .list-position:eq("+page_index+")").animate({
                        left: '100%'
                    },400);
                    $("#honor-module .honor-list .list-position:eq("+$(this).index()+")").animate({
                        left: '0%'
                    },400);
                }else if(page_index < $(this).index()){
                    $("#honor-module .honor-list .list-position:eq("+page_index+")").animate({
                        left: '-100%'
                    },400);
                    $("#honor-module .honor-list .list-position:eq("+$(this).index()+")").animate({
                        left: '0%'
                    },400);
                }
                page_index = $(this).index();
            });
        });

   
        // $(document).ready(function(){
            //获取内容 下li
            var clis = $("#about_content >  li");
            //获取所有的选项卡
            var lis = $('#about_nav > li');

            // 初始化样式
            for(var j=0; j<lis.length; j++){
                lis[j].className = "";
                clis[j].className = "";
            }
            var about_index = "1";
            about_index =  ( about_index <= lis.length && about_index == parseInt(about_index) ) ? about_index : 1;
            $("#about_nav"+about_index).addClass("about_curr_option");
            clis[about_index-1].className = "about_current";

            //循环
            for(var i=0; i<lis.length; i++){
                (function(i){
                        //绑定单击事件
                        lis[i].onclick = function(){
                                //取消其他的
                                for(var j=0; j<lis.length; j++){
                                        lis[j].className = "";
                                        clis[j].className = "";
                                }
                                //选择当前的
                                this.className = "about_curr_option";
                                clis[i].className = "about_current";
                                initMap();//创建和初始化地图
                        };
                })(i);
            }

            $(function(){
                $(".about_flip").click(function(){
                    $(this).next('.about_panel').slideToggle();
                });
                var arr = window.location.href.split('/').pop();
                $(".hidden_x").val(arr);
            });

            if( window.location.href.indexOf('about_index') == -1 ){
                var html = $("#media_page").html();
                html = html.replace(/site\/about\?/gm,"site/about?about_index=4&");
                $("#media_page").html(html);
            }else{
                if( window.location.href.indexOf('about_index=4') == -1 ){
                    var html = $("#media_page").html();
                    html = html.replace(/site\/about\?about_index=\d{1,}/gm,"site/about?about_index=4&");
                    $("#media_page").html(html);
                }
            }
        // });

  
        //创建和初始化地图函数：
        function initMap(){
            createMap();//创建地图
            setMapEvent();//设置地图事件
            addMapControl();//向地图添加控件
            addMarker();//向地图中添加marker
        }

        //创建地图函数：
        function createMap(){
            var map = new BMap.Map("dituContent");//在百度地图容器中创建一个地图
            var point = new BMap.Point(121.358167,31.237965);//定义一个中心点坐标
            map.centerAndZoom(point,15);//设定地图的中心点和坐标并将地图显示在地图容器中
            window.map = map;//将map变量存储在全局
        }

        //地图事件设置函数：
        function setMapEvent(){
            map.enableDragging();//启用地图拖拽事件，默认启用(可不写)
            map.enableScrollWheelZoom();//启用地图滚轮放大缩小
            map.enableDoubleClickZoom();//启用鼠标双击放大，默认启用(可不写)
            map.enableKeyboard();//启用键盘上下左右键移动地图
        }

        //地图控件添加函数：
        function addMapControl(){
            //向地图中添加缩放控件
        var ctrl_nav = new BMap.NavigationControl({anchor:BMAP_ANCHOR_TOP_LEFT,type:BMAP_NAVIGATION_CONTROL_LARGE});
        map.addControl(ctrl_nav);
            //向地图中添加缩略图控件
        var ctrl_ove = new BMap.OverviewMapControl({anchor:BMAP_ANCHOR_BOTTOM_RIGHT,isOpen:0});
        map.addControl(ctrl_ove);
            //向地图中添加比例尺控件
        var ctrl_sca = new BMap.ScaleControl({anchor:BMAP_ANCHOR_BOTTOM_LEFT});
        map.addControl(ctrl_sca);
        }

        //标注点数组
        var markerArr = [{title:"上海市长宁区临虹路168弄6号楼",content:"口袋理财，首批国家“普惠金融”实践企业，是一个提供综合性互联网金融理财的服务平台，隶属于上海凌融网络科技有限公司，注册资本5000万元人民币，为用户提供更广泛、更专业、更安全的投资理财环境。",point:"121.358167|31.237965",isOpen:0,icon:{w:23,h:25,l:46,t:21,x:9,lb:12}}
             ];
        //创建marker
        function addMarker(){
            for(var i=0;i<markerArr.length;i++){
                var json = markerArr[i];
                var p0 = json.point.split("|")[0];
                var p1 = json.point.split("|")[1];
                var point = new BMap.Point(p0,p1);
                var iconImg = createIcon(json.icon);
                var marker = new BMap.Marker(point,{icon:iconImg});
                var iw = createInfoWindow(i);
                var label = new BMap.Label(json.title,{"offset":new BMap.Size(json.icon.lb-json.icon.x+10,-20)});
                marker.setLabel(label);
                map.addOverlay(marker);
                label.setStyle({
                            borderColor:"#808080",
                            color:"#333",
                            cursor:"pointer"
                });

                (function(){
                    var index = i;
                    var _iw = createInfoWindow(i);
                    var _marker = marker;
                    _marker.addEventListener("click",function(){
                        this.openInfoWindow(_iw);
                    });
                    _iw.addEventListener("open",function(){
                        _marker.getLabel().hide();
                    })
                    _iw.addEventListener("close",function(){
                        _marker.getLabel().show();
                    })
                    label.addEventListener("click",function(){
                        _marker.openInfoWindow(_iw);
                    })
                    if(!!json.isOpen){
                        label.hide();
                        _marker.openInfoWindow(_iw);
                    }
                })()
            }
        }
        //创建InfoWindow
        function createInfoWindow(i){
            var json = markerArr[i];
            var iw = new BMap.InfoWindow("<b class='iw_poi_title' title='" + json.title + "'>" + json.title + "</b><div class='iw_poi_content'>"+json.content+"</div>");
            return iw;
        }
        //创建一个Icon
        function createIcon(json){
            var icon = new BMap.Icon("https://res.koudailc.com/article/20160714/1578753df5b095.png", new BMap.Size(json.w,json.h),{imageOffset: new BMap.Size(-json.l,-json.t),infoWindowOffset:new BMap.Size(json.lb+5,1),offset:new BMap.Size(json.x,json.h)})
            return icon;
        }

        initMap();//创建和初始化地图
 