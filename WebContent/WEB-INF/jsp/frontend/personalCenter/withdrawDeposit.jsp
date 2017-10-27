<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en" class=" ieundefined">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="format-detection" content="telephone=no">
<title>提现-口袋理财</title>
<meta name="keywords" content="口袋理财,移动理财,理财超市,互联网金融,银行理财,信托理财">
<meta name="description" content="口袋理财——报喜鸟上市系投资的移动理财平台，是上海十强互联网金融公司、上海金融信息行业协会副会长单位。口袋理财专注于小额分散的投资理财，多元化的投资理财产品，严格风控，灵活安全。">
<meta name="baidu-site-verification" content="W0p7tymOhp">
<meta name="baidu_union_verify" content="ac175d4c07bcca63a8a2f76d7023d69d">

<%@include file="../common/js.jsp"%>           
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/statics/css/object.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/statics/css/mask.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/statics/css/web.css">   
     
<script type="text/javascript" src="${pageContext.request.contextPath }/statics/js/mask.js"></script>	
<script type="text/javascript" src="${pageContext.request.contextPath }/statics/js/public(1).js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/statics/js/check.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/statics/js/base64.js"></script>	
			
</head>
<body style="background: #F7F7F7;">
    <div class="kdlc_pc_wrap">
    <!-- 头部开始 -->
		<%@include file="../common/header.jsp" %>
		<!-- 头部结束 -->
        <!-- 主体部分开始   提现-->
        <div class="container">
            <div class="operation_wrap">
			    <div class="content">
			        <div>
			            <span class="f_24_26 _333">账户提现</span>
			            <div>
			                <div class="_operation">
			                    <table cellpadding="0" cellspacing="0">
			                        <tbody><tr>
			                            <td class="f_18_20 _333">可提取余额：</td>
			                            <td class="f_18_20 _333">
			                            <c:choose>
												<c:when test="${user_property == null}">
													<script type="text/javascript">
														location.href="user/jumpToWithdrawDeposit.html";
													</script>
												</c:when>
												<c:otherwise>
					                                <span>${user_property.balance} &nbsp;</span>元
												</c:otherwise>
										</c:choose>
			                            </td>
			                        </tr>
			                        <tr>
			                            <td class="f_18_20 _333">持卡人：</td>
			                            <c:choose>
			                            	<c:when test="${user !=null }">
						                          <td class="f_18_20 _333"><i id="userName">${user.userName}</i></td>
								                    <script type="text/javascript">
								                    	var name=$("#userName").html();
								                    	var cname="*"+name.substring(1,name.length);
								                    	$("#userName").html(cname);
								                    </script>		
			                            	</c:when>
			                            	<c:otherwise>
					                               <script type="text/javascript">
														location.href="login";
													</script>
												</c:otherwise>
			                            </c:choose>
			                        </tr>
			                        <tr>
			                            <td class="f_18_20 _333">提现至银行卡：</td>
				                         <c:choose>
					                            <c:when test="${user_bankName !=null }">
			                            <td class="f_18_20 _333"><span id="bank">${user_bankName.bankName }</span>
			                            	<input type="hidden" id="bankNumber" value="${user.bankNumber}">
			                            </td>
										                    <script type="text/javascript">
										                    	var bankName=$("#bank").html();
										                    	var bankNumber=$("#bankNumber").val();
										                    	var bank=bankName+"&nbsp;&nbsp;*"+bankNumber.substring(bankNumber.length-4,bankNumber.length);
										                    	$("#bank").html(bank);
										                    </script>		
					                            	</c:when>
					                            	<c:otherwise>
						                               <script type="text/javascript">
															location.href="user/jumpToWithdrawDeposit.html";
														</script>
													</c:otherwise>
				                          </c:choose>
			                            
			                        </tr>
			                        <tr>
			                            <td class="f_18_20 _333">提取金额：</td>
			                            <td class="f_18_20 _333"><input id="money" class="_input" type="text" placeholder="请输入您的提现金额"><span class="f_24_45 _999 _unit">元</span></td>
			                        </tr>
			                        <tr>
			                            <td class="f_18_20 _333">交易密码：</td>
			                            <td class="f_18_20 _333">
			                                <!-- //用于阻止 chrome表单自动填充的占位符 -->
			                                <input class="_hidden" type="text">
			                                <input class="_hidden" type="password">
			                                <!-- //用于阻止 chrome表单自动填充的占位符 -->
			                                <input id="password" class="_input" type="password" autocomplete="off" placeholder="请输入您的交易密码">
			                                <a href="ForgotPassword.jsp" class="f_14_16 ff534f">忘记密码?</a>
			                            </td>
			                        </tr>
			                        <tr>
			                            <td><!-- 留边距 --></td>
			                            <td><div id="notification" class="f_14_16 ff534f">&nbsp;</div>
			                                <a href="javascript:withdraw()" id="withdraw" class="_input _border btn_fd5353 a_center f_20_50 fff">马上提现</a>
			                            </td>
			                        </tr>
			                    </tbody></table>
			                </div>
			                <div id="withdraw_limit">
			                    <p>
			                      	  每月前0次提现免手续费，超过0次每笔2元。您本月剩余0次免费提现机会。<br>&nbsp;
			                    </p>
			                </div>
			                <div id="withdraw_list" class="_list f_right">
			                    <span id="shrinkage" class="f_14_16 ff534f">提现记录&nbsp;<img src="${pageContext.request.contextPath }/statics/img/more.jpg"></span>
			                    <table cellpadding="0" cellspacing="0">
			                        <thead>
				                        <tr>
				                            <td class="a_center f_14_16 _333">提现日期</td>
				                            <td class="a_center f_14_16 _333">提现金额（元）</td>
				                            <td class="a_center f_14_16 _333">状态</td>
				                        </tr>
			                        </thead>
			                        <tbody id="div_log">
			                        	<tr><td></td><td class="a_center f_14_16 b5b5b5">暂无数据</td><td></td></tr>
			                        </tbody>
			                        <tfoot id="div_foot" style="display: none;">
				                        <tr>
				                            <td><!-- 留边距 --></td>
				                            <td class="a_center"><a href="javascript:getWithdrawLog()" class="f_14_16 ff534f">更&nbsp;&nbsp;多</a></td>
				                            <td><!-- 留边距 --></td>
				                        </tr>
			                        </tfoot>
			                    </table>
			                </div>
			            </div>
			            <div class="clear"></div>
			        </div>
			    </div>
			</div>			
		</div>
		<!-- 主体部分结束 -->
		<script type="text/javascript" src="${pageContext.request.contextPath }/statics/localjs/personalCenter_tiXian.js"></script> 			       
		<!-- 尾部开始 -->
		<%@include file="../common/footer.jsp" %>
		<!-- 尾部结束 -->  
    </div>
</body>
</html>