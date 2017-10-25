<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en" class=" ieundefined">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">    
<meta name="format-detection" content="telephone=no">
<title>修改登录密码-口袋理财</title>
<meta name="keywords" content="口袋理财,移动理财,理财超市,互联网金融,银行理财,信托理财">
<meta name="description" content="口袋理财——报喜鸟上市系投资的移动理财平台，是上海十强互联网金融公司、上海金融信息行业协会副会长单位。口袋理财专注于小额分散的投资理财，多元化的投资理财产品，严格风控，灵活安全。">
<meta name="baidu-site-verification" content="W0p7tymOhp">
<meta name="baidu_union_verify" content="ac175d4c07bcca63a8a2f76d7023d69d">

<%@include file="../common/js.jsp"%>           
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/statics/css/object.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/statics/css/mask.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/statics/css/web.css">   
     
<script src="${pageContext.request.contextPath }/statics/js/mask.js"></script>	
<!-- 
<style type="text/css" abt="234"></style>
<style type="text/css" adt="123"></style> 
-->
</head>
<body style="background: #F7F7F7;">
    <div class="kdlc_pc_wrap">
    	<!-- 头部开始 -->
		<%@include file="../common/header.jsp" %>
		<!-- 头部结束 -->
        <!-- 主体部分开始     修改登录密码-->
        <div class="container">
            <div class="my_pocket_wrap">
				<div class="content">					
					<div class="my_pocket_header">
					<span class="f_14_35 _333 f_left">Hi，188****6917用户，为理想和财富开始活力的一天吧！</span>
					<div class="f_right">
			        		<a href="user/recharge.html">
			        			<span class="btn_fd5353 f_14_35 fff a_center">充值</span>
			        		</a>
			        		<a href="user/withdrawDeposit.html">
			        			<span class="btn_fd5353 bg_fff f_14_35 fd5353 a_center">提现</span>
			        		</a>
			        </div>
					<div class="clear"></div></div>
					<div class="my_pocket_body">
						<div class="my_pocket_main a_center">
							<ul>
									<li><a href="myInvest.html" class="f_14_47 _999">我的投资</a></li>
				        			<li><a href="account.html" class="f_14_47 fff">账户中心</a></li>
				        			<li><a href="myPocket.html" class="f_14_47 _999">我的口袋券</a></li>
				        			<li><a href="messageCenter.html" class="f_14_47 _999">消息中心</a></li>
							</ul>
						</div>
						<div id="detail_invest_confirm">
	                        <div id="detail_invest_confirm_top">
	                            <span class="fl f_20_50">绑卡才能提现哦！请先绑定银行卡</span><span class="fr"><a onclick="closeConfirm();">X</a></span>
	                            <img src="${pageContext.request.contextPath }/statics/img/gl_phone.png" id="img1">
	                        </div>
	                   </div>
	                   <div id="fullbg"></div>                            
		               <div class="my_pocket_content">
							<div class="_title">
			                    <span class="f_18_20 _333 f_left">修改登录密码</span>
			                    <a href="account.jsp" class="f_14_16 ff534f f_right">&lt;&nbsp;返回</a>
			                    <div class="clear"></div>
			                </div>
							<div class="_content a_right">
								<div class="f_14_16 _333 a_center">188****6917</div>
			                    <!-- //用于阻止 chrome表单自动填充的占位符 -->
			                    <input class="_hidden" type="text">
			                    <input class="_hidden" type="password">
			                    <!-- //用于阻止 chrome表单自动填充的占位符 -->
								<span class="f_14_16 _333">当前密码</span><input type="password" autocomplete="off" id="old_pwd" class="_input"><br>
								<span class="f_14_16 _333">新密码</span><input type="password" autocomplete="off" id="password" class="_input"><br>
								<span class="f_14_16 _333">确认密码</span><input type="password" autocomplete="off" id="repassword" class="_input"><br>
			                    <div id="notification" class="f_14_16 ff534f a_center">&nbsp;</div>
								<a href="javascript:changepwd();" class="_input _border btn_fd5353 a_center f_20_50 fff" id="red_btn">确认</a>
							</div>
					  </div>
					  <div class="clear"></div>
					</div>
				</div>
			</div>
 		</div>
        <!-- 主体部分结束 -->       		
		<script type="text/javascript" src="${pageContext.request.contextPath }/statics/localjs/personalCenter_loginPassword.js"></script>
        <!-- 尾部开始 -->
		<%@include file="../common/footer.jsp" %>
		<!-- 尾部结束 -->
    </div>	
</body>
</html>     