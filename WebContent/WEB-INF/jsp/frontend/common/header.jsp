<%@page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 头部开始 -->
	<!-- 公共css -->
     <link href="${pageContext.request.contextPath}/statics/css/base.css" rel="stylesheet">
     
     <link href="${pageContext.request.contextPath}/statics/css/common.css" rel="stylesheet">
      
     <link href="${pageContext.request.contextPath}/statics/css/general.css" rel="stylesheet">
       
     <link href="${pageContext.request.contextPath}/statics/css/style.css" rel="stylesheet">
     
     <link rel="shortcut icon" href="https://www.koudailc.com/image/site/ico.ico">
        
<div class="p_fixed" id="main-nav">
    <div class="content">
        <div class="f_left logo">
            <a href="javascript:void(0);">
                <img src="${pageContext.request.contextPath}/statics/img/logo.png" title="口袋理财官方网站-专业的移动理财平台" alt="口袋理财">
            </a>
        </div>
        <ul class="f_left" id="slide-nav">
            <li><a href="index.html" class=" on">首页</a></li>
            <li><a href="toInvest.html" class=" _000">我要投资</a></li>
            <li><a target="_blank" href="exchangeShop.html" class=" _000">积分商城</a></li>
            <li class="dropdown-nav _cursor">
                <a class="_000" href="infoList.html">
                    <i>信息披露</i>
                </a>
                <!-- <ul class="dropdown">
                    <li><a href="https://www.koudailc.com/site/about?about_index=1">公司简介</a></li>
                    <li><a href="https://www.koudailc.com/site/about?about_index=2">管理团队</a></li>
                    <li><a href="https://www.koudailc.com/site/security">安全保障</a></li>
                    <li><a href="https://www.koudailc.com/site/about?about_index=6">法律顾问</a></li>
                </ul> -->
            </li>
            <li class="dropdown-nav _cursor">
                <a class="_000" href="javascript:;">
                    <i>帮助中心</i>
                </a>
                <ul class="dropdown">
                    <li><a href="packageProject.html">帮助中心</a></li>
                    <li><a href="publicNews.html">公告中心</a></li>
                    <!-- <li><a href="http://tieba.baidu.com/f?kw=%E5%8F%A3%E8%A2%8B%E7%90%86%E8%B4%A2&ie=utf-8">官方贴吧</a></li> -->
                </ul>
            </li>
        </ul>
        <ul class="f_right" id="slide-nav1">
            <!-- <li><a href="javascript:;" class="_inline_block weixin_dyh"><img src="/image/site/main/weixin_dyh.png" id="weixin_qrcode"></a></li> -->
            <li>
                <a href="javascript:void(0);" class="_inline_block download_app on" style="background: url(https://www.koudailc.com/image/site/index/201611/app_download.png?ver=0622) 0% 50% no-repeat scroll;">
                    <img src="${pageContext.request.contextPath}/statics/img/dl.png" id="download_qrcode" style="display: none;">下载app
                </a>
            </li>
            
            
            <c:if test="${user == null}">
	            <li class="dropdown-nav _cursor" style="background-color: rgb(255, 255, 255);">               
	                <a class="_000" href="javascript:;">
	                    <i>登录/注册</i>
	                </a>
	                <ul class="dropdown" style="display: none;">	                	
	                    <li><a href="login">请登录</a></li>
	                    <li><a href="register">免费注册</a></li> 	                    
	                </ul>
	            </li>
           </c:if> 
           <c:if test="${user != null}">
	            <li class="dropdown-nav _cursor" style="background-color: rgb(255, 255, 255);">               
	                <a class="_000" href="javascript:;">
	                    <i id="loginName">${user.loginName}</i>
	                    <script type="text/javascript">
	                    	var name=$("#loginName").html();
	                    	var cname=name.substring(0,3)+"****"+name.substring(7);
	                    	$("#loginName").html(cname);
	                    </script>
	                </a>
	                <ul class="dropdown" style="display: none;">	                		                   
	                    <li><a href='/account/my-invest'>我的投资</a></li>
	                    <li><a href='/account/user-center'>账户中心</a></li>
	                    <li><a href='/account/msg-center'>消息中心</a></li>
	                    <li><a href='loginOut'>安全退出</a></li>
	                </ul>
	            </li>
           </c:if>
            
        </ul>
        <div class="clear"></div>
    </div>
</div>
<div style="height:55px;"></div>
<!-- 头部结束 -->