<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>公告中心-口袋理财</title>
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
			<div id="about_wrap">
			    <div class="content">
			        <ul id="about_nav">
			            <li class="about_curr_option">公告中心</li>
			            <div class="clear"></div>
			        </ul>
			        <div id="about_content">
			            <!-- 公告中心 -->
			                    <div style="padding:10px;">
			                       <%--  <div class="f_left f_18_20 _333 _l_item" style="list-style-type:circle">9月22~23日银行维护通知&nbsp;<img src="${pageContext.request.contextPath}/statics/img/top_icon.png" width="18"></div>
			                        <div class="f_right f_14_16 _666">发布时间：2017-09-22</div> --%>
			                        
			                        <c:if test="${msgList != null }">
							                	<c:forEach items="${msgList}" var="msg_push"  varStatus="status">
								                  <a href="javascript:getMsg_push(${msg_push.id});">
								                   <div style="padding:10px;">
								                        <div class="f_left f_18_20 _333 _l_item" style="list-style-type:circle">${msg_push.title}</div>
								                        <div class="f_right f_14_16 _666">发布时间：<fmt:formatDate value="${msg_push.releaseDate }" pattern="yyyy-MM-dd"/></div>
								                        <div class="clear"></div>
								                   </div>
								                </a>
							                	</c:forEach>
					                </c:if>
									<c:if test="${msgList == null }">
			              				  <a href="javascript:void(0);">
							               <div class="f_left f_18_20 _333 _l_item" style="padding:10px;">暂无公告消息&nbsp;
							               <img src="${pageContext.request.contextPath}/statics/img/top_icon.png" width="18"></div><br/>
						                        <div class="clear"></div>
						                    </div>
						                </a>
					                </c:if>
			                
						<!-- 分页显示消息列表  -->
						<form action="jumpToPublicNews.html" method="post">
							<input type="hidden" value="${page.currentPageNo}" name="currentPageNo" id="currentPageNo"/>
							<input type="hidden" value="${page.totalPageCount}" id="totalPageCount"/>
							<input type="hidden" id="msgType" name="msgType" value="${msgType }"/>
						</form>
						<div id="paging">
							<ul class="pagination">
								<li><a href="javascript:sendPage(document.forms[0],1,0)">首页</a></li>	
								<li><a href="javascript:sendPage(document.forms[0],${page.currentPageNo-1},4)">上一页</a></li>							
								<li><a href="javascript:sendPage(document.forms[0],${page.currentPageNo+1},4)">下一页</a></li>
								<li><a href="javascript:sendPage(document.forms[0],${page.totalPageCount},4)">尾页</a></li><br/><br/>								
								<li>
									第&nbsp;${page.currentPageNo}&nbsp;页/共&nbsp;${page.totalPageCount}&nbsp;页（共计&nbsp;${page.totalCount}&nbsp;条记录）&nbsp;
									跳转到&nbsp;<input type="text" id="dumpPage" style="background-color: rgba(0,0,0,0.05);width: 40px;border: 1px rgba(0,0,0,0.2) solid;">&nbsp;页&nbsp;	
									<input type="button" value="确&nbsp;定" onclick="dumpPage(document.forms[0])" style="width:50px;line-height:22px;font-size: 16px;background-color: rgba(0,0,0,0.08);"/>
								</li>					
							</ul>
						</div>
			          </div>
			    </div>
			    <div class="clear"></div>
			</div>        
		</div>
		
        <!-- 主体部分结束 -->
          <script type="text/javascript">
          /* -------------------获取具体的公告消息----------------------- */
       		function getMsg_push(msgId){
       			//alert("公告id>>"+msgId);
       			location.href="jumpToPhoneNews.html?msgId="+msgId;
       		}
          
          
          /* -------------------分页展示数据----------------------- */
		          function sendPage(frm,num,type1){
		          	var totalPageCount=$("#totalPageCount").val();
		          	var type = $("#msgType").val();
		          	if(num<1){
		          		num=1;
		          	}else if(num>totalPageCount){
		          		num=totalPageCount;
		          	}
		          	frm.currentPageNo.value=num;
		          	frm.submit();
		          }
		
		          function dumpPage(frm){
		          	var num=$("#dumpPage").val();//跳转页码	
		          	var type = $("#msgType").val();
		          	if(num != ""){				
		          		sendPage(frm,num,type);
		          	}		
		          }
          </script>	
        <!-- 底部开始 -->
       	<%@include file="../common/footer.jsp"%>
        <!-- 底部结束 -->
    </div>
</body>
</html>