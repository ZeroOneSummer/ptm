<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新手宝-信17IQW1期-到期还款-口袋理财</title>
<meta name="keywords" content="口袋理财,移动理财,理财超市,互联网金融,银行理财,信托理财">
<meta name="description"
	content="口袋理财——报喜鸟上市系投资的移动理财平台，是上海十强互联网金融公司、上海金融信息行业协会副会长单位。口袋理财专注于小额分散的投资理财，多元化的投资理财产品，严格风控，灵活安全。">
<meta name="baidu-site-verification" content="W0p7tymOhp">
<meta name="baidu_union_verify"
	content="ac175d4c07bcca63a8a2f76d7023d69d">

<%@include file="../common/js.jsp"%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/statics/css/layer.css"
	id="layui_layer_cssskinlayercss">
<script
	src="${pageContext.request.contextPath}/statics/js/raphael.min.js"></script>
<script src="${pageContext.request.contextPath}/statics/js/circle.js"></script>
<script src="${pageContext.request.contextPath}/statics/js/layer.js"></script>
<script src="${pageContext.request.contextPath}/statics/js/base64.js"></script>

</head>
<body style="background: #F7F7F7;">
	<div class="kdlc_pc_wrap">
		<!-- 头部开始 -->
		<%@include file="../common/header.jsp"%>
		<!-- 头部结束 -->
		<!-- 主体部分开始 -->
		<div class="container">
			<div class="content">
				<div class="site-map clearfix">
					<ul>
						<li><a href="https://www.koudailc.com/site/index">首页</a></li>
						<li>&gt;</li>
						<li><a href="https://www.koudailc.com/list/list?channelId=4">到期还款</a></li>
						<li>&gt;</li>
						<li class="on"><a
							href="${pageContext.request.contextPath}/statics/img/新手宝-信17IQW1期-到期还款-口袋理财.html">新手宝-信17IQW1期</a></li>
					</ul>
				</div>
			</div>
			<div class="evt-mod">
				<div class="list-floor">
					<h3 class="mb30">
						<span>${product_list.produceName}</span> <i class="showtip showtip1" id="jsx">即生息</i>
						<i class="showtip showtip2" id="sjk">三剑客</i> <i
							class="showtip showtip3" id="novice">新手专享</i> <i
							class="showtip showtip4" id="voucher">口袋券</i> <i
							class="showtip showtip6" id="pttx">贴息</i>
						<div class="db tips"></div>
					</h3>
					<div class="kdb-detail">
						<div class="kdb-meta font14 color1 clearfix">
							<div class="f_left meta1">
								<h5>平均历史年化收益率</h5>
								<p>
									<span class="proj-apr">${product_list.invest_type.annualYield*100}<i>%</i></span>
								</p>
							</div>
							<div class="f_left meta2">
								<h5>投资人数（人）</h5>
								<p>${product_list.investor}</p>
							</div>
							<div class="f_left meta3 clearfix">
								<div class="round-progress f_left">
									<svg height="66" version="1.1" width="66"
										xmlns="http://www.w3.org/2000/svg"
										style="overflow: hidden; position: relative;">
									<desc style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">Created
									with Raphaël 2.1.2</desc>
									<defs style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></defs>
									<path fill="none" stroke="#f0f0f0"
										d="M33,7A26,26,0,1,1,32.99,7" stroke-width="5"
										style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path>
									<path fill="none" stroke="#ff5b07"
										d="M33,7A26,26,0,1,1,15.201775245854094,51.9531843129567"
										stroke-width="5"
										style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path></svg>
									<span>${100-product_list.residueAmount*100/product_list.totalAmount}%</span>
								</div>
								<p>本期总额：${product_list.totalAmount}元</p>
								<p>剩余可投：${product_list.residueAmount}元</p>
							</div>
						</div>
						<p class="font16 _999">
							<strong class="_inline_block _333">新手专属</strong>仅限新用户购买,专属高额贴息产品
						</p>
						<p class="font16 _999">
							<strong class="_inline_block _333">超低门槛</strong>最低1000元即可投资
						</p>
						<p class="font16 _999">
							<strong class="_inline_block _333">安全保障</strong>债权合作方连带责任担保
						</p>
						<div class="invest-rightnow">
							<div class="input-area">
								<div class="checkbox clearfix">
									<span>剩余金额</span><i></i>投入全部 <span class="readonly">0.00</span>元
								</div>
								<div class="clearfix">
									<label>投资金额</label><input type="text" placeholder="10,000"
										class="user_invest_money"><label>元</label>
								</div>
								<div class="clearfix">
									<label>投资期限</label><input type="text" placeholder="365"
										value="${product_list.invest_type.deadline}天" readonly="readonly">
								</div>
								<div class="clearfix">
									<label style="width: 56px;">口袋券</label> <input type="text"
										readonly="readonly" class="selec" href="javascript:void(0);"
										style="color: rgb(153, 153, 153);">请选择优惠券</input>
									<ul class="kdq" style=""></ul>
									<div class="triangle-down"></div>
								</div>
							</div>
							<!-- 判断是否为可投状态，(1:未发布2:可投3:已投满)不可投 “投资”按钮禁用-->
							<c:if test="${product_list.invStatus == 2}">
								<button class="db bg_fd5353 invest_sure">立即投资</button>
								<!-- 隐藏域存用户session -->
								<input type="hidden" value="${user}" id="user_session"/>
							</c:if>
							<c:if test="${product_list.invStatus != 2}">
								<button class="db bg_fd5353 invest_sure" disabled="disabled" style="background-color: rgba(0,0,0,0.2);">立即投资</button>								
							</c:if>
						</div>
					</div>
					<div class="invest-new-info">
						<table width="100%" border="0" cellpadding="0" cellspacing="0">
							<tbody>
								<tr>
									<th>产品类型</th>
									<td>优质信用担保</td>
									<th>起投金额</th>
									<td>${product_list.invest_type.purchaseMoney}元起投</td>
								</tr>
								<tr>
									<th>投资期限</th>
									<td>${product_list.invest_type.deadline}天</td>
									<th>投资收益</th>
									<td><span class="proj-apr">${product_list.invest_type.annualYield*100}<i>%</i></span></td>
								</tr>
								<tr>
									<th>追加金额</th>
									<td>1,000的整数倍</td>
									<th>单笔限购</th>
									<td>30,000元</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="assure">
						<img
							src="${pageContext.request.contextPath}/statics/img/assure.png"
							alt="" width="937" height="141">
					</div>
				</div>
				<div class="list-floor invest-detail-honor clearfix list_pad_detail">
					<div class="pro-table invest-detail f_left">
						<h3 class="mb15">
							<span>投资明细</span>
						</h3>
						<div class="table-detail">
							<table width="100%" border="0" cellpadding="0" cellspacing="0">
								<tbody>
									<tr>
										<td width="40%">2017年9月13日&nbsp;20:30:31</td>
										<td width="20%">135****2114</td>
										<td width="20%">￥4000</td>
										<td width="20%">申购中</td>
									</tr>
									<tr>
										<td width="40%">2017年9月13日&nbsp;20:11:30</td>
										<td width="20%">138****0529</td>
										<td width="20%">￥30000</td>
										<td width="20%">申购中</td>
									</tr>
									<tr>
										<td width="40%">2017年9月13日&nbsp;18:31:49</td>
										<td width="20%">138****1500</td>
										<td width="20%">￥1000</td>
										<td width="20%">申购中</td>
									</tr>
									<tr>
										<td width="40%">2017年9月13日&nbsp;17:30:10</td>
										<td width="20%">139****6609</td>
										<td width="20%">￥5000</td>
										<td width="20%">申购中</td>
									</tr>
									<tr>
										<td width="40%">2017年9月13日&nbsp;16:20:56</td>
										<td width="20%">180****5102</td>
										<td width="20%">￥6000</td>
										<td width="20%">申购中</td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="page_ul">
							<ul class="pagination">
								<li class="prev disabled"><span>«</span></li>
								<li class="active"><a href="javascript:getInvestList('1')"
									data-page="0">1</a></li>
								<li><a href="javascript:getInvestList('2')" data-page="1">2</a></li>
								<li><a href="javascript:getInvestList('3')" data-page="2">3</a></li>
								<li><a href="javascript:getInvestList('4')" data-page="3">4</a></li>
								<li><a href="javascript:getInvestList('5')" data-page="4">5</a></li>
								<li class="next"><a href="javascript:getInvestList('2')"
									data-page="1">»</a></li>
							</ul>
						</div>
						<div class="clearfix"></div>
					</div>
					<div class="invest-honor f_left koudai_sjk">
						<h3 class="mb15">
							<span>投资成就</span>
						</h3>
						<ul>
							<li class="first">
								<p>
									<span>拔得头筹 </span><span>2017-09-12 18:06:06</span>
								</p>
								<p>
									<span>151****2378</span><span>将获得10元奖励</span>
								</p>
							</li>
							<li class="second">
								<p>
									<span>有钱任性 </span><span>2017-09-12 18:31:48</span>
								</p>
								<p>
									<span>158****3437</span><span>单笔投资30000元，暂居榜首</span>
								</p>
							</li>
							<li class="third">
								<p>
									<span>临门一脚 </span><span></span>
								</p>
								<p>虚位以待，达人们赶紧投资啊</p>
							</li>
						</ul>
					</div>
				</div>
				<h3
					style="white-space: normal; position: relative; font-size: 24px; padding: 5px 0px; border-bottom: 1px solid rgb(229, 229, 229); margin-bottom: 15px;">
					<span
						style="padding: 5px 0px; border-bottom: 1px solid rgb(255, 151, 38);">项目详情</span>
				</h3>
				<p style="white-space: normal;">
					<span
						style="color: rgb(102, 102, 102); font-size: 18px; line-height: 34px;"></span>
				</p>
				<p style="white-space: normal;">
					<span
						style="color: rgb(102, 102, 102); font-size: 18px; line-height: 34px;"></span>
				</p>
				<p style="white-space: normal; line-height: 1.5em;">
					<span
						style="color: rgb(102, 102, 102); font-size: 18px; line-height: 34px;"></span>
				</p>
				<p style="white-space: normal;">
					<span
						style="color: rgb(102, 102, 102); font-size: 18px; line-height: 34px;"></span>
				</p>
				<p
					style="margin-bottom: 8px; white-space: normal; text-indent: 28px; line-height: 32px;">
					<span
						style="color: rgb(102, 102, 102); font-size: 18px; line-height: 34px;">本项目原始债权主要为通过平台合作机构推荐的借款项目，注重流动性及安全性，其中包含一定比例的<a
						href="https://h5.koudailc.com/page/project-page/index.html?anchor=two"
						target="_blank" style="color: rgb(102, 102, 102);">消费分期贷</a>、<a
						href="https://h5.koudailc.com/page/project-page/index.html?anchor=one"
						target="_blank" style="color: rgb(102, 102, 102);">小额生活类信贷</a>。
					</span>
				</p>
				<p style="white-space: normal;">
					<span
						style="color: rgb(102, 102, 102); font-size: 18px; line-height: 34px;">&nbsp;
						用户持有本项目期间本项目原始债权出现到期、提前到期情形的，相对应的用户投资金额将通过平台系统自动匹配至新的借款项目中。本项目实时债权情况用户可通过项目页面进行了解、查询。<br>&nbsp;&nbsp;本项目期限届满，部分或全部原始债权尚未到期的，用户所持有的债权份额将通过平台债权转让系统转让于平台其他投资用户。转让成功用户即退出本项目。
					</span>
				</p>
				<p
					style="margin-bottom: 8px; white-space: normal; text-indent: 28px; line-height: 32px;">
					<br>
				</p>
				<p style="white-space: normal; font-size: 14px; line-height: 1.5em;">
					<span
						style="color: rgb(102, 102, 102); font-size: 18px; line-height: 34px;"></span>
				</p>
				<h3
					style="white-space: normal; position: relative; font-size: 24px; padding: 5px 0px; border-bottom: 1px solid rgb(229, 229, 229); margin-bottom: 15px;">
					<span
						style="padding: 5px 0px; border-bottom: 1px solid rgb(255, 151, 38);">安全保障措施</span>
				</h3>
				<p style="white-space: normal; font-size: 14px; line-height: 1.5em;">
					<span
						style="color: rgb(102, 102, 102); font-size: 18px; line-height: 34px;"></span>
				</p>
				<p style="white-space: normal;">
					<span
						style="color: rgb(102, 102, 102); font-size: 18px; line-height: 34px;"></span>
				</p>
				<p style="white-space: normal;">
					<span
						style="color: rgb(102, 102, 102); font-size: 18px; line-height: 34px;">本平台作为网络借贷信息中介机构进行信息发布，不对用户的任何交易提供任何担保，包括但不限于明示、默示或法定的担保。主要可能存在以下几方面风险。</span>
				</p>
				<p style="white-space: normal;">
					<br>
				</p>
				<p style="white-space: normal;">
					<span
						style="color: rgb(102, 102, 102); font-size: 18px; line-height: 34px;">1.政策风险：因国家宏观政策和所处行业或区域的法律法规发生变化，可能影响平台系统实时匹配交易。本平台仅能在法律法规允许的范围内减少您的风险，由此带来的不便应由用户承担。</span>
				</p>
				<p style="white-space: normal;">
					<span
						style="color: rgb(102, 102, 102); font-size: 18px; line-height: 34px;">2.信息风险：本平台将按协议约定进行信息披露，用户应充分关注并及时主动查询项目相关信息，并依其做出独立判断和决策，同时承担可能的投资风险。如未及时查询，或由于通讯故障、系统故障以及其他不可抗力等因素的影响使得无法及时了解产品信息，由此产生的责任和风险应由用户承担。</span>
				</p>
				<p style="white-space: normal;">
					<span
						style="color: rgb(102, 102, 102); font-size: 18px; line-height: 34px;">3.不可抗力及意外事件风险：包括但不限于自然灾害、金融市场危机、战争、黑客攻击、病毒感染等不能预见、不能避免、不能克服的不可抗力事件，由此导致的任何损失，用户须自行承担。</span>
				</p>
				<p style="white-space: normal;">
					<span
						style="color: rgb(102, 102, 102); font-size: 18px; line-height: 34px;">4.退出风险：用户提前退出或到期退出的申请经口袋理财确认后方可进行，经确认后用户持有的投资项目将以债权转让方式通过口袋理财平台进行转让。口袋理财不对债权转让完成的时间以及债权转让能否全部成功实现做出任何承诺，用户因债权转让申请未成功完成将面临资金不能变现、丧失其他投资机会的风险。</span>
				</p>
				<p style="white-space: normal;">
					<span
						style="color: rgb(102, 102, 102); font-size: 18px; line-height: 34px;">特别提示：上述风险提示不能穷尽全部风险及市场的全部情形</span>
				</p>
			</div>
		</div>
		<!-- 主体部分结束 -->
		<script type="text/javascript"
			src="${pageContext.request.contextPath}/statics/localjs/invest_3.js"></script>
		<!-- 底部开始 -->
		<%@include file="../common/footer.jsp"%>
		<!-- 底部结束 -->
	</div>
</body>
</html>