<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  				<title>产品中心-产品分类</title>

 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/statics/css/style_1.css"/>
 <%--  <script src="${ctx}/statics/js/backend/backend.js"></script> --%>
</head>
<body>
<div class="i_bg bg_color">
<div style="text-align: center;line-height: 50px;"><h1>后&nbsp;台&nbsp;管&nbsp;理&nbsp;页&nbsp;面</h1></div>
  <!--Begin 用户中心 Begin -->
  <div class="m_content">
    <%@include file="../common/left.jsp" %>
    <div class="m_right" id="content">
      <div class="mem_tit">修改产品分类</div>
      <br/>
      <form action="#" method="get">
	      <table border="0" class="order_tab" style="width:630px; text-align:center; margin-bottom:30px;" cellspacing="0" cellpadding="0">       
	        <tbody>
	        	<tr>
		          <td width="5%">类别ID</td>	 
		          <td width="8%"><input value="1" readonly="readonly"/></td>	          
		        </tr>
		        <tr>
		          <td>类别名称</td>	 
		          <td><input /></td>	          
		        </tr>        
	        </tbody>       
	      </table> 
      	<input type="submit" value="提交"  style="margin-left: 410px"/>&nbsp;&nbsp;&nbsp;<input type="button" value="返回" onclick="javascript:history.back(-1);"/>   
      </form> 
    </div>
  </div>
</div>
</body>
</html>


