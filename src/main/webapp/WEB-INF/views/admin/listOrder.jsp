<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" import="java.util.*"%>


<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../include/admin/adminHeader.jsp"%>
<%@include file="../include/admin/adminNavigator.jsp"%>

<script>
    $(function(){
        $("button.orderPageCheckOrderItems").click(function(){
            var oid = $(this).attr("oid");
            $("tr.orderPageOrderItemTR[oid="+oid+"]").toggle();
        });
    });
</script>

<title>订单管理</title>

<div class="workingArea">
  <h1 class=" label label-info">订单管理</h1>
    <br>
    <br>

    <div class="listDataTableDiv">
        <table class="table table-striped table-bordered table-hover  table-condensed">
            <thead>
            <tr class="success">
                <th>ID</th>
                <th>状态</th>
                <th>金额</th>
                <th width="100px">商品数量</th>
                <th width="100px">买家名称</th>
                <th>创建时间</th>
                <th>支付时间</th>
                <th>发货时间</th>
                <th>确认发货时间</th>
                <th width="120px">操作</th>
            </tr>
            </thead>
            <tbody>
                    <c:forEach items="${orders}" var="orders">
                        <tr>
                            <td>${orders.id}</td>
                            <td>${orders.statusDesc}</td>
                            <td>￥<fmt:formatNumber type="number" value="${orders.total}" minFractionDigits="2"/></td>
                            <td align="center">${orders.totalNumber}</td>
                            <td align="center">${orders.user.name}</td>

                            <td><fmt:formatDate value="${orders.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/> </td>
                            <td><fmt:formatDate value="${orders.payDate}" pattern="yyyy-MM-dd HH:mm:ss"/> </td>
                            <td><fmt:formatDate value="${orders.deliveryDate}" pattern="yyyy-MM-dd HH:mm:ss"/> </td>
                            <td><fmt:formatDate value="${orders.confirmDate}" pattern="yyyy-MM-dd HH:mm:ss"/> </td>

                            <td>
                                <button oid="${orders.id}" class="orderPageCheckOrderItems btn btn-primary btn-xs">查看详情</button>

                                <c:if test="${orders.status=='waitDelivery'}">
                                    <a href="admin_order_delivery?id=${orders.id}">
                                        <button class="btn btn-primary btn-xs">发货</button>
                                    </a>
                                </c:if>
                            </td>
                        </tr>

                        <tr class="orderPageOrderItemTR" oid="${orders.id}">
                            <td colspan="10" align="center">
                                <div  class="orderPageOrderItem">
                                    <table width="800px" align="center" class="orderPageOrderItemTable">
                                        <c:forEach items="${orders.orderItems}" var="orderItems">
                                            <tr>
                                                <td align="left">
                                                    <img width="40px" height="40px" src="img/ProductImageSingle/${orderItems.product.firstProductImage.id}.jpg">
                                                </td>

                                                <td>
                                                    <a href="foreproduct?pid=${orderItems.product.id}">
                                                        <span>${orderItems.product.name}</span>
                                                    </a>
                                                </td>
                                                <td align="right">

                                                    <span class="text-muted">${orderItems.number}个</span>
                                                </td>
                                                <td align="right">

                                                    <span class="text-muted">单价：￥${orderItems.product.promotePrice}</span>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </table>
                                </div>
                            </td>

                        </tr>


                   </c:forEach>
            </tbody>
        </table>
    </div>


    <div class="pageDiv">
        <%@include file="../include/admin/adminpage.jsp"%>
    </div>

</div>
<%@ include file="../include/admin/adminFooter.jsp"%>








