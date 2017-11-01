//显示灰色 jQuery 遮罩层
/**
 * 遮罩层  START
 * @param id
 */

var _div_id ;

function showBg(id) {
    _div_id = id;
    var bh = $("body").height();
    var bw = $("body").width();
    
    var userAgent = navigator.userAgent.toLowerCase();
   // Figure out what browser is being used 
    $.browser = {
        version: (userAgent.match(/.+(?:rv|it|ra|ie)[\/: ]([\d.]+)/) || [])[1],
        safari: /webkit/.test(userAgent),
        opera: /opera/.test(userAgent),
        msie: /msie/.test(userAgent) && !/opera/.test(userAgent),
        mozilla: /mozilla/.test(userAgent) && !/(compatible|webkit)/.test(userAgent)
    };
    
    if (!$.browser.msie && ($.browser.version != "6.0") && ($.browser.version != "7.0")) {
    	$("#fullbg").css({
            height:bh,
            width:bw,
            display:"block"
        });
    }

    $("#"+_div_id).show();
    $("#"+_div_id).css({display:"block",position:"fixed",'z-index':'100000'});
}
//关闭灰色 jQuery 遮罩
function closeBg() {
    $("#fullbg").hide();
    $("#"+_div_id).hide();
}

/**
 * 遮罩层  END
 */


// <!--[if lte IE 6]>
//    <script type="text/javascript">
//    // 浮动对话框
// $(document).ready(function() {
//    function mask_css(id){
//        var domThis = $('#detail_invest_confirm');
//        var wh = $(window).height() / 2;
//        $("body").css({
//            "background-image": "url(about:blank)",
//            "background-attachment": "fixed"
//        });
//        domThis.style.setExpression('top', 'eval((document.documentElement).scrollTop + ' + wh + ') + "px"');
//    }
// });

//    </script>
//    <![endif]-->