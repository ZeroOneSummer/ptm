<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>注册-口袋理财</title>
<meta name="keywords" content="口袋理财,移动理财,理财超市,互联网金融,银行理财,信托理财">
<meta name="description" content="口袋理财——报喜鸟上市系投资的移动理财平台，是上海十强互联网金融公司、上海金融信息行业协会副会长单位。口袋理财专注于小额分散的投资理财，多元化的投资理财产品，严格风控，灵活安全。">
<meta name="baidu-site-verification" content="W0p7tymOhp">
<meta name="baidu_union_verify" content="ac175d4c07bcca63a8a2f76d7023d69d">

<%@include file="../common/js.jsp"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/statics/localcss/register.css"/>

<script language="javascript" type="text/javascript">
	var code ; //在全局 定义验证码
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
	
	function validate () {
		var inputCode = document.getElementById("imgcode").value.toUpperCase();//输入的验证码转大写
		
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
		}
	}
</script>




</head>
<body style="background: #F7F7F7;" onLoad="createCode();">
    <div class="kdlc_pc_wrap">
        <!-- 头部开始 -->
        <%@include file="../common/header.jsp"%>   
        <!-- 头部结束 -->
        <!-- 主体部分开始 -->
        <div class="container">
			<div id="register_wrap">
				<div class="content">
					<div class="l_left r_left"><ul><li id="left" style="cursor: not-allowed;"><img src="${pageContext.request.contextPath}/statics/img/page_reduce1.jpg" title="第一张"></li><li><img id="obj" src="${pageContext.request.contextPath}/statics/img/kzr.jpg"></li><li id="right" style="cursor: not-allowed;"><img src="${pageContext.request.contextPath}/statics/img/page_add1.jpg" title="最后一张"></li></ul></div>
					<div class="a_center r_right">
						<span class="f_20_22 _333">免费注册，新手投资返600元现金</span>
						<form method="post" action="https://www.koudailc.com/site/register" class="clear_inline_block  a_right">
							<span id="notification" class="f_14_16 ff534f"></span><br>
							<div class="clear"></div>
							<span class="f_14_16 _433f3e">手机号</span>
							<input class="_input bg_input first_child" type="text" maxlength="11" name="phone" id="phone" placeholder="请输入您的手机号码"><br>
							<span class="f_14_16 _433f3e">图片验证码</span>
							
							<input class="_input _w_input bg_input" type="text" name="imgcode" id="imgcode" placeholder="请输入图片验证码">
							
							<input type="button" id="checkCode" class="code" 
								   style="width:100px;margin:4px 35px 0 9px;background-image:url(statics/img/yzmb.png);
								   font-family:Arial,宋体;font-style:italic;color:white;letter-spacing:3px;
								   font-weight:bolder;font-size:22px;line-height: 46px;border-radius:5px;" onClick="createCode()" />
																					
							<!-- <input type="text" id="input1" />
							<input type="button" id="checkCode" class="code" style="width:100px" onClick="createCode()" />
							<input id="Button1" onClick="validate();" type="button" value="确定" /> -->
																											
							<br><br><span class="f_14_16 _433f3e">手机验证码</span>
							<input class="_input _w_input bg_input" type="text" name="msgcode" id="msgcode" placeholder="请输入手机验证码">
							<a id="get_reg_code" class="_w_input1 btn_fd5353 a_center f_14_47 fff">点击获取</a><br>
			                <!-- //用于阻止 chrome表单自动填充的占位符 -->
			                <input class="_hidden" type="text">
			                <input class="_hidden" type="password">
			                <!-- //用于阻止 chrome表单自动填充的占位符 -->
							<span class="f_14_16 _433f3e">创建密码</span>
							<input class="_input bg_input" type="password" name="password" id="password" autocomplete="off" placeholder="6-16位字符组成"><br>
							<span class="f_14_16 _433f3e">确认密码</span>
							<input class="_input bg_input" type="password" name="re_password" id="re_password" autocomplete="off" placeholder="请确认您的登录密码 "><br>
							<p class="lh_em_2 f_14_16 _433f3e a_left"><span class="checked_box selected v_center _cursor"></span>同意<a class="_1b3ad7 v_center" href="${pageContext.request.contextPath}/protocol.jsp">《口袋理财服务协议》</a></p>
							<a id="red_btn" class="_input _input_after _border btn_fd5353 a_center f_20_45 fff">立即注册</a><br>
							<div class="_input _border1 a_center _input_after">
								<span class="f_14_16 _433f3e">已有账号？</span>
								<span><a href="${pageContext.request.contextPath}/jsp/frontend/loginRegister/login.jsp" class="f_14_16 ff534f">登录</a></span>
							</div>
						</form>
					</div>
					<div class="clear"></div>
				</div>
			</div>
        </div>
        <!-- 主体部分结束 -->
		<script type="text/javascript" src="${pageContext.request.contextPath}/statics/localjs/register.js"></script>  
        <!-- 底部开始 -->
       	<%@include file="../common/footer.jsp"%>
        <!-- 底部结束 -->
    </div>
</body>
</html>