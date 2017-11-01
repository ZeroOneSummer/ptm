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
		function _go() {
			var pageIndex = $("#pageIndex").val();
			location.href = "productCategory.html?pageIndex=" + pageIndex;
		};
		
		function delInvest_type_json(id){
			var mess=confirm("你确定要删除吗？");
			 if(mess){
				$.ajax({
					type:"GET",//请求类型
					url:"delproduct_category.json?id="+id,//请求的url
					dataType:"json",//ajax接口（请求url）返回的数据类型
					success:function(data){//data：返回数据（json对象）
						if(data){
							alert("删除成功！");
							location.href="productCategory.html";
						}else{
							alert("删除失败！");
							location.href="productCategory.html";
						}
					}
				});  
			} 
	
		}
	</script> 
    
    
    
    
    <div class="m_right" id="content">
      <div class="mem_tit" >产品分类

      <a href="appInvest_type" style="color: red; float: right;  margin-right:230px;margin-bottom:15px ; font-size: 18px;" >添加分类</a>
       </div>  
      <br/>
      <table border="0" class="order_tab" style="width:630px; text-align:center; margin-bottom:30px;" cellspacing="0" cellpadding="0">       
        <tbody>
        <!-- <a href="appInvest_type" style="color: red ;/* float: left; */margin-right: 0px;margin-bottom:20px ; font-size: 18px">添加产品分类</a> -->
        	 <!-- <a href="appInvest_type" style="color: red; margin-right: 0px;margin-bottom:20px ; font-size: 18px;" >添加分类</a> --> 
        	<tr style="font-weight: 700;">
	          <td width="5%">类别ID</td>
	          <td width="5%">类别名称</td>
	          <td width="5%" colspan="2">操作</td>
        	</tr> 
	        
	        <c:forEach var="invest_type" items="${invest_type}" varStatus="status">
				<tr>
					<td>${invest_type.id}</td>								
					<td>${invest_type.invTypeName}</td>
					<td><a href="modifInvest_type?id=${invest_type.id}">修改</a>&nbsp;&nbsp;&nbsp;&nbsp;
					<a href="javascript:delInvest_type_json(${invest_type.id});">删除</a></td>
				</tr>
			</c:forEach>
	     </tbody>
     	 </table>
	        <div style="padding-left: 450px; font-size: 14px;">
				&nbsp;共&nbsp;<span class="pages">${pages.totalCount }</span>&nbsp;条&nbsp;记录&nbsp;&nbsp;&nbsp;&nbsp;第${pages.currentPageNo }&nbsp;页&nbsp;/&nbsp;&nbsp;共${pages.totalPageCount }&nbsp;页&nbsp;
				&nbsp;&nbsp;&nbsp; <a href="productCategory.html?pageIndex=1">首&nbsp;页</a>&nbsp;
				<a
					href="productCategory.html?pageIndex=${pages.currentPageNo-1<1?1:pages.currentPageNo - 1}">上一页</a>&nbsp;
				<a
					href="productCategory.html?pageIndex=${pages.currentPageNo + 1>pages.totalPageCount?pages.totalPageCount:pages.currentPageNo + 1}">下一页</a>&nbsp;
				<a href="productCategory.html?pageIndex=${pages.totalPageCount}">末&nbsp;页</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				跳转到&nbsp;<input size="1" id="pageIndex" />&nbsp;页&nbsp;&nbsp;&nbsp;
				<a href="javascript:_go();"> go </a>
			</div>
    </div>
  </div>
</div>
</body>
</html>


