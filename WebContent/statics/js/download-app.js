$(function() {
    var u = navigator.userAgent,
        isAndroid = u.indexOf("Android") > -1 || u.indexOf("Adr") > -1,
        isiOS = !!u.match(/\(i[^;]+;( U;)? CPU.+Mac OS X/);        
    // app内不展示
    if (u.indexOf('KDLC') != -1) {
        return;
    }
    //手机端之外不展示
    if(!isAndroid && !isiOS){
        return;
    }
     
    var url = (function() {
        var isWeixin = (/micromessenger/i).test(u),
            isQQ = (/QQBrowser/i).test(u);
        if (isAndroid) {
            if (!isWeixin) {
                return "http://res.koudailc.com/download/app/koudailicai_pc-ewm.apk";
            } else {
                return "http://a.app.qq.com/o/simple.jsp?pkgname=com.kdkj.koudailicai";
            }          
        }
        if (isiOS) {
            if (isWeixin) {
                return "http://a.app.qq.com/o/simple.jsp?pkgname=com.kdkj.koudailicai";
            } else {
                return "https://itunes.apple.com/cn/app/id953061503?mt=8";
            }
        }
    }());
   
    var download = function(e) {
        e.preventDefault();
        if (url) {
            window.location.href=url;
        }           
    };
        
    var fb = lib.flexible;
    var width = window.document.documentElement.getBoundingClientRect().width;
    var ratio = (width === fb.rem*(750/24)) ? 75/24 : 1;
    var $tmp = $('<div class="shareDownload" style="box-sizing:border-box;position:fixed;left:0;bottom:0;padding:0 '+0.75*ratio+'rem;width:100%;background-color:rgba(0,0,0,0.8);z-index:999;"><a href="javascript:void(0);" class="downloadImg"><img src="//deposit.koudailc.com/image/page/download_default2.png" style="display:block;max-width:auto;height:'+1.3*ratio+'rem;"></a><a href="javascript:void(0)" style="display:block;position: absolute;top:'+0.2*ratio+'rem;right:'+0.2*ratio+'rem;width:'+0.4*ratio+'rem;height:'+0.4*ratio+'rem;background:url(//deposit.koudailc.com/image/page/close_small.png) no-repeat;background-size:cover;" class="downloadClose"></a></div>');
   
    $tmp.find('.downloadImg').on('click', download);
    $tmp.find('.downloadClose').on('click', function(e) {
        e.preventDefault();
        $tmp.hide();
    });
    $tmp.appendTo('body');   

});
