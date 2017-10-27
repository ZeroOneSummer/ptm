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
      <div class="mem_tit">产品分类</div>
      <br/>
      <table border="0" class="order_tab" style="width:630px; text-align:center; margin-bottom:30px;" cellspacing="0" cellpadding="0">       
        <tbody>
        	<a  href="add_product_category.jsp"><input type="button" value="新增" style="margin-left: 750px;margin-bottom:5px"/></a>
        	<tr style="font-weight: 700;">
	          <td width="5%">类别ID</td>
	          <td width="5%">类别名称</td>
	          <td width="5%" colspan="2">操作</td>
        	</tr> 
	        <tr>
	          <td>1</td>
	          <td>新手宝</td>	          
	          <td><a>删除</a>&nbsp;&nbsp;&nbsp;<a href="update_product_category.jsp">修改</a>&nbsp;&nbsp;&nbsp;</td>
	        </tr>
	        <tr>
	          <td>2</td>
	          <td>新手宝</td>	          
	          <td><a>删除</a>&nbsp;&nbsp;&nbsp;<a href="update_product_category.jsp">修改</a>&nbsp;&nbsp;&nbsp;</td>
	        </tr>
	        <tr>
	          <td>3</td>
	          <td>新手宝</td>	          
	          <td><a>删除</a>&nbsp;&nbsp;&nbsp;<a href="update_product_category.jsp">修改</a>&nbsp;&nbsp;&nbsp;</td>
	        </tr>
        </tbody>       
      </table>
      <!-- <div style="margin-left: 30px;">
        	<a href="">首&nbsp;页</a>&nbsp;
        	<a href="">上一页</a>&nbsp;
        	<a href="">下一页</a>&nbsp;
        	<a href="">末&nbsp;页</a>&nbsp;
      </div> -->
    </div>
  </div>
</div>
</body>
</html>


