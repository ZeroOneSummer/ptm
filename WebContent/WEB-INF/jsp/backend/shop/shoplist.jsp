<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  				<title>积分商城-商品列表</title>

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
      <div class="mem_tit">商品列表——
      			<a href="Addshop.jsp" style="color: red">添加商品</a></div>
      <br>
      <table border="0" class="order_tab" style="width:930px; text-align:center; margin-bottom:30px;" cellspacing="0" cellpadding="0">
        <tbody>
      <tr>
          <td width="5%">商品ID</td>
          <td width="5%">商品图片</td>
          <td width="10%">商品名称</td>
          <td width="8%">库存量</td>
          <td width="5%">兑换值</td>
          <td width="20%" colspan="2">操作</td>
        </tr>
         <tr>
         	<td>1</td>
         	<td><img src="${pageContext.request.contextPath }/statics/shop/img/mihoutao_s_1503294707298.png" alt="猕猴桃" width="100px" height="100px"/></td>
         	<td>猕猴桃</td>
         	<td>15</td>
         	<td>2500</td>
         	<td>
         		<a href="">删除</a>&nbsp;&nbsp;&nbsp;
         		<a href="Updateshop.jsp">修改</a>
         	</td>
         </tr>
           <tr>
         	<td>1</td>
         	<td><img src="${pageContext.request.contextPath }/statics/shop/img/mihoutao_s_1503294707298.png" alt="猕猴桃"  width="100px" height="100px"/></td>
         	<td>猕猴桃</td>
         	<td>15</td>
         	<td>2500</td>
         	<td>
         		<a href="">删除</a>&nbsp;&nbsp;&nbsp;
         		<a href="UpdatePost.jsp">修改</a>
         	</td>
         </tr>
          <tr>
         	<td>1</td>
         	<td><img src="${pageContext.request.contextPath }/statics/shop/img/mihoutao_s_1503294707298.png" alt="猕猴桃" width="100px" height="100px"/></td>
         	<td>猕猴桃</td>
         	<td>15</td>
         	<td>2500</td>
         	<td>
         		<a href="">删除</a>&nbsp;&nbsp;&nbsp;
         		<a href="UpdatePost.jsp">修改</a>
         	</td>
         </tr>
          <tr>
         	<td>1</td>
         	<td><img src="${pageContext.request.contextPath }/statics/shop/img/mihoutao_s_1503294707298.png" alt="猕猴桃" width="100px" height="100px"/></td>
         	<td>猕猴桃</td>
         	<td>15</td>
         	<td>2500</td>
         	<td>
         		<a href="">删除</a>&nbsp;&nbsp;&nbsp;
         		<a href="UpdatePost.jsp">修改</a>
         	</td>
         </tr>
          <tr>
         	<td>1</td>
         	<td><img src="${pageContext.request.contextPath }/statics/shop/img/mihoutao_s_1503294707298.png" alt="猕猴桃" width="100px" height="100px"/></td>
         	<td>猕猴桃</td>
         	<td>15</td>
         	<td>2500</td>
         	<td>
         		<a href="">删除</a>&nbsp;&nbsp;&nbsp;
         		<a href="UpdatePost.jsp">修改</a>
         	</td>
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


