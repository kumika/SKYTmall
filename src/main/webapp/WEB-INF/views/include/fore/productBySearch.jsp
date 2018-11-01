<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2018/9/30
  Time: 0:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<%--
productsBySearch.jsp 显示产寻结果：
1. 遍历ps，把每个产品的图片，价格，标题等信息显示出来
2. 如果ps为空，则显示 "没有满足条件的产品"--%>
<div class="searchProducts">

    <c:forEach items="${productList}" var="product">
        <div class="productUnit" price="${product.promotePrice}">
            <a href="foreproduct?pid=${product.id}">
                <img class="productImage" src="img/productSingle/${product.firstProductImage.id}.jpg"/>
            </a>
            <span class="productPrice">￥<fmt:formatNumber type="number" value="${product.promotePrice}" minFractionDigits="2"/> </span>
            <a class="productLink" href="foreproduct?pid=${product.id}">
                  ${fn:substring(product.name, 0,50 )}
             </a>

            <a class="tmallLink" href="foreproduct?pid=${product.id}">天猫专卖</a>

            <div class="show1 productInfo">
                <span class="monthDeal">月成交<span class="productDealNumber">${product.saleCount}</span> </span>
                <span class="productReview">评价<span class="productReviewNumber">${product.ReviewCount}</span> </span>
                <span class="wangwang"><img src="img/site/wangwang.png"> </span>
            </div>
        </div>
    </c:forEach>

    <c:if test="${empty productList}">
        <div class="noMatch">没有满足条件的产品</div>
    </c:if>

    <div style="clear:both"></div>

</div>




























