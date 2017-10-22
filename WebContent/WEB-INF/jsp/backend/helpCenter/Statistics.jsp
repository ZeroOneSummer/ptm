<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>统计中心-累计统计表</title>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/statics/css/style_1.css"/>

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
	        <tr>
	          <td>1</td>
	          <td>2017-01</td>
	          <td>360,000.00</td>
	          <td>17220,000.00</td>
	          <td>245,000</td>
	          <td>6210,000.00</td>
	        </tr>
	        <tr>
	          <td>2</td>
	          <td>2017-02</td>
	          <td>360,000.00</td>
	          <td>17220,000.00</td>
	          <td>245,000</td>
	          <td>6210,000.00</td>
	        </tr>
	        <tr>
	          <td>3</td>
	          <td>2017-03</td>
	          <td>360,000.00</td>
	          <td>17220,000.00</td>
	          <td>245,000</td>
	          <td>6210,000.00</td>
	        </tr>	        
        </tbody>       
      </table>
      <div style="margin-left: 30px;">
      		共&nbsp;<span>20</span>&nbsp;条&nbsp;
      		第&nbsp;<span>1</span>/<span>3</span>&nbsp;页&nbsp;&nbsp;&nbsp;
        	<a href="">首&nbsp;页</a>&nbsp;
        	<a href="">上一页</a>&nbsp;
        	<a href="">下一页</a>&nbsp;
        	<a href="">末&nbsp;页</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        	跳转到&nbsp;<input size="1"/>&nbsp;页&nbsp;&nbsp;&nbsp;<input type="button" value="跳转"/>
      </div>
    </div>
  </div>
</div>
</body>
</html>


