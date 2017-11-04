<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>修改产品</title>

 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/statics/css/style_1.css"/>
 <%--  <script src="${ctx}/statics/js/backend/backend.js"></script> --%>
</head>
<body>


<div class="i_bg bg_color">
<div style="text-align: center;line-height: 50px;"><h1>后&nbsp;台&nbsp;管&nbsp;理&nbsp;页&nbsp;面</h1></div>
  <!--Begin 用户中心 Begin -->
  <div class="m_content">
    <%@include file="../common/left.jsp" %>
    
    <script type="text/javascript">
		function update(frm){
			//alert("金泰"); 
			var produceName = frm.produceName.value;
			var invTypeId = frm.invTypeId.value;
			var investor = frm.investor.value;			
			var totalAmount = frm.totalAmount.value;
			//alert(totalAmount); 
			frm.submit(); 
		}
	</script> 
    
  
    <div class="m_right" id="content">
      <div class="mem_tit">修改产品信息</div>
      <br/>
      <form action="updateInvest_product" method="post">
     	 <input type="hidden" name="id" value="${product.id}"/>
	      <table  class="order_tab" style="width:600px; text-align:center; margin-bottom:30px;" >       
	        <tbody>   	
		        
		        <c:if test="${product.invStatus == 1}">
		        <tr>
		          <td>产品名称</td>	 
		          <td><input value="${product.produceName}"  name="produceName" id="produceName" /></td>	          
		        </tr>
		        
		         <tr>
		          <td>产品类别</td>	 
		          <td>
			          <select style="width: 143px ;height: 22px" name="invTypeId"" id="invTypeId">
			         	<option value="${product.invest_type.id}">原产品类别--${product.invest_type.invTypeName}</option>
			         	<c:forEach items="${type_list}" var="invest_type">         
			         	 <option value="${invest_type.id}" >${invest_type.invTypeName}</option>  
			          	</c:forEach>	 	            
			          </select>
		          </td>	          
		        </tr>
		        
		         <tr style="display: none;">
		          <td>投资人数</td>	 
		          <td><input type="text" id="investor" name="investor" value="${product.investor}"/></td>	          
		        </tr>
		        <tr>
		          <td>本期可投总金额（元）</td>	 
		          <td><input value="${product.totalAmount}" name="totalAmount" id="totalAmount" /></td>	          
		        </tr>
		        </c:if>
	        </tbody>       
	      </table>
      	  <input type="button" value="提 交" onclick="update(document.forms[0]) " style="margin-left: 410px"/>&nbsp;&nbsp;&nbsp;
      	  <input type="button" value="返回" onclick="javascript:history.back(-1);"/> 
      	 
      	  
      </form> 
    </div>
  </div>
</div>
</body>
     
</html>


