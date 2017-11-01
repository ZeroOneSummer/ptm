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
      <div class="mem_tit">修改口袋券</div>
      <br/>
      <form action="#" method="get">
	      <table  class="order_tab" style="width:600px; text-align:center; margin-bottom:30px;" >       
	        <tbody>  
		        <tr>
		          <td width="5%">口袋券ID</td>	 
		          <td width="8%"><input readonly="readonly"/></td>	          
		        </tr>
		        <tr>
		          <td>类型</td>	 
		          <td>
		          	<select>
		          		<option selected="selected">-请选择类型-</option>
		          		<option value="1">返现券</option>
		          		<option value="2">加息券</option>
		          		<option value="3">满减券</option>
		          	</select>
				  </td>	          
		        </tr>
		        <tr>
		          <td>面值（元）</td>
		          <td><input /></td>	          
		        </tr>
		        <tr>
		          <td>有效期（天）</td>	 
		          <td><input /></td>	          
		        </tr>
		        <tr>
		          <td>使用范围</td>	 
		          <td>
		          	<select>
		          		<option selected="selected">-请选择使用范围-</option>
		          		<option value="15">用于定期频道15天以上项目</option>
		          		<option value="30">用于定期频道30天以上项目</option>
		          		<option value="90">用于定期频道90天以上项目</option>
		          		<option value="180">用于定期频道180天以上项目</option>
		          	</select>
		          </td>	          
		        </tr>
		        <tr>
		          <td>兑换所需积分</td>	 
		          <td><input /></td>	          
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


