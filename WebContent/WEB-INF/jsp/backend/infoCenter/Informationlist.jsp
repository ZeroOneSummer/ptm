<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>信息中心-信息列表</title>

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/statics/css/style_1.css">

	<script type="text/javascript">
		function _go() {
			var pageIndex = $("#pageIndex").val();
			location.href = "statistics.html?pageIndex=" + pageIndex;
		};
	</script>
</head>
<body>

	<div class="i_bg bg_color">
		<div style="text-align: center; line-height: 50px;">
			<h1>后&nbsp;台&nbsp;管&nbsp;理&nbsp;页&nbsp;面</h1>
		</div>
		<!--Begin 用户中心 Begin -->
		<div class="m_content">
			<%@include file="../common/left.jsp"%>
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
								<td>${news.newsType}</td>
								<td>${news.releaseDate}</td>
								<td><a href="">查看详情</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="">修改</a>&nbsp;&nbsp;&nbsp;&nbsp;<a
									href="" onclick="javascript:return del();">删除</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>

				<div style="margin-left: 30px;">
					&nbsp;共&nbsp;<span class="pages">${pages.totalCount }</span>&nbsp;条&nbsp;记录&nbsp;${pages.currentPageNo }&nbsp;|&nbsp;${pages.totalPageCount }&nbsp;页&nbsp;
					&nbsp;&nbsp;&nbsp; <a href="Information.html?pageIndex=1">首&nbsp;页</a>&nbsp;
					<a
						href="Information.html?pageIndex=${pages.currentPageNo-1<1?1:pages.currentPageNo - 1}">上一页</a>&nbsp;
					<a
						href="Information.html?pageIndex=${pages.currentPageNo + 1>pages.totalPageCount?pages.totalPageCount:pages.currentPageNo + 1}">下一页</a>&nbsp;
					<a href="Information.html?pageIndex=${pages.totalPageCount}">末&nbsp;页</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					跳转到&nbsp;<input size="1" id="pageIndex" />&nbsp;页&nbsp;&nbsp;&nbsp;<a
						href="javascript:_go();"> go </a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>


