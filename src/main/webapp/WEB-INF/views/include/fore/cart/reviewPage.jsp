<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2018/9/30
  Time: 22:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>


<div class="reviewDiv">
    <div class="reviewProductInfoDiv">
        <div class="reviewProductInfoImg">
            <img class="reviewProductImg" src="img/ProductImageSingle/${product.firstProductImage.id}.jpg" width="100px" height="100px">
        </div>
        <div class="reviewProductInfoRightDiv">
            <div class="reviewProductInfoRightText">
                ${product.name}
            </div>
            <table class="reviewProductInfoTable">
                <tbody>
                <tr>
                    <td width="75px">价格：</td>
                    <td><span class="reviewProductInfoTablePrice">￥<fmt:formatNumber type="number" minFractionDigits="2" value="${product.originalPrice}"/> </span> 元  </td>
                </tr>
                <tr>
                    <td>配送</td>
                    <td>快递:  0.00</td>
                </tr>
                <tr>
                    <td>月销量:</td>
                    <td><span class="reviewProductInfoTableSellNumber"> ${product.saleCount} </span> 件 </td>
                </tr>
                </tbody>
            </table>
            <div class="reviewProductInfoRightBelowDiv">
                <span class="reviewProductInfoRightBelowImg">
                    <img src="img/site/reviewLight.png"/>
                </span>
                <span class="reviewProductInfoRightBelowText">
                    现在查看的是 您所购买商品的信息于<fmt:formatDate value="${order.createDate}" pattern="yyyy年MM月dd日"/> 下单购买了此商品
                </span>
            </div>
        </div>
        <div style="clear: both;"></div>
    </div>


    <div class="reviewStasticsDiv">
        <div class="reviewStasticsLeft">
            <div class="reviewStasticsLeftTop"></div>
            <div class="reviewStasticsLeftContent">
                累计评价 <span class="reviewStasticsNumber"> ${product.reviewCount}</span>
            </div>
            <div class="reviewStasticsLeftFoot"></div>
        </div>

        <div class="reviewStasticsRight">
            <div class="reviewStasticsRightEmpty"></div>
            <div class="reviewStasticsFoot"></div>
        </div>
    </div>


    <c:if test="${param.showonly==true}">
        <div class="reviewDivlistReviews">
            <c:forEach items="${reviews}" var="review">
                <div class="reviewDivlistReviewsEach">
                    <div class="reviewDate"><fmt:formatDate value="${review.createDate}" pattern="yyyy-MM-dd"/> </div>
                    <div class="reviewContent"> ${review.content}</div>
                    <div class="reviewUserInfo pull-right">${review.user.anonymousName}<span class="reviewUserInfoAnonymous">(匿名)</span> </div>
                </div>
            </c:forEach>
        </div>
    </c:if>
    <%--点击提交评价，就把数据提交到了/foredoreview路径--%>
    <c:if test="${param.showonly!=true}">
        <div class="makeReviewDiv">
            <form method="post" action="foredoreview">
                <div class="makeReviewText">
                    其他买家，需要你的建议哦！
                </div>
                <table class="makeReviewTable">
                    <tbody>
                    <tr>
                        <td class="makeReviewTableFirstTD">评价商品</td>
                        <td><textarea name="content"> </textarea></td>
                    </tr>
                    </tbody>
                </table>
                <div class="makeReviewButtonDiv">
                    <input type="hidden" value="${order.id}" name="oid">
                    <input type="hidden" value="${product.id}" name="pid">
                    <button type="submit">提交评价</button>
                </div>
            </form>
        </div>
    </c:if>

</div>