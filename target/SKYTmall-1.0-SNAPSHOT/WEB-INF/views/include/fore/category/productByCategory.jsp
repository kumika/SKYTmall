<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2018/9/29
  Time: 23:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%--
    categorycount，这个是用于测试的，
    http://127.0.0.1:8080/tmall_ssm/forecategory?cid=74&categorycount=2
    在访问地址的时候加这个参数
    这样就只显示2个产品，仅供测试使用
--%>
<c:if test="${empty param.categorycount}">
    <c:set var="categorycount" scope="page" value="1000"/>
</c:if>

<c:if test="${!empty param.categorycount}">
    <c:set var="categorycount" scope="page" value="${param.categorycount}"/>
</c:if>
<%--正式代码，上面的是测试--%>
<div class="categoryProducts">
    <c:forEach items="${category.productList}" var="products" varStatus="p">
        <c:if test="${p.count <= categorycount}">
            <div price="${products.promotePrice}" class="productUnit">
                <div class="productUnitFrame">
                    <a href="foreproduct?pid=${products.id}">
                        <img src="img/ProductImage_middle/${products.firstProductImage.id}.jpg" class="productImage"/>
                    </a>
                    <span class="productPrice">￥<fmt:formatNumber type="number" value="${products.promotePrice}" minFractionDigits="2"/> </span>
                    <a href="foreproduct?pid=${products.id}" class="productLink">
                        ${fn:substring(products.name,0,50 )}
                    </a>
                    <a href="foreproduct?pid=${products.id}" class="tmallLink">天猫专卖</a>
                    <div class="show1 productInfo">
                        <span class="monthDeal">月成交<span class="productDealNumber">${products.saleCount}笔</span> </span>
                        <span class="productReview">评价<span class="productReviewNumber">${products.reviewCount}</span> </span>
                        <span class="wangwang">
                                <a href="#nowhere" class="wangwanglink">
                                    <img src="img/site/wangwang.png"/>
                                </a>
                            </span>
                    </div>
                </div>
            </div>
        </c:if>
    </c:forEach>
    <div style="clear:both"></div>
</div>