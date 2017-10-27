<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录-口袋理财</title>
<meta name="keywords" content="口袋理财,移动理财,理财超市,互联网金融,银行理财,信托理财">
<meta name="description" content="口袋理财——报喜鸟上市系投资的移动理财平台，是上海十强互联网金融公司、上海金融信息行业协会副会长单位。口袋理财专注于小额分散的投资理财，多元化的投资理财产品，严格风控，灵活安全。">
<meta name="baidu-site-verification" content="W0p7tymOhp">
<meta name="baidu_union_verify" content="ac175d4c07bcca63a8a2f76d7023d69d">

<%@include file="../common/js.jsp"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/statics/localcss/login.css"/>

</head>
<body style="background: #F7F7F7;">
    <div class="kdlc_pc_wrap">
        <!-- 头部开始 -->
        <%@include file="../common/header.jsp"%>   
        <!-- 头部结束 -->
        <!-- 主体部分开始 -->
        <div class="container">
			<div id="login_wrap">
			    <div class="content">
			       <div class="l_left r_left"><ul><li id="left" style="cursor: not-allowed;"><img src="${pageContext.request.contextPath}/statics/img/page_reduce1.jpg" title="第一张"></li><li><img id="obj" src="${pageContext.request.contextPath}/statics/img/kzr.jpg"></li><li id="right" style="cursor: not-allowed;"><img src="${pageContext.request.contextPath}/statics/img/page_add1.jpg" title="最后一张"></li></ul></div>
			        <div class="l_right a_center">
			            <span class="f_20_22 _333">登录</span>
			            <form method="post" action="https://www.koudailc.com/site/login" class="clear_inline_block  a_right">
			                <!-- //用于阻止 chrome表单自动填充的占位符 -->
			                <input class="_hidden" type="text">
			                <input class="_hidden" type="password">
			                <!-- //用于阻止 chrome表单自动填充的占位符 -->
			                <span id="notification" class="f_14_16 ff534f"></span><br>
			                <div class="clear"></div>
			                <span class="f_14_16 _433f3e">手机号</span>
			                <input class="_input bg_input first_child" type="text" maxlength="11" name="username" id="username" placeholder="请输入注册的手机号码"><br>
			                <span class="f_14_16 _433f3e">密码</span>
			                <input class="_input bg_input" type="password" name="password" id="password" autocomplete="off" placeholder="请输入您的登录密码"><br>
			
			                <span class="f_14_16 _433f3e J_captcha " style="display:none;">验证码</span>
			                <input class=" J_captcha _input _w_input bg_input" style="display:none;" type="text" name="imgcode" id="imgcode" placeholder="请输入图片验证码">
			                <img onclick="refreshCaptcha();" class=" J_captcha _w_input1 btn_fd5353 a_center f_14_47 fff" style="display:none;" title="点击刷新验证码" src="./登录-口袋理财_files/captcha" id="loginform-verifycode-image">
			                <br><br>
			
			                <a id="red_btn" class="_input _border btn_fd5353 a_center f_20_45 fff" name="r_submit" onclick="javascript:login()">登录</a>
			                <div class="_input _border1 a_center">
			                    <span><a href="ForgotPassword" class="f_14_16 ff534f">忘记密码</a></span>
			                    <span class="f_14_16 b5b5b5 nth_child">|</span>
			                    <span><a href="register" class="f_14_16 ff534f">立即注册</a></span>
			                </div>
			            </form>
			        </div>
			        <div class="clear"></div>
			    </div>
			</div>
			</div>
        <!-- 主体部分结束 -->
		<script type="text/javascript" src="${pageContext.request.contextPath}/statics/localjs/login.js"></script>  
        <!-- 底部开始 -->
       	<%@include file="../common/footer.jsp"%>
        <!-- 底部结束 -->
    </div>
</body>
</html>