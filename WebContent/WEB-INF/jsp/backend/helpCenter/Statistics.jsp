<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>统计中心-累计统计表</title>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/statics/css/style_1.css"/>

<script type="text/javascript">
	function _go() {
		var pageIndex = $("#pageIndex").val();
		location.href = "statistics.html?pageIndex=" + pageIndex;
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
      <div class="mem_tit">数据统计</div>
      <br/>
      <table border="0" class="order_tab" style="width:930px; text-align:center; margin-bottom:30px;" cellspacing="0" cellpadding="0">       
        <tbody>   	
        	<tr style="font-weight: 700;">
	          <td width="5%">统计ID</td>
	          <td width="5%">月统计时间</td>
	          <td width="8%">本月交易金额（元）</td>
	          <td width="8%">累计交易金额（元）</td>
	          <td width="8%">累计用户数</td>
	          <td width="8%">累计收益（元）</td>
        	</tr> 
	        
	        <c:forEach var="info" items="${info}" varStatus="status">
			<tr>
				<td>${info.id}</td>
				<td>${info.monthStatis}</td>
				<td>${info.tradeAmount }</td>
				<td>${info.totalAmount}</td>	
				<td>${info.userAmount }</td>
				<td>${info.totalIncome}</td>	
			</tr>
			</c:forEach>
	         
        </tbody>       
      </table>
      <div style="margin-left: 30px;">
      		&nbsp;共&nbsp;<span class="pages">${pages.totalCount }</span>&nbsp;条&nbsp;记录&nbsp;${pages.currentPageNo }&nbsp;|&nbsp;${pages.totalPageCount }&nbsp;页&nbsp;
      		&nbsp;&nbsp;&nbsp;
        	<a href="statistics.html?pageIndex=1">首&nbsp;页</a>&nbsp;
        	<a href="statistics.html?pageIndex=${pages.currentPageNo-1<1?1:pages.currentPageNo - 1}">上一页</a>&nbsp;
        	<a href="statistics.html?pageIndex=${pages.currentPageNo + 1>pages.totalPageCount?pages.totalPageCount:pages.currentPageNo + 1}">下一页</a>&nbsp;
        	<a href="statistics.html?pageIndex=${pages.totalPageCount}">末&nbsp;页</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        	跳转到&nbsp;<input size="1" id="pageIndex" />&nbsp;页&nbsp;&nbsp;&nbsp;<a href="javascript:_go();" > go </a>
      </div>
    </div>
  </div>
</div>
</body>
</html>


