<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	function add(frm) {
		 var invTypeName = frm.invTypeName.value;	
		  
		 if(!invTypeName){  
            alert("请输入类别名称！");                                	
        }else if(annualYield==00){  
        	alert("请输入年化收益率！");  
       		
        } else if(purchaseMoney==0){
        	alert("请输入起购金额！");  
        	
        }  else if(deadline==0){
        	alert("请输入投资期限！"); 
        } 
		 frm.submit(); 
	}		
</script> 
 
 
 
    <div class="m_right" id="content">
      <div class="mem_tit">增加产品分类</div>
      <br/>
      <form action="addInvest_type"  method="post">
	      <table  class="order_tab" style="width:600px; text-align:center; margin-bottom:30px;" >       
	        <tbody>   	
		      
		        <tr>
		          <td>类别名称</td>	 
		          <td><input type="text" id="invTypeName" name="invTypeName" /></td>	          
		        </tr>      
		        
		        <tr>
		          <td>年化收益率(保留4位小数)</td>	 
		          <td><input type="text" id="annualYield" name="annualYield" /></td>	          
		        </tr>   
		        <tr>
		          <td>起购金额(元)</td>	 
		          <td><input type="text" id="purchaseMoney" name="purchaseMoney" /></td>	          
		        </tr>   
		        <tr>
		          <td>投资期限(天)</td>	 
		          <td><input type="text" id="deadline" name="deadline" /></td>	          
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


