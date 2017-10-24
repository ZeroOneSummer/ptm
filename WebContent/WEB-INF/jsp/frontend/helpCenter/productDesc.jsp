<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>帮助中心-产品介绍</title>
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
			                <span class="about_f_18_20">1.关于“即生息”服务说明</span>
			                <p class="about_f_20_50">投资定期项目至项目满款复审通过期间，每天会以5%年利率计算收益（投资当天和满款复审通过当天除外），因此您的 项目收益=项目固定收益+项目未满期间的每日收益例如，您1月10日单笔购买年化利率为12%，期限为1个月的定期项目10000元，如果是1月11日项目满款复审通过，是没有既生息的；如果1月15日项目满款复审通过，那么您的项目收益包含项目固定收益加上1月11日至14日共计4天的5%利率的收益，即项目收益为100+8.76=108.76元。</p>
			            </li>
                        <li>
			                <span class="about_f_18_20">2.口袋券一次能用多张吗？</span>
			                <p class="about_f_20_50">不可以，一次只能使用一张；每张口袋券均标注了有效期，请在有效期内使用。</p>
			            </li>
                        <li>
			                <span class="about_f_18_20">3.年化8%+0~15%？</span>
			                <p class="about_f_20_50">8%是固定收益，0~15%为浮动收益。</p>
			            </li>
                        <li>
			                <span class="about_f_18_20">4.定期项目投资有上限吗？</span>
			                <p class="about_f_20_50">没有，但是不同银行卡每天有充值上限。</p>
			            </li>
                        <li>
			                <span class="about_f_18_20">5.+0.5%是什么意思？</span>
			                <p class="about_f_20_50">额外的0.5%为平台贴息。</p>
			            </li>
                        <li>
			                <span class="about_f_18_20">6.利息的计算方式是什么？</span>
			                <p class="about_f_20_50">定期项目计算方式为：投资金额*年化率*投资天数/365；您也可以点击项目详情的右上角计算器进行计算；</p>
			            </li>
                        <li>
			                <span class="about_f_18_20">7.如何查看项目融资进展？</span>
			                <p class="about_f_20_50">请到“我的口袋”，点击“我的项目”进行查看。</p>
			            </li>
			            <li>
			                <span class="about_f_18_20">8.定期买完后收益会变吗？</span>
			                <p class="about_f_20_50">不会，已购买的定期项目不会调整预期年化收益率。</p>
			            </li>
			            <li>
			                <span class="about_f_18_20">9.不同项目贷款人是一个？</span>
			                <p class="about_f_20_50">有时贷款人借款数额过大，为控制风险，将其拆分后进行融资。</p>
			            </li>
			            <li>
			                <span class="about_f_18_20">10.什么是新手宝？</span>
			                <p class="about_f_20_50">新手宝是针对平台新用户的产品，利率比同类产品高，每位新用户只能购买一次，请珍惜此次机会。</p>
			            </li>
			            <li>
			                <span class="about_f_18_20">11.成长值的用途？</span>
			                <p class="about_f_20_50">成长值决定了用户的会员等级，成长值累计越多，会员等级越高，能享受到的特权与福利也越多。</p>
			            </li>
			        </ul>
			        <div class="clear"></div>
			    </div>
			</div>
			<script>
			    //初始选项卡
			    $('#title_goods').addClass("help_curr_option");
			</script>
        </div>
        <!-- 主体部分结束 -->
        <!-- 底部开始 -->
       	<%@include file="../common/footer.jsp"%>
        <!-- 底部结束 -->
   	</div>
</body>
</html>