<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>产品详情</title>

 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/statics/css/style_1.css"/>
 
</head>
<body>


<div class="i_bg bg_color">
<div style="text-align: center;line-height: 50px;"><h1>后&nbsp;台&nbsp;管&nbsp;理&nbsp;页&nbsp;面</h1></div>
  <!--Begin 用户中心 Begin -->
  <div class="m_content">
    <%@include file="../common/left.jsp" %>
    <div class="m_right" id="content">
      <div class="mem_tit">产品详情</div>
      <br/>
      <table  class="order_tab" style="width:600px; text-align:center; margin-bottom:30px;" >       
        <tbody>   	
	        <tr>
	          <td width="10%">产品ID</td>	 
	          <td width="15%">${invest_product.id }</td>	          
	        </tr>
	        <tr>
	          <td>产品名称</td>	 
	          <td>${invest_product.produceName }</td>	          
	        </tr>
	        <tr>
	          <td>产品类别</td><!--format判断  -->	 
	          <td>${invest_product.invest_type.invTypeName }</td>	          
	        </tr>
	        <tr>
	          <td>年化收益率</td>	 
	          <td>${invest_product.invest_type.annualYield}</td>	          
	        </tr>
	        <tr>
	          <td>起购金额（元）</td>	 
	          <td>${invest_product.invest_type.purchaseMoney }</td>	          
	        </tr>
	        <tr>
	          <td>期限（天）</td>	 
	          <td>${invest_product.invest_type.deadline }</td>	          
	        </tr>
	        <tr>
	          <td>本期可投总金额（元）</td>	 
	          <td>${invest_product.totalAmount}</td>	          
	        </tr>
	        <tr>
	          <td>剩余可投金额（元）</td>	 
	          <td>${invest_product.residueAmount }</td>	          
	        </tr>
	         <tr>
	          <td>投资人数</td>	 
	          <td>${invest_product.investor}</td>	          
	        </tr>
	        <tr>
	          <td>产品投资状态</td>	 
	          <td>	<c:if test="${invest_product.invStatus==1}">未发布</c:if> 
					<c:if test="${invest_product.invStatus==2}">可投</c:if> 
					<c:if test="${invest_product.invStatus==3}">已投满</c:if> 
			 </td>	          
	        </tr>
        </tbody>       
      </table> 
      <td colspan="2" style="text-align: left;"><input type="button" value="返 回" onclick="javascript:history.back(-1);" style="margin-left: 450px"/></td>
      <!-- <a href="product_list.jsp"><input type="button" value="返回" style="margin-left: 400px"/></a>     -->
    </div>
  </div>
</div>
</body>
</html>


