<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  				<title>信息中心-修改信息</title>

 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/statics/css/style_1.css">
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
			var title = frm.title.value;
			var newsType = frm.newsType.value;
			var contentPath = frm.contentPath.value; 
			frm.submit(); 
		}
	</script> 
    
    
    
    <div class="m_right" id="content">
      <div class="mem_tit">修改信息</div>
      <br/>
      		<div style="width:500px; height:300px;margin: auto;background-color: rgba(0,0,0,0.05);">
			<div style="text-align: center;"><h2>修改信息</h2></div>
			<form action="updateNews"  method="post">
				<input type="hidden" name="id" value="${news.id}"/>
			     <table style="margin: auto;">
			  			<tr>
			  				<td>请输入信息新标题：</td>
			  				<td><input type="text" name="title" value="${news.title}" id="title"/></td>
			  			</tr>
			  			<tr>
		       			<td>请选择信息类型：</td>
		       			<td>
		       				<select name="newsType" id="newsType">
		       					<option value="0">选择类型</option>
		       					<option value="1" <c:if test="${news.newsType==1}">selected="selected"</c:if>>公告</option>
		       					<option value="2" <c:if test="${news.newsType==2}">selected="selected"</c:if>>媒体报道</option>
		       				</select>
		       			</td>
		       		</tr>
			  			<tr>
			  				<td>请输入信息新内容：</td>
			  				<td><textarea rows="5" cols="40" id="contentPath" name="contentPath">${news.contentPath}</textarea></td>
			  			</tr>
			  			<tr>
			  				<br/>
		      				<td colspan="2" style="text-align: center;">
		      				<input type="button" value="提 交" onclick="update(document.forms[0])"/>
		      				<input type="button" value="返 回" onclick="history.back(-1)"/></td>
		      			</tr>
			      </table>
		     </form>
		</div>
    </div>
  </div>
</div>
</body>
</html>


