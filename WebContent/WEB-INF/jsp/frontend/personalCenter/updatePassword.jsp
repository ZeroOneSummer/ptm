<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en" class=" ieundefined">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="format-detection" content="telephone=no">    
<title>修改交易密码-口袋理财</title>
<meta name="keywords" content="口袋理财,移动理财,理财超市,互联网金融,银行理财,信托理财">
<meta name="description" content="口袋理财——报喜鸟上市系投资的移动理财平台，是上海十强互联网金融公司、上海金融信息行业协会副会长单位。口袋理财专注于小额分散的投资理财，多元化的投资理财产品，严格风控，灵活安全。">
<meta name="baidu-site-verification" content="W0p7tymOhp">
<meta name="baidu_union_verify" content="ac175d4c07bcca63a8a2f76d7023d69d">

<%@include file="../common/js.jsp"%>           
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/statics/css/object.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/statics/css/mask.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/statics/css/web.css">   
     
<script src="${pageContext.request.contextPath }/statics/js/mask.js"></script>	
<script src="${pageContext.request.contextPath }/statics/js/check.js"></script>

</head>
<body style="background: #F7F7F7;">
    <div class="kdlc_pc_wrap">
    	<!-- 头部开始 -->
		<%@include file="../common/header.jsp" %>
		<!-- 头部结束 -->
        <!-- 主体部分开始  修改交易密码 -->
        <div class="container">
            <div class="my_pocket_wrap">
				<div class="content">
					<div class="my_pocket_header">
					<span class="f_14_35 _333 f_left">Hi，<i id="login">${user.loginName }</i>用户，为理想和财富开始活力的一天吧！
			        	<script type="text/javascript">
	                    	var name=$("#login").html();
	                    	var cname=name.substring(0,3)+"****"+name.substring(7);
	                    	$("#login").html(cname);
	                    </script></span>
					<div class="f_right">
						<a href="user/recharge.html">
						<span class="btn_fd5353 f_14_35 fff a_center">充值</span></a>
						<a href="user/withdrawDeposit.html">
						<span class="btn_fd5353 bg_fff f_14_35 fd5353 a_center">提现</span></a>
					</div>
					<div class="clear"></div>
					</div>
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
			                  </div><div id="fullbg"></div><script type="text/javascript">
			                 
			                </script><script src="${pageContext.request.contextPath }/statics/js/mask.js"></script>			<div class="my_pocket_content">
							<div class="_title">
			                    <span class="f_18_20 _333 f_left">修改交易密码</span>
			                    <a href="account.html" class="f_14_16 ff534f f_right">&lt;&nbsp;返回</a>
			                    <div class="clear"></div>
			                </div>
							<div class="_content a_right">
								<div class="f_14_16 ff534f a_center">请设置交易密码以保障你的每一笔资金变动的安全</div>
								<div class="f_14_16 _333 a_center"><i id="setPassword">${user.loginName }</i>
									<script type="text/javascript">
				                    	var name=$("#setPassword").html();
				                    	var cname=name.substring(0,3)+"****"+name.substring(7);
				                    	$("#setPassword").html(cname);
				                    </script>
								</div>
			                    <!-- //用于阻止 chrome表单自动填充的占位符 -->
			                    <input class="_hidden" type="text">
			                    <input class="_hidden" type="password">
			                    <!-- //用于阻止 chrome表单自动填充的占位符 -->
								<span class="f_14_16 _333">当前密码</span><input type="password" autocomplete="off" class="_input" id="old_pwd"><br>
								<span class="f_14_16 _333">新密码</span><input type="password" autocomplete="off" class="_input" id="password"><br>
								<span class="f_14_16 _333">确认密码</span><input type="password" autocomplete="off" class="_input" id="repassword"><br>
			                    <div id="notification" class="f_14_16 ff534f a_center">&nbsp;</div>
								<a href="javascript:changePaypwd();" class="_input _border btn_fd5353 a_center f_20_50 fff" id="red_btn">确认</a>
							</div>
						</div>
						<div class="clear"></div>
					</div>
				</div>
			</div>			
		</div>
        <!-- 主体部分结束 -->
		<script type="text/javascript" src="${pageContext.request.contextPath }/statics/localjs/personalCenter_updatePassword.js"></script>
		<!-- 尾部开始 -->
		<%@include file="../common/footer.jsp" %>
		<!-- 尾部结束 -->  
    </div>	
</body>
</html>