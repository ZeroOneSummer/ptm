<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en" class=" ieundefined">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="format-detection" content="telephone=no">
<title>充值-口袋理财</title>
<meta name="keywords" content="口袋理财,移动理财,理财超市,互联网金融,银行理财,信托理财">
<meta name="description" content="口袋理财——报喜鸟上市系投资的移动理财平台，是上海十强互联网金融公司、上海金融信息行业协会副会长单位。口袋理财专注于小额分散的投资理财，多元化的投资理财产品，严格风控，灵活安全。">
<meta name="baidu-site-verification" content="W0p7tymOhp">
<meta name="baidu_union_verify" content="ac175d4c07bcca63a8a2f76d7023d69d">

<%@include file="../common/js.jsp"%>           
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/statics/css/object.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/statics/css/mask.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/statics/css/web.css">   
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/statics/css/recharge.css">   
     
<script src="${pageContext.request.contextPath }/statics/js/mask.js"></script>	
		<script type="text/javascript" src="${pageContext.request.contextPath }/statics/js/public(1).js"></script>
  
</head>
<body style="background: #F7F7F7;">
    <div class="kdlc_pc_wrap">
    	<!-- 头部开始 -->
		<%@include file="../common/header.jsp" %>
		<!-- 头部结束 -->
        <!-- 主体部分开始    充值 -->
		<div class="container">
			<!--连连网银支付 <form id="user_charge_form" method="post" target="_blank" action="https://deposit.koudailc.com/user/web-charge?clientType=pc">-->
			<!--宝付网银支付 -->
			<form id="user_charge_form" method="post" target="_blank" action="https://www.koudailc.com/account/web-charge">
			<div class="operation_wrap">
				<div class="content">
					<div>
						<span class="acc-page-title">
						账户充值：			</span>
						<div>
							<div class="cash-detail">
								<table cellpadding="0" cellspacing="0">
									<tbody><tr>
										<td class="usable-left">可用余额：</td>
										<td class="usable-right">
			                                <p id="use-money"><i>￥</i><span>0.00</span></p>
			                            </td>
									</tr>
									<tr>
										<td class="cash-left-pay">付款方式：</td>
										<td class="cash-right">
			                                <p class="p-pay">网银支付(部分银行只支持IE浏览器)</p>
			                                <div id="the-wangyin">
			                                    <ul class="bank-list">
				                                    <li onclick="selectBank(&#39;3002&#39;, &#39;7&#39;);bankLimit();">
				                                    	<i class="icon-bank" paychannelcode="YEEPAY" id="3002">
				                                    	<img src="${pageContext.request.contextPath }/statics/img/bank_1.jpg">
				                                    	</i>
				                                    </li>
				                                    <li onclick="selectBank(&#39;3005&#39;, &#39;7&#39;);bankLimit();">
				                                    	<i class="icon-bank" paychannelcode="YEEPAY" id="3005">
				                                    	<img src="${pageContext.request.contextPath }/statics/img/bank_2.jpg">
				                                    	</i>
				                                    </li>
				                                    <li onclick="selectBank(&#39;3022&#39;, &#39;7&#39;);bankLimit();">
				                                    	<i class="icon-bank" paychannelcode="YEEPAY" id="3022">
				                                    	<img src="${pageContext.request.contextPath }/statics/img/bank_3.jpg">
				                                    	</i>
				                                    	</li>
				                                    <li onclick="selectBank(&#39;3038&#39;, &#39;7&#39;);bankLimit();">
				                                    	<i class="icon-bank" paychannelcode="YEEPAY" id="3038">
				                                    	<img src="${pageContext.request.contextPath }/statics/img/bank_4.jpg">
				                                    	</i>
				                                    </li>
				                                    <li onclick="selectBank(&#39;3009&#39;, &#39;7&#39;);bankLimit();">
				                                    	<i class="icon-bank" paychannelcode="YEEPAY" id="3009">
				                                    	<img src="${pageContext.request.contextPath }/statics/img/bank_5.jpg">
				                                    	</i>
				                                    </li>
				                                    <li onclick="selectBank(&#39;3003&#39;, &#39;7&#39;);bankLimit();">
				                                    	<i class="icon-bank" paychannelcode="YEEPAY" id="3003">
				                                    	<img src="${pageContext.request.contextPath }/statics/img/bank_7.jpg">
				                                    	</i>
				                                    </li>
				                                    <li onclick="selectBank(&#39;3001&#39;, &#39;7&#39;);bankLimit();">
					                                    <i class="icon-bank" paychannelcode="YEEPAY" id="3001">
					                                    <img src="${pageContext.request.contextPath }/statics/img/bank_8.jpg">
					                                    </i>
				                                    </li>
				                                    <li onclick="selectBank(&#39;3026&#39;, &#39;7&#39;);bankLimit();">
				                                    	<i class="icon-bank" paychannelcode="YEEPAY" id="3026">
				                                    	<img src="${pageContext.request.contextPath }/statics/img/bank_9.jpg">
				                                    	</i>
				                                    </li>
				                                    <li onclick="selectBank(&#39;03100000&#39;, &#39;2&#39;);bankLimit();">
					                                    <i class="icon-bank" paychannelcode="YEEPAY" id="03100000">
					                                    <img src="${pageContext.request.contextPath }/statics/img/bank_10.jpg">
					                                    </i>
					                                </li>
					                                <li onclick="selectBank(&#39;3035&#39;, &#39;7&#39;);bankLimit();">
						                                <i class="icon-bank" paychannelcode="YEEPAY" id="3035">
						                                <img src="${pageContext.request.contextPath }/statics/img/bank_11.jpg">
						                                </i>
						                            </li>
						                            <li onclick="selectBank(&#39;3050&#39;, &#39;7&#39;);bankLimit();">
							                            <i class="icon-bank" paychannelcode="YEEPAY" id="3050">
							                            <img src="${pageContext.request.contextPath }/statics/img/bank_12.jpg">
							                            </i>
						                            </li>
						                            <li onclick="selectBank(&#39;3039&#39;, &#39;7&#39;);bankLimit();">
							                            <i class="icon-bank" paychannelcode="YEEPAY" id="3039">
							                            <img src="${pageContext.request.contextPath }/statics/img/bank_13.jpg">
							                            </i>
						                            </li>
						                            <li onclick="selectBank(&#39;3020&#39;, &#39;7&#39;);bankLimit();">
							                            <i class="icon-bank" paychannelcode="YEEPAY" id="3020">
							                            <img src="${pageContext.request.contextPath }/statics/img/bank_14.jpg">
							                            </i>
						                            </li>
						                            <li onclick="selectBank(&#39;3006&#39;, &#39;7&#39;);bankLimit();">
							                            <i class="icon-bank" paychannelcode="YEEPAY" id="3006">
							                            <img src="${pageContext.request.contextPath }/statics/img/bank_15.jpg">
							                            </i>
						                            </li>
						                            <li onclick="selectBank(&#39;3036&#39;, &#39;7&#39;);bankLimit();">
							                            <i class="icon-bank" paychannelcode="YEEPAY" id="3036">
							                            <img src="${pageContext.request.contextPath }/statics/img/bank_16.jpg">
							                            </i>
						                            </li>
						                            <li onclick="selectBank(&#39;3032&#39;, &#39;7&#39;);bankLimit();">
							                            <i class="icon-bank" paychannelcode="YEEPAY" id="3032">
							                            <img src="${pageContext.request.contextPath }/statics/img/bank_17.jpg">
							                            </i>
						                            </li>
						                            <li onclick="selectBank(&#39;3059&#39;, &#39;7&#39;);bankLimit();">
							                            <i class="icon-bank" paychannelcode="YEEPAY" id="3059">
							                            <img src="${pageContext.request.contextPath }/statics/img/bank_18.jpg">
							                            </i>
						                            </li>
						                            <li onclick="selectBank(&#39;3037&#39;, &#39;7&#39;);bankLimit();">
							                            <i class="icon-bank" paychannelcode="YEEPAY" id="3037">
							                            <img src="${pageContext.request.contextPath }/statics/img/bank_19.jpg">
							                            </i>
						                            </li>
						                            <li onclick="selectBank(&#39;03170000&#39;, &#39;2&#39;);bankLimit();">
							                            <i class="icon-bank" paychannelcode="YEEPAY" id="03170000">
							                            <img src="${pageContext.request.contextPath }/statics/img/bank_21.jpg">
							                            </i>
						                            </li>
						                            <li onclick="selectBank(&#39;04243010&#39;, &#39;2&#39;);bankLimit();">
							                            <i class="icon-bank" paychannelcode="YEEPAY" id="04243010">
							                            <img src="${pageContext.request.contextPath }/statics/img/bank_22.jpg">
							                            </i>
						                            </li>
						                            <li onclick="selectBank(&#39;04083320&#39;, &#39;2&#39;);bankLimit();">
							                            <i class="icon-bank" paychannelcode="YEEPAY" id="04083320">
							                            <img src="${pageContext.request.contextPath }/statics/img/bank_23.jpg">
							                            </i>
						                            </li>
						                            <li onclick="selectBank(&#39;03200000&#39;, &#39;2&#39;);bankLimit();">
							                            <i class="icon-bank" paychannelcode="YEEPAY" id="03200000">
							                            <img src="${pageContext.request.contextPath }/statics/img/bank_24.jpg">
							                            </i>
						                            </li>
						                            <li onclick="selectBank(&#39;3060&#39;, &#39;7&#39;);bankLimit();">
							                            <i class="icon-bank" paychannelcode="YEEPAY" id="3060">
							                            <img src="${pageContext.request.contextPath }/statics/img/bank_25.jpg">
							                            </i>
						                            </li>  
					               			    </ul>
			                                    <input name="bank_code" id="bank_code" style="display: none" placeholder="">
			                                    <input name="third_platform" id="third_platform" style="display: none" placeholder="">
			                                </div>
			                            </td>
			                        </tr>
									<tr>
										<td class="cash-left">充值金额：</td>
										<td class="cash-right">
			                                <input id="pay_amount" name="pay_amount" class="_input" type="text" placeholder="请输入您的充值金额"><span class="f_24_45 _999 _unit">元</span>
			                            </td>
									</tr>
									<tr>
										<td class="cash-left">
			                                <!-- //用于阻止 chrome表单自动填充的占位符 -->
			                                <input class="_hidden" type="text">
			                                <input class="_hidden" type="password">
			                                <input class="_hidden" name="platform" value="pc">
			                                <!-- //用于阻止 chrome表单自动填充的占位符 -->
			                                <input id="order_char_id" name="order_char_id" style="display: none" type="password" autocomplete="off" placeholder="">
										</td>
										<td class="cash-right">
			                                <div id="notification" class="f_14_16 ff534f">&nbsp;</div>
			                                <a href="javascript:userCharge()" class="_input _border btn_fd5353 a_center f_20_50 fff" style="border: 2px solid #FD5353;">马上充值</a>
			                            </td>
									</tr>
								</tbody></table>
							</div>
                                <div id="recharge_limit">                                   
                                    <p>                                        
                                    </p>   
                                </div>
							<div id="recharge_list" class="_list f_right">
								<span id="shrinkage" class="f_14_16 ff534f">充值记录&nbsp;<img src="${pageContext.request.contextPath }/statics/img/more.jpg"></span>
								<table cellpadding="0" cellspacing="0">
										<thead>
										<tr>
											<td class="a_center f_14_16 _333">充值日期</td>
											<td class="a_center f_14_16 _333">充值金额（元）</td>
											<td class="a_center f_14_16 _333">状态</td>
										</tr>
										</thead>
										<tbody id="div_log">
										<tr><td></td><td class="a_center f_14_16 b5b5b5">暂无数据</td><td></td></tr></tbody>
										<tfoot id="div_foot" style="display: none;">
										<tr>
											<td><!-- 留边距 --></td>
											<td class="a_center "><a href="javascript:getChargeLog();" class="f_14_16 ff534f">更&nbsp;&nbsp;多</a></td>
											<td><!-- 留边距 --></td>
										</tr>
										</tfoot>
								</table>
							</div>
						</div>
						<div class="clear"></div>
                        <div id="recharge_prompt">
                            <div id="recharge_prompt_top">
                                <span class="f_left f_20_50 fff">充值提示</span>
                                <span class="f_right f_20_50 fff"><a onclick="closeConfirm()">X</a></span>   
                            </div>    
                            <div id="recharge_prompt_top2" class="f_14_35 fd5353">
                              	  请您在新打开的银行页面上进行支付，完成前请不要关闭此窗口（请不要阻止拦截窗口弹出）
                            </div>
                            <div class="_999 f_14_60">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;完成充值后请根据您的情况点击下面的按钮：</div>
                            <div id="recharge_prompt_bt">
	                            <a href="https://www.koudailc.com/site/help-center" id="recharge_prompt_bt1" class="a_center _999 f_20_50">充值遇到问题</a>
	                            <a href="https://www.koudailc.com/account/my-invest" id="recharge_prompt_bt2" class="a_center fff f_20_50">已经充值成功</a>
                            </div>
                        </div>    
					</div>
				</div>
			</div>
			</form>
		    <div id="fullbg"></div>
		 </div>
		 <!-- 主体部分结束 -->
		 <script type="text/javascript" src="${pageContext.request.contextPath }/statics/localjs/personalCenter_recharge.js"></script>
		 <!-- 尾部开始 -->
		 <%@include file="../common/footer.jsp" %>
		 <!-- 尾部结束 -->  
     </div>
</body>
</html>
