
/*$(document).ready(function(){	
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
        	
                var mobile;
                $("#index_wrap #phone,#register_wrap #phone,#be_born_wraper #phone,#new_born_wraper #phone,#land_page_wraper #phone ,#rs_login #phone,#utouweb #phone").change(function(){
                    // 获取选择的值
                    mobile = $(this).val();
                });*/
	//同意协议才能显示“立即注册”（生效）
	/*$("#index_wrap #get_reg_code,#register_wrap #get_reg_code,#be_born_wraper #get_reg_code,#new_born_wraper #get_reg_code,#land_page_wraper #get_reg_code,#rs_login #get_reg_code,#utouweb #get_reg_code").click(function(){
        $("#index_wrap #phone,#register_wrap #phone,#be_born_wraper #phone,#new_born_wraper #phone,#land_page_wraper #phone,#rs_login #phone,#utouweb #phone").change(function(){
            // 获取选择的值
            mobile = $(this).val();
        });
        var $_this = $(this);
        var url = "https://deposit.koudailc.com/user/reg-get-code?clientType=pc";
        var imgcode = $("#imgcode").val();
        var params = {
            phone : mobile,
            imgcode : imgcode
        };*/
       /* if( !$("#index_wrap #get_reg_code,#register_wrap #get_reg_code,#be_born_wraper #get_reg_code,#new_born_wraper #get_reg_code,#land_page_wraper #get_reg_code,#rs_login #get_reg_code,#utouweb #get_reg_code").hasClass("btn_eb4444") ){
            if (!check_tel()) return;
            if (!check_img_yzm()) return;
            KD.util.post(url, params, function(data){
                if(data.code == 0){
                    $("#notification").html("验证码已发送");
                    var total = 60;
                    $_this.html(total+"秒重新获取");
                    $_this.addClass("btn_eb4444");
                    var interId = setInterval(function () {
                        $_this.html(total + "秒重新获取");
                        if (total <= 0) {
                            clearInterval(interId);
                            $_this.html("重新获取");
                            $_this.removeClass("btn_eb4444");
                        }
                    } , 1000);
                }else{
                    refreshCaptcha();
                    $("#notification").html(data.message);
                }
            });
        }   	
    });*/


   /* $("#index_wrap #red_btn,#register_wrap #red_btn,#be_born_wraper #red_btn,#new_born_wraper #red_btn,#land_page_wraper #red_btn,#rs_login #red_btn,#utouweb #red_btn").click(function(){
        if($(this).data("boolAjax")) return;
        var url = "https://deposit.koudailc.com/user/register?clientType=pc&appMarket=" + window.source_tag;
        for(var key in window.cps_params){
            url += "&"+key+"="+window.cps_params[key];
        }
        var btn_id = "#red_btn";
        var btn_text = "立即注册";
        if (check_tel() && check_yzm() && check_pwd()){
            if( "register" == "register" || "register" == "cps-utouweb-reg"  ){
                if( !check_re_pwd() ) return;
            }
            var params = {
                phone : mobile,
                password : $("#password").val(),
                code : $("#msgcode").val()
            };
            KD.util.post(url, params, function(data){
                if(data.code == 0){
                    if(window.source_tag == "zhizhu1")
                    {
                        spider_showMask();
                    }else if(window.source_tag == "yirute")
                    {
                        yirute_cps(data.user.uid);
                    }else if(window.source_tag == "utou")
                    {
                        if( window.cps_params.pid ){
                            jumpTo("https://www.koudailc.com/list/detail?id="+window.cps_params.pid);
                        }else{
                            jumpTo("https://www.koudailc.com/prompt/reg-success");
                        }
                    }else{
                        jumpTo("https://www.koudailc.com/prompt/reg-success");
                    }
                }else{
                    refreshCaptcha();
                    $("#notification").html(data.message);
                }
            });
        }
    });*/

    /*function check_yzm(){
        if ( "" == $.trim($("#msgcode").val()) ){
            $("#notification").html("手机验证码不能为空");
            return false;
        }
        $("#notification").html("&nbsp;");
        return true;
    }

    function check_img_yzm(){
        if ( "" == $.trim($("#imgcode").val()) ){
            $("#notification").html("图片验证码不能为空");
            return false;
        }
        $("#notification").html("&nbsp;");
        return true;
    }

    function check_pwd(){
        var password_reg = /^[a-zA-Z0-9]{6,16}$/;
        if( "" == $.trim($("#password").val()) ){
            $("#notification").html("请设置您的登录密码");
            return false;
        }else if (!password_reg.test($("#password").val())){
            $("#notification").html("密码为6-16位字符");
            return false;
        }
        $("#notification").html("&nbsp;");
        return true;
    }

    function check_re_pwd(){
        if( "" == $.trim($("#re_password").val()) ){
            $("#notification").html("请确认您的登录密码");
            return false;
        }else if ($("#re_password").val() != $("#password").val()){
            $("#notification").html("两次密码不一致");
            return false;
        }
        $("#notification").html("&nbsp;");
        return true;
    }

    function check_tel(){
        if ( "" == $.trim($("#phone").val()) ){
            $("#notification").html("手机号不能为空");
            return false;
        }
        var mobile_reg = /^[1]\d{10}$/;
        if( !mobile_reg.test($("#phone").val()) ){
            $("#notification").html("手机号不合法");
            return false;
        }
        $("#notification").html("&nbsp;");
        return true;
    }
    function yirute_cps(uid){
        var tid = getCookie("tid");
        var js_ad_key = "_yirute";
        var cps_url = "https://deposit.koudailc.com/cps/cps-back?clientType=pc";
        var cps_params = {
            uid : uid,
            tid : tid,
            js_ad_key : js_ad_key
        };
        KD.util.post(cps_url, cps_params, function(result){
            if(result != ""){
                jumpTo("https://www.koudailc.com/prompt/reg-success");
            }
        });
    }
});*/
	

/*function refreshCaptcha() {
    $.ajax({
        url: "https://deposit.koudailc.com/user/captcha?refresh=1&clientType=pc",
        dataType: "jsonp",
        success: function(data){
            $("#loginform-verifycode-image").attr("src", "https://deposit.koudailc.com" + data.url);
        }
    });
}	*/

/*-----------------------------------------验证码&注册验证--------------------------------------*/
	var code ; //产生的验证码
	function createCode(){ 
		code = new Array();
		var codeLength = 4;//验证码的长度
		var checkCode = document.getElementById("checkCode");
		checkCode.value = "";		
		var selectChar = new Array(2,3,4,5,6,7,8,9,
			'A','B','C','D','E','F','G','H','J','K','L','M','N','P','Q','R','S','T','U','V','W','X','Y','Z',
			'a','b','c','d','e','f','g','h','j','k','l','m','n','p','q','r','s','t','u','v','w','x','y','z');	
		for(var i=0;i<codeLength;i++) {
		   var charIndex = Math.floor(Math.random()*56);
		   code +=selectChar[charIndex];
		}
		if(code.length != codeLength){
		   createCode();
		}
		checkCode.value = code;//跟新新的验证码（未转大写）		
	}
	//var newmsgcode1=$("#coded1").val();//获取保存在隐藏域中的验证码
	var phone=$("#phone");//手机号
	var imgcode=$("#imgcode");//填入的图片验证码
	var msgcode=$("#msgcode");//填入的手机验证码
	var newmsg=$("#coded1");//生成的手机验证码（短信接口暂无实现）
	var password=$("#password");//注册密码
	var re_password=$("#re_password");//确认注册密码
	var notification=$("#notification");//错误信息
	
	function validate(){		
		var phone1=phone.val();//手机号
		var imgcode1=imgcode.val().toUpperCase();//填入的图片验证码(转大写)
		var msgcode1=msgcode.val().toUpperCase();//填入的手机验证码(转大写)
		var newmsg1=newmsg.val().toUpperCase();//生成的手机验证码（短信接口暂无实现）
		var password1=password.val();//注册密码
		var re_password1=re_password.val();//确认注册密码		
		
		if(!(phone1 && imgcode1 && msgcode1 && password1 && re_password1)){
			notification.html("* 有未填项，请填写完整");
		}else if(!(/^[1](3|4|5|8)\d{9}$/.test(phone1))){
			notification.html("* 手机号不合法");
		}else if(imgcode1 != code.toUpperCase()){
			notification.html("* 图片验证码不正确");
		}else if($.trim(newmsg1) != msgcode1){
			notification.html("* 手机验证码不正确");
		}else if(password1.length<6 || password1.length>16){
			notification.html("* 密码必须是6-16位");
		}else if(password1 != re_password1){
			notification.html("* 两次密码不一致");
		}else{
			$.ajax({
				url:"doRegister",
				type:"get",
				dataType:"json",
				data:{"loginName":phone1,"password":password1},
				success:function(data){
					if(data){	
						notification.html("该用户名已存在！");								
					}else{
						location.href="index.jsp";//注册成功，进入登录后的首页			
					}
				}
			});
		}
		
	}
	
	/**
	 * 点击请求发送短信验证
	 */
	$("#get_reg_code").click(function(){
		var phone1=phone.val();//手机号
		if(phone1 == ""){
			alert("请先填写手机号码");
		}else{			
			$.ajax({
				url:"code.html?phone="+phone1,
				dateType:"json",
				success:function(data){
					$("#coded1").val(data);	
				}
			});
		}
	})
		
		
		/*var inputCode = document.getElementById("imgcode").value.toUpperCase();//输入的验证码转大写		
		if(inputCode.length <=0) {
		   alert("请输入验证码！");
		   return false;
		}
		else if(inputCode == code.toUpperCase() ){//新的验证码（转大写进行比较）
		   alert("成功！");
		   return true;
		}
		else {
		   alert("验证码输入错误！");		   
		createCode();
		   return false;
		}*/
	
	

	//同意协议才能显示“立即注册”（生效）
	$("#index_wrap #get_reg_code,#register_wrap #get_reg_code,#be_born_wraper #get_reg_code," +
	  "#new_born_wraper #get_reg_code,#land_page_wraper #get_reg_code,#rs_login #get_reg_code," +
	  "#utouweb #get_reg_code").click(function(){ /* 立即注册需要  */ });
	//勾选协议
	$(".checked_box").click(function(){
		//根据勾选状态决定“立即注册”的样式
        if( $(this).hasClass("selected") ){
            actioncheckedBox($(this),1);
            $("#red_btn").css({
            	"background":"#c9c9c9",
            	"border":"1px solid #c9c9c9",
            });
            $("#red_btn").data('result',false);
            $("#red_btn").removeAttr('onclick');//不同意协议，禁用点击事件
        }else{
            actioncheckedBox($(this),0);
            $("#red_btn").css({
            	"background":"#fd5353",
            	"border":"1px solid #fd5353",
            });
            $("#red_btn").data('result',true);
            $("#red_btn").attr('onclick','validate();');//同意协议，恢复点击事件
        }
    });
	//根据勾选状态决定“协议”的样式
	function actioncheckedBox(Obj,Type){
        if(Type == 0){//0-同意，1-不同意
            $('.checked_box').css({'background':'#fff'});
            $('.checked_box').removeClass('selected');
            //同意协议选项上的√
            $(Obj).css({'background':'#fff url(statics/img/gou.png) no-repeat center center'});
            $(Obj).toggleClass('selected');
        }else if(Type == 1){
            $(Obj).css({'background':'#fff'});
            $(Obj).toggleClass('selected');
        }
    }
	
