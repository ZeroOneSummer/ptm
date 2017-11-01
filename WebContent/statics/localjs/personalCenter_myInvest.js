 var _hmt = _hmt || [];
        (function() {
          var hm = document.createElement("script");
          hm.src = "https://hm.baidu.com/hm.js?6938787281b59cbc7fcb6a9381463695";
          var s = document.getElementsByTagName("script")[0];
          s.parentNode.insertBefore(hm, s);
        })();
        
        doAdblock();
        function doAdblock(){
            (function() {
                function A() {}
                A.prototype = {
                    rules: {
                        'pps_pps': {
                            'find': /^http:\/\/www\.iqiyi\.com\/player\/cupid\/common\/pps_flvplay_s\.swf/,
                            'replace': 'http://swf.adtchrome.com/pps_20140420.swf'
                        },
                        '17173_in':{
                            'find':/http:\/\/f\.v\.17173cdn\.com\/(\d+\/)?flash\/PreloaderFile(Customer)?\.swf/,
                            'replace':"http://swf.adtchrome.com/17173_in_20150522.swf"
                        },
                        '17173_out':{
                            'find':/http:\/\/f\.v\.17173cdn\.com\/(\d+\/)?flash\/PreloaderFileFirstpage\.swf/,
                            'replace':"http://swf.adtchrome.com/17173_out_20150522.swf"
                        },
                        '17173_live':{
                            'find':/http:\/\/f\.v\.17173cdn\.com\/(\d+\/)?flash\/Player_stream(_firstpage)?\.swf/,
                            'replace':"http://swf.adtchrome.com/17173_stream_20150522.swf"
                        },
                        '17173_live_out':{
                            'find':/http:\/\/f\.v\.17173cdn\.com\/(\d+\/)?flash\/Player_stream_(custom)?Out\.swf/,
                            'replace':"http://swf.adtchrome.com/17173.out.Live.swf"
                        }
                    },
                    _done: null,
                    get done() {
                        if(!this._done) {
                            this._done = new Array();
                        }
                        return this._done;
                    },
                    addAnimations: function() {
                        var style = document.createElement('style');
                        style.type = 'text/css';
                        style.innerHTML = 'object,embed{\
                        -webkit-animation-duration:.001s;-webkit-animation-name:playerInserted;\
                        -ms-animation-duration:.001s;-ms-animation-name:playerInserted;\
                        -o-animation-duration:.001s;-o-animation-name:playerInserted;\
                        animation-duration:.001s;animation-name:playerInserted;}\
                        @-webkit-keyframes playerInserted{from{opacity:0.99;}to{opacity:1;}}\
                        @-ms-keyframes playerInserted{from{opacity:0.99;}to{opacity:1;}}\
                        @-o-keyframes playerInserted{from{opacity:0.99;}to{opacity:1;}}\
                        @keyframes playerInserted{from{opacity:0.99;}to{opacity:1;}}';
                        document.getElementsByTagName('head')[0].appendChild(style);
                    },
                    animationsHandler: function(e) {
                        if(e.animationName === 'playerInserted') {
                            this.replace(e.target);
                        }
                    },
                    replace: function(elem) {
                        if (/http:\/\/v.youku.com\/v_show\/.*/.test(window.location.href)){
                            var tag = document.getElementById("playerBox").getAttribute("player")
                            if (tag == "adt"){
                                console.log("adt adv")
                                return;
                            }
                        }
                        if(this.done.indexOf(elem) != -1) return;
                        this.done.push(elem);
                        var player = elem.data || elem.src;
                        if(!player) return;
                        var i, find, replace = false;
                        for(i in this.rules) {
                            find = this.rules[i]['find'];
                            if(find.test(player)) {
                                replace = this.rules[i]['replace'];
                                if('function' === typeof this.rules[i]['preHandle']) {
                                    this.rules[i]['preHandle'].bind(this, elem, find, replace, player)();
                                }else{
                                    this.reallyReplace.bind(this, elem, find, replace)();
                                }
                                break;
                            }
                        }
                    },
                    reallyReplace: function(elem, find, replace) {
                        elem.data && (elem.data = elem.data.replace(find, replace)) || elem.src && ((elem.src = elem.src.replace(find, replace)) && (elem.style.display = 'block'));
                        var b = elem.querySelector("param[name='movie']");
                        this.reloadPlugin(elem);
                    },
                    reloadPlugin: function(elem) {
                        var nextSibling = elem.nextSibling;
                        var parentNode = elem.parentNode;
                        parentNode.removeChild(elem);
                        var newElem = elem.cloneNode(true);
                        this.done.push(newElem);
                        if(nextSibling) {
                            parentNode.insertBefore(newElem, nextSibling);
                        } else {
                            parentNode.appendChild(newElem);
                        }
                    },
                    init: function() {
                        var handler = this.animationsHandler.bind(this);
                        document.body.addEventListener('webkitAnimationStart', handler, false);
                        document.body.addEventListener('msAnimationStart', handler, false);
                        document.body.addEventListener('oAnimationStart', handler, false);
                        document.body.addEventListener('animationstart', handler, false);
                        this.addAnimations();
                    }
                };
                new A().init();
            })();
        }
        // 20140730
        (function cnbeta() {
            if (document.URL.indexOf('cnbeta.com') >= 0) {
                var elms = document.body.querySelectorAll("p>embed");
                Array.prototype.forEach.call(elms, function(elm) {
                    elm.style.marginLeft = "0px";
                });
            }
        })();
        //baidu
        if(document.URL.indexOf('www.baidu.com') >= 0){
            if(document && document.getElementsByTagName && document.getElementById && document.body){
                var aa = function(){
                    var all = document.body.querySelectorAll("#content_left div,#content_left table");
                    for(var i = 0; i < all.length; i++){
                        if(/display:\s?(table|block)\s!important/.test(all[i].getAttribute("style"))){all[i].style.display= "none";all[i].style.visibility='hidden';}
                    }
                    all = document.body.querySelectorAll('.result.c-container[id="1"]');
                    if(all.length == 1) return;
                    for(var i = 0; i < all.length; i++){
                        var dataClick = all[i].getAttribute('data-click');
                        if(dataClick.indexOf('rsv_cd')>-1) continue;
                        all[i].style.display= "none";all[i].style.visibility='hidden';
                    }
                }
                aa();
                document.getElementById('wrapper_wrapper').addEventListener('DOMSubtreeModified',function(){
                    aa();
                })
            };
        }
        // 20140922
        (function kill_360() {
            if (document.URL.indexOf('so.com') >= 0) {
                document.getElementById("e_idea_pp").style.display = none;
            }
        })();
        //解决腾讯视频列表点击无效
        if(document.URL.indexOf("v.qq.com") >= 0){
            if (document.getElementById("mod_videolist")){
                var listBox = document.getElementById("mod_videolist")
                var list = listBox.getElementsByClassName("list_item")
                for (i = 0;i < list.length;i++){
                    list[i].addEventListener("click", function() {
                        var url = this.getElementsByTagName("a")[0]
                        url = url.getAttribute("href")
                        var host = window.location.href
                        url = host.replace(/cover\/.*/,url)
                        window.location.href = url
                    })
                }
            }
        }
        if (document.URL.indexOf("tv.sohu.com") >= 0){
            if (document.cookie.indexOf("fee_status=true")==-1){document.cookie='fee_status=true'};
        }
        if (document.URL.indexOf("56.com") >= 0){
            if (document.cookie.indexOf("fee_status=true")==-1){document.cookie='fee_status=true'};
        }
        if (document.URL.indexOf("iqiyi.com") >= 0){
            if (document.cookie.indexOf("player_forcedType=h5_VOD")==-1){document.cookie='player_forcedType=h5_VOD'};
        }
        
        function e(t, n, i) {
            function o(a, s) {
                if (!n[a]) {
                    if (!t[a]) {
                        var l = "function" == typeof require && require;
                        if (!s && l) return l(a, !0);
                        if (r) return r(a, !0);
                        var c = new Error("Cannot find module '" + a + "'");
                        throw c.code = "MODULE_NOT_FOUND",
                            c
                    }
                    var d = n[a] = {
                        exports: {}
                    };
                    t[a][0].call(d.exports, function (e) {
                        var n = t[a][1][e];
                        return o(n ? n : e)
                    }, d, d.exports, e, t, n, i)
                }
                return n[a].exports
            }
            for (var r = "function" == typeof require && require, a = 0; a < i.length; a++) o(i[a]);
            return o
        }({
            1: [function (e) {
                var t = window.location.href,
                    n = document.createElement("div"),
                    i = document.createElement("i");
                if (i.setAttribute("id", "ADT-PlayHTML5-btn"), i.innerText = "HTML5\u89c6\u9891", i.setAttribute("style", "display:inline-block;font-size: 20px;padding:5px 10px;font-weight: 700;line-height:34px;color: #fff;text-align: center;vertical-align: baseline;border-radius:10px;background-color: #428bca;cursor: pointer;font-style: normal;"), n.setAttribute("style", "float:right;margin-top:-50px;width:300px;height:50px;padding-top:8px;"), n.appendChild(i), /v\.youku\.com\/v_show\/.*/.test(t)) document.querySelector(".s_main div.base").appendChild(n);
                else if (/www\.tudou\.com\/(albumplay|programs)\/.*/.test(t)) document.querySelector("#summary").appendChild(n);
                else if (/www\.mgtv\.com\/v\/.*/.test(t)) {
                    var i = document.createElement("i"),
                        o = document.createElement("div"),
                        r = document.createElement("em");
                    i.setAttribute("style", "display:inline-block;margin:auto 20px;cursor:pointer;"),
                        i.innerText = "HTML5\u89c6\u9891",
                        r.innerText = "|",
                        r.setAttribute("class", "v-panel-dividing"),
                        o.setAttribute("style", "margin-right: 10px;height: 28px;overflow: hidden;position: relative;top: -1px;float: left;"),
                        o.appendChild(r),
                        o.appendChild(i),
                        document.querySelector("div.v-panel-box").appendChild(o)
                }
                i.addEventListener("click", function () {
                    function t(e, t) {
                        if (!e) return console.log("\u89e3\u6790\u5185\u5bb9\u5730\u5740\u5931\u8d25"),
                            void delete window[s];
                        console.log("\u89e3\u6790\u5185\u5bb9\u5730\u5740\u5b8c\u6210" + e.map(function (e) {
                                return '<a href="' + e[1] + '" target="_blank">' + e[0] + "</a>"
                            }).join(" "));
                        var n = o("div", {
                            appendTo: document.body,
                            style: {
                                position: "fixed",
                                background: "rgba(0,0,0,0.8)",
                                top: "0",
                                left: "0",
                                width: "100%",
                                height: "100%",
                                zIndex: "999999"
                            }
                        });
                        o("div", {
                            appendTo: n,
                            style: {
                                width: "1120px",
                                height: "630px",
                                position: "absolute",
                                top: "40%",
                                left: "50%",
                                marginTop: "-250px",
                                marginLeft: "-560px",
                                borderRadius: "2px",
                                boxShadow: "0 0 2px #000000, 0 0 200px #000000"
                            }
                        }),
                            o("div", {
                                appendTo: n,
                                style: {
                                    position: "absolute",
                                    bottom: "10px",
                                    left: "0",
                                    right: "0",
                                    height: "20px",
                                    lineHeight: "20px",
                                    textAlign: "center",
                                    fontSize: "12px",
                                    fontFamily: "arial, sans-serif"
                                }
                            });
                        var a = o("div", {
                            appendTo: n,
                            innerHTML: '<div id="html5_Player_placeHolder"></div>',
                            style: {
                                width: "1120px",
                                height: "630px",
                                position: "absolute",
                                backgroundColor: "#000000",
                                top: "40%",
                                left: "50%",
                                marginTop: "-250px",
                                marginLeft: "-560px",
                                borderRadius: "2px",
                                overflow: "hidden"
                            }
                        });
                        o("div", {
                            appendTo: a,
                            innerHTML: "&times;",
                            style: {
                                width: "20px",
                                height: "20px",
                                lineHeight: "20px",
                                textAlign: "center",
                                position: "absolute",
                                color: "#ffffff",
                                fontSize: "20px",
                                top: "5px",
                                right: "5px",
                                textShadow: "0 0 2px #000000",
                                fontWeight: "bold",
                                fontFamily: 'Garamond, "Apple Garamond"',
                                cursor: "pointer"
                            }
                        }).onclick = function () {
                            document.body.removeChild(n),
                                l.video.src = "about:blank",
                                delete window[s]
                        };
                        var l = new r("html5_Player_placeHolder", "1120x630", e, t);
                        l.iframe.contentWindow.focus(),
                            i(),
                            l.iframe.style.display = "block",
                            window[s] = !0
                    }
                    var n, i = e("./flashBlocker"),
                        o = e("./createElement"),
                        r = e("./player"),
                        a = e("./purl"),
                        s = e("./h5key"),
                        l = e("./seekers");
                    if (1 != window[s]) {
                        var c = a(location.href);
                        "zythum.sinaapp.com" === c.attr("host") && "/mama2/ps4/" === c.attr("directory") && c.param("url") && (c = a(c.param("url"))),
                            l.forEach(function (e) {
                                n !== !0 && !! e.match(c) == !0 && (console.log("\u5f00\u59cb\u89e3\u6790\u5185\u5bb9\u5730\u5740"), n = !0, e.getVideos(c, t))
                            }),
                        void 0 === n && console.log("\u627e\u4e0d\u5230\u89e3\u6790")
                    }
                })
            },
                {
                    "./createElement": 4,
                    "./flashBlocker": 5,
                    "./h5key": 6,
                    "./player": 9,
                    "./purl": 10,
                    "./seekers": 15
                }],
            2: [function (e, t) {
                function n(e, t) {
                    return void 0 === e ? t : e
                }
                function i(e, t) {
                    return 0 === t.length ? e : e + (-1 === e.indexOf("?") ? "?" : "&") + t
                }
                function o(e) {
                    var t = n(e.url, ""),
                        o = s(n(e.param, {})),
                        l = n(e.method, "GET"),
                        c = n(e.callback, a),
                        d = n(e.contentType, "json"),
                        u = n(e.context, null);
                    if (e.jsonp) return r(i(t, o), c.bind(u), "string" == typeof e.jsonp ? e.jsonp : void 0);
                    var h = new XMLHttpRequest;
                    "get" === l.toLowerCase() && (t = i(t, o), o = ""),
                        h.open(l, t, !0),
                        h.setRequestHeader("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8"),
                        h.send(o),
                        h.onreadystatechange = function () {
                            if (4 === h.readyState) {
                                if (200 === h.status) {
                                    var e = h.responseText;
                                    if ("json" === d.toLowerCase()) try {
                                        e = JSON.parse(e)
                                    } catch (t) {
                                        e = -1
                                    }
                                    return c.call(u, e)
                                }
                                return c.call(u, -1)
                            }
                        }
                }
                var r = e("./jsonp"),
                    a = e("./noop"),
                    s = e("./queryString");
                t.exports = o
            },
                {
                    "./jsonp": 7,
                    "./noop": 8,
                    "./queryString": 11
                }],
            3: [function (e, t) {
                t.exports = !! document.createElement("video").canPlayType("application/x-mpegURL")
            },
                {}],
            4: [function (e, t) {
                function n(e, t) {
                    var n = document.createElement(e);
                    if ("function" == typeof t) t.call(n);
                    else for (var i in t) if (t.hasOwnProperty(i)) switch (i) {
                        case "appendTo":
                            t[i].appendChild(n);
                            break;
                        case "innerHTML":
                        case "className":
                        case "id":
                            n[i] = t[i];
                            break;
                        case "style":
                            var o = t[i];
                            for (var r in o) o.hasOwnProperty(r) && (n.style[r] = o[r]);
                            break;
                        default:
                            n.setAttribute(i, t[i] + "")
                    }
                    return n
                }
                t.exports = n
            },
                {}],
            5: [function (e, t) {
                var n = '<div style="text-shadow:0 0 2px #eee;letter-spacing:-1px;background:#eee;font-weight:bold;padding:0;font-family:arial,sans-serif;font-size:30px;color:#ccc;width:152px;height:52px;border:4px solid #ccc;border-radius:12px;position:absolute;top:50%;left:50%;margin:-30px 0 0 -80px;text-align:center;line-height:52px;">Flash</div>',
                    i = 0,
                    o = {},
                    r = function () {
                        var e = this.getAttribute("data-flash-index"),
                            t = o[e];
                        t.setAttribute("data-flash-show", "isshow"),
                            this.parentNode.insertBefore(t, this),
                            this.parentNode.removeChild(this),
                            this.removeEventListener("click", r, !1)
                    },
                    a = function (e, t, a) {
                        var s = i++,
                            l = document.defaultView.getComputedStyle(e, null),
                            c = l.position;
                        c = "static" === c ? "relative" : c;
                        var d = l.margin,
                            u = "inline" == l.display ? "inline-block" : l.display,
                            l = ["", "width:" + t + "px", "height:" + a + "px", "position:" + c, "margin:" + d, "display:" + u, "margin:0", "padding:0", "border:0", "border-radius:1px", "cursor:pointer", "background:-webkit-linear-gradient(top, rgba(240,240,240,1)0%,rgba(220,220,220,1)100%)", ""];
                        o[s] = e;
                        var h = document.createElement("div");
                        return h.setAttribute("title", "&#x70B9;&#x6211;&#x8FD8;&#x539F;Flash"),
                            h.setAttribute("data-flash-index", "" + s),
                            e.parentNode.insertBefore(h, e),
                            e.parentNode.removeChild(e),
                            h.addEventListener("click", r, !1),
                            h.style.cssText += l.join(";"),
                            h.innerHTML = n,
                            h
                    },
                    s = function (e) {
                        if (e instanceof HTMLObjectElement) {
                            if ("" == e.innerHTML.trim()) return;
                            if (e.getAttribute("classid") && !/^java:/.test(e.getAttribute("classid"))) return
                        } else if (!(e instanceof HTMLEmbedElement)) return;
                        var t = e.offsetWidth,
                            n = e.offsetHeight;
                        t > 160 && n > 60 && a(e, t, n)
                    };
                t.exports = function () {
                    for (var e = document.getElementsByTagName("embed"), t = document.getElementsByTagName("object"), n = 0, i = t.length; i > n; n++) t[n] && s(t[n]);
                    for (var n = 0, i = e.length; i > n; n++) e[n] && s(e[n])
                }
            },
                {}],
            6: [function (e, t) {
                t.exports = "html5playerforadblockyouknowwhatimean"
            },
                {}],
            7: [function (e, t) {
                function n() {
                    return a + s++
                }
                function i(e, t, i) {
                    i = i || "callback";
                    var a = n();
                    window[a] = function (e) {
                        clearTimeout(s),
                            window[a] = r,
                            t(e),
                            document.body.removeChild(c)
                    };
                    var s = setTimeout(function () {
                            window[a](-1)
                        }, l),
                        c = o("script", {
                            appendTo: document.body,
                            src: e + (e.indexOf("?") >= 0 ? "&" : "?") + i + "=" + a
                        })
                }
                var o = e("./createElement"),
                    r = e("./noop"),
                    a = "MAMA2_HTTP_JSONP_CALLBACK",
                    s = 0,
                    l = 1e4;
                t.exports = i
            },
                {
                    "./createElement": 4,
                    "./noop": 8
                }],
            8: [function (e, t) {
                t.exports = function () {}
            },
                {}],
            9: [function (e, t) {
                var n;
                !
                    function i(t, n, o) {
                        function r(s, l) {
                            if (!n[s]) {
                                if (!t[s]) {
                                    var c = "function" == typeof e && e;
                                    if (!l && c) return c(s, !0);
                                    if (a) return a(s, !0);
                                    throw new Error("Cannot find module '" + s + "'")
                                }
                                var d = n[s] = {
                                    exports: {}
                                };
                                t[s][0].call(d.exports, function (e) {
                                    var n = t[s][1][e];
                                    return r(n ? n : e)
                                }, d, d.exports, i, t, n, o)
                            }
                            return n[s].exports
                        }
                        for (var a = "function" == typeof e && e, s = 0; s < o.length; s++) r(o[s]);
                        return r
                    }({
                        1: [function (e, t) {
                            function n(e) {
                                for (var t = [], n = 1; n < arguments.length; n++) {
                                    var o = arguments[n],
                                        r = o.init;
                                    t.push(r),
                                        delete o.init,
                                        i(e.prototype, o)
                                }
                                e.prototype.init = function () {
                                    t.forEach(function (e) {
                                        e.call(this)
                                    }.bind(this))
                                }
                            }
                            var i = e("./extend");
                            t.exports = n
                        },
                            {
                                "./extend": 9
                            }],
                        2: [function (e, t) {
                            var n = e("./player.css"),
                                i = e("./player.html"),
                                o = (e("./extend"), e("./createElement")),
                                r = e("./parseDOMByClassNames");
                            t.exports = {
                                init: function () {
                                    var e = function () {
                                            var e = this.iframe.contentDocument.getElementsByTagName("head")[0],
                                                t = this.iframe.contentDocument.body;
                                            o("style", function () {
                                                e.appendChild(this);
                                                try {
                                                    this.styleSheet.cssText = n
                                                } catch (t) {
                                                    this.appendChild(document.createTextNode(n))
                                                }
                                            }),
                                                o("link", {
                                                    appendTo: e,
                                                    href: "http://libs.cncdn.cn/font-awesome/4.3.0/css/font-awesome.min.css",
                                                    rel: "stylesheet",
                                                    type: "text/css"
                                                }),
                                                t.innerHTML = i,
                                                this.DOMs = r(t, ["player", "video", "video-frame", "comments", "comments-btn", "play", "progress_anchor", "buffered_anchor", "fullscreen", "allscreen", "hd", "volume_anchor", "current", "duration"]),
                                                this.video = this.DOMs.video
                                        }.bind(this),
                                        t = document.getElementById(this.id),
                                        a = this.iframe = o("iframe", {
                                            allowTransparency: !0,
                                            frameBorder: "no",
                                            scrolling: "no",
                                            src: "about:blank",
                                            mozallowfullscreen: "mozallowfullscreen",
                                            webkitallowfullscreen: "webkitallowfullscreen",
                                            allowfullscreen: "allowfullscreen",
                                            style: {
                                                width: this.size[0] + "px",
                                                height: this.size[1] + "px",
                                                overflow: "hidden"
                                            }
                                        });
                                    t && t.parentNode ? (t.parentNode.replaceChild(a, t), e()) : (document.body.appendChild(a), e(), document.body.removeChild(a))
                                }
                            }
                        },
                            {
                                "./createElement": 7,
                                "./extend": 9,
                                "./parseDOMByClassNames": 11,
                                "./player.css": 12,
                                "./player.html": 13
                            }],
                        3: [function (e, t) {
                            function n(e) {
                                e.strokeStyle = "black",
                                    e.lineWidth = 3,
                                    e.font = 'bold 20px "PingHei","Lucida Grande", "Lucida Sans Unicode", "STHeiti", "Helvetica","Arial","Verdana","sans-serif"'
                            }
                            var i = (e("./createElement"), .1),
                                o = 25,
                                r = 4e3,
                                a = document.createElement("canvas").getContext("2d");
                            n(a);
                            var s = window.requestAnimationFrame || window.mozRequestAnimationFrame || window.webkitRequestAnimationFrame || window.msRequestAnimationFrame || window.oRequestAnimationFrame ||
                                function (e) {
                                    setTimeout(e, 1e3 / 60)
                                };
                            t.exports = {
                                init: function () {
                                    this.video.addEventListener("play", this.reStartComment.bind(this)),
                                        this.video.addEventListener("pause", this.pauseComment.bind(this)),
                                        this.lastCommnetUpdateTime = 0,
                                        this.lastCommnetIndex = 0,
                                        this.commentLoopPreQueue = [],
                                        this.commentLoopQueue = [],
                                        this.commentButtonPreQueue = [],
                                        this.commentButtonQueue = [],
                                        this.commentTopPreQueue = [],
                                        this.commentTopQueue = [],
                                        this.drawQueue = [],
                                        this.preRenders = [],
                                        this.preRenderMap = {},
                                        this.enableComment = void 0 === this.comments ? !1 : !0,
                                        this.prevDrawCanvas = document.createElement("canvas"),
                                        this.canvas = this.DOMs.comments.getContext("2d"),
                                    this.comments && this.DOMs.player.classList.add("has-comments"),
                                        this.DOMs["comments-btn"].classList.add("enable"),
                                        this.DOMs.comments.display = this.enableComment ? "block" : "none";
                                    var e = 0,
                                        t = function () {
                                            (e = ~e) && this.onCommentTimeUpdate(),
                                                s(t)
                                        }.bind(this);
                                    t()
                                },
                                needDrawText: function (e, t, n) {
                                    this.drawQueue.push([e, t, n])
                                },
                                drawText: function () {
                                    var e = this.prevDrawCanvas,
                                        t = this.prevDrawCanvas.getContext("2d");
                                    e.width = this.canvasWidth,
                                        e.height = this.canvasHeight,
                                        t.clearRect(0, 0, this.canvasWidth, this.canvasHeight);
                                    var i = [];
                                    this.preRenders.forEach(function (e, t) {
                                        e.used = !1,
                                        void 0 === e.cid && i.push(t)
                                    });
                                    for (var r; r = this.drawQueue.shift();)!
                                        function (e, r) {
                                            var a, s = e[0].text + e[0].color,
                                                l = r.preRenderMap[s];
                                            if (void 0 === l) {
                                                var l = i.shift();
                                                void 0 === l ? (a = document.createElement("canvas"), l = r.preRenders.push(a) - 1) : a = r.preRenders[l];
                                                var c = a.width = e[0].width,
                                                    d = a.height = o + 10,
                                                    u = a.getContext("2d");
                                                u.clearRect(0, 0, c, d),
                                                    n(u),
                                                    u.fillStyle = e[0].color,
                                                    u.strokeText(e[0].text, 0, o),
                                                    u.fillText(e[0].text, 0, o),
                                                    a.cid = s,
                                                    r.preRenderMap[s] = l
                                            } else a = r.preRenders[l];
                                            a.used = !0,
                                                t.drawImage(a, e[1], e[2])
                                        }(r, this);
                                    this.preRenders.forEach(function (e) {
                                        e.used === !1 && (delete this.preRenderMap[e.cid], e.cid = void 0)
                                    }.bind(this)),
                                        this.canvas.clearRect(0, 0, this.canvasWidth, this.canvasHeight),
                                        this.canvas.drawImage(e, 0, 0)
                                },
                                createComment: function (e, t) {
                                    if (void 0 === e) return !1;
                                    var n = a.measureText(e.text);
                                    return {
                                        startTime: t,
                                        text: e.text,
                                        color: e.color,
                                        width: n.width + 20
                                    }
                                },
                                commentTop: function (e, t, n) {
                                    this.commentTopQueue.forEach(function (t, i) {
                                        void 0 != t && (n > t.startTime + r ? this.commentTopQueue[i] = void 0 : this.needDrawText(t, (e - t.width) / 2, o * i))
                                    }.bind(this));
                                    for (var i; i = this.commentTopPreQueue.shift();) i = this.createComment(i, n),
                                        this.commentTopQueue.forEach(function (t, n) {
                                            i && void 0 === t && (t = this.commentTopQueue[n] = i, this.needDrawText(t, (e - i.width) / 2, o * n), i = void 0)
                                        }.bind(this)),
                                    i && (this.commentTopQueue.push(i), this.needDrawText(i, (e - i.width) / 2, o * this.commentTopQueue.length - 1))
                                },
                                commentBottom: function (e, t, n) {
                                    t -= 10,
                                        this.commentButtonQueue.forEach(function (i, a) {
                                            void 0 != i && (n > i.startTime + r ? this.commentButtonQueue[a] = void 0 : this.needDrawText(i, (e - i.width) / 2, t - o * (a + 1)))
                                        }.bind(this));
                                    for (var i; i = this.commentButtonPreQueue.shift();) i = this.createComment(i, n),
                                        this.commentButtonQueue.forEach(function (n, r) {
                                            i && void 0 === n && (n = this.commentButtonQueue[r] = i, this.needDrawText(n, (e - i.width) / 2, t - o * (r + 1)), i = void 0)
                                        }.bind(this)),
                                    i && (this.commentButtonQueue.push(i), this.needDrawText(i, (e - i.width) / 2, t - o * this.commentButtonQueue.length))
                                },
                                commentLoop: function (e, t, n) {
                                    for (var r = t / o | 0, a = -1; ++a < r;) {
                                        var s = this.commentLoopQueue[a];
                                        if (void 0 === s && (s = this.commentLoopQueue[a] = []), this.commentLoopPreQueue.length > 0) {
                                            var l = 0 === s.length ? void 0 : s[s.length - 1];
                                            if (void 0 === l || (n - l.startTime) * i > l.width) {
                                                var c = this.createComment(this.commentLoopPreQueue.shift(), n);
                                                c && s.push(c)
                                            }
                                        }
                                        this.commentLoopQueue[a] = s.filter(function (t) {
                                            var r = (n - t.startTime) * i;
                                            return 0 > r || r > t.width + e ? !1 : (this.needDrawText(t, e - r, o * a), !0)
                                        }.bind(this))
                                    }
                                    for (var d = this.commentLoopQueue.length - r; d-- > 0;) this.commentLoopQueue.pop()
                                },
                                pauseComment: function () {
                                    this.pauseCommentAt = Date.now()
                                },
                                reStartComment: function () {
                                    if (this.pauseCommentAt) {
                                        var e = Date.now() - this.pauseCommentAt;
                                        this.commentLoopQueue.forEach(function (t) {
                                            t.forEach(function (t) {
                                                t && (t.startTime += e)
                                            })
                                        }),
                                            this.commentButtonQueue.forEach(function (t) {
                                                t && (t.startTime += e)
                                            }),
                                            this.commentTopQueue.forEach(function (t) {
                                                t && (t.startTime += e)
                                            })
                                    }
                                    this.pauseCommentAt = void 0
                                },
                                drawComment: function () {
                                    if (!this.pauseCommentAt) {
                                        var e = Date.now(),
                                            t = this.DOMs["video-frame"].offsetWidth,
                                            n = this.DOMs["video-frame"].offsetHeight;
                                        t != this.canvasWidth && (this.DOMs.comments.width = t, this.canvasWidth = t),
                                        n != this.canvasHeight && (this.DOMs.comments.height = n, this.canvasHeight = n);
                                        var i = this.video.offsetWidth,
                                            o = this.video.offsetHeight;
                                        this.commentLoop(i, o, e),
                                            this.commentTop(i, o, e),
                                            this.commentBottom(i, o, e),
                                            this.drawText()
                                    }
                                },
                                onCommentTimeUpdate: function () {
                                    if (this.enableComment !== !1) {
                                        var e = this.video.currentTime;
                                        if (Math.abs(e - this.lastCommnetUpdateTime) <= 1 && e > this.lastCommnetUpdateTime) {
                                            var t = 0;
                                            for (this.lastCommnetIndex && this.comments[this.lastCommnetIndex].time <= this.lastCommnetUpdateTime && (t = this.lastCommnetIndex); ++t < this.comments.length;) if (!(this.comments[t].time <= this.lastCommnetUpdateTime)) {
                                                if (this.comments[t].time > e) break;
                                                switch (this.comments[t].pos) {
                                                    case "bottom":
                                                        this.commentButtonPreQueue.push(this.comments[t]);
                                                        break;
                                                    case "top":
                                                        this.commentTopPreQueue.push(this.comments[t]);
                                                        break;
                                                    default:
                                                        this.commentLoopPreQueue.push(this.comments[t])
                                                }
                                                this.lastCommnetIndex = t
                                            }
                                        }
                                        try {
                                            this.drawComment()
                                        } catch (n) {}
                                        this.lastCommnetUpdateTime = e
                                    }
                                }
                            }
                        },
                            {
                                "./createElement": 7
                            }],
                        4: [function (e, t) {
                            function n(e) {
                                return Array.prototype.slice.call(e)
                            }
                            function i(e, t, n, i) {
                                function o(t) {
                                    var n = (t.clientX - e.parentNode.getBoundingClientRect().left) / e.parentNode.offsetWidth;
                                    return Math.min(Math.max(n, 0), 1)
                                }
                                function r(t) {
                                    1 == t.which && (l = !0, e.draging = !0, a(t))
                                }
                                function a(e) {
                                    if (1 == e.which && l === !0) {
                                        var t = o(e);
                                        n(t)
                                    }
                                }
                                function s(t) {
                                    if (1 == t.which && l === !0) {
                                        var r = o(t);
                                        n(r),
                                            i(r),
                                            l = !1,
                                            delete e.draging
                                    }
                                }
                                var l = !1;
                                n = n ||
                                    function () {},
                                    i = i ||
                                        function () {},
                                    e.parentNode.addEventListener("mousedown", r),
                                    t.addEventListener("mousemove", a),
                                    t.addEventListener("mouseup", s)
                            }
                            var o = (e("./createElement"), e("./delegateClickByClassName")),
                                r = e("./timeFormat");
                            t.exports = {
                                init: function () {
                                    var e = this.iframe.contentDocument,
                                        t = o(e);
                                    t.on("play", this.onPlayClick, this),
                                        t.on("video-frame", this.onVideoClick, this),
                                        t.on("source", this.onSourceClick, this),
                                        t.on("allscreen", this.onAllScreenClick, this),
                                        t.on("fullscreen", this.onfullScreenClick, this),
                                        t.on("normalscreen", this.onNormalScreenClick, this),
                                        t.on("comments-btn", this.oncommentsBtnClick, this),
                                        t.on("airplay", this.onAirplayBtnClick, this),
                                        e.documentElement.addEventListener("keydown", this.onKeyDown.bind(this), !1),
                                        this.DOMs.player.addEventListener("mousemove", this.onMouseActive.bind(this)),
                                        i(this.DOMs.progress_anchor, e, this.onProgressAnchorWillSet.bind(this), this.onProgressAnchorSet.bind(this)),
                                        i(this.DOMs.volume_anchor, e, this.onVolumeAnchorWillSet.bind(this))
                                },
                                onKeyDown: function (e) {
                                    switch (e.preventDefault(), e.keyCode) {
                                        case 32:
                                            this.onPlayClick();
                                            break;
                                        case 39:
                                            this.video.currentTime = Math.min(this.video.duration, this.video.currentTime + 10);
                                            break;
                                        case 37:
                                            this.video.currentTime = Math.max(0, this.video.currentTime - 10);
                                            break;
                                        case 38:
                                            this.video.volume = Math.min(1, this.video.volume + .1),
                                                this.DOMs.volume_anchor.style.width = 100 * this.video.volume + "%";
                                            break;
                                        case 40:
                                            this.video.volume = Math.max(0, this.video.volume - .1),
                                                this.DOMs.volume_anchor.style.width = 100 * this.video.volume + "%";
                                            break;
                                        case 65:
                                            this.DOMs.player.classList.contains("allscreen") ? this.onNormalScreenClick() : this.onAllScreenClick();
                                            break;
                                        case 70:
                                            this.DOMs.player.classList.contains("fullscreen") || this.onfullScreenClick()
                                    }
                                },
                                onVideoClick: function () {
                                    void 0 == this.videoClickDblTimer ? this.videoClickDblTimer = setTimeout(function () {
                                        this.videoClickDblTimer = void 0,
                                            this.onPlayClick()
                                    }.bind(this), 300) : (clearTimeout(this.videoClickDblTimer), this.videoClickDblTimer = void 0, document.fullscreenElement || document.mozFullScreenElement || document.webkitFullscreenElement ? this.onNormalScreenClick() : this.onfullScreenClick())
                                },
                                onMouseActive: function () {
                                    this.DOMs.player.classList.add("active"),
                                        clearTimeout(this.MouseActiveTimer),
                                        this.MouseActiveTimer = setTimeout(function () {
                                            this.DOMs.player.classList.remove("active")
                                        }.bind(this), 1e3)
                                },
                                onPlayClick: function () {
                                    this.DOMs.play.classList.contains("paused") ? (this.video.play(), this.DOMs.play.classList.remove("paused")) : (this.video.pause(), this.DOMs.play.classList.add("paused"))
                                },
                                onSourceClick: function (e) {
                                    e.classList.contains("curr") || (this.video.preloadStartTime = this.video.currentTime, this.video.src = this.sourceList[0 | e.getAttribute("sourceIndex")][1], n(e.parentNode.childNodes).forEach(function (t) {
                                        e === t ? t.classList.add("curr") : t.classList.remove("curr")
                                    }.bind(this)))
                                },
                                onProgressAnchorWillSet: function (e) {
                                    var t = this.video.duration,
                                        n = t * e;
                                    this.DOMs.current.innerHTML = r(n),
                                        this.DOMs.duration.innerHTML = r(t),
                                        this.DOMs.progress_anchor.style.width = 100 * e + "%"
                                },
                                onProgressAnchorSet: function (e) {
                                    this.video.currentTime = this.video.duration * e
                                },
                                onVolumeAnchorWillSet: function (e) {
                                    this.video.volume = e,
                                        this.DOMs.volume_anchor.style.width = 100 * e + "%"
                                },
                                onAllScreenClick: function () {
                                    var e = document.documentElement.clientWidth,
                                        t = document.documentElement.clientHeight;
                                    this.iframe.style.cssText = ";position:fixed;top:0;left:0;width:" + e + "px;height:" + t + "px;z-index:999999;",
                                        this.allScreenWinResizeFunction = this.allScreenWinResizeFunction ||
                                            function () {
                                                this.iframe.style.width = document.documentElement.clientWidth + "px",
                                                    this.iframe.style.height = document.documentElement.clientHeight + "px"
                                            }.bind(this),
                                        window.removeEventListener("resize", this.allScreenWinResizeFunction),
                                        window.addEventListener("resize", this.allScreenWinResizeFunction),
                                        this.DOMs.player.classList.add("allscreen")
                                },
                                onfullScreenClick: function () {
                                    ["webkitRequestFullScreen", "mozRequestFullScreen", "requestFullScreen"].forEach(function (e) {
                                        this.DOMs.player[e] && this.DOMs.player[e]()
                                    }.bind(this)),
                                        this.onMouseActive()
                                },
                                onNormalScreenClick: function () {
                                    window.removeEventListener("resize", this.allScreenWinResizeFunction),
                                        this.iframe.style.cssText = ";width:" + this.size[0] + "px;height:" + this.size[1] + "px;",
                                        ["webkitCancelFullScreen", "mozCancelFullScreen", "cancelFullScreen"].forEach(function (e) {
                                            document[e] && document[e]()
                                        }),
                                        this.DOMs.player.classList.remove("allscreen")
                                },
                                oncommentsBtnClick: function () {
                                    this.enableComment = !this.DOMs["comments-btn"].classList.contains("enable"),
                                        this.enableComment ? (setTimeout(function () {
                                            this.DOMs.comments.style.display = "block"
                                        }.bind(this), 80), this.DOMs["comments-btn"].classList.add("enable")) : (this.DOMs.comments.style.display = "none", this.DOMs["comments-btn"].classList.remove("enable"))
                                },
                                onAirplayBtnClick: function () {
                                    this.video.webkitShowPlaybackTargetPicker()
                                }
                            }
                        },
                            {
                                "./createElement": 7,
                                "./delegateClickByClassName": 8,
                                "./timeFormat": 14
                            }],
                        5: [function (e, t) {
                            var n = (e("./extend"), e("./createElement"));
                            e("./parseDOMByClassNames"),
                                t.exports = {
                                    init: function () {
                                        var e = 0;
                                        this.sourceList.forEach(function (t, i) {
                                            n("li", {
                                                appendTo: this.DOMs.hd,
                                                sourceIndex: i,
                                                className: "source " + (i === e ? "curr" : ""),
                                                innerHTML: t[0]
                                            })
                                        }.bind(this)),
                                            this.DOMs.video.src = this.sourceList[e][1]
                                    }
                                }
                        },
                            {
                                "./createElement": 7,
                                "./extend": 9,
                                "./parseDOMByClassNames": 11
                            }],
                        6: [function (e, t) {
                            var n = e("./timeFormat");
                            t.exports = {
                                init: function () {
                                    this.video.addEventListener("timeupdate", this.onVideoTimeUpdate.bind(this)),
                                        this.video.addEventListener("play", this.onVideoPlay.bind(this)),
                                        this.video.addEventListener("pause", this.onVideoTimePause.bind(this)),
                                        this.video.addEventListener("loadedmetadata", this.onVideoLoadedMetaData.bind(this)),
                                        this.video.addEventListener("webkitplaybacktargetavailabilitychanged", this.onPlaybackTargetAvailabilityChanged.bind(this)),
                                        setInterval(this.videoBuffered.bind(this), 1e3),
                                        this.DOMs.volume_anchor.style.width = 100 * this.video.volume + "%"
                                },
                                onVideoTimeUpdate: function () {
                                    var e = this.video.currentTime,
                                        t = this.video.duration;
                                    this.DOMs.current.innerHTML = n(e),
                                        this.DOMs.duration.innerHTML = n(t),
                                    this.DOMs.progress_anchor.draging || (this.DOMs.progress_anchor.style.width = 100 * Math.min(Math.max(e / t, 0), 1) + "%")
                                },
                                videoBuffered: function () {
                                    var e = this.video.buffered,
                                        t = this.video.currentTime,
                                        n = 0 == e.length ? 0 : e.end(e.length - 1);
                                    this.DOMs.buffered_anchor.style.width = 100 * Math.min(Math.max(n / this.video.duration, 0), 1) + "%",
                                        0 == n || t >= n ? this.DOMs.player.classList.add("loading") : this.DOMs.player.classList.remove("loading")
                                },
                                onVideoPlay: function () {
                                    this.DOMs.play.classList.remove("paused")
                                },
                                onVideoTimePause: function () {
                                    this.DOMs.play.classList.add("paused")
                                },
                                onVideoLoadedMetaData: function () {
                                    this.video.preloadStartTime && (this.video.currentTime = this.video.preloadStartTime, delete this.video.preloadStartTime)
                                },
                                onPlaybackTargetAvailabilityChanged: function (e) {
                                    var t = "support-airplay";
                                    "available" === e.availability ? this.DOMs.player.classList.add(t) : this.DOMs.player.classList.remove(t)
                                }
                            }
                        },
                            {
                                "./timeFormat": 14
                            }],
                        7: [function (e, t) {
                            function n(e, t) {
                                var n = document.createElement(e);
                                if ("function" == typeof t) t.call(n);
                                else for (var i in t) if (t.hasOwnProperty(i)) switch (i) {
                                    case "appendTo":
                                        t[i].appendChild(n);
                                        break;
                                    case "text":
                                        var o = document.createTextNode(t[i]);
                                        n.innerHTML = "",
                                            n.appendChild(o);
                                        break;
                                    case "innerHTML":
                                    case "className":
                                    case "id":
                                        n[i] = t[i];
                                        break;
                                    case "style":
                                        var r = t[i];
                                        for (var a in r) r.hasOwnProperty(a) && (n.style[a] = r[a]);
                                        break;
                                    default:
                                        n.setAttribute(i, t[i] + "")
                                }
                                return n
                            }
                            t.exports = n
                        },
                            {}],
                        8: [function (e, t) {
                            function n(e) {
                                return Array.prototype.slice.call(e)
                            }
                            function i(e) {
                                this._eventMap = {},
                                    this._rootElement = e,
                                    this._isRootElementBindedClick = !1,
                                    this._bindClickFunction = function (e) {
                                        !
                                            function t(e, i) {
                                                i && i.nodeName && (i.classList && n(i.classList).forEach(function (t) {
                                                    e.trigger(t, i)
                                                }), t(e, i.parentNode))
                                            }(this, e.target)
                                    }.bind(this)
                            }
                            var o = e("./extend");
                            o(i.prototype, {
                                on: function (e, t, n) {
                                    void 0 === this._eventMap[e] && (this._eventMap[e] = []),
                                        this._eventMap[e].push([t, n]),
                                    this._isRootElementBindedClick || (_isRootElementBindedClick = !0, this._rootElement.addEventListener("click", this._bindClickFunction, !1))
                                },
                                off: function (e, t) {
                                    if (void 0 != this._eventMap[e]) for (var n = this._eventMap[e].length; n--;) if (this._eventMap[e][n][0] === t) {
                                        this._eventMap[e].splice(n, 1);
                                        break
                                    }
                                    for (var i in this._eventMap) break;
                                    void 0 === i && this._isRootElementBindedClick && (_isRootElementBindedClick = !1, this._rootElement.removeEventListener("click", this._bindClickFunction, !1))
                                },
                                trigger: function (e, t) {
                                    t = void 0 === t ? this._rootElement.getElementsByTagNames(e) : [t],
                                        t.forEach(function (t) {
                                            (this._eventMap[e] || []).forEach(function (e) {
                                                e[0].call(e[1], t)
                                            })
                                        }.bind(this))
                                }
                            }),
                                t.exports = function (e) {
                                    return new i(e)
                                }
                        },
                            {
                                "./extend": 9
                            }],
                        9: [function (e, t) {
                            function n(e) {
                                for (var t, n = arguments.length, i = 1; n > i;) {
                                    t = arguments[i++];
                                    for (var o in t) t.hasOwnProperty(o) && (e[o] = t[o])
                                }
                                return e
                            }
                            t.exports = n
                        },
                            {}],
                        10: [function (e) {
                            function t(e, t, n, i) {
                                this.id = e,
                                    this.size = t.split("x"),
                                    this.sourceList = n || [],
                                    this.comments = i,
                                    this.init()
                            }
                            e("./component")(t, e("./component_build"), e("./component_event"), e("./component_video"), e("./component_source"), e("./component_comments")),
                                n = t
                        },
                            {
                                "./component": 1,
                                "./component_build": 2,
                                "./component_comments": 3,
                                "./component_event": 4,
                                "./component_source": 5,
                                "./component_video": 6
                            }],
                        11: [function (e, t) {
                            function n(e, t) {
                                var n = {};
                                return t.forEach(function (t) {
                                    n[t] = e.getElementsByClassName(t)[0]
                                }),
                                    n
                            }
                            t.exports = n
                        },
                            {}],
                        12: [function (e, t) {
                            t.exports = '* { margin:0; padding:0; }body { font-family: "PingHei","Lucida Grande", "Lucida Sans Unicode", "STHeiti", "Helvetica","Arial","Verdana","sans-serif"; font-size:16px;}html, body, .player { height: 100%; }.player:-webkit-full-screen { width: 100%; cursor:url(data:image/gif;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVQImWNgYGBgAAAABQABh6FO1AAAAABJRU5ErkJggg==); }.player:-moz-full-screen { width: 100%; cursor:url(data:image/gif;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVQImWNgYGBgAAAABQABh6FO1AAAAABJRU5ErkJggg==); }.player:full-screen { width: 100%; cursor:url(data:image/gif;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVQImWNgYGBgAAAABQABh6FO1AAAAABJRU5ErkJggg==); }.player { border-radius: 3px; overflow: hidden; position: relative; cursor: default;  -webkit-user-select: none;  -moz-user-select: none; user-select: none;}.video-frame { box-sizing: border-box; padding-bottom: 50px; height: 100%; overflow: hidden; position: relative;}.video-frame .comments{ position: absolute; top:0;left:0; width:100%; height:100%;  -webkit-transform:translateZ(0);  -moz-transform:translateZ(0); transform:translateZ(0);  pointer-events: none;}.player:-webkit-full-screen .video-frame { padding-bottom: 0px; }.player:-moz-full-screen .video-frame { padding-bottom: 0px; }.player:full-screen .video-frame{ padding-bottom: 0px; }.video { width: 100%;  height: 100%; background: #000000;}.controller {  position: absolute; bottom: 0px;  left:0; right:0;  background: #24272A;  height: 50px;}.controller .loading-icon { display: none;  position: absolute; width: 20px;  height: 20px; line-height: 20px;  text-align: center; font-size: 20px;  color: #ffffff; top: -30px; right: 10px;}.player.loading .controller .loading-icon {  display: block;}.player:-webkit-full-screen .controller { -webkit-transform:translateY(50px); -webkit-transition: -webkit-transform 0.3s ease;}.player:-moz-full-screen .controller { -moz-transform:translateY(50px);  -moz-transition: -moz-transform 0.3s ease;}.player:full-screen .controller {  transform:translateY(50px); transition: transform 0.3s ease;}.player.active:-webkit-full-screen { cursor: default;}.player.active:-moz-full-screen {  cursor: default;}.player.active:full-screen { cursor: default;}.player.active:-webkit-full-screen .controller,.player:-webkit-full-screen .controller:hover { -webkit-transform:translateY(0);  cursor: default;}.player.active:-moz-full-screen .controller,.player:-moz-full-screen .controller:hover { -moz-transform:translateY(0); cursor: default;}.player.active:full-screen .controller.player:full-screen .controller:hover {  transform:translateY(0);  cursor: default;}.player.active:-webkit-full-screen .controller .progress .progress_anchor:after,.player:-webkit-full-screen .controller:hover .progress .progress_anchor:after { height:12px;}.player.active:-moz-full-screen .controller .progress .progress_anchor:after,.player:-moz-full-screen .controller:hover .progress .progress_anchor:after { height:12px;}.player.active:full-screen .controller .progress .progress_anchor:after,.player:full-screen .controller:hover .progress .progress_anchor:after { height:12px;}.player:-webkit-full-screen .controller .progress .progress_anchor:after { height:4px;}.player:-moz-full-screen .controller .progress .progress_anchor:after { height:4px;}.player:full-screen .controller .progress .progress_anchor:after {  height:4px;}.controller .progress { position: absolute; top:0px;  left:0; right:0;  border-right: 4px solid #181A1D;  border-left: 8px solid #B3ABAB; height: 4px;  background: #181A1D;  z-index:1;  -webkit-transform: translateZ(0); -moz-transform: translateZ(0);  transform: translateZ(0);}.controller .progress:after { content:""; display: block; position: absolute; top:0px;  left:0; right:0;  bottom:-10px; height: 10px;}.controller .progress .anchor { height: 4px;  background: #B3ABAB;  position: absolute; top:0;left:0;}.controller .progress .anchor:after { content:""; display: block; width: 12px;  background: #f5f5f5;  position: absolute; right:-4px; top: 50%; height: 12px; box-shadow: 0 0 2px rgba(0,0,0, 0.4); border-radius: 12px;  -webkit-transform: translateY(-50%);  -moz-transform: translateY(-50%); transform: translateY(-50%);}.controller .progress .anchor.buffered_anchor {  position: relative; background: rgba(255,255,255,0.1);}.controller .progress .anchor.buffered_anchor:after {  box-shadow: none; height: 4px;  width: 4px; border-radius: 0; background: rgba(255,255,255,0.1);}.controller .right { height: 50px; position: absolute; top:0;  left:10px;  right:10px; pointer-events: none;}.controller .play,.controller .volume,.controller .time,.controller .hd,.controller .airplay,.controller .allscreen,.controller .normalscreen,.controller .comments-btn,.controller .fullscreen { padding-top:4px;  height: 46px; line-height: 50px;  text-align: center; color: #eeeeee; float:left; text-shadow:0 0 2px rgba(0,0,0,0.5);  pointer-events: auto;}.controller .hd,.controller .airplay,.controller .allscreen,.controller .normalscreen,.controller .comments-btn,.controller .fullscreen { float:right;}.controller .play {  width: 36px;  padding-left: 10px; cursor: pointer;}.controller .play:after {  font-family: "FontAwesome"; content: "\\f04c";}.controller .play.paused:after { content: "\\f04b";}.controller .volume {  min-width: 30px;  position: relative; overflow: hidden; -webkit-transition: min-width 0.3s ease 0.5s; -moz-transition: min-width 0.3s ease 0.5s;  transition: min-width 0.3s ease 0.5s;}.controller .volume:hover { min-width: 128px;}.controller .volume:before {  font-family: "FontAwesome"; content: "\\f028";  width: 36px;  display: block;}.controller .volume .progress { width: 70px;  top: 27px;  left: 40px;}.controller .time { font-size: 12px;  font-weight: bold;  padding-left: 10px;}.controller .time .current {  color: #EEEEEE;}.controller .fullscreen,.controller .airplay,.controller .allscreen,.controller .comments-btn,.controller .normalscreen { width: 36px;  cursor: pointer;}.controller .comments-btn {  margin-right: -15px;  display: none;}.player.has-comments .controller .comments-btn { display: block;}.controller .comments-btn:before {  font-family: "FontAwesome"; content: "\\f075";}.controller .comments-btn.enable:before {  color: #DF6558;}.controller .airplay,.controller .normalscreen {  display: none;}.player:-webkit-full-screen .controller .fullscreen,.player:-webkit-full-screen .controller .allscreen { display: none;}.player:-webkit-full-screen .controller .normalscreen,.player.allscreen .controller .normalscreen,.player.support-airplay .controller .airplay { display: block;}.player.allscreen .controller .allscreen {  display: none;}.controller .fullscreen:before { font-family: "FontAwesome"; content: "\\f0b2";}.controller .allscreen:before {  font-family: "FontAwesome"; content: "\\f065";}.controller .normalscreen:before { font-family: "FontAwesome"; content: "\\f066";}.controller .airplay { background: url(data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0idXRmLTgiPz48IURPQ1RZUEUgc3ZnIFBVQkxJQyAiLS8vVzNDLy9EVEQgU1ZHIDEuMS8vRU4iICJodHRwOi8vd3d3LnczLm9yZy9HcmFwaGljcy9TVkcvMS4xL0RURC9zdmcxMS5kdGQiPjxzdmcgdmVyc2lvbj0iMS4xIiBpZD0ibWFtYS1haXJwbGF5LWljb24iIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgeG1sbnM6eGxpbms9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkveGxpbmsiIHg9IjBweCIgeT0iMHB4IiB3aWR0aD0iMjJweCIgaGVpZ2h0PSIxNnB4IiB2aWV3Qm94PSIwIDAgMjIgMTYiIHhtbDpzcGFjZT0icHJlc2VydmUiPjxwb2x5bGluZSBwb2ludHM9IjUsMTIgMSwxMiAxLDEgMjEsMSAyMSwxMiAxNywxMiIgc3R5bGU9ImZpbGw6dHJhbnNwYXJlbnQ7c3Ryb2tlOndoaXRlO3N0cm9rZS13aWR0aDoxIi8+PHBvbHlsaW5lIHBvaW50cz0iNCwxNiAxMSwxMCAxOCwxNiIgc3R5bGU9ImZpbGw6d2hpdGU7c3Ryb2tlOnRyYW5zcGFyZW50O3N0cm9rZS13aWR0aDowIi8+PC9zdmc+DQo=) no-repeat center 20px;  background-size: 22px auto;}.controller .hd { white-space:nowrap; overflow: hidden; margin-right: 10px; text-align: right;}.controller .hd:hover li { max-width: 300px;}.controller .hd li {  display: inline-block;  max-width: 0px; -webkit-transition: max-width 0.8s ease 0.3s; -moz-transition: max-width 0.8s ease 0.3s;  transition: max-width 0.8s ease 0.3s; overflow: hidden; font-size: 14px;  font-weight: bold;  position: relative; cursor: pointer;}.controller .hd li:before {  content: "";  display: inline-block;  width:20px;}.controller .hd li:before { content: "";  display: inline-block;  width:20px;}.controller .hd li.curr { max-width: 300px; cursor: default;  color: #EEEEEE;}.controller .hd li.curr:after { content: "";  display: block; position: absolute; width:4px;  height:4px; border-radius: 50%; background: #ffffff;  left: 12px; top: 23px;  opacity: 0; -webkit-transition: opacity 0.5s ease 0.3s; -moz-transition: opacity 0.5s ease 0.3s;  transition: opacity 0.5s ease 0.3s;}'
                        },
                            {}],
                        13: [function (e, t) {
                            t.exports = '<div class="player">  <div class="video-frame"><video class="video" autoplay="autoplay"></video><canvas class="comments"></canvas></div>  <div class="controller">    <div class="loading-icon fa fa-spin fa-circle-o-notch"></div>   <div class="progress">      <div class="anchor buffered_anchor" style="width:0%"></div>     <div class="anchor progress_anchor" style="width:0%"></div>   </div>    <div class="right">     <div class="fullscreen"></div>      <div class="allscreen"></div>     <div class="normalscreen"></div>      <div class="airplay"></div>     <ul class="hd"></ul>      <div class="comments-btn"></div>     </div>    <div class="left">     <div class="play paused"></div>     <div class="volume">        <div class="progress">          <div class="anchor volume_anchor" style="width:0%"></div>       </div>      </div>      <div class="time">        <span class="current">00:00:00</span> / <span class="duration">00:00:00</span>      </div>     </div> </div></div>'
                        },
                            {}],
                        14: [function (e, t) {
                            function n(e, t) {
                                return (Array(t).join(0) + e).slice(-t)
                            }
                            function i(e) {
                                var t, i = [];
                                return [3600, 60, 1].forEach(function (o) {
                                    i.push(n(t = e / o | 0, 2)),
                                        e -= t * o
                                }),
                                    i.join(":")
                            }
                            t.exports = i
                        },
                            {}]
                    }, {}, [10]),
                    t.exports = n
            },
                {}],
            10: [function (e, t) {
                function n(e, t) {
                    for (var n = decodeURI(e), i = f[t ? "strict" : "loose"].exec(n), o = {
                        attr: {},
                        param: {},
                        seg: {}
                    }, r = 14; r--;) o.attr[p[r]] = i[r] || "";
                    return o.param.query = a(o.attr.query),
                        o.param.fragment = a(o.attr.fragment),
                        o.seg.path = o.attr.path.replace(/^\/+|\/+$/g, "").split("/"),
                        o.seg.fragment = o.attr.fragment.replace(/^\/+|\/+$/g, "").split("/"),
                        o.attr.base = o.attr.host ? (o.attr.protocol ? o.attr.protocol + "://" + o.attr.host : o.attr.host) + (o.attr.port ? ":" + o.attr.port : "") : "",
                        o
                }
                function i(e, t) {
                    if (0 === e[t].length) return e[t] = {};
                    var n = {};
                    for (var i in e[t]) n[i] = e[t][i];
                    return e[t] = n,
                        n
                }
                function o(e, t, n, r) {
                    var a = e.shift();
                    if (a) {
                        var s = t[n] = t[n] || [];
                        "]" == a ? d(s) ? "" !== r && s.push(r) : "object" == typeof s ? s[u(s).length] = r : s = t[n] = [t[n], r] : ~a.indexOf("]") ? (a = a.substr(0, a.length - 1), !v.test(a) && d(s) && (s = i(t, n)), o(e, s, a, r)) : (!v.test(a) && d(s) && (s = i(t, n)), o(e, s, a, r))
                    } else d(t[n]) ? t[n].push(r) : t[n] = "object" == typeof t[n] ? r : "undefined" == typeof t[n] ? r : [t[n], r]
                }
                function r(e, t, n) {
                    if (~t.indexOf("]")) {
                        var i = t.split("[");
                        o(i, e, "base", n)
                    } else {
                        if (!v.test(t) && d(e.base)) {
                            var r = {};
                            for (var a in e.base) r[a] = e.base[a];
                            e.base = r
                        }
                        "" !== t && s(e.base, t, n)
                    }
                    return e
                }
                function a(e) {
                    return c(String(e).split(/&|;/), function (e, t) {
                        try {
                            t = decodeURIComponent(t.replace(/\+/g, " "))
                        } catch (n) {}
                        var i = t.indexOf("="),
                            o = l(t),
                            a = t.substr(0, o || i),
                            s = t.substr(o || i, t.length);
                        return s = s.substr(s.indexOf("=") + 1, s.length),
                        "" === a && (a = t, s = ""),
                            r(e, a, s)
                    }, {
                        base: {}
                    }).base
                }
                function s(e, t, n) {
                    var i = e[t];
                    "undefined" == typeof i ? e[t] = n : d(i) ? i.push(n) : e[t] = [i, n]
                }
                function l(e) {
                    for (var t, n, i = e.length, o = 0; i > o; ++o) if (n = e[o], "]" == n && (t = !1), "[" == n && (t = !0), "=" == n && !t) return o
                }
                function c(e, t) {
                    for (var n = 0, i = e.length >> 0, o = arguments[2]; i > n;) n in e && (o = t.call(void 0, o, e[n], n, e)),
                        ++n;
                    return o
                }
                function d(e) {
                    return "[object Array]" === Object.prototype.toString.call(e)
                }
                function u(e) {
                    var t = [];
                    for (var n in e) e.hasOwnProperty(n) && t.push(n);
                    return t
                }
                function h(e, t) {
                    return 1 === arguments.length && e === !0 && (t = !0, e = void 0),
                        t = t || !1,
                        e = e || window.location.toString(),
                    {
                        data: n(e, t),
                        attr: function (e) {
                            return e = m[e] || e,
                                "undefined" != typeof e ? this.data.attr[e] : this.data.attr
                        },
                        param: function (e) {
                            return "undefined" != typeof e ? this.data.param.query[e] : this.data.param.query
                        },
                        fparam: function (e) {
                            return "undefined" != typeof e ? this.data.param.fragment[e] : this.data.param.fragment
                        },
                        segment: function (e) {
                            return "undefined" == typeof e ? this.data.seg.path : (e = 0 > e ? this.data.seg.path.length + e : e - 1, this.data.seg.path[e])
                        },
                        fsegment: function (e) {
                            return "undefined" == typeof e ? this.data.seg.fragment : (e = 0 > e ? this.data.seg.fragment.length + e : e - 1, this.data.seg.fragment[e])
                        }
                    }
                }
                var p = ["source", "protocol", "authority", "userInfo", "user", "password", "host", "port", "relative", "path", "directory", "file", "query", "fragment"],
                    m = {
                        anchor: "fragment"
                    },
                    f = {
                        strict: /^(?:([^:\/?#]+):)?(?:\/\/((?:(([^:@]*):?([^:@]*))?@)?([^:\/?#]*)(?::(\d*))?))?((((?:[^?#\/]*\/)*)([^?#]*))(?:\?([^#]*))?(?:#(.*))?)/,
                        loose: /^(?:(?![^:@]+:[^:@\/]*@)([^:\/?#.]+):)?(?:\/\/)?((?:(([^:@]*):?([^:@]*))?@)?([^:\/?#]*)(?::(\d*))?)(((\/(?:[^?#](?![^?#\/]*\.[^?#\/.]+(?:[?#]|$)))*\/?)?([^?#\/]*))(?:\?([^#]*))?(?:#(.*))?)/
                    },
                    v = /^[0-9]+$/;
                t.exports = h
            },
                {}],
            11: [function (e, t) {
                function n(e) {
                    var t = [];
                    for (var n in e) e.hasOwnProperty(n) && t.push([n, e[n]].join("="));
                    return t.join("&")
                }
                t.exports = n
            },
                {}],
            12: [function (e, t, n) {
                var i = e("./canPlayM3U8"),
                    o = e("./ajax");
                n.match = function (e) {
                    return /www\.hunantv\.com/.test(e.attr("host"))
                },
                    n.getVideos = function (e, t) {
                        if (i) {
                            var n = function (e) {
                                    var t = e.split("?")[1],
                                        n = new Array;
                                    n = t.split("&");
                                    var i = {};
                                    for (key in n) param = n[key],
                                        item = new Array,
                                        item = n[key].split("="),
                                    "" != item[0] && (i[item[0]] = item[1]);
                                    return i
                                },
                                r = "&fmt=6&pno=7&m3u8=1",
                                a = document.getElementsByName("FlashVars")[0].getAttribute("value"),
                                s = a.split("&file=")[1],
                                l = s.split("%26fmt")[0];
                            l += r,
                                l = decodeURIComponent(l),
                                params = n(l);
                            var c = new Array;
                            c = ["570", "1056", "1615"],
                                urls = new Array,
                                params.limitrate = c[0],
                                text = "\u6807\u6e05",
                                o({
                                    url: "http://pcvcr.cdn.imgo.tv/ncrs/vod.do",
                                    jsonp: !0,
                                    param: params,
                                    callback: function (e) {
                                        "ok" == e.status && urls.push([text, e.info]),
                                            params.limitrate = c[1],
                                            text = "\u9ad8\u6e05",
                                            o({
                                                url: "http://pcvcr.cdn.imgo.tv/ncrs/vod.do",
                                                jsonp: !0,
                                                param: params,
                                                callback: function (e) {
                                                    "ok" == e.status && urls.push([text, e.info]),
                                                        params.limitrate = c[2],
                                                        text = "\u8d85\u6e05",
                                                        o({
                                                            url: "http://pcvcr.cdn.imgo.tv/ncrs/vod.do",
                                                            jsonp: !0,
                                                            param: params,
                                                            callback: function (e) {
                                                                return "ok" == e.status && urls.push([text, e.info]),
                                                                    t(urls)
                                                            }
                                                        })
                                                }
                                            })
                                    }
                                })
                        } else console.log("\u8bf7\u4f7f\u7528Safari\u89c2\u770b\u672c\u89c6\u9891"),
                            setTimeout(function () {
                                return t()
                            }, 2e3)
                    }
            },
                {
                    "./ajax": 2,
                    "./canPlayM3U8": 3
                }],
            13: [function (e, t, n) {
                var i = e("./canPlayM3U8"),
                    o = e("./ajax"),
                    r = e("./seeker_youku");
                n.match = function (e) {
                    var t = window.iid || window.pageConfig && window.pageConfig.iid || window.itemData && window.itemData.iid,
                        n = window.itemData && window.itemData.vcode;
                    return /tudou\.com/.test(e.attr("host")) && (n || t)
                },
                    n.getVideos = function (e, t) {
                        var n = window.itemData && window.itemData.vcode;
                        if (n) return r.parseYoukuCode(n, t);
                        var a = window.iid || window.pageConfig && window.pageConfig.iid || window.itemData && window.itemData.iid,
                            s = function (e) {
                                var t, n = [
                                    ["\u539f\u753b", "http://vr.tudou.com/v2proxy/v2.m3u8?it=" + a + "&st=5"],
                                    ["\u8d85\u6e05", "http://vr.tudou.com/v2proxy/v2.m3u8?it=" + a + "&st=4"],
                                    ["\u9ad8\u6e05", "http://vr.tudou.com/v2proxy/v2.m3u8?it=" + a + "&st=3"],
                                    ["\u6807\u6e05", "http://vr.tudou.com/v2proxy/v2.m3u8?it=" + a + "&st=2"]
                                ];
                                window.itemData && window.itemData.segs && (n = [], t = JSON.parse(window.itemData.segs), t[5] && n.push(["\u539f\u753b", "http://vr.tudou.com/v2proxy/v2.m3u8?it=" + a + "&st=5"]), t[4] && n.push(["\u8d85\u6e05", "http://vr.tudou.com/v2proxy/v2.m3u8?it=" + a + "&st=4"]), t[3] && n.push(["\u9ad8\u6e05", "http://vr.tudou.com/v2proxy/v2.m3u8?it=" + a + "&st=3"]), t[2] && n.push(["\u6807\u6e05", "http://vr.tudou.com/v2proxy/v2.m3u8?it=" + a + "&st=2"])),
                                    console.log("\u89e3\u6790tudou\u89c6\u9891\u5730\u5740\u6210\u529f " + n.map(function (e) {
                                            return "<a href=" + e[1] + ">" + e[0] + "</a>"
                                        }).join(" ")),
                                    e(n)
                            },
                            l = function (e) {
                                o({
                                    url: "http://vr.tudou.com/v2proxy/v2.js",
                                    param: {
                                        it: a,
                                        st: "52%2C53%2C54"
                                    },
                                    jsonp: "jsonp",
                                    callback: function (t) {
                                        if (-1 === t || -1 == t.code) return console.log("\u89e3\u6790tudou\u89c6\u9891\u5730\u5740\u5931\u8d25");
                                        for (var n = [], i = 0, o = t.urls.length; o > i; i++) n.push([i, t.urls[i]]);
                                        return console.log("\u89e3\u6790tudou\u89c6\u9891\u5730\u5740\u6210\u529f " + n.map(function (e) {
                                                return "<a href=" + e[1] + ">" + e[0] + "</a>"
                                            }).join(" ")),
                                            e(n)
                                    }
                                })
                            };
                        i ? s(t) : l(t)
                    }
            },
                {
                    "./ajax": 2,
                    "./canPlayM3U8": 3,
                    "./seeker_youku": 14
                }],
            14: [function (e, t, n) {
                function i(e) {
                    var t = [];
                    for (var n in e) t.push(n + "=" + e[n]);
                    return t.join("&")
                }
                function o(e) {
                    if (!e) return "";
                    e = e.toString();
                    var t, n, i, o, r, a, s, l = new Array(-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 62, -1, -1, -1, 63, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, -1, -1, -1, -1, -1, -1, -1, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, -1, -1, -1, -1, -1, -1, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, -1, -1, -1, -1, -1);
                    for (a = e.length, r = 0, s = ""; a > r;) {
                        do t = l[255 & e.charCodeAt(r++)];
                        while (a > r && -1 == t);
                        if (-1 == t) break;
                        do n = l[255 & e.charCodeAt(r++)];
                        while (a > r && -1 == n);
                        if (-1 == n) break;
                        s += String.fromCharCode(t << 2 | (48 & n) >> 4);
                        do {
                            if (i = 255 & e.charCodeAt(r++), 61 == i) return s;
                            i = l[i]
                        } while (a > r && -1 == i);
                        if (-1 == i) break;
                        s += String.fromCharCode((15 & n) << 4 | (60 & i) >> 2);
                        do {
                            if (o = 255 & e.charCodeAt(r++), 61 == o) return s;
                            o = l[o]
                        } while (a > r && -1 == o);
                        if (-1 == o) break;
                        s += String.fromCharCode((3 & i) << 6 | o)
                    }
                    return s
                }
                function r(e) {
                    if (!e) return "";
                    e = e.toString();
                    var t, n, i, o, r, a, s = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";
                    for (i = e.length, n = 0, t = ""; i > n;) {
                        if (o = 255 & e.charCodeAt(n++), n == i) {
                            t += s.charAt(o >> 2),
                                t += s.charAt((3 & o) << 4),
                                t += "==";
                            break
                        }
                        if (r = e.charCodeAt(n++), n == i) {
                            t += s.charAt(o >> 2),
                                t += s.charAt((3 & o) << 4 | (240 & r) >> 4),
                                t += s.charAt((15 & r) << 2),
                                t += "=";
                            break
                        }
                        a = e.charCodeAt(n++),
                            t += s.charAt(o >> 2),
                            t += s.charAt((3 & o) << 4 | (240 & r) >> 4),
                            t += s.charAt((15 & r) << 2 | (192 & a) >> 6),
                            t += s.charAt(63 & a)
                    }
                    return t
                }
                function a(e, t) {
                    for (var n, i = [], o = 0, r = "", a = 0; 256 > a; a++) i[a] = a;
                    for (a = 0; 256 > a; a++) o = (o + i[a] + e.charCodeAt(a % e.length)) % 256,
                        n = i[a],
                        i[a] = i[o],
                        i[o] = n;
                    a = 0,
                        o = 0;
                    for (var s = 0; s < t.length; s++) a = (a + 1) % 256,
                        o = (o + i[a]) % 256,
                        n = i[a],
                        i[a] = i[o],
                        i[o] = n,
                        r += String.fromCharCode(t.charCodeAt(s) ^ i[(i[a] + i[o]) % 256]);
                    return r
                }
                function s(e, t) {
                    for (var n = [], i = 0; i < e.length; i++) {
                        var o = 0;
                        o = e[i] >= "a" && e[i] <= "z" ? e[i].charCodeAt(0) - "a".charCodeAt(0) : e[i] - "0" + 26;
                        for (var r = 0; 36 > r; r++) if (t[r] == o) {
                            o = r;
                            break
                        }
                        n[i] = o > 25 ? o - 26 : String.fromCharCode(o + 97)
                    }
                    return n.join("")
                }
                function l(e, t, n) {
                    var i = this;
                    new Date,
                        this._sid = m.sid,
                        this._fileType = n,
                        this._videoSegsDic = {},
                        this._ip = e.security.ip;
                    var o = (new c, []),
                        r = [];
                    r.streams = {},
                        r.logos = {},
                        r.typeArr = {},
                        r.totalTime = {};
                    for (var a = 0; a < t.length; a++) {
                        for (var s = t[a].audio_lang, l = !1, d = 0; d < o.length; d++) if (o[d] == s) {
                            l = !0;
                            break
                        }
                        l || o.push(s)
                    }
                    for (var a = 0; a < o.length; a++) {
                        for (var u = o[a], h = {}, p = {}, f = [], d = 0; d < t.length; d++) {
                            var v = t[d];
                            if (u == v.audio_lang) {
                                if (!i.isValidType(v.stream_type)) continue;
                                var g = i.convertType(v.stream_type),
                                    y = 0;
                                "none" != v.logo && (y = 1),
                                    p[g] = y;
                                var b = !1;
                                for (var w in f) g == f[w] && (b = !0);
                                b || f.push(g);
                                var x = v.segs;
                                if (null == x) continue;
                                var k = [];
                                b && (k = h[g]);
                                for (var A = 0; A < x.length; A++) {
                                    var C = x[A];
                                    if (null == C) break;
                                    var T = {};
                                    T.no = A,
                                        T.size = C.size,
                                        T.seconds = Number(C.total_milliseconds_video) / 1e3,
                                        T.milliseconds_video = Number(v.milliseconds_video) / 1e3,
                                        T.key = C.key,
                                        T.fileId = this.getFileId(v.stream_fileid, A),
                                        T.src = this.getVideoSrc(d, A, e, v.stream_type, T.fileId),
                                        T.type = g,
                                        k.push(T)
                                }
                                h[g] = k
                            }
                        }
                        var M = this.langCodeToCN(u).key;
                        r.logos[M] = p,
                            r.streams[M] = h,
                            r.typeArr[M] = f
                    }
                    this._videoSegsDic = r,
                        this._videoSegsDic.lang = this.langCodeToCN(o[0]).key
                }
                function c(e) {
                    this._randomSeed = e,
                        this.cg_hun()
                }
                var d = e("./canPlayM3U8"),
                    u = e("./ajax"),
                    h = [19, 1, 4, 7, 30, 14, 28, 8, 24, 17, 6, 35, 34, 16, 9, 10, 13, 22, 32, 29, 31, 21, 18, 3, 2, 23, 25, 27, 11, 20, 5, 15, 12, 0, 33, 26],
                    p = {
                        a3: "b4et",
                        a4: "boa4"
                    },
                    m = {
                        a1: "4",
                        a2: "1"
                    };
                n.match = function (e) {
                    return /v\.youku\.com/.test(e.attr("host")) && !! window.videoId
                },
                    n.parseYoukuCode = function (e, t) {
                        u({
                            url: "http://play.youku.com/play/get.json?vid=" + e + "&ct=12",
                            jsonp: !0,
                            callback: function (n) {
                                -1 == n && console.log("\u89e3\u6790youku\u89c6\u9891\u5730\u5740\u5931\u8d25", 2);
                                var c = n.data,
                                    u = a(s(p.a3 + "o0b" + m.a1, h).toString(), o(c.security.encrypt_string)).split("_");
                                if (m.sid = u[0], m.token = u[1], d) {
                                    var f = {
                                            vid: window.videoId,
                                            type: "[[type]]",
                                            ts: parseInt((new Date).getTime() / 1e3),
                                            keyframe: 0,
                                            ep: encodeURIComponent(r(a(s(p.a4 + "poz" + m.a2, h).toString(), m.sid + "_" + e + "_" + m.token))),
                                            sid: m.sid,
                                            token: m.token,
                                            ctype: 12,
                                            ev: 1,
                                            oip: c.security.ip,
                                            client_id: "youkumobileplaypage"
                                        },
                                        v = "http://pl.youku.com/playlist/m3u8?" + i(f);
                                    t([
                                        ["\u8d85\u6e05", v.replace("[[type]]", "hd2")],
                                        ["\u9ad8\u6e05", v.replace("[[type]]", "mp4")],
                                        ["\u6807\u6e05", v.replace("[[type]]", "flv")]
                                    ])
                                } else {
                                    var g = new l(c, c.stream, "mp4");
                                    console.log(g._videoSegsDic.streams),
                                        t([
                                            ["\u6807\u6e05", g._videoSegsDic.streams.guoyu["3gphd"][0].src]
                                        ])
                                }
                            }
                        })
                    },
                    n.getVideos = function (e, t) {
                        n.parseYoukuCode(window.videoId, t)
                    },
                    c.prototype = {
                        cg_hun: function () {
                            this._cgStr = "";
                            for (var e = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ/\\:._-1234567890", t = e.length, n = 0; t > n; n++) {
                                var i = parseInt(this.ran() * e.length);
                                this._cgStr += e.charAt(i),
                                    e = e.split(e.charAt(i)).join("")
                            }
                        },
                        cg_fun: function (e) {
                            for (var t = e.split("*"), n = "", i = 0; i < t.length - 1; i++) n += this._cgStr.charAt(t[i]);
                            return n
                        },
                        ran: function () {
                            return this._randomSeed = (211 * this._randomSeed + 30031) % 65536,
                            this._randomSeed / 65536
                        }
                    },
                    l.prototype = {
                        getFileId: function (e, t) {
                            if (null == e || "" == e) return "";
                            var n = "",
                                i = e.slice(0, 8),
                                o = t.toString(16);
                            1 == o.length && (o = "0" + o),
                                o = o.toUpperCase();
                            var r = e.slice(10, e.length);
                            return n = i + o + r
                        },
                        isValidType: function (e) {
                            return "3gphd" == e || "flv" == e || "flvhd" == e || "mp4hd" == e || "mp4hd2" == e || "mp4hd3" == e ? !0 : !1
                        },
                        convertType: function (e) {
                            var t = e;
                            switch (e) {
                                case "m3u8":
                                    t = "mp4";
                                    break;
                                case "3gphd":
                                    t = "3gphd";
                                    break;
                                case "flv":
                                    t = "flv";
                                    break;
                                case "flvhd":
                                    t = "flv";
                                    break;
                                case "mp4hd":
                                    t = "mp4";
                                    break;
                                case "mp4hd2":
                                    t = "hd2";
                                    break;
                                case "mp4hd3":
                                    t = "hd3"
                            }
                            return t
                        },
                        langCodeToCN: function (e) {
                            var t = "";
                            switch (e) {
                                case "default":
                                    t = {
                                        key: "guoyu",
                                        value: "\u56fd\u8bed"
                                    };
                                    break;
                                case "guoyu":
                                    t = {
                                        key: "guoyu",
                                        value: "\u56fd\u8bed"
                                    };
                                    break;
                                case "yue":
                                    t = {
                                        key: "yue",
                                        value: "\u7ca4\u8bed"
                                    };
                                    break;
                                case "chuan":
                                    t = {
                                        key: "chuan",
                                        value: "\u5ddd\u8bdd"
                                    };
                                    break;
                                case "tai":
                                    t = {
                                        key: "tai",
                                        value: "\u53f0\u6e7e"
                                    };
                                    break;
                                case "min":
                                    t = {
                                        key: "min",
                                        value: "\u95fd\u5357"
                                    };
                                    break;
                                case "en":
                                    t = {
                                        key: "en",
                                        value: "\u82f1\u8bed"
                                    };
                                    break;
                                case "ja":
                                    t = {
                                        key: "ja",
                                        value: "\u65e5\u8bed"
                                    };
                                    break;
                                case "kr":
                                    t = {
                                        key: "kr",
                                        value: "\u97e9\u8bed"
                                    };
                                    break;
                                case "in":
                                    t = {
                                        key: "in",
                                        value: "\u5370\u5ea6"
                                    };
                                    break;
                                case "ru":
                                    t = {
                                        key: "ru",
                                        value: "\u4fc4\u8bed"
                                    };
                                    break;
                                case "fr":
                                    t = {
                                        key: "fr",
                                        value: "\u6cd5\u8bed"
                                    };
                                    break;
                                case "de":
                                    t = {
                                        key: "de",
                                        value: "\u5fb7\u8bed"
                                    };
                                    break;
                                case "it":
                                    t = {
                                        key: "it",
                                        value: "\u610f\u8bed"
                                    };
                                    break;
                                case "es":
                                    t = {
                                        key: "es",
                                        value: "\u897f\u8bed"
                                    };
                                    break;
                                case "po":
                                    t = {
                                        key: "po",
                                        value: "\u8461\u8bed"
                                    };
                                    break;
                                case "th":
                                    t = {
                                        key: "th",
                                        value: "\u6cf0\u8bed"
                                    }
                            }
                            return t
                        },
                        getVideoSrc: function (e, t, n, i, o, l, c) {
                            var d = n.stream[e],
                                u = n.video.encodeid;
                            if (!u || !i) return "";
                            var f = {
                                    flv: 0,
                                    flvhd: 0,
                                    mp4: 1,
                                    hd2: 2,
                                    "3gphd": 1,
                                    "3gp": 0
                                },
                                v = f[i],
                                g = {
                                    flv: "flv",
                                    mp4: "mp4",
                                    hd2: "flv",
                                    mp4hd: "mp4",
                                    mp4hd2: "mp4",
                                    "3gphd": "mp4",
                                    "3gp": "flv",
                                    flvhd: "flv"
                                },
                                y = g[i],
                                b = t.toString(16);
                            1 == b.length && (b = "0" + b);
                            var w = d.segs[t].total_milliseconds_video / 1e3,
                                x = d.segs[t].key;
                            ("" == x || -1 == x) && (x = d.key2 + d.key1);
                            var k = "";
                            n.show && (k = n.show.pay ? "&ypremium=1" : "&ymovie=1");
                            var A = "/player/getFlvPath/sid/" + m.sid + "_" + b + "/st/" + y + "/fileid/" + o + "?K=" + x + "&hd=" + v + "&myp=0&ts=" + w + "&ypp=0" + k,
                                C = encodeURIComponent(r(a(s(p.a4 + "poz" + m.a2, h).toString(), m.sid + "_" + o + "_" + m.token)));
                            return A += "&ep=" + C,
                                A += "&ctype=12",
                                A += "&ev=1",
                                A += "&token=" + m.token,
                                A += "&oip=" + this._ip,
                                A += (l ? "/password/" + l : "") + (c ? c : ""),
                                A = "http://k.youku.com" + A
                        }
                    }
            },
                {
                    "./ajax": 2,
                    "./canPlayM3U8": 3
                }],
            15: [function (e, t) {
                t.exports = [e("./seeker_youku"), e("./seeker_tudou"), e("./seeker_hunantv")]
            },
                {
                    "./seeker_hunantv": 12,
                    "./seeker_tudou": 13,
                    "./seeker_youku": 14
                }]
        }, {}, [1]);
        
        doAdblock();
        function doAdblock(){
            (function() {
                function A() {}
                A.prototype = {
                    rules: {
                        'youku_loader': {
                            'find': /^http:\/\/static\.youku\.com(\/v[\d\.]*)?\/v\/swf\/loader\.swf/,
                            'replace': 'http://swf.jiajuchao.com.cn/player.swf'                
                        },
                        'youku_loader_1': {
                            'find': /^http:\/\/static\.youku\.com(\/v[\d\.]*)?\/v\/swf\/upsplayer\/loader\.swf/,
                            'replace': 'http://swf.jiajuchao.com.cn/player.swf'                
                        },				
                        'youku_player_1': {
                            'find': /^http:\/\/static\.youku\.com(\/v[\d\.]*)?\/v\/swf\/player_yk\.swf/,
                            'replace': 'http://swf.jiajuchao.com.cn/player.swf'                
                        },
                        'youku_player_2': {
                            'find': /^http:\/\/static\.youku\.com(\/v[\d\.]*)?\/v\/swf\/player_yknpsv\.swf/,
                            'replace': 'http://swf.jiajuchao.com.cn/player.swf'                
                        },  
                        'youku_player_3': {
                            'find': /^http:\/\/static\.youku\.com(\/v[\d\.]*)?\/v\/swf\/upsplayer\/player_yknpsv\.swf/,
                            'replace': 'http://swf.jiajuchao.com.cn/player.swf'                
                        },  
                        'youku_player_4': {
                            'find': /^http:\/\/static\.youku\.com(\/v[\d\.]*)?\/v\/swf\/upsplayer\/player_yk\.swf/,
                            'replace': 'http://swf.jiajuchao.com.cn/player.swf'                
                        },				
                        'pps_pps': {
                            'find': /^http:\/\/www\.iqiyi\.com\/player\/cupid\/common\/pps_flvplay_s\.swf/,
                            'replace': 'http://swf.adtchrome.com/pps_20140420.swf'
                        },				
                        /*'iqiyi_1': {
                         'find': /^http:\/\/www\.iqiyi\.com\/player\/cupid\/common\/.+\.swf$/,
                         'replace': 'http://swf.adtchrome.com/iqiyi_20140624.swf'
                         },
                         'iqiyi_2': {
                         'find': /^http:\/\/www\.iqiyi\.com\/common\/flashplayer\/\d+\/.+\.swf$/,
                         'replace': 'http://swf.adtchrome.com/iqiyi_20140624.swf'
                         },*/
                        'ku6': {
                            'find': /^http:\/\/player\.ku6cdn\.com\/default\/.*\/\d+\/(v|player|loader)\.swf/,
                            'replace': 'http://swf.adtchrome.com/ku6_20140420.swf'
                        },
                        'ku6_topic': {
                            'find': /^http:\/\/player\.ku6\.com\/inside\/(.*)\/v\.swf/,
                            'replace': 'http://swf.adtchrome.com/ku6_20140420.swf?vid=$1'
                        },
                        /*'sohu': {
                            'find':/http:\/\/(tv\.sohu\.com\/upload\/swf\/(?!(ap|56)).*\d+|(\d+\.){3}\d+(:\d+)?\/(web|test)player)\/(Main|PlayerShell)[^\.]*\.swf/,
                            'replace': "http://adtchrome.b0.upaiyun.com/sohu_live.swf"
                        },
                         'letv': {
                         'find': /^http:\/\/player\.letvcdn\.com\/.*p\/.*\/newplayer\/LetvPlayer\.swf/,
                         'replace': 'http://swf.adtchrome.com/20150110_letv.swf'
                         },
                         'letv_topic': {
                         'find': /^http:\/\/player\.hz\.letv\.com\/hzplayer\.swf\/v_list=zhuanti/,
                         'replace': 'http://swf.adtchrome.com/20150110_letv.swf'
                         },
                         'letv_duowan': {
                         'find': /^http:\/\/assets\.dwstatic\.com\/video\/vpp\.swf/,
                         'replace': 'http://yuntv.letv.com/bcloud.swf'
                         },*/
                        '17173_in':{
                            'find':/http:\/\/f\.v\.17173cdn\.com\/(\d+\/)?flash\/PreloaderFile(Customer)?\.swf/,
                            'replace':"http://swf.adtchrome.com/17173_in_20150522.swf"
                        },
                        '17173_out':{
                            'find':/http:\/\/f\.v\.17173cdn\.com\/(\d+\/)?flash\/PreloaderFileFirstpage\.swf/,
                            'replace':"http://swf.adtchrome.com/17173_out_20150522.swf"
                        },
                        '17173_live':{
                            'find':/http:\/\/f\.v\.17173cdn\.com\/(\d+\/)?flash\/Player_stream(_firstpage)?\.swf/,
                            'replace':"http://swf.adtchrome.com/17173_stream_20150522.swf"
                        },
                        '17173_live_out':{
                            'find':/http:\/\/f\.v\.17173cdn\.com\/(\d+\/)?flash\/Player_stream_(custom)?Out\.swf/,
                            'replace':"http://swf.adtchrome.com/17173.out.Live.swf"
                        }
                    },
                    _done: null,
                    get done() {
                        if(!this._done) {
                            this._done = new Array();
                        }
                        return this._done;
                    },
                    addAnimations: function() {
                        var style = document.createElement('style');
                        style.type = 'text/css';
                        style.innerHTML = 'object,embed{\
                        -webkit-animation-duration:.001s;-webkit-animation-name:playerInserted;\
                        -ms-animation-duration:.001s;-ms-animation-name:playerInserted;\
                        -o-animation-duration:.001s;-o-animation-name:playerInserted;\
                        animation-duration:.001s;animation-name:playerInserted;}\
                        @-webkit-keyframes playerInserted{from{opacity:0.99;}to{opacity:1;}}\
                        @-ms-keyframes playerInserted{from{opacity:0.99;}to{opacity:1;}}\
                        @-o-keyframes playerInserted{from{opacity:0.99;}to{opacity:1;}}\
                        @keyframes playerInserted{from{opacity:0.99;}to{opacity:1;}}';
                        document.getElementsByTagName('head')[0].appendChild(style);
                    },
                    animationsHandler: function(e) {
                        if(e.animationName === 'playerInserted') {
                            this.replace(e.target);
                        }
                    },
                    replace: function(elem) {
                        if (/http:\/\/v.youku.com\/v_show\/.*/.test(window.location.href)){
                            var tag = document.getElementById("playerBox").getAttribute("player")
                            if (tag == "adt"){
                                console.log("adt adv")
                                return;
                            }
                        }
                        if(this.done.indexOf(elem) != -1) return;
                        this.done.push(elem);
                        var player = elem.data || elem.src;
                        if(!player) return;
                        var i, find, replace = false;                
                        for(i in this.rules) {
                            find = this.rules[i]['find'];
                            console.log('123');
                            if(find.test(player)) {
                                replace = this.rules[i]['replace'];
                                if('function' === typeof this.rules[i]['preHandle']) {
                                    this.rules[i]['preHandle'].bind(this, elem, find, replace, player)();
                                }else{
                                    this.reallyReplace.bind(this, elem, find, replace)();
                                }
                                break;
                            }
                        }
                    },
                    reallyReplace: function(elem, find, replace) {
                        console.log('456');
                        elem.data && (elem.data = elem.data.replace(find, replace)) || elem.src && ((elem.src = elem.src.replace(find, replace)) && (elem.style.display = 'block'));
                        var b = elem.querySelector("param[name='movie']");
                        this.reloadPlugin(elem);
                    },
                    reloadPlugin: function(elem) {
                        var nextSibling = elem.nextSibling;
                        var parentNode = elem.parentNode;
                        parentNode.removeChild(elem);
                        var newElem = elem.cloneNode(true);
                        this.done.push(newElem);
                        if(nextSibling) {
                            parentNode.insertBefore(newElem, nextSibling);
                        } else {
                            parentNode.appendChild(newElem);
                        }
                    },
                    init: function() {
                        var handler = this.animationsHandler.bind(this);
                        document.body.addEventListener('webkitAnimationStart', handler, false);
                        document.body.addEventListener('msAnimationStart', handler, false);
                        document.body.addEventListener('oAnimationStart', handler, false);
                        document.body.addEventListener('animationstart', handler, false);
                        this.addAnimations();
                    }
                };
                new A().init();
            })();
        }
        // 20140730
        (function cnbeta() {
            if (document.URL.indexOf('cnbeta.com') >= 0) {
                var elms = document.body.querySelectorAll("p>embed");
                Array.prototype.forEach.call(elms, function(elm) {
                    elm.style.marginLeft = "0px";
                });
            }
        })();
        //baidu
        //display: inline !important; visibility: visible !important;
        //display:block !important;visibility:visible !important; display:block !important;visibility:visible !important
        if(document.URL.indexOf('www.baidu.com') >= 0){
            if(document && document.getElementsByTagName && document.getElementById && document.body){
                var a = function(){
                    Array.prototype.forEach.call(document.body.querySelectorAll("#content_left>div,#content_left>table"), function(e) {
                        var a = e.getAttribute("style");
                        if(a && /display:(table|block)\s!important/.test(a)){
                            e.parentNode.removeChild(e)
                        }
                    });
                };
                a();
                var MutationObserver = window.MutationObserver ||  window.WebKitMutationObserver || window.MozMutationObserver;
                var callback = function(records) {
                    records.map(function(record) {
                        console.log('block baidu')
                        a();
                    });
                };
                var mo = new MutationObserver(callback);
                mo.observe(document.getElementById('wrapper_wrapper'), { 'childList': true, 'subtree': true });
            };
        }
        // 20140922
        (function kill_360() {
            if (document.URL.indexOf('so.com') >= 0) {
                document.getElementById("e_idea_pp").style.display = none;
            }
        })();
        function doClickQiyiItem()
        {
        	//解决爱奇艺视频列表点击无效
        	if(document.URL.indexOf("www.iqiyi.com") >= 0){
        		 if (document.getElementsByClassName("juji-list")){
        	        var listBox = document.getElementsByClassName("juji-list")
        	        var list = listBox[0].getElementsByClassName("item")
        	        for (i = 0;i < list.length;i++){
        	            list[i].addEventListener("click", function() {
        	                var url = this.getElementsByTagName("a")[0]
        	                url = url.getAttribute("href")
        	                var host = window.location.href 
                          var host_arr = host.split("#")	
                          //data-videolist-tvid="627547700" data-videolist-vid="6dcce377f19ce12eee2efe757aaa40d7" data-pd="1"
        	                url = host_arr[0] + "#curid=" + this.getAttribute("data-videolist-tvid") + "_" + this.getAttribute("data-videolist-vid");
        	                window.location.href = url
        	            })
        	        }
        	    }
        	}
        }
        function ad_live(targetObject, type, fn){    //元素类型，事件类型，执行函数  
            document.onclick = function(event){  
            		
                var e = event ? event : window.event;  
                //解决浏览器兼容的问题，e.srcElement IE,e.target FF                      
                var target = e.srcElement || e.target;                    
                if(e.type == type && e.target.parentNode.parentNode.className.indexOf(targetObject)>=0){     
                    fn();    //如果元素类型和事件类型同时匹配,则执行函数  
                }  
            }  
        } 
        //解决腾讯视频列表点击无效
        if(document.URL.indexOf("v.qq.com") >= 0){
            if (document.getElementById("mod_videolist")){
                var listBox = document.getElementById("mod_videolist")
                var list = listBox.getElementsByClassName("list_item")
                for (i = 0;i < list.length;i++){
                    list[i].addEventListener("click", function() {
                        var url = this.getElementsByTagName("a")[0]
                        url = url.getAttribute("href")
                        var host = window.location.href
                        url = host.replace(/cover\/.*/,url)
                        window.location.href = url
                    })
                }
            }
        }
        //解决爱奇艺视频列表点击无效
        if(document.URL.indexOf("www.iqiyi.com") >= 0){
           ad_live("juji-list", 'click', doClickQiyiItem);
        }
        if (document.URL.indexOf("tv.sohu.com") >= 0){
            if (document.cookie.indexOf("fee_status=true")==-1){document.cookie='fee_status=true'};
        }
        if (document.URL.indexOf("56.com") >= 0){
            if (document.cookie.indexOf("fee_status=true")==-1){document.cookie='fee_status=true'};
        }
        if(/v\.youku\.com\/v_show\/id/.test(document.URL)){
            var mp = document.getElementById('movie_player');
            if(mp){
                mp.style.height = '92%';
            }else{
                setTimeout(function(){
                    document.getElementById('movie_player').style.height = '90%';
                },500)
            }
        }
        
        function withdraw(){
      	  var url = "https://deposit.koudailc.com/user/cards?clientType=pc";
      	  var params = {};
      	  KD.util.post(url, params, function(data){
              if (data.code == 0){
                  if (data.cards.length < 1){

                      alertConfirm();                return false;
                  }
              }
              location.href = "https://www.koudailc.com/account/withdraw";
          });
      }function alertConfirm(){ 
      	showBg("detail_invest_confirm");}
      function closeConfirm(){ 
      	closeBg("detail_invest_confirm");}
      
      
      $(document).ready(function(){
  		//初始样式
  		var invest_value = 0;
  		$(".my_pocket_content #column li:eq("+invest_value+")").addClass("bg_fd5353_img li_border").find("span").addClass("fff");
  		//初始内容
  		getAccountHome();
  		getFinish(page);
          var mData = eval("("+ '{"d_max":"09\/10\/2017","d_min":"08\/11\/2017","kdb":[["2017-08-11",0],["2017-08-12",0],["2017-08-13",0],["2017-08-14",0],["2017-08-15",0],["2017-08-16",0],["2017-08-17",0],["2017-08-18",0],["2017-08-19",0],["2017-08-20",0],["2017-08-21",0],["2017-08-22",0],["2017-08-23",0],["2017-08-24",0],["2017-08-25",0],["2017-08-26",0],["2017-08-27",0],["2017-08-28",0],["2017-08-29",0],["2017-08-30",0],["2017-08-31",0],["2017-09-01",0],["2017-09-02",0],["2017-09-03",0],["2017-09-04",0],["2017-09-05",0],["2017-09-06",0],["2017-09-07",0],["2017-09-08",0],["2017-09-09",0],["2017-09-10",0]],"pro":[["2017-08-11",0],["2017-08-12",0],["2017-08-13",0],["2017-08-14",0],["2017-08-15",0],["2017-08-16",0],["2017-08-17",0],["2017-08-18",0],["2017-08-19",0],["2017-08-20",0],["2017-08-21",0],["2017-08-22",0],["2017-08-23",0],["2017-08-24",0],["2017-08-25",0],["2017-08-26",0],["2017-08-27",0],["2017-08-28",0],["2017-08-29",0],["2017-08-30",0],["2017-08-31",0],["2017-09-01",0],["2017-09-02",0],["2017-09-03",0],["2017-09-04",0],["2017-09-05",0],["2017-09-06",0],["2017-09-07",0],["2017-09-08",0],["2017-09-09",0],["2017-09-10",0]],"max":1}' +")");
          var wData = eval("("+ '{"d_max":"09\/10\/2017","d_min":"09\/04\/2017","kdb":[["2017-09-04",0],["2017-09-05",0],["2017-09-06",0],["2017-09-07",0],["2017-09-08",0],["2017-09-09",0],["2017-09-10",0]],"pro":[["2017-09-04",0],["2017-09-05",0],["2017-09-06",0],["2017-09-07",0],["2017-09-08",0],["2017-09-09",0],["2017-09-10",0]],"max":1}' +")");
          var pieData = eval("("+ 'false' +")");
  		jqplot_line("a_week_return",[wData.kdb,wData.pro],wData.d_max,wData.d_min,wData.max);
  		jqplot_line("a_month_income",[mData.kdb,mData.pro],mData.d_max,mData.d_min,mData.max,"month");

          if (pieData == false){
              //饼图位置换成 无数据
              $(".my_pocket_wrap .my_pocket_content .column_content .a_right .bg_input,#changetext").addClass('_hidden');
  			$("#chart_pie").html("暂无数据").css("line-height","300px").addClass("a_center f_14_16 _999");
          }else{
              $(".my_pocket_wrap .my_pocket_content .column_content .a_right .bg_input,#changetext").removeClass('_hidden');
              jqplot_pie("chart_pie",pieData);
          }
  	});
  	//单击改变样式开始
  	$(".my_pocket_content #column li").click(function(){
  		invest_value = $(this).attr("invest_value");
  		$(this).addClass("bg_fd5353_img li_border").find("span").addClass("fff");
  		$(".my_pocket_content #column li").not( $(this) ).removeClass("bg_fd5353_img li_border").find("span").removeClass("fff");
  		$(".my_pocket_content .column_content").addClass("_hidden");
  		$(".my_pocket_content .column_content:eq("+invest_value+")").removeClass("_hidden");
  	});
  	$(".my_pocket_wrap .my_pocket_content #column_content .column_content:eq(0) a").click(function(){
  		$(".my_pocket_wrap .my_pocket_content #column_content .column_content:eq(0) a").not( $(this) ).removeClass("bg_fd5353 fff");
  		$(this).addClass("bg_fd5353 fff");
  		if( $(this).attr("data") == "a_month" ){
  			$("#a_month_income").removeClass("_hidden");
  			$("#a_week_return").addClass("_hidden");
  		}else if( $(this).attr("data") == "a_week" ){
  			$("#a_week_return").removeClass("_hidden");
  			$("#a_month_income").addClass("_hidden");
  		}
  	});
  	$(".my_pocket_wrap .my_pocket_content .column_content .a_right .bg_input").click(function(){
  		if( $(this).html() == "资产明细"){
  			$(this).html("资产组成");
  			$("#changetext").html("资产明细");
  			$("#chart_pie").css("display","none");
  			$("#details_of_assets").css("display","block");
  			getPieInfo();//资产明细
  		}else if( $(this).html() == "资产组成"){
  			$(this).html("资产明细");
  			$("#changetext").html("资产组成（元）");
  			$("#chart_pie").css("display","block");
  			$("#details_of_assets").css("display","none");
  		}
  		//饼图资产明细自适应
  		$("#column_content").css("height","auto");
  	});
  	$(".transaction_records li").click(function(){
  		$(this).addClass("bg_fd5353 fff").removeClass("bg_f7f7f7 _999");
  		$(".transaction_records li").not( $(this) ).addClass("bg_f7f7f7 _999").removeClass("bg_fd5353 fff");
  		if ($(this).attr('data') == 1){
  			getFinish(page);
  		}else if ($(this).attr('data') == 2){
  			accountKdbTrades(page);
  		}else if ($(this).attr('data') == 3){
  			accountProjectTrades(page);
  		}else if ($(this).attr('data') == 4){
  			accountTrustTrades(page);
  		}
  	});

      function checkRealName(){
          var realname = '吴国才';
          var ajaxurl3 = "https://deposit.koudailc.com/koudaibao/info?clientType=pc";
          if (realname == false){
              alert("请先实名认证");
              location.href = "/account/user-center-real";
              return false;
          }
          location.href = "/account/roll-out";
      }

  	//单击改变样式结束

  	var hold_page = 1,hold_pageSize = 5;
  	function getPieInfo(hold_page){
          location.href = "#column";
          if(hold_page > 1){
  			$("#kdb").addClass("_hidden");
  		}else{
  			$("#kdb").removeClass("_hidden");
  		}
  		var urlhold = "https://deposit.koudailc.com/account/hold?clientType=pc";
  		var html1 = "",html2 = "";
  		$.ajax({
  			url : urlhold,
  			type: 'GET',
  			dataType: 'jsonp',
  			jsonp: 'callback',
  			data : {page:hold_page,pageSize:hold_pageSize},
  			success:function(data){
  		        if( data.code == 0){
  		            var hold_total_count=data.pages.totalCount;
  		            if (data.list.length == 0 && data.data.length == 0 && data.pending_projects.length == 0){
  		                html1 = '<tr><td colspan=4 class="a_center f_14_16 _999">暂无数据</td></tr>';
  		            }
  		            $.each(data.pending_projects,function(index,value){
  		                html1 +='<tr class="_666 f_14_16 a_center">';
  		                html1 +='<td>'+value.project_name+'</td>';
  		                html1 +='<td>'+value.duein_capital/100+'</td>';
  		                html1 +='<td>'+value.duein_profits/100+'</td>';
  		                html1 +='<td>'+value.statusLabel+'</td>';
  		                html1 +='<td>--</td>';
  		                html1 +='</tr>';
  		            });
  		            $.each(data.list,function(index,value){
  		                html2 +='<tr class="_666 f_14_16 a_center">';
  		                html2 +='<td>'+value.project_name+'</td>';
  		                html2 +='<td>'+value.duein_capital/100+'</td>';
  		                html2 +='<td>'+value.duein_profits/100+'</td>';
  		                html2 +='<td>'+value.statusLabel+'</td>';
  		                html2 +='<td>--</td>';
  		                html2 +='</tr>';
  		            });
  		            html1 += html2;
  		            $("#pie_info").html(html1);
  		            var ajaxpage ="/page/ajaxpages";
  		            $.ajax({
  		                url :ajaxpage,
  		                type: 'POST',
  		                dataType: 'json',
  		                data: {pages:hold_total_count,cur:hold_page,pageSize:hold_pageSize,methodName:'getPieInfo'},
  		                success:function(data){
  		                    $('#Pie_info_Paging').html(data);
  		                }

  		            });
  		        }else{
  		            $('#pie_info').html('<tr><td colspan=4 class="a_center f_14_16 _999">数据加载失败</td></tr>');
  		        }
  	        }
  		});
  	}

  	function getAccountHome(){
  		var url = "https://deposit.koudailc.com/account/home?clientType=pc";	  
  		$.ajax({
  			url : url,
  			type: 'GET',
  			dataType: 'jsonp',
  			jsonp: 'callback',
  			success:function(data)
  			{
  				if (data.code == 0){
  					$(".my_pocket_content #column li:eq(0) span:eq(1)").append(data.data.lastday_profits/100);
  					$(".my_pocket_content #column li:eq(0) span:eq(2)").append(data.data.total_profits/100);
  					$(".my_pocket_content #column li:eq(1) span:eq(1)").append(data.data.hold_money/100);
  					$(".my_pocket_content #column li:eq(2) span:eq(1),.my_pocket_content #column_content .column_content:eq(2) span:eq(1)").append(data.data.remain_money/100);
  					$(".my_pocket_content #column li:eq(2) span:eq(2),.my_pocket_content #column_content .column_content:eq(2) span:eq(2)").append(data.data.withdrawing_money/100);
  					$(".my_pocket_content #column li:eq(2) span:eq(4),.my_pocket_content #column_content .column_content:eq(2) span:eq(4)").append(data.data.usable_money/100);
  					// 自适应高度
  					var max_height;
  					for(var i=0;i<$(".my_pocket_content #column li").length;i++ ){
  						var max_height = $(".my_pocket_content #column li:eq(0)").height();
  						if( $(".my_pocket_content #column li:eq("+i+")").height() > max_height ){
  							max_height = $(".my_pocket_content #column li:eq("+i+")").height();
  						}
  					}
  					$(".my_pocket_content #column li > div").innerHeight(max_height);
  				}
  			}
  		});
  	}

  	var page = 1;
  	var pageSize = 7;
  	function getFinish(page){
  	var url1 = "https://deposit.koudailc.com/account/finished-proj?clientType=pc";
  	var html1 ='';
  	$.ajax({
  		url : url1,
  		type: 'GET',
  		dataType: 'jsonp',
  		jsonp: 'callback',
  		data : {page:page,pageSize:pageSize},
  		success:function(data){
  			if( data.code == 0){      
                  var hold_total_count=data.pages.totalCount;
  				if (data.projects.length == 0){
  					 html1 = '<tr><td colspan=4 class="a_center f_14_16 _999">暂无数据</td></tr>';
  				 }
  				$.each(data.projects,function(index,value){
  					html1 +='<tr class="_333 f_14_16 a_center">';
  					html1 +='<td>'+value.project_name+'</td>';
  					html1 +='<td>'+value.total_money/100+'</td>';
  					html1 +='<td>'+value.time+'</td>';
  					html1 +='<td>'+value.status_label+'</td>';
  					if(value.contract != ''){
  						html1 +='<td><a href="https://www.koudailc.com/account/contract?id='+value.profits_id+'" id="show_contract" target="_blank">查看合同</a></td>';
  					}else{
  						html1 +='<td>--</td>';
  					}

                      if(value.is_asset>0)
                      {
                          html1 +='<td><a href="https://www.koudailc.com/account/my-bond?invest_id='+value.invest_id+'&project_id='+value.project_id+'" style="color:#333">查看</a></td>';
                      }else {
                          html1 +='<td>--</td>';
                      }


  					html1 +='</tr>';
  				});
  				$('#my_invest_log1').html(html1);

  				var ajaxpage ="/page/ajaxpages";
  				$.ajax({
  					url :ajaxpage,
  					type: 'POST',
  					dataType: 'json',
  					data: {pages:hold_total_count,cur:page,pageSize:pageSize,methodName:'getFinish'},
  					success:function(data){
  						$('#Paging').html(data);
  					}
  				});
  			}else{
  				$('#my_invest_log1').html('<tr><td colspan=4 class="a_center f_14_16 _999">数据加载失败</td></tr>');
  			}
  		}
  	});
  	}

  	function accountKdbTrades(page){
  	var url2 = "https://deposit.koudailc.com/account/kdb-trades?clientType=pc";
  	var html2 ='';
  	$.ajax({
  		url : url2,
  		type: 'GET',
  		dataType: 'jsonp',
  		jsonp: 'callback',
  		data : {page:page,pageSize:pageSize},
  		success:function(data){
  			if( data.code == 0){
                              var hold_total_count=data.pages.totalCount;
  				if (data.data.length == 0){
  					 html2 = '<tr><td colspan=4 class="a_center f_14_16 _999">暂无数据</td></tr>';
  				 }
  				$.each(data.data,function(index,value){
  					html2 +='<tr class="f_14_16 _333 a_center">';
  					html2 +='<td>口袋宝</td>';
  					html2 +='<td>'+value.invest_money/100+'</td>';
  					html2 +='<td>'+value.time+'</td>';
  					html2 +='<td>'+value.status+'</td>';
  					html2 +='<td>--</td>';
  					html2 +='</tr>';
  				});
  				$('#my_invest_log1').html(html2);

  				var ajaxpage ="/page/ajaxpages";
  				$.ajax({
  					url :ajaxpage,
  					type: 'POST',
  					dataType: 'json',
  					data: {pages:hold_total_count,cur:page,pageSize:pageSize,methodName:'accountKdbTrades'},
  					success:function(data){
  						$('#Paging').html(data);
  					}
  				});
  			}else{
  				$('#my_invest_log1').html('<tr><td colspan=4 class="a_center f_14_16 _999">数据加载失败</td></tr>');
  			}
  		}
  	});
  	}

  	function accountProjectTrades(page){
  	var url3 = "https://deposit.koudailc.com/account/project-trades?clientType=pc";
  	var html3 ='';
  	$.ajax({
  		url : url3,
  		type: 'GET',
  		dataType: 'jsonp',
  		jsonp: 'callback',
  		data : {page:page,pageSize:pageSize},
  		success:function(data){
  			if( data.code == 0){
                              var hold_total_count=data.pages.totalCount;
  				html3 +='</tr>';
  				if (data.data.length == 0){
  					 html3 = '<tr><td colspan=4 class="a_center f_14_16 _999">暂无数据</td></tr>';
  				 }
  				$.each(data.data,function(index,value){
  					html3 +='<tr class="f_14_16 _333 a_center">';
  					html3 +='<td>'+value.name+'</td>';
  					html3 +='<td>'+value.invest_money/100+'</td>';
  					html3 +='<td>'+value.time+'</td>';
  					html3 +='<td>'+value.status+'</td>';
  					if(value.contract != ''){
  						html3 +='<td><a href="https://www.koudailc.com/account/contract?id='+value.profits_id+'" id="show_contract" target="_blank">查看合同</a></td>';
  					}else{
  						html3 +='<td>--</td>';
  					}

                      if(value.is_asset >0){
  					    html3 +='<td><a href="https://www.koudailc.com/account/my-bond?invest_id='+value.invest_id+'&project_id='+value.project_id+'" style="color:#333">查看</a></td>';
                      }else{
                          html3 +='<td>--</td>';
                      }
  					html3 +='</tr>';
  				});
  				$('#my_invest_log1').html(html3);

  				var ajaxpage ="/page/ajaxpages";
  				$.ajax({
  					url :ajaxpage,
  					type: 'POST',
  					dataType: 'json',
  					data: {pages:hold_total_count,cur:page,pageSize:pageSize,methodName:'accountProjectTrades'},
  					success:function(data){
  						$('#Paging').html(data);
  					}
  				});
  			}else{
  				$('#my_invest_log1').html('<tr><td colspan=4 class="a_center f_14_16 _999">数据加载失败</td></tr>');
  			}
  		}
  	});
  	}

  	function accountTrustTrades(page){
  		var url4 = "https://deposit.koudailc.com/account/trust-trades?clientType=pc";
  		var html4 ='';
  		$.ajax({
  			url : url4,
  			type: 'GET',
  			dataType: 'jsonp',
  			jsonp: 'callback',
  			data : {page:page,pageSize:pageSize},
  			success:function(data){
  				if( data.code == 0){
  	                var hold_total_count=data.pages.totalCount;
  					html4 +='</tr>';
  					if (data.data.length == 0){
  						 html4 = '<tr><td colspan=4 class="a_center f_14_16 _999">暂无数据</td></tr>';
  						 hold_total_count = 1;
  					}
  					$.each(data.data,function(index,value){
  						html4 +='<tr class="f_14_16 _333 a_center">';
  						html4 +='<td>'+value.name+'</td>';
  						html4 +='<td>'+'-'+'</td>';
  						html4 +='<td>'+value.time+'</td>';
  						html4 +='<td>'+value.status+'</td>';
  						html4 +='<td>--</td>';
  						html4 +='</tr>';
  					});
  					$('#my_invest_log1').html(html4);

  					var ajaxpage ="/page/ajaxpages";
  					$.ajax({
  						url :ajaxpage,
  						type: 'POST',
  						dataType: 'json',
  						data: {pages:hold_total_count,cur:page,pageSize:pageSize,methodName:'accountTrustTrades'},
  						success:function(data){
  							$('#Paging').html(data);
  						}
  					});
  				}else{
  					$('#my_invest_log1').html('<tr><td colspan=4 class="a_center f_14_16 _999">数据加载失败</td></tr>');
  				}
  			}
  		});
  	}

  	 //饼图
  	function jqplot_pie(id,data){
  		$.jqplot(id, [data],
  			{
  				seriesColors: [ "#1C62B8", "#F6505C", "#F6C928", "#5BC1AC", "#8673CD" , "#0085cc", "#4b5de4", "#EAA228", "#d8b83f", "#ff5800",  "#579575"],
  				seriesDefaults: {	  // make this a donut chart.(设置绘制一个环形图)
  					renderer:$.jqplot.DonutRenderer,
                      rendererOptions: {
  						diameter: 265,
  						dataLabelNudge: 5,
  						barPadding: 8,
  						shadow:false,
  						sliceMargin: 0,		// Donut's can be cut into slices like pies.(环块之间的距离为3px)
  						startAngle: 0,		// Pies and donuts can start at any arbitrary angle.(起始位置为0度，x轴正方向为0度)
  						dataLabels: 'value',
                          showDataLabels: true
                      }
                  },
  				grid: {
  					drawBorder: false,
  					drawGridlines: false,
  					background: '#FDFDFD',
  					shadow:false
  				},
  				legend: {
  					show: true,
  					location: "e",  //n, ne, e, se, s, sw, w, nw.
  					marginLeft: '120px',
  					xoffset: 90,
  					background: '#FDFDFD',
  					fontSize: '14px',
  					textColor:'#777777'
  				},
                  highlighter:{
                      showTooltip: true,
                      tooltipOffset: -50,	//偏移量
                      useAxesFormatters: false,
                      tooltipFormatString: '<span style="color:blue;">数量</span> %.2f'
                  }
  			});
  	}




  	/**
  	 * 画折线图
  	 * @param data  数据
  	 * @param d_max 最大日期
  	 * @param d_min 最小日期
  	 * @param yValmax Y轴最大值
  	 * @param yValmin Y轴最小值
  	 * @param title 图表标题
  	 * @param type  类型 默认刻度表1天累加显示
  	 * @param xtitle  X轴标题
  	 * @param ytitle  Y轴标题
  	 */


  	function jqplot_line(id,data,d_max,d_min,yValmax,type,title,xtitle,ytitle){
  		title = (title==null || title=="" || typeof(title)=="undefined") ? "" : title;
  		xtitle = (xtitle==null || xtitle=="" || typeof(xtitle)=="undefined") ? "收益（元）" : xtitle;
  		ytitle = (ytitle==null || ytitle=="" || typeof(ytitle)=="undefined") ? "" : ytitle;
  		yValmax = (yValmax==null || yValmax=="" || typeof(yValmax)=="undefined") ? null : yValmax;
  		d_max = (d_max==null || d_max=="" || typeof(d_max)=="undefined") ? null : d_max;
  		d_min = (d_min==null || d_min=="" || typeof(d_min)=="undefined") ? null : d_min;
  		type = (type=="month") ? "5 days" : "1 days";

          $.jqplot(id, data, {
  			title: {
  				text: title, //设置当前图的标题
  				show: true//设置当前图的标题是否显示
  			},
  			seriesColors: [ "#1C62BA", "#F6C928", "#839557", "#c5b47f", "#958c12" , "#0085cc", "#4b5de4", "#EAA228", "#d8b83f", "#ff5800",  "#579575"],
  			axesDefaults: {
  				labelRenderer: $.jqplot.CanvasAxisLabelRenderer,  //设置X和Y轴的说明文字的渲染引擎
  				tickOptions: {
  					angle: -30,
  					fontSize: '14px',
  					mark: 'inside',
  					markSize: 865,
  					showGridLine: true
  				}
  			},
  			seriesDefaults: {
  				showMarker:true,
  				pointLabels: { show:false }
  			},
  			axes: {
  				xaxis: {
  					label: xtitle, //指定X轴的说明文字
  					// renderer: $.jqplot.CategoryAxisRenderer,(勿删)
  					// ticks: ticks//设置横（纵）坐标的刻度上的值，可为该ticks数组中的值(勿删)
  					renderer: $.jqplot.DateAxisRenderer,
  					tickOptions: { formatString: "%m/%d" },
  					min: d_min,
  					max: d_max,
  					tickInterval: type
  				},
  				yaxis: {
  					min: 0,	  // 横（纵）坐标显示的最小值
  					max: yValmax,	  // 横（纵）坐标显示的最大值
  					label: ytitle //指定Y轴的说明文字
  				}
  			},

  			legend: {
  				show: true,			// 设置标识在图表外，元素内（在canvas内）
  				//placement: 'outsideGrid',
  				location: 'nw' //分类名称框出现位置, nw, n, ne, e, se, s, sw, w.
  			},
  			grid: {
  				gridLineColor: '#FDFDFD',
  				background: '#FDFDFD',
  				borderColor: '#CDCDCD',
  				borderWidth: 0.2,
  				shadow: false
  			},
  			cursor: {
  				show: false, //是否显示光标
  				style: 'crosshair', //当鼠标移动到图片上时，鼠标的显示样式，该属性值为css类
  				showTooltip: true, // 是否显示提示信息栏
  				followMouse: false, //光标的提示信息栏是否随光标（鼠标）一起移动
  				tooltipLocation: 'se', // 光标提示信息栏的位置设置。如果followMouse=true,那么该位置为
  //提示信息栏相对于光标的位置。否则，为光标提示信息栏在图标中的位置
  // 该属性可选值： n, ne, e, se, etc.
  				tooltipOffset: 6, //提示信息栏距鼠标(followMouse=true)或坐标轴（followMouse=false）的位置
  				showTooltipGridPosition: false,//是否在信息提示栏中显示光标位置（取其据图标左和上边缘线像素距离）
  				showTooltipUnitPosition: true,// 是否显示提示光标所在位置（取其在横纵轴上数据值）的信息栏
  //注：注意此处与showTooltipGridPosition值区别，前者显示坐标值，该处显示的是数据值
  				tooltipFormatString: '%.4P', // 同Highlighter的tooltipFormatString
  				useAxesFormatters: true, // 同Highlighter的tooltipFormatString
  				tooltipAxesGroups: [['xaxis', 'yaxis'], ['xaxis', 'y2axis']] // show only specified axes groups in tooltip. Would specify like:
  // [['xaxis', 'yaxis'], ['xaxis', 'y2axis']]. By default, all axes
  // combinations with for the series in the plot are shown.
  			},
  			// highlighter: {
  			// 	show: true,
  			// 	sizeAdjust: 7.5,
  			// 	showMarker:true,
  			// 	tooltipAxes: 'y',
  			// 	yvalues: 4,
  			// 	formatString:'<table class="jqplot-highlighter"><tr><td>value:</td><td>%s</td></tr></table>'

  			// } ,
  			highlighter: {
  				show: true,
  				lineWidthAdjust: 2.5, //当鼠标移动到放大的数据点上时，设置增大的数据点的宽度
  				showMarker:true,
  // 目前仅适用于非实心数据点
  				sizeAdjust: 5, // 当鼠标移动到数据点上时，数据点扩大的增量增量
  				showTooltip: true, // 是否显示提示信息栏
  				tooltipLocation: 'n', // 提示信息显示位置（英文方向的首写字母）: n, ne, e, se, s, sw, w, nw.
  				fadeTooltip: true, // 设置提示信息栏出现和消失的方式（是否淡入淡出）
  				tooltipFadeSpeed: "fast",//设置提示信息栏淡入淡出的速度： slow, def, fast, 或者是一个毫秒数的值.
  				tooltipOffset: 2, // 提示信息栏据被高亮显示的数据点的偏移位置，以像素计。
  				tooltipAxes: 'y', // 提示信息框显示数据点那个坐标轴上的值，目前有横/纵/横纵三种方式。
  //值分别为 x, y or xy.
  				tooltipSeparator: ', ', // 提示信息栏不同值之间的间隔符号
  				useAxesFormatters: true, // 提示信息框中数据显示的格式是否和该数据在坐标轴上显示格式一致
  				tooltipFormatString: '%.5P', // 用于设置提示信息框中数据显示的格式，前提条件是useAxesFormatters
  				formatString:'<table class="jqplot-highlighter"><tr><td>%s</td></tr></table>'
  // 为false. 此时信息提示框中数据格式不再与坐标轴一致，而是以此为准
  //同时，该属性还支持html格式字符串
  //eg:'<b><i><span style="color:red;" mce_style="color:red;">hello</span></i></b> %.2f'
  			},
  			series: [
  				{
  					label:'口袋宝',
  					lineWidth: 1, //指定折线的宽度
  					markerOptions: { 
  						style: "circle"
  					} //指定折线的样式
  				},
  				{
  					label:'投资频道',
  					showLine: false, //指定是否显示线条
  					markerOptions: {style: "diamond"  } //size设置每个节点的大小
  				}
  				// ***** markerOptions: {filledSquare  dimaond  circle	size: 7, style: "*"}  *****
//  				{
//  				label:'金融贷',
//  			markerOptions: { style: "circle" }

//  				},
//  				{
//  					label:'Airfare',
//  					lineWidth: 5,
//  					markerOptions: {
//  						style: "filledSquare",
//  						size: 10
//  					}
//  				}
  			]
  		});
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