<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  				<title>用户中心-用户列表</title>

 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/statics/css/style_1.css">

<script type="text/javascript">
	function _go() {
		var pageIndex = $("#pageIndex").val();
		location.href = "userList.html?pageIndex=" + pageIndex;
	};
</script>

</head>

<body>

<div class="i_bg bg_color">
<div style="text-align: center;line-height: 50px;"><h1>后&nbsp;台&nbsp;管&nbsp;理&nbsp;页&nbsp;面</h1></div>
  <!--Begin 用户中心 Begin -->
  <div class="m_content">
    <%@include file="../common/left.jsp" %>
    <div class="m_right" id="content">
      <div class="mem_tit">用户列表</div>
      <br>
      <table border="0" class="order_tab" style="width:930px; text-align:center; margin-bottom:30px;" cellspacing="0" cellpadding="0">
        <tbody>
       <tr style="font-weight: 700;">
          <td width="10%">用户编号</td>
          <td width="10%">登录名</td>
          <td width="10%">姓&nbsp;名</td>
          <td width="10%">用户类型</td>
        </tr> 
        <c:forEach var="userList" items="${userList}" varStatus="status">
			<tr>
				<td>${userList.id}</td>
				<td>${userList.loginName}</td>
				<td>${userList.userName }</td>
				<td>
					<c:if test="${userList.userType==1}">管理员用户</c:if> 
					<c:if test="${userList.userType==2}">普通用户</c:if> 					
				</td>	
			</tr>
		</c:forEach>
        </tbody>
      </table>
  
   <div style="padding-left: 600px; font-size: 14px;">
      		&nbsp;共&nbsp;<span class="pages">${pages.totalCount }</span>&nbsp;条&nbsp;记录&nbsp;&nbsp;&nbsp;&nbsp;第${pages.currentPageNo }&nbsp;页&nbsp;/&nbsp;&nbsp;共${pages.totalPageCount }&nbsp;页&nbsp;&nbsp;
      		&nbsp;&nbsp;&nbsp;
        	<a href="userList.html?pageIndex=1">首&nbsp;页</a>&nbsp;
        	<a href="userList.html?pageIndex=${pages.currentPageNo-1<1?1:pages.currentPageNo - 1}">上一页</a>&nbsp;&nbsp;
        	<a href="userList.html?pageIndex=${pages.currentPageNo + 1>pages.totalPageCount?pages.totalPageCount:pages.currentPageNo + 1}">下一页</a>&nbsp;&nbsp;
        	<a href="userList.html?pageIndex=${pages.totalPageCount}">末&nbsp;页</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        	跳转到&nbsp;<input size="1" id="pageIndex" />&nbsp;页&nbsp;&nbsp;&nbsp;<a href="javascript:_go();" > go </a>
      </div>
   
   
   
  
    </div>
 </div>
</div>
</body>
</html>
