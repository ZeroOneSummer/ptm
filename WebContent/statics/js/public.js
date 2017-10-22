var source_tag_temp = getQueryString('source_tag');
if(getQueryString('from') == 'tan66'){
    var source_tag_temp = 'tan66';
}
if( source_tag_temp ){
    setCookie("source_tag",source_tag_temp,"h12");
    switch ( source_tag_temp ){
        case 'mika':
            setCookie(source_tag_temp+"_uid",intval(getQueryString('uid')),"h12");
            setCookie(source_tag_temp+"_zid",intval(getQueryString('zid')),"h12");
            break;
        case 'fbaba':
            var uid_temp = getQueryString('uid') ? intval(getQueryString('uid')) : 1316;
            setCookie("source_tag",source_tag_temp,"d30");
            setCookie(source_tag_temp+"_uid",uid_temp,"d30");
            break;
        case 'utou':
            var pid_temp = getQueryString('pid') ? intval(getQueryString('pid')) : 0;
            pid_temp && setCookie(source_tag_temp+"_pid",pid_temp,"h12");
            break;
        case 'tan66':
            setCookie(source_tag_temp+"_uid",intval(getQueryString('userID')),"h12");
            break;
    }
}
// 全局变量初始化
window.source_tag = getCookie("source_tag") ? getCookie("source_tag") : 'wap';
window.cps_params = {};
switch ( window.source_tag ){
    case 'mika':
        window.cps_params = {
            "uid" : getCookie(window.source_tag+"_uid"),
            "zid" : getCookie(window.source_tag+"_zid")
        };
        break;
    case 'fbaba':
        window.cps_params = {
            "uid" : getCookie(window.source_tag+"_uid")
        };
        break;
    case 'utou':
        window.cps_params = {};
        var pid_temp = getCookie(window.source_tag+"_pid");
        pid_temp && (window.cps_params.pid = pid_temp);
        break;
    case 'tan66':
        window.cps_params = {
            "uid" : getCookie(window.source_tag+"_uid")
        };
        break;
}

/*
 *获取url参数的值
*/
function getQueryString(name){
    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
    var r = window.location.search.substr(1).match(reg);
    if (r != null) return unescape(r[2]);
    return null;
}
/**
 * url参数拼接
 * @url
 * @params string
*/
function createUrl(url,params){
    return url + (url.indexOf("?") == -1 ? '?' : '&') + params;
}

function AjaxJsonP(callback,url, data, type,async){
    url = (url==null || url=="" || typeof(url)=="undefined") ? "" : url;
    data = (data==null || data=="" || typeof(data)=="undefined")? {"date": new Date().getTime()} : data;
    async = (async==null || async=="" || typeof(async)=="undefined")? "true" : async;
    type = (type==null || type=="" || typeof(type)=="undefined")? "POST" : type;

    if( type == 'POST' ){
        KD.util.post(url, data, callback);
    }else{
        $.ajax({
            url : url,
            type: type,
            data : data,
            dataType: "jsonp",
            jsonp: "callback",
            async:async,
            success:callback,
            error:callback
        }); 
    }
}

function AjaxJson(callback,url, data, async, type){
    url = (url==null || url=="" || typeof(url)=="undefined") ? "" : url;
    data = (data==null || data=="" || typeof(data)=="undefined")? {"date": new Date().getTime()} : data;
    async = (async==null || async=="" || typeof(async)=="undefined")? "true" : async;
    type = (type==null || type=="" || typeof(type)=="undefined")? "post" : type;
    
    if( type == 'POST' ){
        KD.util.post(url, data, callback);
    }else{
        $.ajax({
            url : url,
            type: type,
            data : data,
            dataType: "json",
            async:async,
            success:callback,
            error:callback
        });
    }
}

    /**
     * 当前时间戳
     * @return <int>        unix时间戳(秒)
     */
    function CurTime(){
        return Date.parse(new Date())/1000;
    }

    /**
     * 日期 转换为 Unix时间戳
     * @param <string> 2014-01-01 20:20:20  日期格式
     * @return <int>        unix时间戳(秒)
     */
    function DateToUnix(string) {
        var f = string.split(' ', 2);
        var d = (f[0] ? f[0] : '').split('-', 3);
        var t = (f[1] ? f[1] : '').split(':', 3);
        return (new Date(
            parseInt(d[0], 10) || null,
            (parseInt(d[1], 10) || 1) - 1,
            parseInt(d[2], 10) || null,
            parseInt(t[0], 10) || null,
            parseInt(t[1], 10) || null,
            parseInt(t[2], 10) || null
        )).getTime() / 1000;
    }

    /**
     * 时间戳转换日期
     * @param <int> unixTime    待时间戳(秒)
     * @param <bool> isFull    返回完整时间(Y-m-d 或者 Y-m-d H:i:s)
     * @param <int>  timeZone   时区
     */
    function UnixToDate(unixTime, isFull, isSeconds, timeZone) {
        if (typeof (timeZone) == 'number')
        {
            unixTime = parseInt(unixTime) + parseInt(timeZone) * 60 * 60;
        }
        var time = new Date(unixTime * 1000);
        var ymdhis = "";
        ymdhis += time.getFullYear() + "-";
        ymdhis += Appendzero( (time.getMonth()+1) ) + "-";
        ymdhis += Appendzero( time.getDate() );
        if (isFull === true)
        {
            ymdhis += " " + time.getHours() + ":";
            ymdhis += Appendzero(time.getMinutes());
            if (isSeconds === false){
                return ymdhis;
            }
            ymdhis += ":" + Appendzero(time.getSeconds());

        }
        return ymdhis;
    }

    /**
     * 不足补零
     * @param obj
     * @returns {*}
     * @constructor
     */
    function Appendzero (obj) {
        if (obj < 10) return "0" + obj; else return obj;
    }

    /*
     * 转换成整型
    */
    function intval(num){
        var ret = parseInt(num);
        return isNaN(ret) ?  0 : ret;
    }
    
    /**
     * 字符串替换 默认去除所有空格
     * @string  必需。规定被搜索的字符串。
     * @find 可选。规定要查找的值。
     * @replace 可选。规定替换 find 中的值的值。
     * @place 可选。规定替换 string 的位置：左右 左 右 所有，默认所有。
    */
    function strReplace(string,find,replace,place){
        find = typeof(find) == 'undefined' ? ' ' : find;
        replace = typeof(replace) == 'undefined' ? '' : replace;
        place = typeof(place) == 'undefined' ? 'all' : place;
        var placeList = {
            "left" : "^[" + find + "]",
            "right" : "[" + find + "]$",
            "both" : "^[" + find + "]|[" + find + "]$",
            "all" : "[" + find + "]"
        };
        placeList[place] = typeof(placeList[place]) == 'undefined' ? placeList['all'] : placeList[place];
        var reg =new RegExp(placeList[place],"ig"); // reg为 /[变量]/ig
        return string.replace(reg,replace);
    }
    function jumpTo(url){
        window.location.href = url;
    }
    /**
     * 时间戳转换日期
     * @param <string> 2014.01.01 日期格式
     */
    function StrToTime(nS) {
        return (new Date(parseInt(nS) * 1000).getFullYear())+'.'
        +( ((new Date(parseInt(nS) * 1000).getMonth())+1) <10 
            ? '0'+((new Date(parseInt(nS) * 1000).getMonth())+1) 
            : ((new Date(parseInt(nS) * 1000).getMonth())+1) )+'.'
        +( (new Date(parseInt(nS) * 1000).getDate()) <10 
            ? '0'+(new Date(parseInt(nS) * 1000).getDate()) 
            : (new Date(parseInt(nS) * 1000).getDate()) );
    }

    /**
     * 值除100 并保留两位小数 {分 TO 元}
     * @param str
     * @returns {string}
     */
    function safeConvertIntToCent(str){
        return (parseFloat(str)/100).toFixed(2);
    }

    var KD = {};
    KD.util = {};
    KD.util.post = function(url, data, okfn) {
    KD.util.post.pIndex = (KD.util.post.pIndex || 0) + 1;
    var iframe = $('<iframe name="pIframe_'+KD.util.post.pIndex+'" src="about:blank" style="display:none" width="0" height="0" scrolling="no" allowtransparency="true" frameborder="0"></iframe>').appendTo($(document.body));

    var ipts = [];
    $.each(data, function(k, v){
        ipts.push('<input type="hidden" name="'+k+'" value="" />');
    });
    
    if(!/(\?|&(amp;)?)fmt=[^0 &]+/.test(url)) url += (url.indexOf('?') > 0 ? '&' : '?') + 'fmt=1';

    var form = $('<form action="'+url+'" method="post" target="pIframe_'+KD.util.post.pIndex+'">'+ipts.join('')+'</form>').appendTo($(document.body));

    $.each(data, function(k, v){
        form.children('[name='+k+']').val(v);
    });

    iframe[0].callback = function(o){
        if(typeof okfn == 'function') okfn(o);
        $(this).src = 'about:blank';
        $(this).remove();
        form.remove();
        iframe = form = null;
    };
    if(false && $.browser.msie && $.browser.version == 6.0){ // 暂不考虑ie6，且$.browser还不行
        iframe[0].pIndex = KD.util.post.pIndex;
        iframe[0].ie6callback = function(){
            form.target = 'pIframe_' + this.pIndex;
            form.submit();
        };
        iframe[0].src = location.protocol + '//www.koudailc.com/html/ie6post.html';
    } else {
        form.submit();
    }
};

    //获取ID
    function ID(id) {
        return !id ? null : document.getElementById(id);
    }