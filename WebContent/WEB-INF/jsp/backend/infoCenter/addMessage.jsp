<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>信息中心-添加消息</title>
<%  
String path = request.getContextPath();  
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
%>  
  
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/statics/css/style_1.css"/>
	
<script type="text/javascript">
	function add(frm) {
		var title = frm.title.value;
		var msgType = frm.msgType.value;
		var content = frm.content.value; 		
		if(title == ""){  
            alert("请输入标题！");               
        }else if(msgType == 0){  
            alert("请选择类型！");               
        }else if(content == ""){  
            alert("请输入内容！");                  
        }else{          	
        	frm.submit(); 
        } 
	}		
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
				<div class="mem_tit">
					<h2>添加消息</h2>
				</div>
				<br/>
					<div
						style="width: 540px; height: 350px; margin: auto; background-color: rgba(0,0,0,0.05);">
						<div style="text-align: center;"><br/>
							<h2>添加消息</h2>
							<br/>
						</div>
						<form action="addMsgs"  method="post" >
							<table style="margin: auto;">
								<tr>
									<td>标题：</td>
									<td><input type="text" id="title" name="title" /></td>
								</tr>
								<tr>
									<td>类别：</td>
									<td><select id="msgType" name="msgType">
											<option value="0">选择类别</option>
											<option value="1">充值类</option>
											<option value="2">提现类</option>
											<option value="3">积分类</option>
											<option value="4">公告类</option>
									</select></td>
								</tr>
								<tr>
									<td>内容：</td>
									<td><textarea rows="8" cols="40" id="content" name="content"></textarea></td>
								</tr>
								<tr>
									<td colspan="2" style="text-align: center;">
									<input type="button" value="提 交" onclick="add(document.forms[0])"/><input type="button" value="返 回" onclick="history.go(-1)"/></td>
								</tr>
							</table>
						</form>
		
					</div>
			</div>
		</div>
	</div>
</body>
</html>


