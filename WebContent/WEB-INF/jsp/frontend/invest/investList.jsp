<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>投资频道-口袋理财</title>
<meta name="keywords" content="口袋理财,移动理财,理财超市,互联网金融,银行理财,信托理财">
<meta name="description"
	content="口袋理财——报喜鸟上市系投资的移动理财平台，是上海十强互联网金融公司、上海金融信息行业协会副会长单位。口袋理财专注于小额分散的投资理财，多元化的投资理财产品，严格风控，灵活安全。">
<meta name="baidu-site-verification" content="W0p7tymOhp">
<meta name="baidu_union_verify"
	content="ac175d4c07bcca63a8a2f76d7023d69d">

<%@include file="../common/js.jsp"%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/statics/css/colorbox.css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/statics/js/jquery.colorbox.js"></script>

</head>
<body style="background: #F7F7F7;">
	<div class="kdlc_pc_wrap">
		<!-- 头部开始 -->
		<%@include file="../common/header.jsp"%>
		<!-- 头部结束 -->
		<!-- 主体部分开始 -->
		<div class="container">
			<div class="banner"
				style="background-image: url(${pageContext.request.contextPath}/statics/img/channel_4.jpg); background-color: rgb(193, 151, 93);"></div>
			<div class="content">
				<div class="site-map clearfix">
					<ul>
						<li><a
							href="${pageContext.request.contextPath}/firstPage.jsp">首页</a></li>
						<li>&gt;</li>
						<li class="on"><a href="javascript:void(0);"
							style="color: rgb(251, 83, 83);">产品页面</a></li>
					</ul>
				</div>
			</div>
			<div class="evt-mod">
				<div class="list-floor">
					<h3>
						<span>产品列表</span>
					</h3>
					<div class="pro-list _hidden" id="pro-list">
						<div class="pro-status">
							<ul class="clearfix">
								<li class="font16 _999">项目状态</li>
								<li class="on _333" onclick="Searcher(&quot;status&quot;,0)">
									<a>全部</a>
								</li>
								<li class="_333" onclick="Searcher(&quot;status&quot;,3)">
									<a>投资中</a>
								</li>
								<li class="_333" onclick="Searcher(&quot;status&quot;,5)">
									<a>投资结束</a>
								</li>
								<li class="_333" onclick="Searcher(&quot;status&quot;,7)">
									<a>计息中</a>
								</li>
								<li class="_333" onclick="Searcher(&quot;status&quot;,8)">
									<a>已完结</a>
								</li>
							</ul>
						</div>
						<div class="pro-period">
							<ul class="clearfix">
								<li class="font16 _999">项目期限</li>
								<li class="on _333" onclick="Searcher(&quot;period&quot;,0)">
									<a>全部</a>
								</li>
								<li class="_333" onclick="Searcher(&quot;period&quot;,1)">
									<a>1个月以内</a>
								</li>
								<li class="_333" onclick="Searcher(&quot;period&quot;,2)">
									<a>1-3个月</a>
								</li>
								<li class="_333" onclick="Searcher(&quot;period&quot;,3)">
									<a>3-6个月</a>
								</li>
								<li class="_333" onclick="Searcher(&quot;period&quot;,4)">
									<a>6-12个月</a>
								</li>
								<li class="_333" onclick="Searcher(&quot;period&quot;,5)">
									<a>1年以上</a>
								</li>
							</ul>
						</div>
						<div class="pro-apr">
							<ul class="clearfix">
								<li class="font16 _999">项目利率</li>
								<li class="on _333" onclick="Searcher(&quot;apr&quot;,0)"><a>全部</a></li>
								<li class="_333" onclick="Searcher(&quot;apr&quot;,1)"><a>8%以下</a></li>
								<li class="_333" onclick="Searcher(&quot;apr&quot;,2)"><a>8%-10%</a></li>
								<li class="_333" onclick="Searcher(&quot;apr&quot;,3)"><a>10%-12%</a></li>
								<li class="_333" onclick="Searcher(&quot;apr&quot;,4)"><a>12%以上</a></li>
								<li class="_333" onclick="Searcher(&quot;apr&quot;,5)"><a>浮动利率</a></li>
							</ul>
						</div>
					</div>
					<div class="pro-table">
						<table width="100%" border="0" cellpadding="0" cellspacing="0">
							<thead>
								<tr>
									<th>产品名称</th>
									<th>平均历史年化收益率</th>
									<th>起购金额（元）</th>
									<th>期限</th>
									<th>投资人数 （人）</th>
									<th>订购产品</th>
								</tr>
							</thead>
							<tbody id="pc_list_data">
								<c:forEach items="${product_list}" var="invest_product">
									<!-- 过滤掉未发布的产品invStatus=1的 -->
									<c:if test="${invest_product.invStatus != 1 }">
										<tr>
											<td class="firstchild"><span class="pan"> <a
													href="product?id=${invest_product.id}">${invest_product.produceName}</a></span></td>
											<td><span class="proj-apr">${invest_product.invest_type.annualYield*100}<i>%</i></span></td>
											<td>${invest_product.invest_type.purchaseMoney}</td>
											<td>${invest_product.invest_type.deadline}天</td>
											<td>${invest_product.investor}</td>
											
											<c:if test="${invest_product.invStatus == 2 }">
												<td class="lastchild"><a href="product?id=${invest_product.id}">立即投资</a></td>
											</c:if>
											<c:if test="${invest_product.invStatus == 3 }">
												<td class="lastchild"><a href="product?id=${invest_product.id}">查看详情</a></td>
											</c:if>
										</tr>
									</c:if>
								</c:forEach>																												
							</tbody>
						</table>
					</div>
					
					<div id="paging">
						<ul class="pagination">
							<li class="prev disabled"><span>«</span></li>
							<li class="active"><a href="javascript:getPaging('1')"
								data-page="0">1</a></li>
							<li><a href="javascript:getPaging('2')" data-page="1">2</a></li>
							<li><a href="javascript:getPaging('3')" data-page="2">3</a></li>
							<li><a href="javascript:getPaging('4')" data-page="3">4</a></li>
							<li><a href="javascript:getPaging('5')" data-page="4">5</a></li>
							<li><a href="javascript:getPaging('6')" data-page="5">6</a></li>
							<li><a href="javascript:getPaging('7')" data-page="6">7</a></li>
							<li><a href="javascript:getPaging('8')" data-page="7">8</a></li>
							<li><a href="javascript:getPaging('9')" data-page="8">9</a></li>
							<li><a href="javascript:getPaging('10')" data-page="9">10</a></li>
							<li class="next"><a href="javascript:getPaging('2')"
								data-page="1">»</a></li>
						</ul>
					</div>
					
					<div class="clearfix"></div>
				</div>
				<div class="list-floor floor3 clearfix">
					<div class="f_left floor3-evt1 mb30">
						<h3>
							<span>精品推荐</span>
						</h3>
						<ul class="kdb-intro">
							<c:forEach items="${product_list}" var="invest_product" varStatus="status">
								<!-- 过滤掉未发布的产品invStatus=1的,展示6条数据 -->
								<c:if test="${invest_product.invStatus!=1 and status.index<6}">
									<li>
										<h4 class="_333 h4">
											<a href="product?id=${invest_product.id}" target="_blank">${invest_product.produceName}</a>
										</h4> <span class="bordered">优质担保</span>
										<p class="aaa rate fd5353">
											<span class="proj-apr">${invest_product.invest_type.annualYield*100}<i>%</i></span>
										</p>
										<p class="_333 font14">
											${invest_product.invest_type.purchaseMoney}元起投<span>${invest_product.invest_type.deadline}天</span>
										</p>
										
										<c:if test="${invest_product.invStatus == 2 }">
											<button class="db bg_button2 btn_fd5353 color4 a_center"
												onclick="window.location.href='product?id=${invest_product.id}'">立即投资</button>												
										</c:if>
										<c:if test="${invest_product.invStatus == 3 }">
											<button class="db bg_button2 btn_fd5353 color4 a_center"
												onclick="window.location.href='product?id=${invest_product.id}'">查看详情</button>												
										</c:if>										
									</li>
								</c:if>
							</c:forEach>								
						</ul>
					</div>
					<div class="f_left floor3-evt2 mb30">
						<h3>
							<span>口袋资讯</span>
						</h3>
						<ul>
							<li class="clearfix">
								<div class="news-image f_left">
									<img
										src="${pageContext.request.contextPath}/statics/img/1505125087178656.jpg"
										alt="" width="92" height="62">
								</div>
								<div class="news-info f_left">
									<h4 class="font16 _333">
										<a href="../infoCenter/Meiti.jsp">口袋理财为青年圆梦，助力英雄再缔传奇</a>
									</h4>
									<p class="font14 _666">
										9月6日，由上海有人公益基金会、口袋理财...<span class="db _999">2017-09-11</span>
									</p>
								</div>
							</li>
							<li class="clearfix">
								<div class="news-image f_left">
									<img
										src="${pageContext.request.contextPath}/statics/img/1500285298550248.jpg"
										alt="" width="92" height="62">
								</div>
								<div class="news-info f_left">
									<h4 class="font16 _333">
										<a href="../infoCenter/Meiti.jsp">“共话前沿金融科技”口袋理财受邀出席2017朗迪金融科技峰会</a>
									</h4>
									<p class="font14 _666">
										7月15日至16日，全球金融科技领域最受...<span class="db _999">2017-07-17</span>
									</p>
								</div>
							</li>
							<li class="clearfix">
								<div class="news-image f_left">
									<img
										src="${pageContext.request.contextPath}/statics/img/1499243640374593.png"
										alt="" width="92" height="62">
								</div>
								<div class="news-info f_left">
									<h4 class="font16 _333">
										<a href="../infoCenter/Meiti.jsp">“数字经济，无限未来”，口袋理财携“海清”亮相上海国际信息消费博览会</a>
									</h4>
									<p class="font14 _666">
										6月28日-30日，2017上海国际信息...<span class="db _999">2017-07-05</span>
									</p>
								</div>
							</li>
						</ul>
					</div>
					<div class="f_left floor3-evt4 mb30">
						<h3>
							<span>常见问题</span>
							<!-- <a href="#">更多</a> -->
						</h3>
						<ul class="font16 _666">
							<li><a href="../helpCenter/packageProject.jsp">提现多久能够到账？</a></li>
							<li><a href="../helpCenter/packageProject.jsp">提现需要手续费吗？</a></li>
							<li><a href="../helpCenter/moneyInfo.jsp">什么是转让专区？</a></li>
							<li><a href="../helpCenter/productDesc.jsp">关于“即生息”服务说明</a></li>
							<li><a href="../helpCenter/productDesc.jsp">口袋券一次能用多张吗？</a></li>
							<li><a href="../helpCenter/security.jsp">绑定银行卡规则说明</a></li>
						</ul>
					</div>
				</div>
				<div class="list-floor floor4">
					<h3>
						<span>风险措施</span>
					</h3>
					<ul class="clearfix">
						<li class="rel _hidden"><a href="javascript:;"
							class="relGroup db"><img
								src="${pageContext.request.contextPath}/statics/img/rel-group1.png"
								width="188" height="144"></a>
							<div class="relInfo dn">
								<a
									href="https://www.koudailc.com/site/announcement-detail?id=346"
									target="_blank">口袋理财注册用户在平台充值、提现、投资、还款四个环节中，若出现资金损失，将由阳光财产保险股份有限公司按合同条款承保赔付。</a>
							</div></li>
						<li class="rel _hidden"><a href="javascript:;"
							class="relGroup db"><img
								src="${pageContext.request.contextPath}/statics/img/rel-group2.png"
								width="188" height="144"></a>
							<div class="relInfo dn">
								<a href="${pageContext.request.contextPath}/statics/img/11.png"
									title="联动优势电子商务有限公司 支付业务许可证（副本）" class="group1 cboxElement">口袋理财所有投资者资金均交由第三方支付平台监管，由第三方支付平台与银行进行交易；口袋理财不直接接触用户资金，保障用户资金安全。</a>
								<a href="${pageContext.request.contextPath}/statics/img/12.jpg"
									title="连连银通电子支付有限公司 支付业务许可证" class="group1 cboxElement"
									style="display: none;">查看支付许可证</a> <a
									href="${pageContext.request.contextPath}/statics/img/13.jpg"
									title="国付宝信息科技有限公司 支付业务许可证" class="group1 cboxElement"
									style="display: none;">查看支付许可证</a>
							</div></li>
						<li class="rel"><a href="javascript:;" class="relGroup db"><img
								src="${pageContext.request.contextPath}/statics/img/rel-group4.png"
								width="188" height="144"></a>
							<div class="relInfo dn">
								<a href="${pageContext.request.contextPath}/statics/img/31.jpg"
									title="上海国科 律师事务所执业许可证" class="db group3 fd5353 cboxElement">法律顾问评估所有融资项目，确保平台产品合法合规，对平台服务提供法律意见，使平台所有业务均有法可依，保障了投资人的合法权益。</a>
								<a href="${pageContext.request.contextPath}/statics/img/32.jpg"
									title="聘请法律顾问合同" class="group3 cboxElement"
									style="display: none;">查看合作合同</a> <a
									href="${pageContext.request.contextPath}/statics/img/33.jpg"
									title="聘请法律顾问合同" class="group3 cboxElement"
									style="display: none;">查看合作合同</a>
							</div></li>
						<li class="rel _hidden"><a href="javascript:;"
							class="relGroup db"><img
								src="${pageContext.request.contextPath}/statics/img/rel-group5.png"
								width="188" height="144"></a>
							<div class="relInfo dn">
								<a href="${pageContext.request.contextPath}/statics/img/41.png"
									title="宿迁市宿城区民鑫农村小额贷款有限公司 营业执照" class="group4 cboxElement">口袋理财所有投资项目均由第三方担保公司担保，所有借款人均提供足值动产抵押、质押以此最大程度得保障口袋理财投资者的权益。</a>
							</div></li>
					</ul>
				</div>
			</div>
		</div>
		<!-- 主体部分结束 -->
		<script type="text/javascript"
			src="${pageContext.request.contextPath}/statics/localcss/invest_2.js"></script>
		<!-- 底部开始 -->
		<%@include file="../common/footer.jsp"%>
		<!-- 底部结束 -->
	</div>

	<div id="cboxOverlay" style="display: none;"></div>
	<div id="colorbox" class="" role="dialog" tabindex="-1"
		style="display: none;">
		<div id="cboxWrapper">
			<div>
				<div id="cboxTopLeft" style="float: left;"></div>
				<div id="cboxTopCenter" style="float: left;"></div>
				<div id="cboxTopRight" style="float: left;"></div>
			</div>
			<div style="clear: left;">
				<div id="cboxMiddleLeft" style="float: left;"></div>
				<div id="cboxContent" style="float: left;">
					<div id="cboxTitle" style="float: left;"></div>
					<div id="cboxCurrent" style="float: left;"></div>
					<button type="button" id="cboxPrevious"></button>
					<button type="button" id="cboxNext"></button>
					<button id="cboxSlideshow"></button>
					<div id="cboxLoadingOverlay" style="float: left;"></div>
					<div id="cboxLoadingGraphic" style="float: left;"></div>
				</div>
				<div id="cboxMiddleRight" style="float: left;"></div>
			</div>
			<div style="clear: left;">
				<div id="cboxBottomLeft" style="float: left;"></div>
				<div id="cboxBottomCenter" style="float: left;"></div>
				<div id="cboxBottomRight" style="float: left;"></div>
			</div>
		</div>
		<div
			style="position: absolute; width: 9999px; visibility: hidden; display: none; max-width: none;"></div>
	</div>
</body>
</html>