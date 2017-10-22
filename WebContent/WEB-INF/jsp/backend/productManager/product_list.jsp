<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  				<title>产品中心-产品信息</title>

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
      <div class="mem_tit">产品信息</div>
      <br/>
      <table border="0" class="order_tab" style="width:930px; text-align:center; margin-bottom:30px;" cellspacing="0" cellpadding="0">       
        <tbody>
        	<a href="add_product.jsp"><input type="button" value="新增" style="float: right;margin-right: 30px;margin-bottom:5px"/></a>
        	<tr style="font-weight: 700;">
	          <td width="5%">产品ID</td>
	          <td width="8%">产品名称</td>
	          <td width="5%">产品类别</td>
	          <td width="5%">投资状态</td>
	          <td width="10%" colspan="3">操作</td>
        	</tr> 
	        <tr>
	          <td>1</td>
	          <td>新手宝2期</td>
	          <td>新手宝</td>
	          <td>投资中</td>
	          <td><a href="product_details.jsp">详情</a>&nbsp;&nbsp;&nbsp;<a>删除</a>&nbsp;&nbsp;&nbsp;<a href="update_product.jsp">修改</a>&nbsp;&nbsp;&nbsp;<a>发布</a></td>
	        </tr>
	        <tr>
	          <td>2</td>
	          <td>新手宝2期</td>
	          <td>新手宝</td>
	          <td>投资中</td>
	          <td><a href="product_details.jsp">详情</a>&nbsp;&nbsp;&nbsp;<a>删除</a>&nbsp;&nbsp;&nbsp;<a href="update_product.jsp">修改</a>&nbsp;&nbsp;&nbsp;<a>发布</a></td>
	        </tr>
	        <tr>
	          <td>3</td>
	          <td>新手宝2期</td>
	          <td>新手宝</td>
	          <td>未发布</td>
	          <td><a href="product_details.jsp">详情</a>&nbsp;&nbsp;&nbsp;<a>删除</a>&nbsp;&nbsp;&nbsp;<a href="update_product.jsp">修改</a>&nbsp;&nbsp;&nbsp;<a>发布</a></td>
	        </tr> 
        </tbody>       
      </table>
      <div style="margin-left: 30px;">
      		共&nbsp;<span>20</span>&nbsp;条&nbsp;
      		第&nbsp;<span>1</span>/<span>3</span>&nbsp;页&nbsp;&nbsp;&nbsp;
        	<a href="">首&nbsp;页</a>&nbsp;
        	<a href="">上一页</a>&nbsp;
        	<a href="">下一页</a>&nbsp;
        	<a href="">末&nbsp;页</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        	跳转到&nbsp;<input size="1"/>&nbsp;页&nbsp;&nbsp;&nbsp;<input type="button" value="跳转"/>
      </div>
    </div>
  </div>
</div>
</body>
</html>


