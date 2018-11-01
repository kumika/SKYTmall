<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2018/9/29
  Time: 23:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>
<div id="category">
    <div class="categoryPageDiv">
        <img src="img/category/${category.id}.jpg">

        <%@include file="sortBar.jsp"%>
        <%@include file="productByCategory.jsp"%>
    </div>

</div>






















