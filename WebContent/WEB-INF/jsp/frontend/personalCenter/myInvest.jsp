<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en" class=" ieundefined">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="format-detection" content="telephone=no">
<title>我的投资-口袋理财</title>
<meta name="keywords" content="口袋理财,移动理财,理财超市,互联网金融,银行理财,信托理财">
<meta name="description"
	content="口袋理财——报喜鸟上市系投资的移动理财平台，是上海十强互联网金融公司、上海金融信息行业协会副会长单位。口袋理财专注于小额分散的投资理财，多元化的投资理财产品，严格风控，灵活安全。">
<meta name="baidu-site-verification" content="W0p7tymOhp">
<meta name="baidu_union_verify"
	content="ac175d4c07bcca63a8a2f76d7023d69d">

<%@include file="../common/js.jsp"%>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/statics/css/object.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/statics/css/mask.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/statics/css/web.css">

<script src="${pageContext.request.contextPath }/statics/js/mask.js"></script>
<script src="${pageContext.request.contextPath }/statics/js/jscharts.js"></script>


</head>
<body style="background: #F7F7F7;">
	<div class="kdlc_pc_wrap">
		<!-- 头部开始 -->
		<%@include file="../common/header.jsp"%>
		<!-- 头部结束 -->
		<!-- 主体部分开始  我的投资 -->
		<div class="container">
			<div class="my_pocket_wrap">
				<div class="content">
					<div class="my_pocket_header">
						<span class="f_14_35 _333 f_left">Hi，<i id="login">${user.loginName }</i>用户，为理想和财富开始活力的一天吧！
							<script type="text/javascript">
								var name = $("#login").html();
								var cname = name.substring(0, 3) + "****"
										+ name.substring(7);
								$("#login").html(cname);
							</script></span>
						<div class="f_right">
							<a href="recharge.html"> <span
								class="btn_fd5353 f_14_35 fff a_center">充值</span>
							</a> <a href="withdrawDeposit.html"> <span
								class="btn_fd5353 bg_fff f_14_35 fd5353 a_center">提现</span>
							</a>
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
								<span class="fl f_20_50">绑卡才能提现哦！请先绑定银行卡</span><span class="fr"><a
									onclick="closeConfirm();">X</a></span> <img
									src="${pageContext.request.contextPath }/statics/img/gl_phone.png"
									id="img1">
							</div>
						</div>
						<div id="fullbg"></div>
						<script
							src="${pageContext.request.contextPath }/statics/js/mask.js"></script>
						<div class="my_pocket_content">
							<div id="column" name="column">
								<ul>
									<li class="a_center bg_fd5353_img li_border" invest_value="0">
										<div style="height: 144px;">
											<span class="f_20_22 _999 fff">昨日收益（元）</span><br> <span
												class="f_36_38 _333 fff">0</span><br> <span
												class="f_14_16 _333 fff">累计收益&nbsp;&nbsp;0</span>
										</div>
									</li>
								<c:if test="user_property == null and noFinishWithdrawDepositNum<0">
										<script type="text/javascript">
												location.href="user/jumpToMyInvest.html";
										</script>
								</c:if>
								<c:if test="${user_property != null and noFinishWithdrawDepositNum>=0}">
										<li class="a_center" invest_value="0">
											<div style="height: 144px;">
												<span class="f_20_22 _999">持有资产（元）</span><br> 
														<span class="f_36_38 _333">${user_property.invProperty}</span><br> 
												<span class="f_14_16 _333">&nbsp;<!-- 占位 --></span>
											</div>
										</li>
										<li class="a_center" style="float: right;" invest_value="0">
											<div style="height: 144px;">
												<span class="f_20_22 _999">我的余额（元）</span><br> 
												<span class="f_36_38 _333">${user_property.balance}</span><br> 
												<span class="f_14_16 _333">提现中&nbsp;${noFinishWithdrawDepositNum}</span> 
												<span class="f_14_16 _333">&nbsp;|&nbsp;</span> 
												<span class="f_14_16 _333">可用余额&nbsp;${user_property.balance - user_property.withdrawMoney}</span>
											</div>
										</li>
								</c:if>
								</ul>
								<div class="clear"></div>
							</div>
							<div id="column_content">
								<div class="column_content">
									<span class="f_20_22 _333 f_left">收益曲线</span> <a
										class="_333 f_14_16 f_right" data="a_month">一月</a> <a
										class="_333 f_14_16 f_right bg_fd5353 fff" data="a_week">一周</a>
									<div class="clear"></div>
									<!-- <div id="a_week_return" class="jqplot-target" style="position: relative;"><canvas width="929" height="300" class="jqplot-base-canvas" style="position: absolute; left: 0px; top: 0px;"></canvas><div class="jqplot-title" style="height: 0px; width: 0px;"></div><div class="jqplot-axis jqplot-xaxis" style="position: absolute; width: 929px; height: 46px; left: 0px; bottom: 0px;"><canvas width="75" height="16" class="jqplot-xaxis-label" style="position: absolute; left: 440.5px; bottom: 0px;"></canvas><div class="jqplot-xaxis-tick" style="position: absolute; font-size: 14px; left: 18px;">09/04</div><div class="jqplot-xaxis-tick" style="position: absolute; font-size: 14px; left: 165px;">09/05</div><div class="jqplot-xaxis-tick" style="position: absolute; font-size: 14px; left: 312px;">09/06</div><div class="jqplot-xaxis-tick" style="position: absolute; font-size: 14px; left: 459px;">09/07</div><div class="jqplot-xaxis-tick" style="position: absolute; font-size: 14px; left: 606px;">09/08</div><div class="jqplot-xaxis-tick" style="position: absolute; font-size: 14px; left: 753px;">09/09</div><div class="jqplot-xaxis-tick" style="position: absolute; font-size: 14px; left: 900px;">09/10</div></div><div class="jqplot-axis jqplot-yaxis" style="position: absolute; height: 300px; width: 27px; left: 0px; top: 0px;"><div class="jqplot-yaxis-tick" style="position: absolute; font-size: 14px; top: 234px;">0.00</div><div class="jqplot-yaxis-tick" style="position: absolute; font-size: 14px; top: 175.5px;">0.25</div><div class="jqplot-yaxis-tick" style="position: absolute; font-size: 14px; top: 117px;">0.50</div><div class="jqplot-yaxis-tick" style="position: absolute; font-size: 14px; top: 58.5px;">0.75</div><div class="jqplot-yaxis-tick" style="position: absolute; font-size: 14px; top: 0px;">1.00</div></div><canvas width="929" height="300" class="jqplot-grid-canvas" style="position: absolute; left: 0px; top: 0px;"></canvas><canvas width="882" height="234" class="jqplot-series-shadowCanvas" style="position: absolute; left: 37px; top: 10px;"></canvas><canvas width="882" height="234" class="jqplot-series-shadowCanvas" style="position: absolute; left: 37px; top: 10px;"></canvas><canvas width="882" height="234" class="jqplot-series-canvas" style="position: absolute; left: 37px; top: 10px;"></canvas><canvas width="882" height="234" class="jqplot-series-canvas" style="position: absolute; left: 37px; top: 10px;"></canvas><table class="jqplot-table-legend" style="left: 37px; top: 10px;"><tbody><tr class="jqplot-table-legend"><td class="jqplot-table-legend jqplot-table-legend-swatch" style="text-align: center; padding-top: 0px;"><div class="jqplot-table-legend-swatch-outline"><div class="jqplot-table-legend-swatch" style="background-color: rgb(28, 98, 186); border-color: rgb(28, 98, 186);"></div></div></td><td class="jqplot-table-legend jqplot-table-legend-label" style="padding-top: 0px;">口袋宝</td></tr><tr class="jqplot-table-legend"><td class="jqplot-table-legend jqplot-table-legend-swatch" style="text-align: center;"><div class="jqplot-table-legend-swatch-outline"><div class="jqplot-table-legend-swatch" style="background-color: rgb(246, 201, 40); border-color: rgb(246, 201, 40);"></div></div></td><td class="jqplot-table-legend jqplot-table-legend-label">投资频道</td></tr></tbody></table><canvas width="882" height="234" class="jqplot-highlight-canvas" style="position: absolute; left: 37px; top: 10px;"></canvas><div class="jqplot-highlighter-tooltip" style="position: absolute; display: none;"></div><div class="jqplot-cursor-tooltip" style="position: absolute; display: none;"></div><canvas width="882" height="234" class="jqplot-lineRenderer-highlight-canvas" style="position: absolute; left: 37px; top: 10px;"></canvas><canvas width="882" height="234" class="jqplot-event-canvas" style="position: absolute; left: 37px; top: 10px;"></canvas></div>
									<div id="a_month_income" class="jqplot-target" style="position: relative;"><canvas width="929" height="300" class="jqplot-base-canvas" style="position: absolute; left: 0px; top: 0px;"></canvas><div class="jqplot-title" style="height: 0px; width: 0px;"></div><div class="jqplot-axis jqplot-xaxis" style="position: absolute; width: 929px; height: 46px; left: 0px; bottom: 0px;"><canvas width="75" height="16" class="jqplot-xaxis-label" style="position: absolute; left: 440.5px; bottom: 0px;"></canvas><div class="jqplot-xaxis-tick" style="position: absolute; font-size: 14px; left: 18px;">08/11</div><div class="jqplot-xaxis-tick" style="position: absolute; font-size: 14px; left: 165px;">08/16</div><div class="jqplot-xaxis-tick" style="position: absolute; font-size: 14px; left: 312px;">08/21</div><div class="jqplot-xaxis-tick" style="position: absolute; font-size: 14px; left: 459px;">08/26</div><div class="jqplot-xaxis-tick" style="position: absolute; font-size: 14px; left: 606px;">08/31</div><div class="jqplot-xaxis-tick" style="position: absolute; font-size: 14px; left: 753px;">09/05</div><div class="jqplot-xaxis-tick" style="position: absolute; font-size: 14px; left: 900px;">09/10</div></div><div class="jqplot-axis jqplot-yaxis" style="position: absolute; height: 300px; width: 27px; left: 0px; top: 0px;"><div class="jqplot-yaxis-tick" style="position: absolute; font-size: 14px; top: 234px;">0.00</div><div class="jqplot-yaxis-tick" style="position: absolute; font-size: 14px; top: 175.5px;">0.25</div><div class="jqplot-yaxis-tick" style="position: absolute; font-size: 14px; top: 117px;">0.50</div><div class="jqplot-yaxis-tick" style="position: absolute; font-size: 14px; top: 58.5px;">0.75</div><div class="jqplot-yaxis-tick" style="position: absolute; font-size: 14px; top: 0px;">1.00</div></div><canvas width="929" height="300" class="jqplot-grid-canvas" style="position: absolute; left: 0px; top: 0px;"></canvas><canvas width="882" height="234" class="jqplot-series-shadowCanvas" style="position: absolute; left: 37px; top: 10px;"></canvas><canvas width="882" height="234" class="jqplot-series-shadowCanvas" style="position: absolute; left: 37px; top: 10px;"></canvas><canvas width="882" height="234" class="jqplot-series-canvas" style="position: absolute; left: 37px; top: 10px;"></canvas><canvas width="882" height="234" class="jqplot-series-canvas" style="position: absolute; left: 37px; top: 10px;"></canvas><table class="jqplot-table-legend" style="left: 37px; top: 10px;"><tbody><tr class="jqplot-table-legend"><td class="jqplot-table-legend jqplot-table-legend-swatch" style="text-align: center; padding-top: 0px;"><div class="jqplot-table-legend-swatch-outline"><div class="jqplot-table-legend-swatch" style="background-color: rgb(28, 98, 186); border-color: rgb(28, 98, 186);"></div></div></td><td class="jqplot-table-legend jqplot-table-legend-label" style="padding-top: 0px;">口袋宝</td></tr><tr class="jqplot-table-legend"><td class="jqplot-table-legend jqplot-table-legend-swatch" style="text-align: center;"><div class="jqplot-table-legend-swatch-outline"><div class="jqplot-table-legend-swatch" style="background-color: rgb(246, 201, 40); border-color: rgb(246, 201, 40);"></div></div></td><td class="jqplot-table-legend jqplot-table-legend-label">投资频道</td></tr></tbody></table><canvas width="882" height="234" class="jqplot-highlight-canvas" style="position: absolute; left: 37px; top: 10px;"></canvas><div class="jqplot-highlighter-tooltip" style="position: absolute; display: none;"></div><div class="jqplot-cursor-tooltip" style="position: absolute; display: none;"></div><canvas width="882" height="234" class="jqplot-lineRenderer-highlight-canvas" style="position: absolute; left: 37px; top: 10px;"></canvas><canvas width="882" height="234" class="jqplot-event-canvas" style="position: absolute; left: 37px; top: 10px;"></canvas></div>
									-->

									<!--图表载体-->
									<div id="mychart">Loading graph...</div>

								</div>
								<div class="column_content">
									<span class="f_20_22 _333 _hidden" id="changetext">资产组成（元）</span>
									<div class="a_right">
										<a class="ff534f f_14_16 bg_input _hidden">资产明细</a>
									</div>
									<div id="chart_pie" class="a_center f_14_16 _999"
										style="line-height: 300px;">暂无数据</div>
									<div id="details_of_assets" class="_hidden">
										<table cellpadding="0" cellspacing="0">
											<thead>
												<tr class="_333 f_14_16 a_center">
													<td>项目名称</td>
													<td>待收本金(元)</td>
													<td>待收收益(元)</td>
													<td>状态</td>
													<td>操作</td>
												</tr>
												<tr class="_666 f_14_16 a_center" id="kdb">
													<td>口袋宝</td>
													<td></td>
													<td>--</td>
													<td>--</td>
													<td><a href="javascript:checkRealName();"
														class="ff534f">转出</a><a></a></td>
												</tr>
											</thead>
											<tbody id="pie_info">

											</tbody>
											<tfoot>
												<!-- 分页 -->
												<tr>
													<td colspan="4" class="a_center" id="Pie_info_Paging"></td>
												</tr>
											</tfoot>
										</table>
									</div>
									<div class="clear"></div>
								</div>
								<div class="column_content a_center _balance">
								<c:if test="${user_property != null and noFinishWithdrawDepositNum>=0}">
												<span class="f_20_22 _999">我的余额（元）</span><br> 
												<span class="f_36_38 _333">${user_property.balance}</span><br> 
												<span class="f_14_16 _333">提现中&nbsp;${noFinishWithdrawDepositNum}</span> 
												<span class="f_14_16 _333">&nbsp;|&nbsp;</span> 
												<span class="f_14_16 _333">可用余额&nbsp;${user_property.balance - user_property.withdrawMoney}</span>
								</c:if>
									<div class="account_recharge_withdraw">
										<a href="recharge.html" class="btn_fd5353 f_18_20 fff a_center">充值</a>

										<a href="withdrawDeposit.html"
											class="btn_fd5353 bg_fff f_18_20 fd5353 a_center">提现</a>
									</div>
								</div>
							</div>
							<div style="border-bottom: 1px solid #FD5353;"></div>
							<div class="transaction_records">
								<span>交易记录</span>
								<form action="jumpToMyInvest.html" method="post">
									<input type="hidden" name="invTypeId" value="${invTypeId}"/>
									<input type="hidden" name="pageIndex" value="${page.currentPageNo}"/>
									<input type="hidden" id="totalPageCount" value="${page.totalPageCount}"/>
									<ul id="change_invest_log1">
										<c:if test="${invTypeId == 1}">
											<li data="1" class="a_center bg_fd5353 fff" onclick="byInvTypeId(1);">新手宝</li>										
										</c:if>
										<c:if test="${invTypeId != 1}">
											<li data="1" class="a_center bg_f7f7f7 _999" onclick="byInvTypeId(1);">新手宝</li>	
										</c:if>
										<c:if test="${invTypeId == 2}">
											<li data="1" class="a_center bg_fd5353 fff" onclick="byInvTypeId(2);">月盈宝</li>										
										</c:if>
										<c:if test="${invTypeId != 2}">
											<li data="1" class="a_center bg_f7f7f7 _999" onclick="byInvTypeId(2);">月盈宝</li>	
										</c:if>
										<c:if test="${invTypeId == 3}">
											<li data="1" class="a_center bg_fd5353 fff" onclick="byInvTypeId(3);">季盈宝</li>										
										</c:if>
										<c:if test="${invTypeId != 3}">
											<li data="1" class="a_center bg_f7f7f7 _999" onclick="byInvTypeId(3);">季盈宝</li>	
										</c:if>
										<c:if test="${invTypeId == 4}">
											<li data="1" class="a_center bg_fd5353 fff" onclick="byInvTypeId(4);">双季盈</li>										
										</c:if>
										<c:if test="${invTypeId != 4}">
											<li data="1" class="a_center bg_f7f7f7 _999" onclick="byInvTypeId(4);">双季盈</li>	
										</c:if>
										<c:if test="${invTypeId == 5}">
											<li data="1" class="a_center bg_fd5353 fff" onclick="byInvTypeId(5);">年盈宝</li>										
										</c:if>
										<c:if test="${invTypeId != 5}">
											<li data="1" class="a_center bg_f7f7f7 _999" onclick="byInvTypeId(5);">年盈宝</li>	
										</c:if>
										<!-- <li data="2" class="a_center bg_f7f7f7 _999" onclick="byInvTypeId(2);">月盈宝</li>
										<li data="3" class="a_center bg_f7f7f7 _999" onclick="byInvTypeId(3);">季盈宝</li>
										<li data="4" class="a_center bg_f7f7f7 _999" onclick="byInvTypeId(4);">双季盈</li>
										<li data="5" class="a_center bg_f7f7f7 _999" onclick="byInvTypeId(5);">年盈宝</li> -->
										<div class="clear"></div>
									</ul>
								</form>
								<table cellpadding="0" cellspacing="0">
									<thead>
										<tr class="_666 f_14_16 a_center td-title">
											<td>项目名称</td>
											<td>金额(元)</td>
											<td>时间</td>
											<td>状态</td>											
											<td colspan="3">电子合同</td>
											<td colspan="4">债权详情</td> 
										</tr>
									</thead>
									<tbody id="my_invest_log1">
										<c:if test="${invest_msg_list != null}">
						                	<c:forEach items="${invest_msg_list}" var="invest_msg">					                	
							                	<tr>
								                	<td class="a_center f_14_16 _333">${invest_msg.produceName}</td>
								                	<td class="a_center f_14_16 _333">${invest_msg.tradeMoney}</td>
								                	<td class="a_center f_14_16 _333"><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${invest_msg.tradeDate}"/></td>
								                	<c:if test="${invest_msg.tradeStatus == 1}"><td class="a_center f_14_16 _333"><font color="red">未完成</font></td></c:if>
							                		<c:if test="${invest_msg.tradeStatus == 2}"><td class="a_center f_14_16 _333">已完成</td></c:if>						                		
								              	    <td colspan="3" class="a_center f_14_16 _999">无</td>
													<td colspan="4" class="a_center f_14_16 _999">无</td> 
							                	</tr>
						                	</c:forEach>
					                	</c:if>
					                	<c:if test="${invest_msg_list == null}">
					                			<tr><td colspan="10" class="a_center f_14_16 _999">暂无数据</td></tr>
					                	</c:if>
									</tbody>
									<tfoot>
										<!-- 分页 -->
										<c:if test="${invest_msg_list != null}">
											<tr class="a_center">
												<td colspan="4" id="Paging">
													<ul class="pagination">
														<li><a href="javascript:sendPage(document.forms[0],1)">首页</a></li>	
														<li><a href="javascript:sendPage(document.forms[0],${page.currentPageNo-1})">上一页</a></li>							
														<li><a href="javascript:sendPage(document.forms[0],${page.currentPageNo+1})">下一页</a></li>
														<li><a href="javascript:sendPage(document.forms[0],${page.totalPageCount})">尾页</a></li>								
													</ul>
													<br/><br/><br/>
													<div>
														第&nbsp;${page.currentPageNo}&nbsp;页/共&nbsp;${page.totalPageCount}&nbsp;页（共计&nbsp;${page.totalCount}&nbsp;条记录）&nbsp;
														跳转到&nbsp;<input type="text" id="dumpPage" style="background-color: rgba(0,0,0,0.05);width: 40px;border: 1px rgba(0,0,0,0.2) solid;">&nbsp;页&nbsp;	
														<input type="button" value="确&nbsp;定" onclick="dumpPage(document.forms[0])" style="width:50px;line-height:22px;font-size: 16px;background-color: rgba(0,0,0,0.08);"/>
													</div>	
												</td>
											</tr>
										</c:if>
									</tfoot>
								</table>
							</div>
						</div>
					</div>
					<div class="clear"></div>
				</div>
			</div>
		</div>
		<!-- 主体部分结束 -->
		<script type="text/javascript"
			src="${pageContext.request.contextPath }/statics/localjs/personalCenter_myInvest.js"></script>
		<script
			src="${pageContext.request.contextPath }/statics/localjs/earning.js"></script>
		<!-- 尾部开始 -->
		<%@include file="../common/footer.jsp"%>
		<!-- 尾部结束 -->
	</div>
</body>
</html>
