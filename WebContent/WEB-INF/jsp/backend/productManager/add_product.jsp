<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
    
    
    <script type="text/javascript">
	function add(frm) {
		 var produceName = frm.produceName.value;
		 var invTypeId = frm.invTypeId.value;
		 var investor = frm.investor.value;
		 var totalAmount = frm.totalAmount.value;
		 frm.residueAmount.value = frm.totalAmount.value;
		 var residueAmount = frm.residueAmount.value;
		 var invStatus = frm.invStatus.value; 
		  
		 //alert(produceName+"--"+invTypeId+"--"+investor+"--"+totalAmount+"--"+residueAmount+"--"+invStatus);
		 if(!(produceName && invTypeId!=0 && investor && totalAmount && residueAmount && invStatus)){  
       		$("#error").html("* 你还有未填项或未选择项");
       	 }else if(totalAmount < 10000){
       		$("#error").html("* 产品可投金额不能少于10000元");
       	 }else if(totalAmount != residueAmount){
       		$("#error").html("* 产品可投金额和可投余额不相等");
       	 }else{			
			 frm.submit();           
       	 } 
	}		
</script> 
    
    
    
    <div class="m_right" id="content">
      <div class="mem_tit">新增产品</div>
      <br/>
      <form action="addProduct" method="post">
      
	      <table  class="order_tab" style="width:600px; text-align:center; margin-bottom:30px;" >       
	        <tbody>   	
		       
		        <tr>
		          <td>产品名称</td>	 
		          <td><input type="text" id="produceName" name="produceName"/></td>	          
		        </tr>
		        <tr>
		          <td>产品类别</td>	 
		          <td>
			          <select style="width: 143px ;height: 22px" name="invTypeId"" id="invTypeId">
			         	<option value="0">选择类别</option>
			         	<c:forEach items="${type_list}" var="invest_type">         
			         	 <option value="${invest_type.id}" >${invest_type.invTypeName}</option>  
			          	</c:forEach>	 	            
			          </select>
		          </td>	          
		        </tr>
		         <tr style="display: none;">
		          <td>投资人数</td>	 
		          <td><input type="text" id="investor" name="investor" value="0" readonly="readonly"/></td>	          
		        </tr>
		        <tr>
		          <td>本期可投总金额（元）</td>	 
		          <td><input type="text" id="totalAmount" name="totalAmount" placeholder="请输入可投总金额" value="" /></td>	          
		        </tr>
		       <tr style="display: none;">
		          <td>剩余可投金额（元）</td>	 
		          <td><input  type="text" id="residueAmount" name="residueAmount" value="" /></td>	            
		        </tr>
		        <tr style="display: none;">
		          <td>产品投资状态</td>	 
		          <td>
		          	 <input type="hidden" id="invStatus" name="invStatus" value="1"/>
		         	 <input type="text"  value="未发布" readonly="readonly"/>
		          </td>	          
		        </tr>
		        <tr>
		        	<td colspan="2"><font id="error" color="red"></font></td>
		        </tr>
	        </tbody>       
	      </table>
       <input type="button" value="提 交" onclick="add(document.forms[0])" style="margin-left: 410px"/>&nbsp;&nbsp;&nbsp;<input type="button" value="返回" onclick="javascript:history.back(-1);"/>   
      </form> 
    </div>
  </div>
</div>
</body>
</html>


