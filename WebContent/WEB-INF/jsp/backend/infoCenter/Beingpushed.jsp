<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>信息中心-消息推送</title>

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
				<div class="mem_tit">
					消息推送—— <a href="addMessage.jsp" style="color: red">添加消息</a>
				</div>
				<br/>
					<table border="0" class="order_tab"
						style="width: 930px; text-align: center; margin-bottom: 30px;"
						cellspacing="0" cellpadding="0">
						<thead>
							<tr>
								<td width="10%">消息ID：</td>
								<td width="20%">消息标题</td>
								<td width="10%">消息类别</td>
								<td width="20%">内容</td>
								<td width="10%">发布时间</td>
								<td width="10%" colspan="2">操作</td>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>1</td>
								<td>9月22~23日银行维护通知</td>
								<td>公告</td>
								<td>9月22~23日银行维护</td>
								<td>2017-02-17</td>
								<td>&nbsp;&nbsp;&nbsp; <a href="">删除</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<a href="updateMessage.jsp">修改</a>
								</td>
							</tr>

							<tr>
								<td>2</td>
								<td>用户提现通知</td>
								<td>提现通知</td>
								<td>9月22~23日提现1000元</td>
								<td>2017-02-17</td>
								<td>&nbsp;&nbsp;&nbsp; <a href="">删除</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<a href="updateMessage.jsp">修改</a>
								</td>
							</tr>

							<tr>
								<td>3</td>
								<td>用户充值通知</td>
								<td>充值通知</td>
								<td>9月22~23日充值1000元成功</td>
								<td>2017-02-17</td>
								<td>&nbsp;&nbsp;&nbsp; <a href="">删除</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<a href="updateMessage.jsp">修改</a>
								</td>
							</tr>

							<tr>
								<td>4</td>
								<td>用户体验金到账通知</td>
								<td>体验金到账通知</td>
								<td>9月22~23日体验金到账1000元成功</td>
								<td>2017-02-17</td>
								<td>&nbsp;&nbsp;&nbsp; <a href="">删除</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<a href="updateMessage.jsp">修改</a>
								</td>
							</tr>

							<tr>
								<td>5</td>
								<td>活动介绍</td>
								<td>庆国庆，投资送礼</td>
								<td>10月1~7日，投资1000元，立即赠送488体验金</td>
								<td>2017-09-15</td>
								<td>&nbsp;&nbsp;&nbsp; <a href="">删除</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<a href="updateMessage.jsp">修改</a>
								</td>
							</tr>

						</tbody>
					</table>
					<div style="margin-left: 30px;">
						<a href="">首&nbsp;页</a>&nbsp; <a href="">上一页</a>&nbsp; <a href="">下一页</a>&nbsp;
						<a href="">末&nbsp;页</a>&nbsp;
					</div>
			</div>
		</div>
	</div>
</body>
</html>


