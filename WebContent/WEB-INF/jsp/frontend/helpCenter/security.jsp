<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>帮助中心-安全特性</title>
<meta name="keywords" content="口袋理财,移动理财,理财超市,互联网金融,银行理财,信托理财">
<meta name="description" content="口袋理财——报喜鸟上市系投资的移动理财平台，是上海十强互联网金融公司、上海金融信息行业协会副会长单位。口袋理财专注于小额分散的投资理财，多元化的投资理财产品，严格风控，灵活安全。">
<meta name="baidu-site-verification" content="W0p7tymOhp">
<meta name="baidu_union_verify" content="ac175d4c07bcca63a8a2f76d7023d69d">

<%@include file="../common/js.jsp"%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/statics/css/web.css">

</head>
<body style="background: #F7F7F7;">
    <div class="kdlc_pc_wrap">
        <!-- 头部开始 -->
        <%@include file="../common/header.jsp"%>   
        <!-- 头部结束 -->
        <!-- 主体部分开始 -->
        <div class="container">           
			<div id="help_wrap">
			    <div class="content">
			        <ul id="help_nav">
                        <li id="title_property" class="help_curr_option"><a href="packageProject.html" class="title_a">资产说明</a></li>
                        <li id="title_function"><a href="moneyInfo.html" class="title_a">功能介绍</a></li>
                        <li id="title_goods"><a href="productDesc.html" class="title_a">产品介绍</a></li>
                        <li id="title_safety"><a href="security.html" class="title_a">安全特性</a></li>
                    </ul>
			        <ul id="help_content">
                        <li>
			                <span class="about_f_18_20">1.绑定银行卡规则说明</span>
			                <p class="about_f_20_50">您必须保证注册手机号，实名认证个人信息和绑定银行卡的开户人信息保持一致，并且同一身份证信息只能注册一个用户账号，否则您将会无法绑卡成功。若您绑定工商银行卡时提示身份不符，请先确认卡号是正确的，并且是您本人身份证开户的。然后请拨打客服电话：400-002-0802，工作人员会协助您进行绑定操作。</p>
			            </li>
                        <li>
			                <span class="about_f_18_20">2.平台的产品合法吗？</span>
			                <p class="about_f_20_50">本平台聘用了专业法律顾问团队对所有融资项目及业务模式进行评估，确保平台所有产品合法合规。法律顾问亦对平台服务合规性、政策走向性等方面提供法律意见，使平台所有业务均有法可依。</p>
			            </li>
                    </ul>
			        <div class="clear"></div>
			    </div>
			</div>
			<script>			
			    //初始选项卡
			    $('#title_safety').addClass("help_curr_option");
			</script>
		</div>
        <!-- 主体部分结束 -->
        <!-- 底部开始 -->
       	<%@include file="../common/footer.jsp"%>
        <!-- 底部结束 -->
    </div>
</body>
</html>