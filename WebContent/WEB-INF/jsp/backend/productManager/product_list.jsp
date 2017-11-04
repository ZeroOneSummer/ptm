<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  				<title>产品中心-产品信息</title>

 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/statics/css/style_1.css"/>
 <%--  <script src="${ctx}/statics/js/backend/backend.js"></script> --%>
<script type="text/javascript">
		function _go() {
			var pageIndex = $("#pageIndex").val();
			location.href = "productCenter.html?pageIndex=" + pageIndex;
		};
		
		function delaProduct_json(id){
			var mess=confirm("你确定要删除吗？");
			 if(mess){
				$.ajax({
					type:"GET",//请求类型
					url:"delInvestProduct.json?id="+id,//请求的url
					dataType:"json",//ajax接口（请求url）返回的数据类型
					success:function(data){//data：返回数据（json对象）
						if(data){
							alert("删除成功！");
							location.href="productCenter.html";
						}else{
							alert("删除失败！");
							location.href="productCenter.html";
						}
					}
				});  
			} 
	
		}		
		
	</script>


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
        	<a href="appInvest_product" style="color: red ;float: right;margin-right: 80px;margin-bottom:20px ; font-size: 18px">添加产品信息</a>
        	<!-- <a href="add_product.jsp"><input type="button" value="新增" style="float: right;margin-right: 30px;margin-bottom:5px"/></a> -->
        	<tr style="font-weight: 700;">
        	 	<td width="1%">序号</td>
	          <td width="5%">产品ID</td>
	          <td width="8%">产品名称</td>
	          <td width="5%">产品类别</td>
	          <td width="5%">投资状态</td>
	          <td width="10%" colspan="3">操作</td>
        	</tr> 
	        
	        <c:forEach var="invest_product" items="${invest_product}" varStatus="status" >
				<c:if test="${invest_product.invStatus != 1}">
				<tr>
					<td>${status.index + 1 }</td>
					<td>${invest_product.id}</td>
					<td>${invest_product.produceName}</td>
					<td>${invest_product.invTypeId}</td>
					<td><c:if test="${invest_product.invStatus==1}">未发布</c:if> 
						<c:if test="${invest_product.invStatus==2}">可投</c:if> 
						<c:if test="${invest_product.invStatus==3}">已投满</c:if> 
					</td>
					<td><a href="getProduct?id=${invest_product.id }">&nbsp;&nbsp;&nbsp;产品详情</a>&nbsp;&nbsp;&nbsp;&nbsp;
					<a href="javascript:void(0);" style="color: rgba(0,0,0,0.3);">修改</a>&nbsp;&nbsp;&nbsp;&nbsp;
					<a href="javascript:void(0);" style="color: rgba(0,0,0,0.3);">删除</a>
					&nbsp;&nbsp;&nbsp;&nbsp;
					<a href="javascript:void();" style="color: rgba(0,0,0,0.3);">已发布</a> 
					</td>
				</tr>
				</c:if>
				
				<c:if test="${invest_product.invStatus==1}">
				<tr>
					<td>${status.index + 1 }</td>
					<td>${invest_product.id}</td>
					<td>${invest_product.produceName}</td>
					<td>${invest_product.invTypeId}</td>
					<td><c:if test="${invest_product.invStatus==1}">未发布</c:if> 
						<c:if test="${invest_product.invStatus==2}">可投</c:if> 
						<c:if test="${invest_product.invStatus==3}">已投满</c:if> 
					</td>
					<td><a href="getProduct?id=${invest_product.id }">产品详情</a>&nbsp;&nbsp;&nbsp;&nbsp;
					<a href="modifProduct?id=${invest_product.id}" >修改</a>&nbsp;&nbsp;&nbsp;&nbsp;
					<a href="javascript:delaProduct_json(${invest_product.id});" >删除</a>
					&nbsp;&nbsp;&nbsp;&nbsp;
					<a href="changeStatus?id=${invest_product.id}">发布</a> 
					</td>
				</tr>
				</c:if>
			</c:forEach>
       
        </tbody>       
      </table>
      
      <div style="padding-left: 550px; font-size: 14px;">
					&nbsp;共&nbsp;<span class="pages">${pages.totalCount }</span>&nbsp;条&nbsp;记录&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;第${pages.currentPageNo }&nbsp;&nbsp;页/&nbsp;&nbsp;共${pages.totalPageCount }&nbsp;页&nbsp;
					&nbsp;&nbsp;&nbsp; <a href="productCenter.html?pageIndex=1">首&nbsp;页</a>&nbsp;
					<a
						href="productCenter.html?pageIndex=${pages.currentPageNo-1<1?1:pages.currentPageNo - 1}">上一页</a>&nbsp;&nbsp;
					<a
						href="productCenter.html?pageIndex=${pages.currentPageNo + 1>pages.totalPageCount?pages.totalPageCount:pages.currentPageNo + 1}">下一页</a>&nbsp;&nbsp;
					<a href="productCenter.html?pageIndex=${pages.totalPageCount}">末&nbsp;页</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					跳转到&nbsp;<input size="1" id="pageIndex" />&nbsp;页&nbsp;&nbsp;&nbsp;
					<a href="javascript:_go(); "> go </a>
				</div>
      
    </div>
  </div>
</div>
</body>
</html>


