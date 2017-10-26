<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>产品详情</title>

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
      <div class="mem_tit">新增产品</div>
      <br/>
      <form action="#" method="get">
	      <table  class="order_tab" style="width:600px; text-align:center; margin-bottom:30px;" >       
	        <tbody>   	
		        <tr>
		          <td width="5%">产品ID</td>	 
		          <td width="8%"><input /></td>	          
		        </tr>
		        <tr>
		          <td>产品名称</td>	 
		          <td><input /></td>	          
		        </tr>
		        <tr>
		          <td>产品类别</td><!--format判断  -->	 
		          <td><input /></td>	          
		        </tr>
		        <tr>
		          <td>年化收益率</td>	 
		          <td><input /></td>	          
		        </tr>
		        <tr>
		          <td>起购金额（元）</td>	 
		          <td><input /></td>	          
		        </tr>
		        <tr>
		          <td>期限（天）</td>	 
		          <td><input /></td>	          
		        </tr>
		        <tr>
		          <td>本期可投总金额（元）</td>	 
		          <td><input /></td>	          
		        </tr>
		       <!--  <tr>
		          <td>剩余可投金额（元）</td>	 
		          <td>4,564.00</td>	          
		        </tr> -->
		        <tr>
		          <td>产品投资状态</td>	 
		          <td><input value="未发布" readonly="readonly"/></td>	          
		        </tr>
	        </tbody>       
	      </table>
      <input type="submit" value="提交" style="margin-left: 410px"/>&nbsp;&nbsp;&nbsp;<input type="button" value="返回" onclick="javascript:history.back(-1);"/>   
      </form> 
    </div>
  </div>
</div>
</body>
</html>


