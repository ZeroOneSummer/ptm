<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>信息中心-修改信息</title>

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/statics/css/style_1.css">
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
				<div class="mem_tit">修改消息</div>
				<br>
					<div
						style="width: 540px; height: 350px; margin: auto; background-color: lightcoral;">
						<div style="text-align: center;"></br>
							<h2>修改消息</h2>
						</div>
						<form>
							<table style="margin: auto;">
								<tr>
									<td>请输入新标题：</td>
									<td><input type="text" /></td>
								</tr>
								<tr>
									<td>请选择类别：</td>
									<td><select> <
											<option>选择类别</option>
											<option>充值类</option>
											<option>提现类</option>
											<option>活动推广类</option>
											<option>公告类</option>
									</select></td>
								</tr>
								<tr>
									<td>请输入新内容：</td>
									<td><textarea rows="8" cols="50"></textarea></td>
								</tr>
								<tr>
									<br />
									<td colspan="2" style="text-align: center;"><input
										type="submit" value="提 交" /> <input type="button" value="返 回" onclick="history.back(-1)"/></td>
								</tr>
							</table>
						</form>
					</div>
			</div>
		</div>
	</div>
</body>
</html>


