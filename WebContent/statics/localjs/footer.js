//尾部相关
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
        $(this).css("background","url(${pageContext.request.contextPath}/statics/img/app_download.png?ver=0622) no-repeat scroll left center");
        $(this).children('#download_qrcode').show();
    });
    $('.download_app').mouseout(function() {
        $(this).css("background","url(${pageContext.request.contextPath}/statics/img/app_download.png?ver=0622) no-repeat scroll left center");
        $(this).children('#download_qrcode').hide();
    });
    $('.weixin_dyh').mouseover(function() {
        $(this).css("background","url(${pageContext.request.contextPath}/statics/img/weixin_hover.png) no-repeat scroll right center");
        $(this).children('#weixin_qrcode').show();
    });
    $('.weixin_dyh').mouseout(function() {
        $(this).css("background","url(${pageContext.request.contextPath}/statics/img/weixin.png) no-repeat scroll right center");
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
