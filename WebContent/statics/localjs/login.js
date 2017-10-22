
var ajax_url = "https://deposit.koudailc.com/user/login?clientType=pc";
var captcha_url = "https://deposit.koudailc.com/user/captcha?refresh=1&clientType=pc";

function login() {
    if (check_mobile() && check_pwd()) {
        var _captcha_show = $('.J_captcha').is(':visible');
        var imgcode = $.trim( $('#imgcode').val() );
        if ( _captcha_show && imgcode.length == 0 ) {
            $('#notification').html('请输入验证码');
            return false;
        }

        var params =  {
            username : $('#username').val(),
            password : $('#password').val(),
            imgcode : $('#imgcode').val(),
            redirect_url:"https://www.koudailc.com/site/index",
        };
        KD.util.post(ajax_url, params, function(result) {
            if( result.code == 0) {
                setCookie('SESSIONID', result.sessionid, 'h12');
                //登陆成功 行为
                window.location.href = "https://www.koudailc.com/site/index";
            }else{
                var _captcha_refreshed = false;
                if (result.code == 1002) {
                    if (! $('.J_captcha').is(':visible')) {
                        $('.J_captcha').show();
                    }
                    _captcha_refreshed = true;
                    refreshCaptcha();
                }

                if ( (!_captcha_refreshed) && _captcha_show ) {
                    refreshCaptcha();
                }
                $('#notification').html(result.message);
            }
        });
    }
}

$("#password").focus(function() {
    $("body").keydown(function(event) {
        if (event.keyCode == 13) {
            login();
        }
    });
});

function check_pwd() {
    if ( '' == $.trim($('#password').val()) || $.trim($('#password').attr('placeholder')) == $.trim($('#password').val()) ) {
        $('#notification').html('密码不能为空');
        return false;
    }else{
        $('#notification').html('');
    }
    return true;
}

function check_mobile() {
    if ( '' == $.trim($('#username').val()) || $.trim($('#username').attr('placeholder')) == $.trim($('#username').val()) ) {
        $('#notification').html('账号不能为空');
        return false;
    }else{
        $('#notification').html('');
    }
    var mobile_reg = /^[1]\d{10}$/;
    if (!mobile_reg.test($('#username').val())) {
        $('#notification').html('账号不合法');
        return false;
    }else{
        $('#notification').html('');
    }
    return true;
}

function refreshCaptcha() {
    $.ajax({
        url: "https://deposit.koudailc.com/user/captcha?refresh=1&clientType=pc",
        dataType: "jsonp",
        success: function(data){
            $("#loginform-verifycode-image").attr("src", "https://deposit.koudailc.com" + data.url);
        }
    });
}
$(document).ready(function() {
    
        var curIndex=0,timeInterval=3000,arr=new Array(),arr1=new Array();
        arr[0]="https://www.koudailc.com/image/site/kzr.jpg";
        arr1[0]="https://www.koudailc.com/image/site/page_reduce1.jpg";
        arr1[1]="https://www.koudailc.com/image/site/page_add1.jpg";
        arr1[2]="https://www.koudailc.com/image/site/page_reduce.jpg";
        arr1[3]="https://www.koudailc.com/image/site/page_add.jpg";
        changeButton();
        var timing = self.setInterval(changeImg,timeInterval);//定时切换图片
        $(".l_left,.r_left").mouseover(function(){
            window.clearInterval(timing); //清楚定时器
        });
        $(".l_left,.r_left").mouseout(function(){
            timing = self.setInterval(changeImg,timeInterval);//定时切换图片
        });
        $("#left").click(function(){
            if(curIndex == 0){
                curIndex = 0;
            }else{
                curIndex -= 1;
            }
            $("#obj").attr("src", arr[curIndex]);
            changeButton();
        });
        $("#right").click(function(){
            if(curIndex == arr.length-1){
                curIndex = arr.length-1;
            }else{
                curIndex += 1;
            }
            $("#obj").attr("src", arr[curIndex]);
            changeButton();
        });
        function changeImg(){
            if(curIndex == arr.length-1){
                curIndex = 0;
            }else{
                curIndex += 1;
            }
            $("#obj").attr("src", arr[curIndex]);
            changeButton();
        }
        function changeButton(){
            if($("#obj").attr("src") == arr[0]){
                $("#left img").attr("src", arr1[0]);
                $("#left img").attr("title", "第一张");
                $("#left").css("cursor","not-allowed");
            }else{
                $("#left img").attr("src", arr1[2]);
                $("#left img").attr("title", "向左滚");
                $("#left").css("cursor","pointer");
            }
            if($("#obj").attr("src") == arr[arr.length-1]){
                $("#right img").attr("src", arr1[1]);
                $("#right img").attr("title", "最后一张");
                $("#right").css("cursor","not-allowed");
            }else{
                $("#right img").attr("src", arr1[3]);
                $("#right img").attr("title", "向右滚");
                $("#right").css("cursor","pointer");
            }
        }
        });
      