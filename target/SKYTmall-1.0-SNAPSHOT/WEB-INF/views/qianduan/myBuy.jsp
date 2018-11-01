<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2018/9/12
  Time: 14:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/fore/header.jsp"%>
<%@ include file="../include/fore/top.jsp" %>
<%@ include file="../include/fore/search.jsp"%>
<html>
<div class="boughtDiv">
    <div class="orderType">
        <div class="selectedOrderType">
            <a href="#nowhere" orderstatus="all">所有订单</a>
        </div>
        <div>
            <a href="#nowhere" orderstatus="waitPay">待付款</a>
            <a href="#nowhere" orderstatus="waitDelivery">待发货</a>
            <a href="#nowhere" orderstatus="waitConfirm">待收货</a>
            <a href="#nowhere" orderstatus="waitReview" class="noRightborder">待收货</a>
            <div class="orderTypeLastOne">
            </div>
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
    </div>
</div>

<style>
    div.boughtDiv{/*订单页面*/
        max-width: 1013px;
        /*最大宽度1013，有时候用户的分辨率很高，比如1600x1200,使用1013可以使订单页面这一块仅仅显示在中间，而不是平铺满整个屏幕，那样不好看*/
        margin: 10px auto;
        /*本元素居中显示*/
    }
/*    各种订单类型*/
    div.orderType div{
        border-bottom: 2px solid #E8E8E8;
        /*下边框*/
        float: left;
        /*向左漂浮，这样可以水平摆放*/
    }
/*    订单类型超链*/
    div.orderType a{
        border-right: 1px solid #E8E8E8;
        /*右边框*/
        display:inline-block;
        /*显示为内联块，这样下外边距才能生效*/
        font-size: 16px;
        /*字体大小: 16px*/
        font-weight: bold;
        /*粗体*/
        color: black;
        /*字体颜色: black*/
        margin-bottom: 10px;
        /*下外边距*/
        padding: 0px 20px;
        /*左右内边距*/
        text-decoration: none;
        /*无下划线*/
    }
/*    订单类型超链鼠标悬浮*/
    div.orderType a:hover{
        color: #C40000;
        /*字体颜色: #C40000*/
        text-decoration: none;
        /*无下划线*/
    }
/*    选中的订单类型div*/
    div.orderType div.selectedOrderType{
        border-bottom: 2px solid #C40000;
        /*下边框*/
    }
/*    选中的订单类型超链*/
    div.orderType div.selectedOrderType a{
        color: #C40000;
        /*字体颜色: #C40000*/
    }
/*    右边的空的div*/
    div.orderTypeLastOne{
        overflow: hidden;
        /*隐藏滚动条*/
        float: none !important;
        /*取消浮动，就会自动出现在右边，并且把剩下的占满*/
        border-bottom: 2px solid #E8E8E8;
        /*下边框*/
        height:35px;
        /*高度:35px*/
    }
/*    待评估超链*/
    a.noRightborder{
        border-right-width:0px !important;
        /*去掉右边框*/
    }
/*    订单列表标题所在表格*/
    table.orderListTitleTable{
        border: 1px solid #E8E8E8;
        /*边框*/
        width: 100%;
        /*宽度: 100%*/
        margin: 20px 0px;
        /*上下外边距*/
        background-color: #F5F5F5;
        /*背景色: #F5F5F5*/
        text-align: center;
        /*文本水平居中*/
        font-size:12px;
        /*字体大小12px*/
    }
/*    订单列表标题*/
    table.orderListTitleTable td{
        padding: 12px 0px;
        /*垂直内边距*/
    }
</style>

<div class="boughtDiv">
    <div class="orderListItem">
        <table oid="946" orderstatus="waitReview" class="orderListItemTable">
            <tbody>
                <tr class="orderListItemFirstTR">
                    <td colspan="2">
                        <b>2016-09-12 17:00:41</b>
                        <span>订单号: 20160912170041674794</span>
                    </td>
                    <td colspan="2">
                        <img src="../../../img/site/orderItemTmall.png">天猫商城
                    </td>
                    <td colspan="1">
                        <a href="#nowhere" class="wangwanglink">
                            <div class="orderItemWangWangGif"></div>
                        </a>
                    </td>
                    <td class="orderItemDeleteTD">
                        <a href="#nowhere" oid="946" class="deleteOrderLink">
                            <span class="orderListItemDelete glyphicon glyphoneicon-trash"></span>
                        </a>
                    </td>
                </tr>

                <tr class="orderItemProductInfoPartTR">
                    <td class="orderItemProductInfoPartTD">
                        <img width="80" height="80" src="../../../img/productSingle_middle/3796.jpg">
                    </td>
                    <td class="orderItemProducInfoPartTD">
                        <div class="orderListItemProductLinkOutDiv">
                            <a href="#nowhere">
                                公众智能扫地机器人家用全自动电动清洁地毯擦拖地一体机吸尘器
                            </a>
                            <div class="orderListItemProductLinkInnerDiv">
                                <img title="支持信用卡支付" src="../../../img/site/creditcard.png"/>
                                <img title="消费者保障服务,承诺7天退货" src="../../../img/site/7day.png"/>
                                <img title="消费者保障服务,承诺如实描述" src="../../../img/site/promise.png"/>
                            </div>
                        </div>
                    </td>
                    <td width="100px" class="orderItemProductInfoPartTD">
                        <div class="orderListITemProductOriginalPrice">
                            ￥2,499.00
                        </div>
                        <div class="orderListItemProductPrice">
                            ￥2,124.15
                        </div>
                    </td>
                    <td width="100px" valign="top" class="orderListItemNumberTD orderItemOrderInfoPartTD" rowspan="1">
                        <span class="orderListItemNumber">1</span>
                    </td>
                    <td width="120px" valign="top" class="orderListItemProductRealPriceTD orderItemOrderInfoPartTD"  rowspan="1">
                          <div class="orderListItemProductRealPrice">
                             ￥2,124.15
                          </div>
                          <div class="orderListItemPriceWithTransport">
                             (含运费：￥0.00)
                          </div>
                    </td>

                    <td width="100px" valign="top" class="orderListItemButtonTD orderItemOrderInfoPartTD" rowspan="1">
                        <a href="#nowhere">
                            <button class="orderListItemReview">评价</button>
                        </a>
                    </td>
                </tr>
            </tbody>
        </table>

        <table oid="945" orderstatus="waitConfirm" class="orderListItemTable">
            <tbody>
            <tr class="orderListItemFirstTR">
                <td colspan="2">
                    <b>2018-09-12 17:00:33</b>
                    <span>订单号: 201609121700333128784</span>
                </td>
                <td colspan="2">
                    <img src="../../../img/site/orderItemTmall.png">天猫商城
                </td>
                <td colspan="1">
                    <a href="#nowhere" class="wangwanglink">
                        <div class="orderItemWangWangGif"></div>
                    </a>
                </td>
                <td class="orderItemDeleteTD">
                    <a href="#nowhere" oid="946" class="deleteOrderLink">
                        <span class="orderListItemDelete glyphicon glyphoneicon-trash"></span>
                    </a>
                </td>
            </tr>

            <tr class="orderItemProductInfoPartTR">
                <td class="orderItemProductInfoPartTD">
                    <img width="80" height="80" src="../../../img/productSingle_middle/3796.jpg">
                </td>
                <td class="orderItemProducInfoPartTD">
                    <div class="orderListProductLinkOutDiv">
                        <a href="#nowhere">
                            ULIFE原创信封包男个性真皮手包男士手拿包休闲男包手抓包拉链潮
                        </a>
                        <div class="orderListItemProductLinkInnerDiv">
                            <img title="支持信用卡支付" src="../../../img/site/creditcard.png"/>
                            <img title="消费者保障服务,承诺7天退货" src="../../../img/site/7day.png"/>
                            <img title="消费者保障服务,承诺如实描述" src="../../../img/site/promise.png"/>
                        </div>
                    </div>
                </td>
                <td width="100px" class="orderItemProductInfoPartTD">
                    <div class="orderListItemProductOriginalPrice">
                        ￥1,188.00
                    </div>
                    <div class="orderListItemProductPrice">
                        ￥1,128.60
                    </div>
                </td>
                <td width="100px" valign="top" class="orderListItemNumberTD orderItemOrderInfoPartTD" rowspan="1">
                    <span class="orderListItemNumber">1</span>
                </td>
                <td width="120px" valign="top" class="orderListItemProductRealPriceTD orderItemOrderInfoPartTD"  rowspan="1">
                    <div class="orderListItemProductRealPrice">
                        ￥1,128.60
                    </div>
                    <div class="orderListItemPriceWithTransport">
                        (含运费：￥0.00)
                    </div>
                </td>

                <td width="100px" valign="top" class="orderListItemButtonTD orderItemOrderInfoPartTD" rowspan="1">
                    <a href="#nowhere">
                        <button class="orderListItemConfirm">确认收货</button>
                    </a>
                </td>
            </tr>
            </tbody>
        </table>
    </div>
</div>
<style>
    div.boughtDiv{/*订单页面div*/
        max-width: 1013px;
        /*最大宽度1013，有时候用户的分辨率很高，
        比如1600x1200,使用1013可以使订单页面这一块仅仅显示在中间，
        而不是平铺满整个屏幕，那样不好看*/
        margin: 10px auto;
        /*本元素居中显示*/
    }
    table.orderListItemTable{/*订单项目所在表格*/
        border: 2px solid #ECECEC;
        width: 100%;
        margin: 20px 0px;
        font-size:12px;
    }
    table.orderListItemTable:hover {/*表格悬停状态*/

        border: 2px solid #aaa !important;
    }
    table.orderListItemTable td{/*单元格*/
        padding: 8px 10px;/*内边距*/
    }
    tr.orderListItemFirstTR{/*标题行*/
        background-color: #F1F1F1;
    }
    div.orderItemWangWangGif{/*旺旺图标*/
        display: inline-block;/*显示为内联，既可以设置大小，又能够不换行*/
        width: 67px;
        height: 22px;
        /*//不知道用什么连接，是要上传到服务器上的，还是文件夹里面的*/
        background-image:url(http://how2j.cn/tmall/img/site/wangwang.gif);/*背景图片*/
        background-repeat: no-repeat;/*不重复*/
        background-color: transparent;/*背景色: transparent*/
        background-attachment: scroll;/*滚动背景图片*/
        background-position: -0px -0px;/*取背景图片左上角*/
        position: relative;
        top: 0px;
        left: 2px;
    }
    td.orderItemDeleteTD{/*删除列*/
        text-align: right;/*文本居右*/
    }
    span.orderListItemDelete{/*删除按钮*/
        display: inline-block;/*显示为内联，既可以设置大小，又能够不换行*/
        margin: 0px 10px;
        color: #999999;
        font-size: 16px;
    }
    div.orderListItemProductLinkOutDiv{/*产品连接外部div*/
        position: relative;
        height: 80px;
    }
    div.orderListItemProductLinkInnerDiv{/*三个图标所在div*/
        position: absolute;
        bottom: 0px;
    }
    div.orderListItemProductOriginalPrice{/*原始价格*/
        color: #999999;
        font-size: 14px;
    }
    div.orderListItemProductPrice{/*促销价格*/
        color: #3C3C3C;
        font-size: 14px;
    }
    td.orderListItemNumberTD{/*数量所在td*/
        text-align: center;
    }
    td.orderItemOrderInfoPartTD{/*订单项所在td*/
        border: solid 1px #ECECEC;
    }
    span.orderListItemNumber{/*数量颜色*/
        color: #3C3C3C;
    }
    td.orderListItemProductRealPriceTD{/*价格td*/
        text-align: center;
    }
    div.orderListItemProductRealPrice{/*价格信息*/
        color: #3C3C3C;
        font-size: 14px;
        font-weight: bold;
    }
    div.orderListItemPriceWithTransport{/*运费*/
        color: #6C6C6C;
        font-size: 12px;
    }
    td.orderListItemButtonTD{/*按钮所在td*/
        text-align: center;
    }
    button.orderListItemReview{/*评价按钮*/
        border: 1px solid #DCDCDC;
        background-color: #fff;
        border-radius: 2px;
        color: #3C3C3C;
        font-size: 12px;
        font-weight: bold;
        padding: 6px 12px;
    }
    button.orderListItemReview:hover{/*评价按钮鼠标悬浮状态*/
        border-color: #C40000;
        color: #C40000;
    }
    button.orderListItemConfirm{/*确认收货按钮
*/
        background-color: #66B6FF;
        border-radius: 2px;
        color: white;
        font-size: 12px;
        font-weight: bold;
        border-width: 0px;
        padding: 6px 12px;
    }
    button.orderListItemConfirm:hover{/*确认收货按钮鼠标悬浮状态*/
        background-color: #118ADB;
    }
    a{/*所有超链*/
        color:#999;
    }
    a:hover{/*超链鼠标悬停*/
        text-decoration:none;
        color: #C40000;
    }
</style>


</html>
<%@include file="../include/fore/footTotal.jsp"%>