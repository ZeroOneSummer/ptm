<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>大额充值扫一扫-口袋理财</title>
<meta name="keywords" content="口袋理财,移动理财,理财超市,互联网金融,银行理财,信托理财">
<meta name="description" content="口袋理财——报喜鸟上市系投资的移动理财平台，是上海十强互联网金融公司、上海金融信息行业协会副会长单位。口袋理财专注于小额分散的投资理财，多元化的投资理财产品，严格风控，灵活安全。">
<meta name="baidu-site-verification" content="W0p7tymOhp">
<meta name="baidu_union_verify" content="ac175d4c07bcca63a8a2f76d7023d69d">

<%@include file="../common/js.jsp"%> 

</head>
<body style="background: #F7F7F7;">
    <div class="kdlc_pc_wrap">
        <!-- 头部开始 -->
        <%@include file="../common/header.jsp"%>   
        <!-- 头部结束 -->
        <!-- 主体部分开始 -->
        <div class="container">
			<div class="container">
				<div class="evt-mod" style="margin-top:23px">
					<div class="qrcode">
						<h3 class="text-center">扫一扫登录，进行大额充值<span class="db">二维码6分钟后失效，请重新刷新页面</span></h3>
						<div class="qrcode-img">
						    <img src="${pageContext.request.contextPath}/statics/js/charge-qr-code" class="img1">
						    <img src="${pageContext.request.contextPath}/statics/img/logo_2x.png" class="img2">
						</div>
						<p class="qrcode-steps">
							<span><i>1</i>扫一扫登录官网（仅限口袋理财app扫一扫）</span>
							<span><i>2</i>选用网银充值</span>
							<span><i>3</i>查看余额</span>
							<span><i>4</i>选购理财产品</span>
						</p>
					</div>
				</div>
			</div>
		</div>
		<!-- 主体部分结束 -->		
		<script type="text/javascript" src="${pageContext.request.contextPath}/statics/localcss/invest_4.js"></script>
        <!-- 底部开始 -->
       	<%@include file="../common/footer.jsp"%>
        <!-- 底部结束 -->
    </div>
</body>
</html>