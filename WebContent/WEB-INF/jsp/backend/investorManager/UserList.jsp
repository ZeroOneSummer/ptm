<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  				<title>用户中心-用户列表</title>

 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/statics/css/style_1.css">
 <%--  <script src="${ctx}/statics/js/backend/backend.js"></script> --%>
</head>
<body>

<div class="i_bg bg_color">
<div style="text-align: center;line-height: 50px;"><h1>后&nbsp;台&nbsp;管&nbsp;理&nbsp;页&nbsp;面</h1></div>
  <!--Begin 用户中心 Begin -->
  <div class="m_content">
    <%@include file="../common/left.jsp" %>
    <div class="m_right" id="content">
      <div class="mem_tit">用户列表</div>
      <br>
      <table border="0" class="order_tab" style="width:930px; text-align:center; margin-bottom:30px;" cellspacing="0" cellpadding="0">
        <tbody>
       <tr style="font-weight: 700;">
          <td width="10%">用户编号</td>
          <td width="10%">登录名</td>
          <td width="10%">姓&nbsp;名</td>
          <td width="10%">用户类型</td>
        </tr> 
        <tr>
         	<td>1</td>
         	<td>admin</td>
         	<td>系统管理员-小花</td>
         	<td>管理员用户</td>
         </tr> 
         <tr>
         	<td>2</td>
         	<td>13612345678</td>
         	<td>张三</td>
         	<td>普通用户</td>
         </tr>
          <tr>
         	<td>3</td>
         	<td>13212345679</td>
         	<td>李四</td>
         	<td>普通用户</td>
         </tr>
          <tr>
         	<td>4</td>
         	<td>13512345680</td>
         	<td>麻子</td>
         	<td>普通用户</td>
         </tr>
          <tr>
         	<td>5</td>
         	<td>13812345681</td>
         	<td>王二</td>
         	<td>普通用户</td>
         </tr>
          <tr>
         	<td>6</td>
         	<td>13812345681</td>
         	<td>王二</td>
         	<td>普通用户</td>
         </tr>
          <tr>
         	<td>7</td>
         	<td>13812345681</td>
         	<td>王二</td>
         	<td>普通用户</td>
         </tr>
          <tr>
         	<td>8</td>
         	<td>13812345681</td>
         	<td>王二</td>
         	<td>普通用户</td>
         </tr>
        </tbody>
      </table>
       <div style="margin-left: 30px;">
        	<a href="">首&nbsp;页</a>&nbsp;
        	<a href="">上一页</a>&nbsp;
        	<a href="">下一页</a>&nbsp;
        	<a href="">末&nbsp;页</a>&nbsp;
        </div>
    </div>
  </div>
</div>
</body>
</html>


