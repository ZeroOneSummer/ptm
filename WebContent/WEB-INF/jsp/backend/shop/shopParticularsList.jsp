<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  				<title>积分商城-交易详情展示</title>

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
      <div class="mem_tit">商城交易详情列表</div>
      <br>
      <table border="0" class="order_tab" style="width:930px; text-align:center; margin-bottom:30px;" cellspacing="0" cellpadding="0">
        <tbody>
      <tr>
          <td width="5%">订单号(ID)</td>
          <td width="5%">用户名称</td>
          <td width="5%">商品名称</td>
          <td width="5%">收货人</td>
          <td width="5%">联系方式</td>
          <td width="10%">收货地址</td>
          <td width="5%">创建时间</td>
          <td width="5%">快递单号(顺丰快递)</td>
          <td width="5%">状态</td>
           <td width="5%">操作</td>
        </tr>
        <tr>
          <td width="5%">1</td>
          <td width="5%">张三</td>
          <td width="5%">猕猴桃</td>
          <td width="5%">张三</td>
          <td width="5%">13678945612</td>
          <td width="5%">广东省深圳市南山区钰龙园3楼</td>
          <td width="5%">2017-09-25</td>
          <td width="5%">201709251234</td>
          <td width="5%">已发货</td>
          <td width="5%"><a href="javascript:void(0);">发货</a></td>
        </tr>
        <tr>
          <td width="5%">1</td>
          <td width="5%">张三</td>
          <td width="5%">猕猴桃</td>
          <td width="5%">张三</td>
          <td width="5%">13678945612</td>
          <td width="5%">广东省深圳市南山区钰龙园3楼</td>
          <td width="5%">2017-09-25</td>
          <td width="5%">201709251234</td>
          <td width="5%">已发货</td>
          <td width="5%"><a href="javascript:void(0);">发货</a></td>
        </tr>
        <tr>
          <td width="5%">1</td>
          <td width="5%">张三</td>
          <td width="5%">猕猴桃</td>
          <td width="5%">张三</td>
          <td width="5%">13678945612</td>
          <td width="5%">广东省深圳市南山区钰龙园3楼</td>
          <td width="5%">2017-09-25</td>
          <td width="5%">201709251234</td>
          <td width="5%">已发货</td>
          <td width="5%"><a href="javascript:void(0);">发货</a></td>
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


