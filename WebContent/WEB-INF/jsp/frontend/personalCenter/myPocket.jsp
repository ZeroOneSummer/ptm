<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en" class=" ieundefined">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="format-detection" content="telephone=no">
<title>我的口袋券-口袋理财</title>
<meta name="keywords" content="口袋理财,移动理财,理财超市,互联网金融,银行理财,信托理财">
<meta name="description" content="口袋理财——报喜鸟上市系投资的移动理财平台，是上海十强互联网金融公司、上海金融信息行业协会副会长单位。口袋理财专注于小额分散的投资理财，多元化的投资理财产品，严格风控，灵活安全。">
<meta name="baidu-site-verification" content="W0p7tymOhp">
<meta name="baidu_union_verify" content="ac175d4c07bcca63a8a2f76d7023d69d">

<%@include file="../common/js.jsp"%>           
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/statics/css/object.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/statics/css/mask.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/statics/css/web.css">   
     
<script src="${pageContext.request.contextPath }/statics/js/mask.js"></script>	
 
</head>
<body style="background: #F7F7F7;">
    <div class="kdlc_pc_wrap">
    <!-- 头部开始 -->
		<%@include file="../common/header.jsp" %>
		<!-- 头部结束 -->
        <!-- 主体部分开始  我的口袋卷-->
        <div class="container">
            <div class="my_pocket_wrap">
			    <div class="content">
			        <div class="my_pocket_header">
			        	<span class="f_14_35 _333 f_left">Hi，188****6917用户，为理想和财富开始活力的一天吧！</span>
			        	<div class="f_right">
			        		<a href="user/recharge.html">
			        			<span class="btn_fd5353 f_14_35 fff a_center">充值</span>
			        		</a>
			        		<a href="user/withdrawDeposit.html">
			        			<span class="btn_fd5353 bg_fff f_14_35 fd5353 a_center">提现</span>
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
			                            <span class="fl f_20_50">绑卡才能提现哦！请先绑定银行卡</span><span class="fr"><a onclick="closeConfirm();">X</a></span>
			                            <img src="${pageContext.request.contextPath }/statics/img/gl_phone.png" id="img1">
			                        </div>
			            </div>
			            <div id="fullbg"></div>		
			            <div class="my_pocket_content">
				            <div id="vouchers_center_header">
				                <span class="_999 f_14_16">我的口袋券:</span>
				                <a vouchers_type="" class="_333 f_14_16 btn_fd5353 fff">所有</a>
	                            <a vouchers_type="1" class="_333 f_14_16">未使用</a>
	                            <a vouchers_type="2" class="_333 f_14_16">已失效</a>
				            </div>
				            <div id="vouchers_list">
				            <table cellpadding="0" cellspacing="0">
				            <tbody>
					            <tr class="_666 f_14_16">
					            	<td class="a_center">口袋券</td>
					            	<td>适用范围</td><td class="a_center">有效期至</td>
					            </tr>
					            <tr class="_666 f_14_16">
					            	<td class="a_left fff f_26_28">
					            		<p style="padding-left:42px;width:54px;height:63px;line-height:63px;background: url(${pageContext.request.contextPath }/statics/img/fringe3.png) no-repeat center center;background-size:100%;">
					            		<span class="f_16">￥</span>6</p>
					            	</td>
					            	<td>用于定期频道30天以上项目</td>
					            	<td class="a_left _999 f_14_16">2017-09-19到期</td>
					            </tr>
					            <tr class="_666 f_14_16">
					            	<td class="a_left fff f_20_22">
					            		<p style="padding-left:42px;width:54px;height:63px;line-height:63px;background: url(${pageContext.request.contextPath }/statics/img/fringe3.png) no-repeat center center;background-size:100%;">
					            		<span class="f_16">￥</span>328</p>
					            	</td>
					            	<td>用于定期频道180天以上项目</td>
					            	<td class="a_left _999 f_14_16">2017-11-07到期</td>
					            </tr>
					            <tr class="_666 f_14_16">
					            	<td class="a_left fff f_20_22">
					            		<p style="padding-left:42px;width:54px;height:63px;line-height:63px;background: url(${pageContext.request.contextPath }/statics/img/fringe3.png) no-repeat center center;background-size:100%;">
					            		<span class="f_16">￥</span>106</p>
					            	</td>
					            	<td>用于定期频道90天以上项目</td>
					            	<td class="a_left _999 f_14_16">2017-11-07到期</td>
					            </tr>
					            <tr class="_666 f_14_16">
					            	<td class="a_left fff f_26_28">
					            		<p style="padding-left:42px;width:54px;height:63px;line-height:63px;background: url(${pageContext.request.contextPath }/statics/img/fringe3.png) no-repeat center center;background-size:100%;">
					            		<span class="f_16">￥</span>68</p>
					            	</td>
					            	<td>用于定期频道15天以上项目</td>
					            	<td class="a_left _999 f_14_16">2017-09-15到期</td>
					            </tr>
					            <tr class="_666 f_14_16">
					            	<td class="a_left fff f_26_28">
					            		<p style="padding-left:42px;width:54px;height:63px;line-height:63px;background: url(${pageContext.request.contextPath }/statics/img/fringe3.png) no-repeat center center;background-size:100%;">
					            		<span class="f_16">￥</span>50</p>
					            	</td>
					            	<td>用于定期频道30天以上项目</td>
					            	<td class="a_left _999 f_14_16">2017-10-03到期</td>
					            </tr>
					            <tr class="_666 f_14_16">
					            	<td class="a_left fff f_26_28">
					            		<p style="padding-left:42px;width:54px;height:63px;line-height:63px;background: url(${pageContext.request.contextPath }/statics/img/fringe3.png) no-repeat center center;background-size:100%;">
					            		<span class="f_16">￥</span>30</p>
					            	</td>
					            	<td>用于定期频道15天以上项目</td>
					            	<td class="a_left _999 f_14_16">2017-09-15到期</td>
					            </tr>
				       		 </tbody>
				   		 </table>
						</div>
			            <div id="vouchers_list_page" class="a_center"><ul class="pagination"><li class="prev disabled"><span>«</span></li><li class="active"><a href="javascript:getVouchersList(&#39;1&#39;)" data-page="0">1</a></li><li><a href="javascript:getVouchersList(&#39;2&#39;)" data-page="1">2</a></li><li class="next"><a href="javascript:getVouchersList(&#39;2&#39;)" data-page="1">»</a></li></ul></div>
			        </div>
			        <div class="clear"></div>
			    </div>
			</div>
		</div>
        <!-- 主体部分结束 -->
		<script type="text/javascript" src="${pageContext.request.contextPath }/statics/localjs/personalCenter_myPocket.js"></script>  
		<!-- 尾部开始 -->
		<%@include file="../common/footer.jsp" %>
		<!-- 尾部结束 -->  
    </div>
</body>
</html>