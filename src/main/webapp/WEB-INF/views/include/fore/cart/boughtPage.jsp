<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2018/9/30
  Time: 21:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>


<div class="boughtDiv">
    <div class="orderType">
        <div class="selectedOrderType"><a href="#nowhere" orderstatus="all">所有订单</a></div>
        <div><a href="#nowhere" orderstatus="waitPay">待付款</a></div>
        <div><a href="#nowhere" orderstatus="waitDelivery">待发货</a></div>
        <div><a href="#nowhere" orderstatus="waitConfirm">待收货</a></div>
        <div><a href="#nowhere" orderstatus="waitReview" class="noRightborder">待评价</a></div>
        <div class="orderTypeLastOne"><a class="noRightborder">&nbsp;</a></div>
    </div>

    <div style="clear:both"></div>

    <div class="orderListTitle">
        <table class="orderListTitleTable">
            <tbody>
            <tr>
                <td>宝贝</td>
                <td width="100px">单价</td>
                <td width="100px">数量</td>
                <td width="100px">实际付款</td>
                <td width="100px">交易操作</td>
            </tr>
            </tbody>
        </table>
    </div>



    <div class="orderListItem">
        <c:forEach items="${orders}" var="order">


            <table oid="${order.id}" orderstatus="${order.status}" class="orderListItemTable">
                <tbody>
                <tr class="orderListItemFirstTR">
                    <td colspan="2">
                        <b><fmt:formatDate value="${order.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/></b>
                        <span>订单号: ${order.orderCode}</span>
                    </td>
                    <td colspan="2">
                        <img src="img/site/orderItemTmall.png">天猫商城
                    </td>
                    <td colspan="1">
                        <a href="#nowhere" class="wangwanglink">
                            <div class="orderItemWangWangGif"></div>
                        </a>
                    </td>
                    <%--<td class="orderItemDeleteTD">
                        <a href="#nowhere" oid="${order.id}" class="deleteOrderLink">
                            <span class="orderListItemDelete glyphicon glyphoneicon-trash"></span>
                        </a>
                    </td>--%>
                    <td class="orderItemDeleteTD">
                        <a class="deleteOrderLink" oid="${order.id}" href="#nowhere">
                            <span  class="orderListItemDelete glyphicon glyphicon-trash"></span>
                        </a>

                    </td>
                </tr>

                <c:forEach items="${order.orderItems}" var="orderItem" varStatus="st">
                    <tr class="orderItemProductInfoPartTR">
                    <td class="orderItemProductInfoPartTD">
                        <img width="80" height="80" src="img/ProductImage_middle/${orderItem.product.firstProductImage.id}.jpg">
                    </td>
                    <td class="orderItemProducInfoPartTD">
                        <div class="orderListItemProductLinkOutDiv">
                            <a href="foreproduct?pid=${orderItem.product.id}">
                               ${orderItem.product.name}
                            </a>
                            <div class="orderListItemProductLinkInnerDiv">
                                <img title="支持信用卡支付" src="img/site/creditcard.png"/>
                                <img title="消费者保障服务,承诺7天退货" src="img/site/7day.png"/>
                                <img title="消费者保障服务,承诺如实描述" src="img/site/promise.png"/>
                            </div>
                        </div>
                    </td>
                    <td width="100px" class="orderItemProductInfoPartTD">
                        <div class="orderListITemProductOriginalPrice">
                            ￥<fmt:formatNumber type="number" minFractionDigits="2" value="${orderItem.product.originalPrice}"/>
                        </div>
                        <div class="orderListItemProductPrice">
                            ￥<fmt:formatNumber type="number" minFractionDigits="2" value="${orderItem.product.promotePrice}"/>
                        </div>
                    </td>

                  <c:if test="${st.count == 1}">

                    <td width="100px" valign="top" class="orderListItemNumberTD orderItemOrderInfoPartTD" rowspan="${fn:length(order.orderItems)}">
                        <span class="orderListItemNumber">${order.totalNumber}</span>
                    </td>
                    <td width="120px" valign="top" class="orderListItemProductRealPriceTD orderItemOrderInfoPartTD"  rowspan="${fn:length(order.orderItems)}">
                        <div class="orderListItemProductRealPrice">
                            ￥<fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${order.total}"/>
                        </div>
                        <div class="orderListItemPriceWithTransport">
                            (含运费：￥0.00)
                        </div>
                    </td>

                    <td width="100px" valign="top" class="orderListItemButtonTD orderItemOrderInfoPartTD" rowspan="${fn:length(order.orderItems)}">
                        <c:if test="${order.status == 'waitConfirm'}">
                            <a href="foreconfirmPay?oid=${order.id}">
                                <button class="orderListItemConfirm">确认收货</button>
                            </a>
                        </c:if>

                        <c:if test="${order.status == 'waitPay'}">
                            <a href="forealipay?oid=${order.id}&total=${order.total}">
                                <button class="orderListItemConfirm">付款</button>
                            </a>
                        </c:if>

                        <c:if test="${order.status == 'waitDelivery'}">

                                <span>待发货</span>

                        </c:if>

                        <c:if test="${order.status == 'waitReview'}">
                            <a href="forereview?oid=${order.id}">
                                <button class="orderListItemReview">评价</button>
                            </a>
                        </c:if>
                    </td>

                  </c:if>

                </tr>
                </c:forEach>

                </tbody>
            </table>


        </c:forEach>
    </div>

</div>

<script>
    var deleteOrder = false;
    var deleteOrderid = 0;

    $(function(){
        $("a[orderStatus]").click(function(){
            var orderStatus = $(this).attr("orderStatus");
            if('all'==orderStatus){
                $("table[orderStatus]").show();
            }
            else{
                $("table[orderStatus]").hide();
                $("table[orderStatus="+orderStatus+"]").show();
            }

            $("div.orderType div").removeClass("selectedOrderType");
            $(this).parent("div").addClass("selectedOrderType");
        });

        $("a.deleteOrderLink").click(function(){
            deleteOrderid = $(this).attr("oid");
            deleteOrder = false;
            $("#deleteConfirmModal").modal("show");
        });

        $("button.deleteConfirmButton").click(function(){
            deleteOrder = true;
            $("#deleteConfirmModal").modal('hide');
        });

        /*点击删除按钮，根据 boughtPage.jsp 中的ajax操作，会访问路径/foredeleteOrder，
        导致ForeController.deleteOrder方法被调用*/
        $('#deleteConfirmModal').on('hidden.bs.modal', function (e) {
            if(deleteOrder){
                var page="foredeleteOrder";
                $.post(
                    page,
                    {"oid":deleteOrderid},
                    function(result){
                        if("success"==result){
                            $("table.orderListItemTable[oid="+deleteOrderid+"]").hide();
                        }
                        else{
                            location.href="loginPage";
                        }
                    }
                );

            }
        })

        $(".ask2delivery").click(function(){
            var link = $(this).attr("link");
            $(this).hide();
            page = link;
            $.ajax({
                url: page,
                success: function(result){
                    alert("卖家已秒发，刷新当前页面，即可进行确认收货")
                }
            });

        });
    });

</script>


