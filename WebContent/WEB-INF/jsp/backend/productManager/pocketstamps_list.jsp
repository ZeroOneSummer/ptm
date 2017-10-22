<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  				<title>产品中心-产品信息</title>

 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/statics/css/style_1.css"/>
 <%--  <script src="${ctx}/statics/js/backend/backend.js"></script> --%>
</head>
<body>


<div class="i_bg bg_color">
<div style="text-align: center;line-height: 50px;"><h1>后&nbsp;台&nbsp;管&nbsp;理&nbsp;页&nbsp;面</h1></div>
  <!--Begin 用户中心 Begin -->
  <div class="m_content">
    <%@include file="../common/left.jsp" %>
    <div class="m_right" id="content">
      <div class="mem_tit">口袋券列表</div>
      <br/>
      <table border="0" class="order_tab" style="width:930px; text-align:center; margin-bottom:30px;" cellspacing="0" cellpadding="0">       
        <tbody>
        	<a href="add_poketstamps.jsp"><input type="button" value="新增" style="float: right;margin-right: 30px;margin-bottom:5px"/></a>
        	<tr style="font-weight: 700;">
	          <td width="5%">口袋券ID</td>
	          <td width="5%">类型</td>
	          <td width="5%">面值（元）</td>
	          <td width="5%">有效期（天）</td>
	          <td width="5%">使用范围</td>
	          <td width="5%">兑换所需积分</td>
	          <td width="10%" colspan="2">操作</td>
        	</tr> 
	        <tr>
	          <td>1</td>
	          <td>返现券</td>
	          <td>300</td>
	          <td>15</td>
	          <td>用于定期频道15天以上项目</td>
	          <td>30</td>
	          <td><a>删除</a>&nbsp;&nbsp;&nbsp;<a href="update_poketstamps.jsp">修改</a></td>
	        </tr>
	        <tr>
	          <td>2</td>
	          <td>返现券</td>
	          <td>300</td>
	          <td>15</td>
	          <td>用于定期频道15天以上项目</td>
	          <td>30</td>
	          <td><a>删除</a>&nbsp;&nbsp;&nbsp;<a href="update_poketstamps.jsp">修改</a></td>
	        </tr>
	        <tr>
	          <td>3</td>
	          <td>返现券</td>
	          <td>300</td>
	          <td>15</td>
	          <td>用于定期频道15天以上项目</td>
	          <td>30</td>
	          <td><a>删除</a>&nbsp;&nbsp;&nbsp;<a href="update_poketstamps.jsp">修改</a></td>
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


