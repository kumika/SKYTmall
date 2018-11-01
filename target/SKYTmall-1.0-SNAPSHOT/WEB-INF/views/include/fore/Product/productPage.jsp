<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2018/9/29
  Time: 11:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>

<title>模仿天猫官网 ${product.name}</title>
<div class="categoryPictureInProductPageDiv">
    <img class="categoryPictureInProductPage" src="img/category/${product.category.id}.jpg">
</div>

<div class="productPageDiv">
    <%--单个图片和基本信息--%>
    <%@include file="imgAndInfo.jsp"%>

    <%--评价信息--%>
    <%@include file="productReview.jsp"%>

    <%--详情图片--%>
    <%@include file="productDetail.jsp"%>
</div>


