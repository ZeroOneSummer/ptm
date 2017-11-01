<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>信息中心-信息详情</title>

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/statics/css/style_1.css"/>
	<%--  <script src="${ctx}/statics/js/backend/backend.js"></script> --%>
	
	
	
	
	
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
				<div class="mem_tit">信息详情展示</div>
				<br/>
				
					<div style="width: 850px; margin: auto;">
						<div style="text-align: center;">
							<h2>信息详情展示</h2>
						</div>
						
						<table style="margin: auto ; ">
							<tr>
								<td width="30%">信息ID：</td>
								<td>${news.id}</td>
							</tr>

							<tr>
								<td>标&nbsp;&nbsp;题：</td>
								<td>${news.title}</td>
							</tr>


							<tr>
								<td>发布日期：</td>
								<td>
								<fmt:formatDate value="${news.releaseDate}" pattern="yyyy-MM-dd"/>
								</td>
							</tr>

							<tr>
								<td>内容：</td>
								<td><textarea cols="60" rows="10">${news.contentPath }</textarea></td>
							</tr><tr></tr>
							<tr>
									<td colspan="2" style="text-align: left;"><input type="button" value="返 回" onclick="javascript:history.back(-1);" style="margin-left: 450px"/></td>
								</tr>
						</table>
		
					</div>
			</div>
		</div>
	</div>
</body>
</html>


