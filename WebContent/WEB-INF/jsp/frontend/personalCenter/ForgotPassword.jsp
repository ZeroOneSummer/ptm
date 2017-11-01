<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- saved from url=(0067)https://www.koudailc.com/site/forget-the-password?type=find_pay_pwd -->
<html lang="en" class=" ieundefined"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="format-detection" content="telephone=no">
<title>忘记密码-口袋理财</title>
<meta name="keywords" content="口袋理财,移动理财,理财超市,互联网金融,银行理财,信托理财">
<meta name="description" content="口袋理财——报喜鸟上市系投资的移动理财平台，是上海十强互联网金融公司、上海金融信息行业协会副会长单位。口袋理财专注于小额分散的投资理财，多元化的投资理财产品，严格风控，灵活安全。">
<meta name="baidu-site-verification" content="W0p7tymOhp">
<meta name="baidu_union_verify" content="ac175d4c07bcca63a8a2f76d7023d69d">

<%@include file="../common/js.jsp"%>           
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/statics/css/object.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/statics/css/mask.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/statics/css/web.css">   
     
<script src="${pageContext.request.contextPath }/statics/js/mask.js"></script>	
<script type="text/javascript" src="${pageContext.request.contextPath }/statics/js/check.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/statics/js/public(1).js"></script>
			
</head>
<body style="background: #F7F7F7;">
    <div class="kdlc_pc_wrap">
        <!-- 头部开始 -->
 		<%@include file="../common/header.jsp" %>     
        <!-- 头部结束 -->
        <!-- 主体部分开始 -->
        <div class="container">
            <div class="operation_wrap">
				<div class="content">
					<div>
						<span class="f_24_26 _333">忘记密码</span>
						<div>
							<div class="_operation">
								<table cellpadding="0" cellspacing="0">
			                                                    <tbody><tr>
			                                <td class="f_18_20 _333">手机号：</td>
			                                <td class="f_18_20 _333"><i id="loginName">${user.loginName }</i></td>
								        	<script type="text/javascript">
						                    	var name=$("#loginName").html();
						                    	var cname=name.substring(0,3)+"****"+name.substring(7);
						                    	$("#loginName").html(cname);
						                    </script>
			                            </tr>
			                            <tr>
			                                <td class="f_18_20 _333">实 名：</td>
			                                <td class="f_18_20 _333"><i id="name">${user.name }</i></td>
			                                <script type="text/javascript">
						                    	var name=$("#name").html();
						                    	var cname="*"+name.substring(1);
						                    	$("#name").html(cname);
						                    </script>
			                            </tr>
			                        						<tr>
										<td class="f_18_20 _333">身份证：</td>
										<td class="f_18_20 _333"><input id="id_card" class="_input" type="text"></td>
									</tr>
									<tr>
										<td class="f_18_20 _333">验证码：</td>
										<td class="f_18_20 _333 clear_inline_block">
			                                <input id="code" class="_input _inputcode" type="text" placeholder="请输入手机验证码">
			                                <a href="javascript:void(0);" id="getcode" class="_input _getcode btn_fd5353 a_center f_14_47 fff">点击获取</a>
			                            </td>
									</tr>
									<tr>
										<td class="f_18_20 _333">新密码：</td>
										<td class="f_18_20 _333"><input id="password" class="_input" type="password" placeholder="请输入新密码"></td>
									</tr>
			                        <tr>
			                            <td class="f_18_20 _333">确认密码：</td>
			                            <td class="f_18_20 _333">
			                                <!-- //用于阻止 chrome表单自动填充的占位符 -->
			                                <input class="_hidden" type="text">
			                                <input class="_hidden" type="password">
			                                <!-- //用于阻止 chrome表单自动填充的占位符 -->
			                                <input id="newpassword" class="_input" type="password" autocomplete="off" placeholder="请输入确认密码">
			                            </td>
			                        </tr>
									<tr>
										<td><!-- 留边距 --></td>
										<td><div id="notification" class="f_14_16 ff534f">&nbsp;</div>
			                                <a href="javascript:form_submit()" class="_input _border btn_fd5353 a_center f_20_50 fff">提  交</a>
			                            </td>
									</tr>
								</tbody></table>
							</div>
						</div>
						<div class="clear"></div>
					</div>
				</div>
			</div>
        </div>
        <!-- 主体部分结束 -->
		<script type="text/javascript" src="${pageContext.request.contextPath }/statics/localjs/personalCenter_ForgotPassword.js"></script>
		<!-- 尾部开始 -->
		<%@include file="../common/footer.jsp" %>
		<!-- 尾部结束 -->
    </div>
</body>
</html>  