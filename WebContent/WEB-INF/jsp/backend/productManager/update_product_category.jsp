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
    <script type="text/javascript">
		function update(frm){
			var id = frm.id.value;
			var invTypeName = frm.invTypeName.value;
			var annualYield = frm.annualYield.value;
			var purchaseMoney = frm.purchaseMoney.value;
			var deadline = frm.deadline.value;
			frm.submit(); 
		}
	</script> 
       
    <div class="m_right" id="content">
      <div class="mem_tit">修改产品分类</div>
      <br/>
      <form action="updateInvest_type" method="post">
      <input type="hidden" name="id" value="${invest_type.id}"/>
	      <table border="0" class="order_tab" style="width:630px; text-align:center; margin-bottom:30px;" cellspacing="0" cellpadding="0">       
	        <tbody>
	        	<tr>
		          <td width="5%">类别ID</td>	 
		          <td width="8%"><input value="1" readonly="readonly"  name="id" value="${invest_type.id}"/></td>	          
		        </tr>
		        <tr>
		          <td>类别名称</td>	 
		          <td><input id="invTypeName" name="invTypeName" value="${invest_type.invTypeName }"/></td>	          
		        </tr>    
		        
		        <tr>
		          <td>年化收益率(保留4位小数)</td>	 
		          <td><input id="annualYield" name="annualYield" value="${invest_type.annualYield }"/></td>	          
		        </tr>  
		        <tr>
		          <td>起购金额(元)</td>	 
		          <td><input id="purchaseMoney" name="purchaseMoney" value="${invest_type.purchaseMoney }"/></td>	          
		        </tr>  
		        <tr>
		          <td>投资期限(天)</td>	 
		          <td><input id="deadline" name="deadline" value="${invest_type.deadline }"/></td>	          
		        </tr>  
		                    
	        </tbody>       
	      </table> 
      	<input type="button" value="提 交" onclick="update(document.forms[0])"  style="margin-left: 410px"/>&nbsp;&nbsp;&nbsp;<input type="button" value="返回" onclick="javascript:history.back(-1);"/>   
      </form> 
    </div>
  </div>
</div>
</body>
</html>


