<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2018/9/30
  Time: 12:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>

<div class="buyPageDiv">
  <form action="forecreateOrder" method="post">
        <div class="buyFlow">
            <img src="img/site/simpleLogo.png" class="pull-left"/>
            <img src="img/site/buyflow.png" class="pull-right"/>
            <div style="clear: both;"></div>
        </div>

        <div class="address">
            <div class="addressTip">输入收货地址</div>

            <table class="addressTable">
                <tbody>
                <tr>
                    <td class="firstColumn">
                        详细地址
                        <span class="redStar">*</span>
                    </td>
                    <td>
                        <textarea name="address" placeholder="建议您如实填写详细收货地址，例如接到名称，门牌好吗，楼层和房间号等信息"></textarea>
                    </td>
                </tr>

                <tr>
                    <td>邮政编码</td>
                    <td><input type="text" name="post" placeholder="如果您不清楚邮递区号，请填写000000"></td>
                </tr>

                <tr>
                    <td>收货人姓名<span class="redStar">*</span> </td>
                    <td><input type="text" name="receiver" placeholder="长度不超过25个字符"></td>
                </tr>

                <tr>
                    <td>手机号码 <span class="redStar">*</span> </td>
                    <td><input type="text" name="mobile" placeholder="请输入11位手机号码"></td>
                </tr>
                </tbody>
            </table>
        </div>

        <div class="productList">
            <div class="productListTip">确认订单信息</div>
            <table class="productListTable">
                <thead>
                <tr>
                    <th class="productListTableFirstColumn" colspan="2">
                        <img src="img/site/tmallbuy.png" class="tmallbuy"/>
                        <a href="marketLink" class="marketLink">店铺：天猫店铺</a>
                        <a href="wangwanglink" class="wangwanglink">
                            <span class="wangwangGif"></span>
                        </a>
                    </th>
                    <th>单价</th>
                    <th>数量</th>
                    <th>小计</th>
                    <th>配送方式</th>
                </tr>
                <tr class="rowborder">
                    <td colspan="2"></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                </thead>
                <tbody class="productListTableTbody">
                <c:forEach items="${orderItems}" var="orderItem" varStatus="oi">


                <tr class="orderItemTR">
                    <td class="orderItemFirstTD">
                        <img src="img/ProductImage_middle/${orderItem.product.firstProductImage.id}.jpg"  class="orderItemImg">
                    </td>
                    <td class="orderItemProductInfo">
                        <a href="foreproduct?pid=${orderItem.product.id}" class="orderItemProductLink">
                           ${orderItem.product.name}
                        </a>
                        <img title="支持信用卡支付" src="img/site/creditcard.png">
                        <img title="消费者保障服务,承诺7天退货" src="img/site/7day.png">
                        <img title="消费者保障服务,承诺如实描述" src="img/site/promise.png">
                    </td>
                    <td>
                        <span class="orderItemProductPrice">￥<fmt:formatNumber type="number" value="${orderItem.product.promotePrice}" minFractionDigits="2"/> </span>
                        <span class="orderItemProductNumber">${orderItem.number}</span>
                    </td>
                    <td>
                        <span class="orderItemUnitSum">￥<fmt:formatNumber type="number" value="${orderItem.product.promotePrice}" minFractionDigits="2"/> </span>
                    </td>
                    <c:if test="${oi.count == 1}">
                    <td class="orderItemLastTD" rowspan="5">
                        <label class="orderItemDeliveryLabel">
                            <input type="radio" checked="checked" value="">
                            普通配送
                        </label>
                        <select class="orderItemDeliverySelect">
                            <option>快递 免邮费</option>
                        </select>
                    </td>
                    </c:if>
                </tr>
                </c:forEach>

                </tbody>
            </table>

            <div class="orderItemSumDiv">
                <div class="pull-right">
                <span class="leaveMessageText">给卖家留言:
                    <img src="img/site/leaveMessage.png" class="leaveMessageImg">
                </span>
                    <span class="leaveMessageTextareaSpan" style="display: none;">
                    <textarea class="leaveMessageTextarea" name="userMessage"></textarea>
                    <div>
                        <span>还可以输入200个字符</span>
                    </div>
                </span>
                </div>
                <span class="pull-right">店铺合计(含运费): ￥<fmt:formatNumber type="number" value="${total}" minFractionDigits="2"/> </span>
            </div>
        </div>

        <div class="orderItemTotalSumDiv">
            <div class="pull-right">
                <span>实付款：</span>
                <span class="orderItemTotalSumSpan">￥<fmt:formatNumber type="number" value="${total}" minFractionDigits="2"/> </span>
            </div>
        </div>

        <div class="submitOrderDiv">
            <button class="submitOrderButton" type="submit">提交订单</button>
        </div>
    </form>




</div>





