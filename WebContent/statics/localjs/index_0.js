
    window.onload= function (){
        // 数据递增动效 2016-11-14 phoebe
        var oneD = '27,159,483,737',
            twoD = '494,608,760',
            threeD = '6,525,291',
            fourD = '30,731,710.14',
            start1=0,start2=0,start3=0,start4=0;
            
        var oneT = setInterval(addO, 50);
        var twoT = setInterval(addT, 50);
        var threeT = setInterval(addE, 50);
        var fourT = setInterval(addF, 50);
        function addO (){
            if (oneD==0){
                start1='--';
            }else {
                var aIntNum = oneD.toString().split('.');
                var end = parseInt(aIntNum[0].replace(/[^0-9]/ig,""));
                start1= start1 + parseInt(end/20);
                if(start1>=end){
                    start1=oneD; 
                    window.clearInterval(oneT);            
                }
            }            
            addCommas(start1, 'one-d');
        }
       
        function addE (){
            if (threeD==0){
                start3='--';
            }else {
                var aIntNum = threeD.toString().split('.');
                var end = parseInt(aIntNum[0].replace(/[^0-9]/ig,""));
                start3= start3 + parseInt(end/20);
                if(start3>=end){
                    start3=threeD; 
                    window.clearInterval(threeT);            
                }
            }            
            addCommas(start3, 'three-d');
        }
        function addF (){

            if (fourD==0){
                start4='--';
            }else {
                var aIntNum = fourD.toString().split('.');
                var end = parseInt(aIntNum[0].replace(/[^0-9]/ig,""));
                start4= start4 + parseInt(end/20);
                if(start4>=end){
                    start4=fourD; 
                    window.clearInterval(fourT);            
                }
            }
            addCommas(start4, 'four-d');
        }

        function addT(){
            if (twoD==0){
                start2='--';
            }else {
                var aIntNum = twoD.toString().split('.');
                var end = parseInt(aIntNum[0].replace(/[^0-9]/ig,""));
                start2= start2 + parseInt(end/20);
                if(start2>=end){
                    start2=twoD; 
                    window.clearInterval(twoT);            
                }
            }
            addCommas(start2, 'two-d');                     
        }
        // 数字转千分位
        function addCommas(val, obj) {
            var aIntNum = val.toString().split('.');
            var iIntPart = aIntNum[0];
            var iFlootPart = aIntNum.length > 1 ? '.' + aIntNum[1] : '';
            var rgx = /(\d+)(\d{3})/;
            if (iIntPart.length >= 5) {
                while (rgx.test(iIntPart)) {
                    iIntPart = iIntPart.replace(rgx, '$1' + ',' + '$2');
                }
            }
            $('.'+obj).html(iIntPart+iFlootPart); 
        }
    }

    //----------------------------------------------

    $(function(){
        $(".column2_c2 .pic-top img").css('cursor','pointer');
    });
    //轮播图
    carouselFigure();
    function carouselFigure() {
        var i = 0;
        var isClick = false;
        var html = '';
        // var num = $(".banner_image").length; //Banner数
        var num = "5"; //Banner数
        //生成切换按钮
        for (var j = 0; j <= num - 1; j++) {
            html += '<div class="_tab" eq="' + j + '"></div>';
        };
        $(".sliderbanner_tabs").html(html);
        $(".sliderbanner_tabs").width(num * 60);
        $(".sliderbanner_tabs ._tab:eq(" + i + ")").addClass("_tab_here");

        i = i + 1;
        var timing = setInterval(function() {
            if (!isClick) {
                execute();
            }
            isClick = false;
        },
        4000);

        $(".sliderbanner_tabs ._tab").click(function() {
            isClick = true;
            i = parseInt($(this).attr("eq"));
            execute();
        });

        function execute() {
            $(".sliderbanner_tabs ._tab:eq(" + i + ")").addClass("_tab_here").siblings("._tab").removeClass("_tab_here");
            $(".banner_image:eq(" + i + ")").fadeIn(600).siblings(".banner_image").fadeOut(600);
            i = i + 1;
            if (i >= num) {
                i = 0;
            }
        }
    }
    $(".column2_c2 .pic-top img").hover(function(){
        var index = $(this).parent().index();
        $(".column2_c2 .txt-bottom div").addClass("_hidden");
        $(".column2_c2 .txt-bottom div:eq("+index+")").removeClass("_hidden");
    },function(){
        return;
    });
    function showTxt(index, obj) {
        $(obj).parent().siblings("div.f_left").each(function() {
            $(this).css("background-image", 'url('+$(this).attr('base-bg-img')+')');
        });
        $(obj).parent().css("background-image", "url(https://www.koudailc.com/image/site/index/201611/column2_" + index + "_hover.png)");
        $(obj).parent().attr("base-bg-img", "https://www.koudailc.com/image/site/index/201611/column2_" + index + ".png");
        $(".column2_c2 ._txt").addClass("_hidden");
        $(".column2_c2 ._txt" + index).removeClass("_hidden");
    }
       
    