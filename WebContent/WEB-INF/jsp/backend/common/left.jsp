<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="${pageContext.request.contextPath}/statics/js/jquery.min.js"></script>
<div class="m_left">
    <div class="left_n">管理中心</div>
    <div class="left_m">
        <div class="left_m_t t_bg1" style="font-weight: 700;">用户中心</div>
        <ul>
            <li><a href="userList.html" >用户列表</a></li>
        	
        </ul>
    </div>
    <div class="left_m">
        <div class="left_m_t t_bg2" style="font-weight: 700;">产品中心</div>
        <ul>
            <li><a href="productCenter.html"  >产品信息</a></li>
            	<li><a href="productCategory.html">产品分类</a></li>
        </ul>
    </div>
    <div class="left_m">
        <div class="left_m_t t_bg2" style="font-weight: 700;">积分商城</div>
        <ul>
            <li><a href="pocketstamps.html">口袋券列表</a></li>
            <li><a href="shop.html" >商品列表</a></li>
            <li><a href="shopParticulars.html" >商城交易详情表</a></li>
        </ul>
    </div>
    <div class="left_m">
        <div class="left_m_t t_bg2" style="font-weight: 700;">信息中心</div>
        <ul>
            <li><a href="Information.html">信息列表</a></li>
            <li><a href="beingpushed.html">消息推送</a></li>
        </ul>
    </div>
     <div class="left_m">
        <div class="left_m_t t_bg2" style="font-weight: 700;">统计中心</div>
        <ul>
            <li><a href="statistics.html">累计统计表</a></li>

        </ul>
    </div>
     
</div>