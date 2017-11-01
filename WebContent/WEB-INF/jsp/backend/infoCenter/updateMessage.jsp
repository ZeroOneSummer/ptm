<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>信息中心-修改信息</title>

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/statics/css/style_1.css"/>
	<%--  <script src="${ctx}/statics/js/backend/backend.js"></script> --%>
<%  
String path = request.getContextPath();  
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
%>  	
	<script type="text/javascript">
		function update(frm){
			var title = frm.title.value;
			var msgType = frm.msgType.value;
			var content = frm.content.value; 
			frm.submit(); 
		}
	</script> 
	
	
</head>
<body>

	<div class="i_bg bg_color" >
		<div style="text-align: center; line-height: 50px;">
			<h1>后&nbsp;台&nbsp;管&nbsp;理&nbsp;页&nbsp;面</h1>
		</div>
		<!--Begin 用户中心 Begin -->
		<div class="m_content">
			<%@include file="../common/left.jsp"%>
			<div class="m_right" id="content">
				<div class="mem_tit">修改消息</div>
				<br/>
					<div
						style="width: 540px; height: 350px; margin: auto; background-color: rgba(0,0,0,0.05);">
						<div style="text-align: center;"><br/>
							<h2>修改消息</h2>
						</div>
					<form action="updateMsg"  method="post" >
							<input type="hidden" name="id" value="${msg.id}"/>
							<table style="margin: auto;">
								<tr>
									<td>请输入新标题：</td>
									<td><input type="text" id="title" name="title" value="${msg.title}" /></td>
								</tr>
								<tr>
									<td>请选择类别：</td>
									<td><select id="msgType" name="msgType" > 
											<option value="0">选择类别</option>
											<option value="1" <c:if test="${msg.msgType==1}">selected="selected"</c:if>>充值类</option>
											<option value="2" <c:if test="${msg.msgType==2}">selected="selected"</c:if>>提现类</option>
											<option value="3" <c:if test="${msg.msgType==3}">selected="selected"</c:if>>积分类</option>
											<option value="4" <c:if test="${msg.msgType==4}">selected="selected"</c:if>>公告类</option> 
									</select></td>
								</tr>
								<tr>
									<td>请输入新内容：</td>
									<td><textarea rows="8" cols="50" id="content" name="content">${msg.content}</textarea></td>
								</tr>
								<tr>
									<br/>
									<td colspan="2" style="text-align: center;">
									<input type="button" value="提 交" onclick="update(document.forms[0])"/>
									 <input type="button" value="返 回" onclick="history.back(-1)"/></td>
								</tr>
							</table>
						
					</form>
					</div>
			</div>
		</div>
	</div>
</body>
</html>


