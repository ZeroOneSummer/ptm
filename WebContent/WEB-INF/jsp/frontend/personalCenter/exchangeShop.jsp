<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- <style type="text/css">
@charset "UTF-8";

[ng\:cloak], [ng-cloak], [data-ng-cloak], [x-ng-cloak], .ng-cloak,
	.x-ng-cloak, .ng-hide {
	display: none !important;
}

ng\:form {
	display: block;
}

.ng-animate-block-transitions {
	transition: 0s all !important;
	-webkit-transition: 0s all !important;
}

.ng-hide-add-active, .ng-hide-remove {
	display: block !important;
}
</style> -->
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>口袋理财- 积分商城</title>
<meta name="format-detection" content="telephone=no">
<meta name="description"
	content="口袋理财——报喜鸟上市系投资的移动理财平台，是上海十强互联网金融公司、上海金融信息行业协会副会长单位。口袋理财专注于小额分散的投资理财，多元化的投资理财产品，严格风控，灵活安全。 ">
<meta name="keywords" content="口袋理财，金融+互联网平台">
<meta name="baidu-site-verification" content="b6FBxZYTyZ">

<link
	href="${pageContext.request.contextPath}/statics/shop/css/shitou-9aa11b0d08.lib.css"
	rel="stylesheet">  
<link
	href="${pageContext.request.contextPath}/statics/shop/css/activity-b9b8b62e61.css"
	rel="stylesheet"> 
<%@include file="../common/js.jsp"%>	

</head>
<body class="ng-scope" ng-controller="Base">
	<!-- 头部开始 -->
	 <%@include file="../common/header.jsp"%>  
	<!-- 头部结束 -->
	
	<div class="main-wrapper">
		<div class="integral-mall-wrapper ng-scope"
			ng-controller="IntegralMallCtrl" ng-init="pageInit(false);">
			<div class="container" ng-show="!loading">
				<div ng-show="killList1.length &gt; 0 || killList2.length &gt; 0"
					class="">
					<div class="header-title">
						<h4 class="title">特价专区</h4>
					</div>
					<div class="sale-zone">
						<ul class="list-unstyled clearfix">
							<!-- ngRepeat: item in killList1 track by $index -->
							<!-- ngIf: $index == 0 -->
							<li class="col-xs-6 ng-scope mr-20"
								ng-class="{ &#39;mr-20&#39;: $index % 2 == 0 }"
								ng-repeat="item in killList1 track by $index"
								ng-if="$index == 0"><span class="seckill-icon"></span>
								<p class="sale-time text-center ng-binding">每天10:00开抢</p>
								<div class="cont clearfix">
									<div class="pull-left product-content">
										<img class="product-image physical-image ng-hide"
											ng-show="item.prizetype == 1"
											ng-src="https://shitouback.shitou.com/integral20170906/app-b_1504660717376.jpg"
											ng-click="showActiveIntegralInfo($index, item.spikeActiveId, item.prizetype, item.prizetype, true, true)"
											src="${pageContext.request.contextPath}/statics/shop/img/app-b_1504660717376.jpg">
										<img class="product-image" ng-show="item.prizetype == 2"
											ng-src="https://shitouback.shitou.com/integral20170906/app-b_1504660717376.jpg"
											src="${pageContext.request.contextPath}/statics/shop/img/app-b_1504660717376.jpg">
									</div>
									<div class="pull-left">
										<p class="prod-title ng-binding">限抢1张-0.5%额度加息券</p>
										<p class="cost-integral original-integral">
											<span class="icon-font icon-jifen"></span><span
												class="line-through ng-binding">230000</span>
										</p>
										<p class="cost-integral sale-integral orange ng-binding">
											<span class="icon-font icon-jifen"></span>200
										</p>
										<p class="cost-integral remain-stock">
											<span class="ng-binding">库存：5</span>
										</p>
										<div class="sale-status">
											<button
												class="btn btn-orange-hollow to-buy count-btn ng-binding ng-hide"
												ng-show="item.isCountDown">距离秒杀 ::</button>
											<div ng-show="!item.isCountDown" class="">
												<!-- ngIf: item.isReceived == 1 -->
												<div ng-show="item.isReceived != 1" class="">
													
													
													<button class="btn btn-orange-rect to-buy ng-scope"
														ng-if="item.remainStock &gt; 0" ng-click="showLoginForm12()">立即抢购</button>
													
												</div>
											</div>
										</div>
									</div>
								</div></li>
								<li class="col-xs-6 ng-scope"
								ng-repeat="item in killList2 track by $index"
								ng-if="$index == 0"><span class="seckill-icon"></span>
								<p class="sale-time text-center ng-binding">每天14:00开抢</p>
								<div class="cont clearfix">
									<div class="pull-left product-content">
										<img class="product-image physical-image ng-hide"
											ng-show="item.prizetype == 1"
											ng-src="https://shitouback.shitou.com/integral20170906/app-b_1504660717376.jpg"
											ng-click="showActiveIntegralInfo($index, item.spikeActiveId, item.prizetype, item.prizetype, true, true)"
											src="${pageContext.request.contextPath}/statics/shop/img/app-b_1504660717376.jpg">
										<img class="product-image" ng-show="item.prizetype == 2"
											ng-src="https://shitouback.shitou.com/integral20170906/app-b_1504660717376.jpg"
											src="${pageContext.request.contextPath}/statics/shop/img/app-b_1504660717376.jpg">
									</div>
									<div class="pull-left">
										<p class="prod-title ng-binding">限抢1张-0.5%额度加息券</p>
										<p class="cost-integral original-integral">
											<span class="icon-font icon-jifen"></span><span
												class="line-through ng-binding">230000</span>
										</p>
										<p class="cost-integral sale-integral orange ng-binding">
											<span class="icon-font icon-jifen"></span>200
										</p>
										<p class="cost-integral remain-stock">
											<span class="ng-binding">库存：5</span>
										</p>
										<div class="sale-status">
											<button
												class="btn btn-orange-hollow to-buy count-btn ng-binding"
												ng-show="item.isCountDown">距离秒杀 00:40:14</button>
											<div ng-show="!item.isCountDown" class="ng-hide">
												<!-- ngIf: item.isReceived == 1 -->
												<div ng-show="item.isReceived != 1" class="">
													
													
													<button class="btn btn-orange-rect to-buy ng-scope"
														ng-if="item.remainStock &gt; 0" ng-click="showLoginForm12()">立即抢购</button>
													
												</div>
											</div>
										</div>
									</div>
								</div></li>
							<!-- end ngIf: $index == 0 -->
							<!-- end ngRepeat: item in killList2 track by $index -->
						</ul>
					</div>
				</div>
				<div class="pull-left header-title">
					<h4 class="title">兑换优惠券</h4>
				</div>
				<div class="main-content virtual-list-wrapper"
					ng-show="virtualList &amp;&amp; virtualList.length &gt; 0">
					<ul class="exchange-list virtual-list list-unstyled list-inline"
						ng-show="virtualList.length &gt; 0">
						<!-- ngRepeat: item in virtualList track by $index -->
						<li ng-repeat="item in virtualList track by $index"
							ng-class="{&#39;nth-child-4n&#39;: ($index &gt; 0) &amp;&amp; (($index + 1)%4 == 0)}"
							class="ng-scope"><div class="product-info">
								<div class="product-content">
									<img class="product-image"
										ng-src="https://shitouback.shitou.com/integral20170927/tzdjq_10_s_1506475163620.png"
										src="${pageContext.request.contextPath}/statics/shop/img/tzdjq_10_s_1506475163620.png">
								</div>
								<div class="product-footer text-center">
									<div class="product-desc">
										<p>
											<i class="icon-font integral-icon"></i><span
												class="price ng-binding">3,800</span> <span
												class="qty ng-binding">库存：5</span>
										</p>
									</div>
									<div class="product-btn">
										
										
										<a class="btn btn-blue-rect to-buy ng-scope"
											ng-if="item.remainstock &gt; 0" ng-click="showLoginForm12()">立即兑换</a>
										
									</div>
								</div>
							</div></li>
						<!-- end ngRepeat: item in virtualList track by $index -->
						<li ng-repeat="item in virtualList track by $index"
							ng-class="{&#39;nth-child-4n&#39;: ($index &gt; 0) &amp;&amp; (($index + 1)%4 == 0)}"
							class="ng-scope"><div class="product-info">
								<div class="product-content">
									<img class="product-image"
										ng-src="https://shitouback.shitou.com/integral20170822/tzdjq_20_s_1503396920783.png"
										src="${pageContext.request.contextPath}/statics/shop/img/tzdjq_20_s_1503396920783.png">
								</div>
								<div class="product-footer text-center">
									<div class="product-desc">
										<p>
											<i class="icon-font integral-icon"></i><span
												class="price ng-binding">5,900</span> <span
												class="qty ng-binding">库存：3</span>
										</p>
									</div>
									<div class="product-btn">
										
										
										<a class="btn btn-blue-rect to-buy ng-scope"
											ng-if="item.remainstock &gt; 0" ng-click="showLoginForm12()">立即兑换</a>
										
									</div>
								</div>
							</div></li>
						<!-- end ngRepeat: item in virtualList track by $index -->
						<li ng-repeat="item in virtualList track by $index"
							ng-class="{&#39;nth-child-4n&#39;: ($index &gt; 0) &amp;&amp; (($index + 1)%4 == 0)}"
							class="ng-scope"><div class="product-info">
								<div class="product-content">
									<img class="product-image"
										ng-src="https://shitouback.shitou.com/integral20170928/tzdjq_100_s_1506561318575.png"
										src="${pageContext.request.contextPath}/statics/shop/img/tzdjq_100_s_1506561318575.png">
								</div>
								<div class="product-footer text-center">
									<div class="product-desc">
										<p>
											<i class="icon-font integral-icon"></i><span
												class="price ng-binding">29,000</span> <span
												class="qty ng-binding">库存：5</span>
										</p>
									</div>
									<div class="product-btn">
										
										
										<a class="btn btn-blue-rect to-buy ng-scope"
											ng-if="item.remainstock &gt; 0" ng-click="showLoginForm12()">立即兑换</a>
										
									</div>
								</div>
							</div></li>
						<!-- end ngRepeat: item in virtualList track by $index -->
						<li ng-repeat="item in virtualList track by $index"
							ng-class="{&#39;nth-child-4n&#39;: ($index &gt; 0) &amp;&amp; (($index + 1)%4 == 0)}"
							class="ng-scope nth-child-4n"><div class="product-info">
								<div class="product-content">
									<img class="product-image"
										ng-src="https://shitouback.shitou.com/integral20170428/tzdjq_200_s_1493365755202.png"
										src="${pageContext.request.contextPath}/statics/shop/img/tzdjq_200_s_1493365755202.png">
								</div>
								<div class="product-footer text-center">
									<div class="product-desc">
										<p>
											<i class="icon-font integral-icon"></i><span
												class="price ng-binding">57,000</span> <span
												class="qty ng-binding">库存：3</span>
										</p>
									</div>
									<div class="product-btn">
										
										
										<a class="btn btn-blue-rect to-buy ng-scope"
											ng-if="item.remainstock &gt; 0" ng-click="showLoginForm12()">立即兑换</a>
										
									</div>
								</div>
							</div></li>
						<!-- end ngRepeat: item in virtualList track by $index -->
						<li ng-repeat="item in virtualList track by $index"
							ng-class="{&#39;nth-child-4n&#39;: ($index &gt; 0) &amp;&amp; (($index + 1)%4 == 0)}"
							class="ng-scope"><div class="product-info">
								<div class="product-content">
									<img class="product-image"
										ng-src="https://shitouback.shitou.com/integral20170428/tzjxq_0.66_s_1493362733547.png"
										src="${pageContext.request.contextPath}/statics/shop/img/tzjxq_0.66_s_1493362733547.png">
								</div>
								<div class="product-footer text-center">
									<div class="product-desc">
										<p>
											<i class="icon-font integral-icon"></i><span
												class="price ng-binding">5,000</span> <span
												class="qty ng-binding">库存：7</span>
										</p>
									</div>
									<div class="product-btn">
										
										
										<a class="btn btn-blue-rect to-buy ng-scope"
											ng-if="item.remainstock &gt; 0" ng-click="showLoginForm12()">立即兑换</a>
										
									</div>
								</div>
							</div></li>
						<!-- end ngRepeat: item in virtualList track by $index -->
						<li ng-repeat="item in virtualList track by $index"
							ng-class="{&#39;nth-child-4n&#39;: ($index &gt; 0) &amp;&amp; (($index + 1)%4 == 0)}"
							class="ng-scope"><div class="product-info">
								<div class="product-content">
									<img class="product-image"
										ng-src="https://shitouback.shitou.com/integral20170911/tzdjq_6.6_s_1505092775306.png"
										src="${pageContext.request.contextPath}/statics/shop/img/tzdjq_6.6_s_1505092775306.png">
								</div>
								<div class="product-footer text-center">
									<div class="product-desc">
										<p>
											<i class="icon-font integral-icon"></i><span
												class="price ng-binding">2,000</span> <span
												class="qty ng-binding">库存：4</span>
										</p>
									</div>
									<div class="product-btn">
										
										
										<a class="btn btn-blue-rect to-buy ng-scope"
											ng-if="item.remainstock &gt; 0" ng-click="showLoginForm12()">立即兑换</a>
										
									</div>
								</div>
							</div></li>
						<!-- end ngRepeat: item in virtualList track by $index -->
						<li ng-repeat="item in virtualList track by $index"
							ng-class="{&#39;nth-child-4n&#39;: ($index &gt; 0) &amp;&amp; (($index + 1)%4 == 0)}"
							class="ng-scope"><div class="product-info">
								<div class="product-content">
									<img class="product-image"
										ng-src="https://shitouback.shitou.com/integral20170426/tzdjq_5_s_1493192829837.png"
										src="${pageContext.request.contextPath}/statics/shop/img/tzdjq_5_s_1493192829837.png">
								</div>
								<div class="product-footer text-center">
									<div class="product-desc">
										<p>
											<i class="icon-font integral-icon"></i><span
												class="price ng-binding">1,500</span> <span
												class="qty ng-binding">库存：4</span>
										</p>
									</div>
									<div class="product-btn">
										
										
										<a class="btn btn-blue-rect to-buy ng-scope"
											ng-if="item.remainstock &gt; 0" ng-click="showLoginForm12()">立即兑换</a>
										
									</div>
								</div>
							</div></li>
						<!-- end ngRepeat: item in virtualList track by $index -->
						<li ng-repeat="item in virtualList track by $index"
							ng-class="{&#39;nth-child-4n&#39;: ($index &gt; 0) &amp;&amp; (($index + 1)%4 == 0)}"
							class="ng-scope nth-child-4n"><div class="product-info">
								<div class="product-content">
									<img class="product-image"
										ng-src="https://shitouback.shitou.com/integral20170426/tzdjq_8_s_1493192909744.png"
										src="${pageContext.request.contextPath}/statics/shop/img/tzdjq_8_s_1493192909744.png">
								</div>
								<div class="product-footer text-center">
									<div class="product-desc">
										<p>
											<i class="icon-font integral-icon"></i><span
												class="price ng-binding">2,500</span> <span
												class="qty ng-binding">库存：4</span>
										</p>
									</div>
									<div class="product-btn">
										
										
										<a class="btn btn-blue-rect to-buy ng-scope"
											ng-if="item.remainstock &gt; 0" ng-click="showLoginForm12()">立即兑换</a>
										
									</div>
								</div>
							</div></li>
						<!-- end ngRepeat: item in virtualList track by $index -->
					</ul>
					<div class="pagination-wrapper">
						<ul class="pagination ly-pagination ng-isolate-scope"
							name="virtual" total-records="virtualInfo.total"
							page-size="params.virtual.rows"
							ng-show="virtualList.length &gt; 0">
							<li><a href="" aria-label="Previous" ng-click="prev()"><span
									aria-hidden="true" ng-bind-html="trustHtml(prevTextFinal)"
									class="ng-binding">上一页</span></a></li>
							<li ng-show="inTheEnd" class="ng-hide"><a href=""
								ng-click="goto(1)">1</a></li>
							<li ng-show="inTheEnd &amp;&amp; !hidePageTwo" class="ng-hide"><a
								href="" ng-click="goto(2)">2</a></li>
							<li ng-show="inTheEnd" class="ng-hide"><a href="">...</a></li>
							<!-- ngRepeat: p in pages -->
							<li ng-class="{active: currentPage === p}" ng-repeat="p in pages"
								class="ng-scope active"><a href="" ng-click="goto(p)"
								class="ng-binding">1</a></li>
							<!-- end ngRepeat: p in pages -->
							<li ng-show="outOfRange" class="ng-hide"><a href="">...</a></li>
							<li ng-show="outOfRange" class="ng-hide"><a href=""
								ng-click="goto(totalPages)" class="ng-binding">1</a></li>
							<li><a href="" aria-label="Next" ng-click="next()"><span
									aria-hidden="true" ng-bind-html="trustHtml(nextTextFinal)"
									class="ng-binding">下一页</span></a></li>
						</ul>
					</div>
				</div>
				<div class="no-data-wrapper ng-hide"
					ng-show="virtualList &amp;&amp; virtualList.length == 0">
					<div class="text-center no-data-wrapper">
						<img
							src="${pageContext.request.contextPath}/statics/shop/img/no-data-img-39f18a45bd.png"
							class="no-data-img"> <span class="gray-darker">暂无数据显示</span>
					</div>
				</div>
				<div class="pull-left header-title">
					<h4 class="title">兑换实物商品</h4>
				</div>
				<div class="main-content physical-list-wrapper"
					ng-show="physicalList &amp;&amp; physicalList.length &gt; 0">
					<ul class="exchange-list physical-list list-unstyled list-inline">
						<!-- ngRepeat: item in physicalList track by $index -->
						<li ng-repeat="item in physicalList track by $index"
							ng-class="{&#39;nth-child-4n&#39;: ($index &gt; 0) &amp;&amp; (($index + 1)%4 == 0)}"
							class="ng-scope"><div class="product-info">
								<div class="product-content">
									<img class="product-image physical-image"
										ng-src="https://shitouback.shitou.com/integral20170821/mihoutao_s_1503294707298.png"
										ng-click="showIntegralInfo($index, item.exchangeprizeid, 1, 1, true, true)"
										src="${pageContext.request.contextPath}/statics/shop/img/mihoutao_s_1503294707298.png">
								</div>
								<div class="product-footer text-center">
									<div class="product-desc">
										<p>
											<i class="icon-font integral-icon"></i><span
												class="price ng-binding">15,000</span> <span
												class="qty ng-binding">库存：0</span>
										</p>
									</div>
									<div class="product-btn">
										
										<a class="btn btn-blue-rect to-buy disabled ng-scope"
											ng-if="item.remainstock == 0">暂无库存</a>
										<!-- end ngIf: item.remainstock == 0 -->
										
									</div>
								</div>
							</div></li>
						
						<li ng-repeat="item in physicalList track by $index"
							ng-class="{&#39;nth-child-4n&#39;: ($index &gt; 0) &amp;&amp; (($index + 1)%4 == 0)}"
							class="ng-scope"><div class="product-info">
								<div class="product-content">
									<img class="product-image physical-image"
										ng-src="https://shitouback.shitou.com/integral20170523/xbr_s_1495525186653.png"
										ng-click="showIntegralInfo($index, item.exchangeprizeid, 1, 1, true, true)"
										src="${pageContext.request.contextPath}/statics/shop/img/xbr_s_1495525186653.png">
								</div>
								<div class="product-footer text-center">
									<div class="product-desc">
										<p>
											<i class="icon-font integral-icon"></i><span
												class="price ng-binding">18,000</span> <span
												class="qty ng-binding">库存：9</span>
										</p>
									</div>
									<div class="product-btn">
										
										
										<a class="btn btn-blue-rect to-buy ng-scope"
											ng-if="item.remainstock &gt; 0"
											href="https://www.shitou.com/login?from=/activity/integral-mall">立即兑换</a>
										
									</div>
								</div>
							</div></li>
						
						<li ng-repeat="item in physicalList track by $index"
							ng-class="{&#39;nth-child-4n&#39;: ($index &gt; 0) &amp;&amp; (($index + 1)%4 == 0)}"
							class="ng-scope"><div class="product-info">
								<div class="product-content">
									<img class="product-image physical-image"
										ng-src="https://shitouback.shitou.com/integral20170523/xqg_s_1495525359986.png"
										ng-click="showIntegralInfo($index, item.exchangeprizeid, 1, 1, true, true)"
										src="${pageContext.request.contextPath}/statics/shop/img/xqg_s_1495525359986.png">
								</div>
								<div class="product-footer text-center">
									<div class="product-desc">
										<p>
											<i class="icon-font integral-icon"></i><span
												class="price ng-binding">9,200</span> <span
												class="qty ng-binding">库存：10</span>
										</p>
									</div>
									<div class="product-btn">
										
										
										<a class="btn btn-blue-rect to-buy ng-scope"
											ng-if="item.remainstock &gt; 0"
											href="https://www.shitou.com/login?from=/activity/integral-mall">立即兑换</a>
										
									</div>
								</div>
							</div></li>
						
						<li ng-repeat="item in physicalList track by $index"
							ng-class="{&#39;nth-child-4n&#39;: ($index &gt; 0) &amp;&amp; (($index + 1)%4 == 0)}"
							class="ng-scope nth-child-4n"><div class="product-info">
								<div class="product-content">
									<img class="product-image physical-image"
										ng-src="https://shitouback.shitou.com/integral20170523/ptg_s_1495525453186.png"
										ng-click="showIntegralInfo($index, item.exchangeprizeid, 1, 1, true, true)"
										src="${pageContext.request.contextPath}/statics/shop/img/ptg_s_1495525453186.png">
								</div>
								<div class="product-footer text-center">
									<div class="product-desc">
										<p>
											<i class="icon-font integral-icon"></i><span
												class="price ng-binding">9,400</span> <span
												class="qty ng-binding">库存：10</span>
										</p>
									</div>
									<div class="product-btn">
										
										
										<a class="btn btn-blue-rect to-buy ng-scope"
											ng-if="item.remainstock &gt; 0"
											href="https://www.shitou.com/login?from=/activity/integral-mall">立即兑换</a>
										
									</div>
								</div>
							</div></li>
						
						<li ng-repeat="item in physicalList track by $index"
							ng-class="{&#39;nth-child-4n&#39;: ($index &gt; 0) &amp;&amp; (($index + 1)%4 == 0)}"
							class="ng-scope"><div class="product-info">
								<div class="product-content">
									<img class="product-image physical-image"
										ng-src="https://shitouback.shitou.com/integral20170523/xbr_s_1495525545916.png"
										ng-click="showIntegralInfo($index, item.exchangeprizeid, 1, 1, true, true)"
										src="${pageContext.request.contextPath}/statics/shop/img/xbr_s_1495525545916.png">
								</div>
								<div class="product-footer text-center">
									<div class="product-desc">
										<p>
											<i class="icon-font integral-icon"></i><span
												class="price ng-binding">19,200</span> <span
												class="qty ng-binding">库存：9</span>
										</p>
									</div>
									<div class="product-btn">
										
										
										<a class="btn btn-blue-rect to-buy ng-scope"
											ng-if="item.remainstock &gt; 0"
											href="https://www.shitou.com/login?from=/activity/integral-mall">立即兑换</a>
										
									</div>
								</div>
							</div></li>
						
						<li ng-repeat="item in physicalList track by $index"
							ng-class="{&#39;nth-child-4n&#39;: ($index &gt; 0) &amp;&amp; (($index + 1)%4 == 0)}"
							class="ng-scope"><div class="product-info">
								<div class="product-content">
									<img class="product-image physical-image"
										ng-src="https://shitouback.shitou.com/integral20170309/Artboard 7_1489040429739.jpg"
										ng-click="showIntegralInfo($index, item.exchangeprizeid, 1, 1, true, true)"
										src="${pageContext.request.contextPath}/statics/shop/img/Artboard 7_1489040429739.jpg">
								</div>
								<div class="product-footer text-center">
									<div class="product-desc">
										<p>
											<i class="icon-font integral-icon"></i><span
												class="price ng-binding">99,000</span> <span
												class="qty ng-binding">库存：5</span>
										</p>
									</div>
									<div class="product-btn">
										
										
										<a class="btn btn-blue-rect to-buy ng-scope"
											ng-if="item.remainstock &gt; 0"
											href="https://www.shitou.com/login?from=/activity/integral-mall">立即兑换</a>
										
									</div>
								</div>
							</div></li>
						
						<li ng-repeat="item in physicalList track by $index"
							ng-class="{&#39;nth-child-4n&#39;: ($index &gt; 0) &amp;&amp; (($index + 1)%4 == 0)}"
							class="ng-scope"><div class="product-info">
								<div class="product-content">
									<img class="product-image physical-image"
										ng-src="https://shitouback.shitou.com/integral20170309/Artboard 6_1489040443238.jpg"
										ng-click="showIntegralInfo($index, item.exchangeprizeid, 1, 1, true, true)"
										src="${pageContext.request.contextPath}/statics/shop/img/Artboard 6_1489040443238.jpg">
								</div>
								<div class="product-footer text-center">
									<div class="product-desc">
										<p>
											<i class="icon-font integral-icon"></i><span
												class="price ng-binding">150,000</span> <span
												class="qty ng-binding">库存：2</span>
										</p>
									</div>
									<div class="product-btn">
										
										
										<a class="btn btn-blue-rect to-buy ng-scope"
											ng-if="item.remainstock &gt; 0"
											href="https://www.shitou.com/login?from=/activity/integral-mall">立即兑换</a>
										
									</div>
								</div>
							</div></li>
						
						<li ng-repeat="item in physicalList track by $index"
							ng-class="{&#39;nth-child-4n&#39;: ($index &gt; 0) &amp;&amp; (($index + 1)%4 == 0)}"
							class="ng-scope nth-child-4n"><div class="product-info">
								<div class="product-content">
									<img class="product-image physical-image"
										ng-src="https://shitouback.shitou.com/integral20170309/Artboard 5_1489040453651.jpg"
										ng-click="showIntegralInfo($index, item.exchangeprizeid, 1, 1, true, true)"
										src="${pageContext.request.contextPath}/statics/shop/img/Artboard 5_1489040453651.jpg">
								</div>
								<div class="product-footer text-center">
									<div class="product-desc">
										<p>
											<i class="icon-font integral-icon"></i><span
												class="price ng-binding">450,000</span> <span
												class="qty ng-binding">库存：5</span>
										</p>
									</div>
									<div class="product-btn">
										
										
										<a class="btn btn-blue-rect to-buy ng-scope"
											ng-if="item.remainstock &gt; 0"
											href="javascript:void(0);">立即兑换</a>
										
									</div>
								</div>
							</div></li>
						
					</ul>
					<div class="pagination-wrapper">
						<ul class="pagination ly-pagination ng-isolate-scope"
							name="physical" total-records="physicalInfo.total"
							page-size="params.physical.rows"
							ng-show="physicalList.length &gt; 0">
							<li><a href="" aria-label="Previous" ng-click="prev()"><span
									aria-hidden="true" ng-bind-html="trustHtml(prevTextFinal)"
									class="ng-binding">上一页</span></a></li>
							<li ng-show="inTheEnd" class="ng-hide"><a href=""
								ng-click="goto(1)">1</a></li>
							<li ng-show="inTheEnd &amp;&amp; !hidePageTwo" class="ng-hide"><a
								href="" ng-click="goto(2)">2</a></li>
							<li ng-show="inTheEnd" class="ng-hide"><a href="">...</a></li>
							<!-- ngRepeat: p in pages -->
							<li ng-class="{active: currentPage === p}" ng-repeat="p in pages"
								class="ng-scope active"><a href="" ng-click="goto(p)"
								class="ng-binding">1</a></li>
							<!-- end ngRepeat: p in pages -->
							<li ng-class="{active: currentPage === p}" ng-repeat="p in pages"
								class="ng-scope"><a href="" ng-click="goto(p)"
								class="ng-binding">2</a></li>
							<!-- end ngRepeat: p in pages -->
							<li ng-show="outOfRange" class="ng-hide"><a href="">...</a></li>
							<li ng-show="outOfRange" class="ng-hide"><a href=""
								ng-click="goto(totalPages)" class="ng-binding">2</a></li>
							<li><a href="" aria-label="Next" ng-click="next()"><span
									aria-hidden="true" ng-bind-html="trustHtml(nextTextFinal)"
									class="ng-binding">下一页</span></a></li>
						</ul>
					</div>
				</div>
				<div class="no-data-wrapper ng-hide"
					ng-show="physicalList &amp;&amp; physicalList.length == 0">
					<div class="text-center no-data-wrapper">
						<img
							src="${pageContext.request.contextPath}/statics/shop/img/no-data-img-39f18a45bd.png"
							class="no-data-img"> <span class="gray-darker">暂无数据显示</span>
					</div>
				</div>
			</div>
			<%-- <div class="container lottery-banner-wrapper">
				<div class="banner-wrapper">
					<a
						ng-href="/activity/integrals-lottery?lotteryCode=MK2017011000AE000110-1F46-42F8-ADE1-54E4626623ED"
						target="_blank"
						href="https://www.shitou.com/activity/integrals-lottery?lotteryCode=MK2017011000AE000110-1F46-42F8-ADE1-54E4626623ED"><div
							class="top-banner">
							<div class="top-tip top-top">
								<img
									src="${pageContext.request.contextPath}/statics/shop/img/tip-1b3db54a70.png">
							</div>
						</div></a>
				</div>
			</div> --%>
			<br/>
			<div class="modal fade modal-small" id="exchangeInfoModal"
				tabindex="-1" role="dialog">
				<div class="modal-dialog integral-modal"
					ng-show="dialogType != 3 &amp;&amp; dialogType != 4">
					<div class="modal-content integral-info-content">
						<div class="modal-header">
							<a type="button" class="close" data-dismiss="modal"><i
								class="icon-font icon-close"></i></a>
							<h2 class="modal-title text-center">积分兑换</h2>
						</div>
						<div class="modal-body">
							<div class="row exchange-info">
								<div class="col-xs-2 title">商品名称：</div>
								<div class="col-xs-10 content ng-binding"
									ng-bind-html="integralInfo.prizename"></div>
							</div>
							<div class="row exchange-info">
								<div class="col-xs-2 title">商品介绍：</div>
								<div class="col-xs-10 content ng-binding"
									ng-bind-html="integralInfo.prizeproduce"></div>
							</div>
							<div class="row exchange-info">
								<div class="col-xs-2 title">兑换规则：</div>
								<div class="col-xs-10 content ng-binding"
									ng-bind-html="integralInfo.exchangerule"></div>
							</div>
							<div class="row exchange-info">
								<div class="col-xs-2 title">兑换数量：</div>
								<div class="col-xs-10 content">
									<div class="input-group">
										<span class="input-group-btn"><button
												class="btn btn-default sub" type="button"
												ng-class="{&#39;disabled&#39;: integralInfo.isMin || integralInfo.isDisabledExchange}"
												ng-click="changeQty(-1, integralInfo);">
												<span class="icon-minus">-</span>
											</button> </span><input type="text" class="form-control ng-pristine ng-valid"
											ng-model="integralInfo.qty" ng-blur="checkQty(integralInfo)"
											ng-readonly="integralInfo.isDisabledExchange"> <span
											class="input-group-btn"><button
												class="btn btn-default add" type="button"
												ng-class="{&#39;disabled&#39;: integralInfo.isMax || integralInfo.isDisabledExchange}"
												ng-click="changeQty(1, integralInfo);">
												<span class="icon-plus">+</span>
											</button></span>
									</div>
									<div class="add-error-msg red"></div>
								</div>
							</div>
							<div class="row exchange-info consume-info">
								<div class="col-xs-2 title">消耗积分：</div>
								<div class="col-xs-10 content ng-binding">积分</div>
							</div>
							<div class="row exchange-info">
								<div class="col-xs-2 title">当前积分：</div>
								<div class="col-xs-10 content ng-binding">积分</div>
							</div>
							<div class="row exchange-info logistics-info ng-hide"
								ng-show="dialogType == 1">
								<div class="col-xs-2 title">收货地址：</div>
								<div class="col-xs-10 content">
									<p>
										<a href="javascript:void(0);" class="add-address-btn"
											ng-click="showAddressInfo();">新增收货人</a>
									</p>
								</div>
							</div>
							<div class="row exchange-info logistics-info ng-hide"
								ng-show="dialogType == 1">
								<div class="col-xs-12 content address-info-row">
									<!-- ngIf: defaultAddress -->
									<!-- ngIf: addressLits.length > 0 -->
									<p class="toggle-btn-wrapper ng-hide"
										ng-show="addressLits.length &gt; 0">
										<a href="javascript:void(0);" class="toggle-btn"
											ng-click="toggleCollapse()">更多地址<i
											class="icon-font icon-toggle close"
											ng-class="{&#39;close&#39;: collapseClose}"></i></a>
									</p>
								</div>
							</div>
							<div class="row exchange-info">
								<div class="col-xs-2 title"></div>
								<div class="col-xs-10 content red ng-binding"
									ng-bind-html="integralInfo.submit.integral.msg"></div>
							</div>
						</div>
						<div class="modal-footer">
							<a role="button" class="btn btn-orange-rect ng-hide"
								ng-class="{&#39;disabled&#39;: integralInfo.isDisabledExchange}"
								ng-show="activeExchange" ng-click="exchange(0)">确认兑换</a> <a
								role="button" class="btn btn-orange-rect"
								ng-class="{&#39;disabled&#39;: integralInfo.isDisabledExchange}"
								ng-show="!activeExchange" ng-click="exchange(1)">确认兑换</a> <a
								role="button" class="btn btn-gray-hollow" data-dismiss="modal">取消</a>
						</div>
					</div>
				</div>
				<div class="modal-dialog address-modal ng-hide"
					ng-show="dialogType == 3">
					<div class="modal-content">
						<div class="modal-header">
							<a type="button" class="close" data-dismiss="modal"><i
								class="icon-font icon-close"></i></a>
							<h2 class="modal-title text-center">积分兑换</h2>
						</div>
						<div class="modal-body">
							<div class="row exchange-info">
								<div class="col-xs-2 title"></div>
								<div class="col-xs-10 content tip">请填写您的收货地址</div>
							</div>
							<div class="row exchange-info">
								<div class="col-xs-2 title">收货人：</div>
								<div class="col-xs-10 content">
									<input type="text" class="form-control ng-pristine ng-valid"
										ng-model="addressInfo.consignee" maxlength="20">
								</div>
							</div>
							<div class="row exchange-info">
								<div class="col-xs-2 title">手机号：</div>
								<div class="col-xs-10 content">
									<input type="text" class="form-control ng-pristine ng-valid"
										ng-model="addressInfo.phone" maxlength="11">
								</div>
							</div>
							<div class="row exchange-info">
								<div class="col-xs-2 title">所在地区：</div>
								<div class="col-xs-10 content">
									<div class="btn-group">
										<button type="button" class="btn btn-default ng-binding"
											ng-bind-html="addressInfo.provincename ? addressInfo.provincename : &#39;请选择&#39;"
											code="">请选择</button>
										<button type="button" class="btn btn-default dropdown-toggle"
											data-toggle="dropdown" aria-haspopup="true"
											aria-expanded="false">
											<span class="caret"></span> <span class="sr-only">Toggle
												Dropdown</span>
										</button>
										<ul class="dropdown-menu">
											<!-- ngRepeat: item in proviceList track by $index -->
										</ul>
									</div>
									<div class="btn-group">
										<button type="button" class="btn btn-default ng-binding"
											ng-bind-html="addressInfo.cityname ? addressInfo.cityname : &#39;请选择&#39;"
											code="">请选择</button>
										<button type="button"
											class="btn btn-default dropdown-toggle disabled"
											ng-class="{&#39;disabled&#39;: !addressInfo.provincecode}"
											data-toggle="dropdown" aria-haspopup="true"
											aria-expanded="false">
											<span class="caret"></span> <span class="sr-only">Toggle
												Dropdown</span>
										</button>
										<ul class="dropdown-menu">
											<!-- ngRepeat: item in cityList track by $index -->
										</ul>
									</div>
									<div class="btn-group">
										<button type="button" class="btn btn-default ng-binding"
											ng-bind-html="addressInfo.areaname ? addressInfo.areaname : &#39;请选择&#39;"
											code="">请选择</button>
										<button type="button"
											class="btn btn-default dropdown-toggle disabled"
											ng-class="{&#39;disabled&#39;: !addressInfo.citycode}"
											data-toggle="dropdown" aria-haspopup="true"
											aria-expanded="false">
											<span class="caret"></span> <span class="sr-only">Toggle
												Dropdown</span>
										</button>
										<ul class="dropdown-menu">
											<!-- ngRepeat: item in areaList track by $index -->
										</ul>
									</div>
								</div>
							</div>
							<div class="row exchange-info">
								<div class="col-xs-2 title">详细地址：</div>
								<div class="col-xs-10 content">
									<input type="text"
										class="form-control address ng-pristine ng-valid"
										ng-model="addressInfo.address" maxlength="100">
								</div>
							</div>
							<div class="row exchange-info">
								<div class="col-xs-2 title"></div>
								<div class="col-xs-10 content red ng-binding"
									ng-bind-html="integralInfo.submit.address.msg"></div>
							</div>
						</div>
						<div class="modal-footer">
							<a role="button" class="btn btn-blue-rect"
								ng-class="{&#39;disabled&#39;: integralInfo.submit.address.pending}"
								ng-click="editAddressInfo(addressInfo)">保存</a>
						</div>
					</div>
				</div>
				<div class="modal-dialog result-modal ng-hide"
					ng-show="dialogType == 4">
					<div class="modal-content">
						<div class="modal-header">
							<a type="button" class="close" data-dismiss="modal"><i
								class="icon-font icon-close"></i></a>
							<h2 class="modal-title text-center">积分兑换</h2>
						</div>
						<!-- ngIf: exchangeResult -->
						<!-- ngIf: exchangeResult -->
						<!-- ngIf: !exchangeResult -->
						<div class="modal-body ng-scope" ng-if="!exchangeResult">
							<div class="result-error"></div>
							<div class="result-msg text-center ng-binding"
								ng-bind-html="exchangeTips"></div>
							<div class="result-msg result-error-msg text-center ng-binding"
								ng-bind-html="exchangeResultMsg"></div>
							<div class="result-msg result-footer-msg text-center ng-hide"
								ng-show="activeExchange">
								您可以返回项目<a href="javascript:void(0);" class="link-blue"
									ng-click="reExchange(integralInfo,0)">重新购买</a>或<a
									href="javascript:void(0);" class="link-blue"
									data-dismiss="modal">浏览其他项目</a>
							</div>
							<div class="result-msg result-footer-msg text-center"
								ng-show="!activeExchange">
								您可以返回项目<a href="javascript:void(0);" class="link-blue"
									ng-click="reExchange(integralInfo,1)">重新购买</a>或<a
									href="javascript:void(0);" class="link-blue"
									data-dismiss="modal">浏览其他项目</a>
							</div>
						</div>
						<!-- end ngIf: !exchangeResult -->
					</div>
				</div>
			</div>
			<div class="modal fade modal-small" id="productInfoModal"
				tabindex="-1" role="dialog">
				<div class="modal-dialog images-modal">
					<div class="modal-content integral-info-content">
						<div class="modal-header">
							<a type="button" class="close" data-dismiss="modal"><i
								class="icon-font icon-close"></i></a>
							<h2 class="modal-title text-center">商品详情</h2>
						</div>
						<div class="modal-body">
							<div class="row exchange-info images-info text-center">
								<img ng-src="">
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="modal fade msg-modal integral-sign-up" id="signUpModal"
				tabindex="-1">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<a type="button" class="close" data-dismiss="modal"><i
								class="icon-font icon-close"></i></a>
						</div>
						<div class="modal-body text-center">
							<p class="sign-title">
								<b
									ng-bind-html="userSignInfo.isSign ? &#39;您今日已签到&#39; : &#39;签到失败&#39;"
									class="ng-binding">签到失败</b>
							</p>
							<p class="sign-info orange-point ng-hide"
								ng-show="userSignInfo.isSign">
								获得<span ng-bind-html="userSignInfo.achieveIntegral"
									class="ng-binding"></span>积分
							</p>
							<p class="sign-close">
								<span class="orange-point ng-binding"
									ng-bind-html="userSignInfo.timeCount"></span>后自动关闭
							</p>
						</div>
					</div>
				</div>
			</div>
			<div class="pop-form-wrapper ng-scope" ng-controller="PopLoginCtrl">
				<div class="modal fade form-modal" id="login-modal" tabindex="-1">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<a type="button" class="close pop-modal-close"
									ng-click="hideLogin()"><i class="icon-font icon-close"></i></a>
								<h2 class="modal-title">登录</h2>
							</div>
							<div class="modal-body">
								<form class="form-public-login ng-pristine ng-valid"
									ng-submit="login()">
									<div class="form-group error-group">
										<p class="error-msg only ng-binding hide"
											ng-class="{&#39;show&#39;: errorMsgPopShow,&#39;hide&#39;: !errorMsgPopShow}">
											<i class="icon-font icon-icon-circle-tip font-small"></i>
										</p>
									</div>
									<div class="form-group">
										<i class="icon-font icon-wodeshitou icon-input"
											ng-class="{&#39;has-error&#39; : errorNameMsgShow}"></i> <input
											class="form-control ng-pristine ng-valid"
											ng-class="{&#39;has-error&#39; : errorNameMsgShow}"
											ng-model="user.loginName" placeholder="用户名/手机号/邮箱"
											ng-blur="ckNeedVerifyCode()">
									</div>
									<div class="form-group">
										<i class="icon-font icon-lock icon-input"
											ng-class="{&#39;has-error&#39; : errorPasswordMsgShow}"></i>
										<input class="form-control ng-pristine ng-valid"
											ng-class="{&#39;has-error&#39; : errorPasswordMsgShow}"
											type="password" ng-model="user.password" placeholder="请输入密码">
									</div>
									<div class="form-group mb-group ng-hide"
										ng-show="showVerfiyCode">
										<input class="form-control ident-code ng-pristine ng-valid"
											ng-class="{&#39;has-error&#39; : errorVerifycodeMsgShow}"
											ng-model="user.verifyCode" placeholder="请输入验证码"> <img
											ng-src="/api-proxy/v4/verifyCode/get.do?type=2&amp;uid=MjAxNzA5MjgxMzE5MjYwLjYyMzgxODQ3MDc4MTE3NzY="
											class="captcha-img" ng-click="refreshVerifyCode()"
											src="${pageContext.request.contextPath}/statics/shop/img/get.do">
									</div>
									<div class="form-group row mb-group">
										<div class="text-left col-xs-6 remuser">
											<div class="checkbox-type">
												<input id="remuser" type="checkbox" checked="checked"><label
													for="remuser"></label>
											</div>
											<label for="remuser">记住用户名</label>
										</div>
										<div class="text-right col-xs-6 forget-psw">
											<a href="https://www.shitou.com/forget-password">忘记密码?</a>
										</div>
									</div>
									<div class="form-group mb-group">
										<button
											class="btn btn-block btn-orange-rect btn-lg ng-binding"
											ng-disabled=" formInfo.isSubmitting ">登录</button>
									</div>
									<div class="register-link">
										没有账号？<a class="link-blue gotoregister"
											href="javascript:void(0)">注册</a>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="pop-form-wrapper ng-scope"
				ng-controller="PopRegisterCtrl">
				<div class="modal fade form-modal" id="register-modal" tabindex="-1">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<a type="button" class="close pop-modal-close"
									ng-click="hideRegister()"><i class="icon-font icon-close"></i></a>
								<h2 class="modal-title hd-title">注册</h2>
							</div>
							<div class="modal-body">
								<form
									class="form-public-login form-public-register ng-pristine ng-valid"
									ng-submit="register()">
									<div class="form-group"
										ng-class="{&#39;show-msg&#39; : errorPhoneMsgShow}">
										<span class="label">手机号</span> <input
											class="form-control ng-pristine ng-valid" maxlength="11"
											ng-class="{&#39;has-error&#39; : errorPhoneMsgShow}"
											placeholder="作为用户名" type="tel" ng-model="user.tel"
											ng-blur="checkPhone()"> <span
											class="error-msg ng-hide"
											ng-class="{&#39;show&#39; : errorPhoneMsgShow}"
											ng-show="errorPhoneMsgShow"><i
											class="icon-font icon-circle-tip"></i><span
											ng-bind-html="trustHtml(errorPhoneMsg)" class="ng-binding"></span></span>
									</div>
									<div class="form-group"
										ng-class="{&#39;show-msg&#39; : errorCodeMsgShow}">
										<span class="label">图形验证码</span> <input
											class="form-control captcha-input ng-pristine ng-valid"
											maxlength="4"
											ng-class="{&#39;has-error&#39; : errorCodeMsgShow}"
											placeholder="输入验证码" type="tel" ng-model="user.verifyCode"
											ng-blur="checkVerifyCode()"> <img
											ng-src="/api-proxy/v4/verifyCode/get.do?type=1&amp;uid=MjAxNzA5MjgxMzE5MjYwLjYzMTQxMDcwMDgzMTkyMDM="
											class="captcha-img" ng-click="refreshVerifyCode()"
											src="${pageContext.request.contextPath}/statics/shop/js/get(1).do">
										<span class="error-msg ng-binding ng-hide"
											ng-class="{&#39;show&#39; : errorCodeMsgShow}"
											ng-show="errorCodeMsgShow"><i
											class="icon-font icon-circle-tip"></i></span>
									</div>
									<div class="form-group"
										ng-class="{&#39;show-msg&#39; : errorPhoneCodeMsgShow}">
										<span class="label">短信验证码</span>
										<div class="form-control send-code"
											ng-class="{&#39;has-error&#39; : errorPhoneCodeMsgShow}">
											<input class="code-input ng-pristine ng-valid" maxlength="6"
												placeholder="输入短信验证码" type="tel" ng-model="user.phoneCode"
												ng-blur="loseFocus()"> <a
												class="btn btn-send-code ng-binding"
												ng-class="{&#39;disabled&#39;: codeSending}"
												ng-click="sendPhoneCode()" ng-disabled="codeSending">获取验证码</a>
										</div>
										<p
											ng-show="successCodeMsgShow &amp;&amp; !errorPhoneCodeMsgShow"
											ng-class="{&#39;show&#39; : errorPhoneCodeMsgShow}"
											class="gray-disabled send-tip ng-binding ng-hide">
											<i class="icon-font icon-tishi font-small"></i>
										</p>
										<span class="error-msg ng-binding ng-hide"
											ng-class="{&#39;show&#39; : errorPhoneCodeMsgShow}"
											ng-show="errorPhoneCodeMsgShow"><i
											class="icon-font icon-circle-tip"></i></span>
									</div>
									<div class="form-group input-pwd"
										ng-class="{&#39;show-msg&#39; : errorPasswordMsgShow}">
										<span class="label">登录密码</span> <input
											class="form-control input-pwd ng-pristine ng-valid"
											ng-class="{&#39;has-error&#39; : errorPasswordMsgShow}"
											placeholder="建议至少使用6-16位字符组合" type="password"
											ng-model="user.password" ng-change="checkSafety()"> <span
											class="error-msg ng-hide"
											ng-class="{&#39;show&#39; : errorPasswordMsgShow || isSafety}"
											ng-show="errorPasswordMsgShow || isSafety"><span
											ng-show="errorPasswordMsgShow" class="ng-binding ng-hide"><i
												class="icon-font icon-circle-tip"></i></span> <span
											ng-show="isSafety &amp;&amp; safeLevel == 1"
											class="tip-txt ng-hide"><i
												class="safety-tip color-warning"></i><i class="safety-tip"></i><i
												class="safety-tip"></i><span>有被盗风险，建议使用字母、数字和符号组合</span></span> <span
											ng-show="isSafety &amp;&amp; safeLevel == 2"
											class="tip-txt ng-hide"><i
												class="safety-tip color-normal"></i><i
												class="safety-tip color-normal"></i><i class="safety-tip"></i><span>安全强度适中，可使用三种以上的组合提高安全</span></span>
											<span ng-show="isSafety &amp;&amp; safeLevel == 3"
											class="tip-txt ng-hide"><i
												class="safety-tip color-safe"></i><i
												class="safety-tip color-safe"></i><i
												class="safety-tip color-safe"></i><span>您的密码很安全，请牢记</span></span></span>
									</div>
									<span class="recommendTel" ng-click="ctrlReccomend()"><i
										ng-class="{&#39;open-down&#39;:showReccomend}"></i>推荐人手机号（选填）</span>
									<div class="form-group ng-hide" ng-show="showReccomend">
										<span class="label">推荐码</span> <input
											class="form-control ng-pristine ng-valid" maxlength="11"
											placeholder="输入推荐人手机号码,非必选项" type="text"
											ng-model="user.recommend">
									</div>
									<div class="form-group">
										<div class="checkbox-type">
											<input type="checkbox" id="agreement"
												ng-model="formInfo.checked" checked="checked"
												class="ng-pristine ng-valid"><label for="agreement"></label>
										</div>
										<label class="agreement" for="agreement">我已经阅读并同意《<a
											href="https://www.shitou.com/agreement/rgservice"
											class="link-blue">口袋理财网站服务协议</a>》
										</label>
									</div>
									<div class="form-group no-margin-bottom ng-hide"
										ng-show="errorRegMsgShow">
										<p class="error-msg only ng-binding">
											<i class="icon-font icon-tishi font-small"></i>
										</p>
									</div>
									<div class="form-group mb-group">
										<button
											class="btn btn-block btn-orange-rect btn-lg ng-binding">立即注册</button>
									</div>
									<div class="register-link">
										已有账号？<a class="link-blue gotologin" href="javascript:void(0)">登录</a>
									</div>
								</form>
								<div class="modal fade modal-small" id="registerTipModal"
									tabindex="-1" role="dialog">
									<div class="modal-dialog" role="document">
										<div class="modal-content">
											<div class="modal-header">
												<a type="button" class="close" ng-click="hideTip()"><i
													class="icon-font icon-close"></i></a>
												<h2 class="modal-title">提示</h2>
											</div>
											<div class="modal-body text-center">
												<p class="gray-darker ng-binding"></p>
											</div>
											<div class="modal-footer text-right">
												<a role="button" class="btn btn-blue-rect"
													ng-click="hideTip()">确认</a>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<script>var userId=""</script>
		<div class="user-integral-task-wrapper ng-scope"
			ng-controller="UserIntegratorCtrl">
			<div class="how">
				<div class="container exchange-title-wrapper">
					<div class="pull-left header-title">
						<h4 class="title">
							积分任务<span>口袋积分可以通过三种方式获得，分别是新手任务、日常任务、投资任务</span>
						</h4>
					</div>
				</div>
				<div class="container">
					<div class="task-entrace-wrap row">
						<div class="task-tabs pull-left">
							<a ng-class="{&#39;active&#39;: taskPoint == 0}"
								href="javaScript: void(0);" ng-click="getTask(0);"
								class="active" ><i class="newer-icon"></i>新手任务</a> <a
								ng-class="{&#39;active&#39;: taskPoint == 1}"
								href="javaScript: void(0);" ng-click="getTask(1);"><i
								class="origin-icon"></i>日常任务</a> <a
								ng-class="{&#39;active&#39;: taskPoint == 2}"
								href="javaScript: void(0);" ng-click="getTask(2);"><i
								class="invst-icon"></i>投资任务</a>
						</div>
						<div ng-show="loading" class="pull-right task-entraces ng-hide">
							<div class="sk-circle ng-hide" ng-show="loading">
								<div class="sk-circle1 sk-child"></div>
								<div class="sk-circle2 sk-child"></div>
								<div class="sk-circle3 sk-child"></div>
								<div class="sk-circle4 sk-child"></div>
								<div class="sk-circle5 sk-child"></div>
								<div class="sk-circle6 sk-child"></div>
								<div class="sk-circle7 sk-child"></div>
								<div class="sk-circle8 sk-child"></div>
								<div class="sk-circle9 sk-child"></div>
								<div class="sk-circle10 sk-child"></div>
								<div class="sk-circle11 sk-child"></div>
								<div class="sk-circle12 sk-child"></div>
							</div>
						</div>
						<div ng-show="!loading" class="task-entraces pull-right">
							<!-- ngRepeat: task in currentTask track by $index -->
							<div class="col-xs-3 ng-scope"
								ng-repeat="task in currentTask track by $index">
								<p class="ng-binding">注册成功</p>
								<p class="get-integrator">
									<!-- ngIf: !task.score -->
									<!-- ngIf: task.score -->
									<span ng-if="task.score" class="ng-binding ng-scope">+
										100</span>
									<!-- end ngIf: task.score -->
								</p>
								<p>
									<a ng-href="/register" target="_blank" type="button"
										class="btn btn-block btn-orange-rect"
										ng-class="{true: &#39;disabled&#39;, false: &#39;btn-orange-rect&#39;}[task.completed]"
										href="https://www.shitou.com/register"> <!-- ngIf: task.completed -->
										<!-- ngIf: !task.completed --> <span ng-if="!task.completed"
										class="ng-binding ng-scope">去开通</span> <!-- end ngIf: !task.completed -->
									</a>
								</p>
							</div>
							<!-- end ngRepeat: task in currentTask track by $index -->
							<div class="col-xs-3 ng-scope"
								ng-repeat="task in currentTask track by $index">
								<p class="ng-binding">开通银行存管</p>
								<p class="get-integrator">
									<!-- ngIf: !task.score -->
									<!-- ngIf: task.score -->
									<span ng-if="task.score" class="ng-binding ng-scope">+
										200</span>
									<!-- end ngIf: task.score -->
								</p>
								<p>
									<a ng-href="/my-account/basic-info?resetType=4#basic-info-1"
										target="_blank" type="button"
										class="btn btn-block btn-orange-rect"
										ng-class="{true: &#39;disabled&#39;, false: &#39;btn-orange-rect&#39;}[task.completed]"
										href="https://www.shitou.com/my-account/basic-info?resetType=4#basic-info-1">
										<!-- ngIf: task.completed --> <!-- ngIf: !task.completed --> <span
										ng-if="!task.completed" class="ng-binding ng-scope">去开通</span>
										<!-- end ngIf: !task.completed -->
									</a>
								</p>
							</div>
							<!-- end ngRepeat: task in currentTask track by $index -->
							<div class="col-xs-3 ng-scope"
								ng-repeat="task in currentTask track by $index">
								<p class="ng-binding">首次充值成功</p>
								<p class="get-integrator">
									<!-- ngIf: !task.score -->
									<!-- ngIf: task.score -->
									<span ng-if="task.score" class="ng-binding ng-scope">+
										400</span>
									<!-- end ngIf: task.score -->
								</p>
								<p>
									<a ng-href="/my-account/sh-bank/add-funds#assets-management-1"
										target="_blank" type="button"
										class="btn btn-block btn-orange-rect"
										ng-class="{true: &#39;disabled&#39;, false: &#39;btn-orange-rect&#39;}[task.completed]"
										href="https://www.shitou.com/my-account/sh-bank/add-funds#assets-management-1">
										<!-- ngIf: task.completed --> <!-- ngIf: !task.completed --> <span
										ng-if="!task.completed" class="ng-binding ng-scope">去充值</span>
										<!-- end ngIf: !task.completed -->
									</a>
								</p>
							</div>
							<!-- end ngRepeat: task in currentTask track by $index -->
							<div class="col-xs-3 ng-scope"
								ng-repeat="task in currentTask track by $index">
								<p class="ng-binding">首次投资普通标成功</p>
								<p class="get-integrator">
									<!-- ngIf: !task.score -->
									<!-- ngIf: task.score -->
									<span ng-if="task.score" class="ng-binding ng-scope">+
										600</span>
									<!-- end ngIf: task.score -->
								</p>
								<p>
									<a ng-href="/investment-list" target="_blank" type="button"
										class="btn btn-block btn-orange-rect"
										ng-class="{true: &#39;disabled&#39;, false: &#39;btn-orange-rect&#39;}[task.completed]"
										href="https://www.shitou.com/investment-list"> <!-- ngIf: task.completed -->
										<!-- ngIf: !task.completed --> <span ng-if="!task.completed"
										class="ng-binding ng-scope">去投标</span> <!-- end ngIf: !task.completed -->
									</a>
								</p>
							</div>
							<!-- end ngRepeat: task in currentTask track by $index -->
							<div class="col-xs-3 ng-scope"
								ng-repeat="task in currentTask track by $index">
								<p class="ng-binding">首次填写风险评估问卷</p>
								<p class="get-integrator">
									<!-- ngIf: !task.score -->
									<!-- ngIf: task.score -->
									<span ng-if="task.score" class="ng-binding ng-scope">+
										1000</span>
									<!-- end ngIf: task.score -->
								</p>
								<p>
									<a ng-href="/my-account/basic-info?resetType=4#basic-info-1"
										target="_blank" type="button"
										class="btn btn-block btn-orange-rect"
										ng-class="{true: &#39;disabled&#39;, false: &#39;btn-orange-rect&#39;}[task.completed]"
										href="https://www.shitou.com/my-account/basic-info?resetType=4#basic-info-1">
										<!-- ngIf: task.completed --> <!-- ngIf: !task.completed --> <span
										ng-if="!task.completed" class="ng-binding ng-scope">去测评</span>
										<!-- end ngIf: !task.completed -->
									</a>
								</p>
							</div>
							<!-- end ngRepeat: task in currentTask track by $index -->
						</div>
					</div>
				</div>
			</div>\
			<div class="container exchange-title-wrapper">
				<div class="pull-left header-title">
					<h4 class="title">口袋积分介绍</h4>
				</div>
			</div>
			<div class="about container">
				<div class="what first">
					<i class="what-icon"></i>
					<p class="title">口袋积分是什么？</p>
					<p>口袋积分是口袋理财为回馈平台用户推出的一项增值服务。口袋er们可以通过每日签到、投资、邀请好友等获得相应的积分，获得的积分可以用来在口袋理财平台上抽奖、兑换红包、兑换加息券以及兑换不同种类的实物商品等。后续我们也会不断丰富可兑换的虚拟或实物商品类型，努力为广大口袋er们提供更多福利！</p>
				</div>
				<div class="rule">
					<i class="rule-icon"></i>
					<p class="title">口袋积分规则是什么？</p>
					<p class="left-br">积分可以通过新手任务、日常任务和投资任务获得并累积，上不封顶。</p>
					<p class="left-br">积分从获得的时刻记起，有效期为一年。</p>
					<p class="left-br">积分不能提现，仅允许在平台通过兑换虚拟奖励、购买商品、抽奖等方式使用。</p>
				</div>
			</div>
		</div>
	</div>	
	<!-- 主体部分结束 -->
		<script type="text/javascript" src="${pageContext.request.contextPath}/statics/localjs/invest_3.js"></script>
		<%@include file="../common/shop_js.jsp" %>
	<!-- 底部开始 -->
		<%@include file="../common/footer.jsp"%>
	<!-- 底部结束 -->
	
</body>
</html>