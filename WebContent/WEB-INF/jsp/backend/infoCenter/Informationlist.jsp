<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>信息中心-信息列表</title>

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
			location.href = "Information.html?pageIndex=" + pageIndex;
		};
		
		 function delNews_json(id){
			var mess=confirm("你确定要删除吗？");
			 if(mess){
				$.ajax({
					type:"GET",//请求类型
					url:"delNews.json?id="+id,//请求的url
					dataType:"json",//ajax接口（请求url）返回的数据类型
					success:function(data){//data：返回数据（json对象）
						if(data){
							alert("删除成功！");
							location.href="Information.html";
							alert("删除失败！");
							location.href="Information.html";
						}
					}
				});  
			} 	
		} 
	</script>
			
			
			
			<div class="m_right" id="content">
				<div class="mem_tit">信息列表</div>
				<br />
				<table border="0" class="order_tab"
					style="width: 930px; text-align: center; margin-bottom: 30px;"
					cellspacing="0" cellpadding="0">
					<tbody>
						<tr>
							<td width="5%">信息ID</td>
							<td width="10%">标题</td>
							<td width="8%">类别</td>
							<td width="5%">发布时间</td>
							<td width="8%" colspan="2">操作</td>
						</tr>

						<c:forEach var="news" items="${news}" varStatus="status">
							<tr>
								<td>${news.id}</td>
								<td>${news.title}</td>
								<td>
									<c:if test="${news.newsType==1}">公告</c:if> 
									<c:if test="${news.newsType==2}">媒体报道</c:if> 
								</td>
								<td>
								<fmt:formatDate value="${news.releaseDate}" pattern="yyyy-MM-dd"/>
								</td>
								<td><a href="getNews?id=${news.id}">查看详情</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="modifyNews?id=${news.id}">修改</a>&nbsp;&nbsp;&nbsp;&nbsp;
								<a href="javascript:delNews_json(${news.id});;">删除</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>

				<div style="padding-left: 600px; font-size: 14px;">
					&nbsp;共&nbsp;<span class="pages">${pages.totalCount }</span>&nbsp;条&nbsp;记录&nbsp;&nbsp;&nbsp;&nbsp;第${pages.currentPageNo }&nbsp;&nbsp;/共&nbsp;&nbsp;${pages.totalPageCount }&nbsp;页&nbsp;
					&nbsp;&nbsp;&nbsp; <a href="Information.html?pageIndex=1">首&nbsp;页</a>&nbsp;
					<a
						href="Information.html?pageIndex=${pages.currentPageNo-1<1?1:pages.currentPageNo - 1}">上一页</a>&nbsp;&nbsp;
					<a
						href="Information.html?pageIndex=${pages.currentPageNo + 1>pages.totalPageCount?pages.totalPageCount:pages.currentPageNo + 1}">下一页</a>&nbsp;
					<a href="Information.html?pageIndex=${pages.totalPageCount}">末&nbsp;页</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					跳转到&nbsp;<input size="1" id="pageIndex" />&nbsp;页&nbsp;&nbsp;&nbsp;<a
						href="javascript:_go();"> go </a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>


