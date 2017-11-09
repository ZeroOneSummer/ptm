<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>信息中心-消息推送</title>

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/statics/css/style_1.css"/>
	
	
</head>
<body>

	<div class="i_bg bg_color">
		<div style="text-align: center; line-height: 50px;">
			<h1>后&nbsp;台&nbsp;管&nbsp;理&nbsp;页&nbsp;面</h1>
		</div>
		<!--Begin 用户中心 Begin -->
		<div class="m_content">
			<%@include file="../common/left.jsp"%>
			
	<script type="text/javascript">
		function _go() {
			var pageIndex = $("#pageIndex").val();
			location.href = "beingpushed.html?pageIndex=" + pageIndex;
		};
		
		function delaMsg_json(id){
			var mess=confirm("你确定要删除吗？");
			 if(mess){
				$.ajax({
					type:"GET",//请求类型
					url:"delaMsg.json?id="+id,//请求的url
					dataType:"json",//ajax接口（请求url）返回的数据类型
					success:function(data){//data：返回数据（json对象）
						if(data){
							alert("删除成功！");
							location.href="beingpushed.html";
						}else{
							alert("删除失败！");
							location.href="beingpushed.html";
						}
					}
				});  
			} 
	
	}
		
		</script>			
			
			
			<div class="m_right" id="content">
				<div class="mem_tit">
					消息推送—— <a href="appMsg" style="color: red">添加消息</a>
				</div>
				<br />
				<table border="3px" class="order_tab"
					style="width: 930px; text-align: center; margin-bottom: 30px;"
					cellspacing="0" cellpadding="0">
					<thead>
						<tr>
							<td width="10%">消息ID：</td>
							<td width="12%">消息标题</td>
							<td width="10%">消息类别</td>
							<td width="40%">内容</td>
							<td width="12%">发布时间</td>
							<td width="20%" colspan="2">操作</td>
						</tr>
					</thead>
					<tbody>

						<c:forEach var="msg" items="${msg}" varStatus="status">
							<tr>
								<td>${msg.id}</td>
								<td>${msg.title}</td>
								<td><%-- <c:if test="${msg.msgType==1}">充值</c:if> 
									<c:if test="${msg.msgType==2}">提现</c:if> 
									<c:if test="${msg.msgType==3}">积分</c:if>  --%>
									<c:if test="${msg.msgType==4}">公告</c:if>
								</td>
								<td>${msg.content}</td>
								<td>
								<fmt:formatDate value="${msg.releaseDate}" pattern="yyyy-MM-dd"/>
								</td>
								<td><a href="modifyMsg?id=${msg.id}">修改</a>&nbsp;&nbsp;&nbsp;&nbsp;
								<a href="javascript:delaMsg_json(${msg.id});" >删除</a></td>
							</tr>
						</c:forEach>

					</tbody>
				</table>

				<div style="padding-left: 600px; font-size: 14px;">
					&nbsp;共&nbsp;<span class="pages">${pages.totalCount }</span>&nbsp;条&nbsp;记录&nbsp;&nbsp;&nbsp;&nbsp;第${pages.currentPageNo }&nbsp;页&nbsp;/&nbsp;&nbsp;共${pages.totalPageCount }&nbsp;页&nbsp;
					&nbsp;&nbsp;&nbsp; <a href="beingpushed.html?pageIndex=1">首&nbsp;页</a>&nbsp;
					<a
						href="beingpushed.html?pageIndex=${pages.currentPageNo-1<1?1:pages.currentPageNo - 1}">上一页</a>&nbsp;&nbsp;
					<a
						href="beingpushed.html?pageIndex=${pages.currentPageNo + 1>pages.totalPageCount?pages.totalPageCount:pages.currentPageNo + 1}">下一页</a>&nbsp;&nbsp;
					<a href="beingpushed.html?pageIndex=${pages.totalPageCount}">末&nbsp;页</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					跳转到&nbsp;<input size="1" id="pageIndex" />&nbsp;页&nbsp;&nbsp;&nbsp;<a
						href="javascript:_go();"> go </a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>


