<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2018/9/12
  Time: 17:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/fore/header.jsp"%>
<%@ include file="../include/fore/top.jsp" %>
<%@ include file="../include/fore/search.jsp"%>
<html>
<div class="buyPageDiv">
    <div class="buyFlow">
        <img src="../../../img/site/simpleLogo.png" class="pull-right"/>
        <img src="../../../img/site/buyflow.png" class="pull-right"/>
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
                    <td>手机号码<span class="redStart">*</span> </td>
                    <td><input type="text" name="mobile" placeholder="请输入11位手机号码"></td>
                </tr>
            </tbody>
        </table>
    </div>
</div>
<style>
    div.buyPageDiv{/*结算页面div*/
        margin: 20px auto;
        max-width: 1013px;
    }
    div.address{/*地址div*/
        margin: 20px 5px;
        text-align: left;
    }
    div.addressTip, div.productListTip{/*输入收货地址几个字*/
        color: #333333;
        font-size: 16px;
        font-weight: bold;
        text-align: left;
        margin-bottom: 30px;
    }
    table.addressTable{/*地址信息表格*/
        margin: 20px 20px;
        width: 600px;
        font-size:12px;
    }
    table.addressTable td{/*单元格*/
        color: #333333;
        text-align: right;
        vertical-align: top;
        padding-right: 5px;
        text-align: left;
        height: 30px;
    }
    table.addressTable td.firstColumn{/*第一列*/
        width: 100px;
    }
    table.addressTable td textarea{/*详细地址文本域*/
        border: 1px solid #AFAFAF;
        margin-bottom: 10px;
        width: 400px;
    }
    table.addressTable td input{/*输入框*/
        border: 1px solid #AFAFAF;
        width: 200px;
    }
    span.redStar{/*星号*/
        color: red;
        font-size: 8px;
    }
</style>


<div class="buyPageDiv">
    <div class="productList">
        <div class="productListTip">确认订单信息</div>
        <table class="productListTable">
            <thead>
                <tr>
                    <th class="productListTableFirstColumn" colspan="2">
                        <img src="../../../img/site/tmallbuy.png" class="tmallbuy"/>
                        <a href="#nowhere" class="marketLink">店铺：天猫店铺</a>
                        <a href="#nowhere" class="wangwanglink">
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
                <tr class="orderItemTR">
                    <td class="orderItemFirstTD">
                        <img src="../../../img/productSingle_middle/4206.jpg" width="20px" class="orderItemImg">
                    </td>
                    <td class="orderItemProductInfo">
                        <a href="#nowhere" class="orderItemProductLink">
                            Philips/飞利浦 HR1897/30破壁微榨原汁机 多功能家用果汁榨汁机
                        </a>
                        <img title="支持信用卡支付" src="../../../img/site/creditcard.png">
                        <img title="消费者保障服务,承诺7天退货" src="../../../img/site/7day.png">
                        <img title="消费者保障服务,承诺如实描述" src="../../../img/site/promise.png">
                    </td>
                    <td>
                        <span class="orderItemProductPrice">￥3,514.05</span>
                        <span class="orderItemProductNumber">2</span>
                    </td>
                    <td>
                        <span class="orderItemUnitSum">￥7,028.10</span>
                    </td>
                    <td class="orderItemLastTD" rowspan="5">
                        <label class="orderItemDeliveryLabel">
                            <input type="radio" checked="checked" value="">
                            普通配送
                        </label>
                        <select class="orderItemDeliverySelect">
                            <option>快递 免邮费</option>
                        </select>
                    </td>
                </tr>

                <tr class="orderItemTR">
                    <td class="orderItemFirstTD">
                        <img src="../../../img/productSingle_middle/3796.jpg" width="20px" class="orderItemImg">
                    </td>
                    <td class="orderItemProductInfo">
                        <a href="#nowhere" class="orderItemProductLink">
                            公众智能扫地机器人家用全自动电动清洁地毯擦拖地一体机吸尘器
                        </a>
                        <img title="支持信用卡支付" src="../../../img/site/creditcard.png">
                        <img title="消费者保障服务,承诺7天退货" src="../../../img/site/7day.png">
                        <img title="消费者保障服务,承诺如实描述" src="../../../img/site/promise.png">
                    </td>
                    <td>
                        <span class="orderItemProductPrice">￥2,124.15</span>
                        <span class="orderItemProductNumber">1</span>
                    </td>
                    <td>
                        <span class="orderItemUnitSum">￥2,124.15</span>
                    </td>
                    <td class="orderItemLastTD" rowspan="5">
                        <label class="orderItemDeliveryLabel">
                            <input type="radio" checked="checked" value="">
                            普通配送
                        </label>
                        <select class="orderItemDeliverySelect">
                            <option>快递 免邮费</option>
                        </select>
                    </td>
                </tr>
            </tbody>
        </table>

        <div class="orderItemSumDiv">
            <div class="pull-right">
                <span class="leaveMessageText">给卖家留言:
                    <img src="../../../img/site/leaveMessage.png" class="leaveMessageImg">
                </span>
                <span class="leaveMessageTextareaSpan" style="display: none;">
                    <textarea class="leaveMessageTextarea" name="userMessage"></textarea>
                    <div>
                        <span>还可以输入200个字符</span>
                    </div>
                </span>
            </div>
            <span class="pull-right">店铺合计(含运费): ￥9,152.25</span>
        </div>
    </div>

    <div class="orderItemTotalSumDiv">
        <div class="pull-right">
            <span>实付款：</span>
            <span class="orderItemTotalSumSpan">￥9,152.25</span>
        </div>
    </div>

    <div class="submitOrderDiv">
        <button class="submitOrderButton" type="button">提交订单</button>
    </div>
</div>

<style>
    div.buyPageDiv{/*结算页面div*/
        margin: 20px auto;
        max-width: 1013px;
    }
    div.addressTip, div.productListTip{/*确认订单信息几个字*/
        color: #333333;
        font-size: 16px;
        font-weight: bold;
        text-align: left;
        margin-bottom: 30px;
    }
    table.productListTable{/*产品列表所在table*/
        width: 100%;
        border-collapse: separate;
        font-size:12px;
    }
    table.productListTable th{/*标题栏的每个单元格*/
        color: #999999;
        font-family: 宋体;
        font-weight: normal;
        font-size: 12px;
        text-align: center;
        padding-bottom: 5px;
    }
    table.productListTable tr.rowborder td{/*标题栏下的下划线*/
        background-color: #b2d1ff;
        border-right: 2px solid #fff;
        height: 3px;
    }
    th.productListTableFirstColumn{/*标题栏第一列*/
        text-align: left !important;
    }
    img.tmallbuy{/*天猫图片*/
        width: 15px;
    }
    a.marketLink{/*天猫店铺超链*/
        color: black;
        font-size: 12px;
        font-family: 宋体;
        font-weight: normal;
    }
    a.marketLink:hover{/*天猫店铺超链悬停状态*/
        color: black;
        font-size: 12px;
        text-decoration: underline;
        font-family: 宋体;
        font-weight: normal;
    }
    span.wangwangGif{/*旺旺图标*/
        display: inline-block;
        width: 25px;
        height: 25px;
        background-image:url(http://how2j.cn/tmall/img/site/wangwang.gif);
        background-repeat: no-repeat;
        background-color: transparent;
        background-attachment: scroll;
        background-position: -83px -0px;
        position: relative;
        top: 8px;
        left: 2px;
    }
    tbody.productListTableTbody td{/*产品列表单元格*/
        text-align: center;
    }
    tbody.productListTableTbody td.orderItemFirstTD{/*产品列表第一列*/
        text-align: left;
    }
    tr.orderItemTR td{/*产品信息单元格*/
        border-bottom: 1px solid #E5E5E5;
    }
    tr.orderItemTR td{/*订单项单元格*/
        padding: 10px 0px;
    }
    img.orderItemImg{/*产品图片*/
        width: 50px;
        height: 50px;
        border: 1px solid #E9E9E9;
    }
    td.orderItemProductInfo{/*产品信息*/
        text-align:left !important;
    }
    td.orderItemProductInfo img{/*3个图标*/
        height: 16px;
    }
    a.orderItemProductLink{/*3个图标*/
        color: #666666;
        display: block;
    }
    a.orderItemProductLink:hover{/*产品超链悬停状态*/
        color: #666666;
        text-decoration: underline;
    }
    span.orderItemProductPrice, span.orderItemProductNumber{/*产品价格和产品数量*/
        color: #000000;
    }
    span.orderItemUnitSum{/*小计*/
        color: #CC0000;
        font-weight: bold;
    }
    td.orderItemFirstTD, td.orderItemLastTD{/*第一列和最后一列*/
        border-bottom: 0px solid black !important;
    }
    label.orderItemDeliveryLabel{/*普通配送字样*/
        color: #666666;
        font-family: 宋体;
        font-size: 12px;
        font-weight: normal;
    }
    select.orderItemDeliverySelect{/*配送方式下拉*/
        width: 100px;
        height: 23px;
    }
    div.orderItemSumDiv{/*v配送方式下拉*/
        padding: 20px;
        border-top: 2px solid #B4D0FF;
        background-color: #F2F6FF;
        height: 50px;
    }
    div.orderItemSumDiv span{/*v合计div下所有的span*/
        color: #999999;
    }
    span.leaveMessageText{/*v给卖家留言*/
        display: inline-block;
        margin-right: 10px;
        float: left;
    }
    div.orderItemTotalSumDiv{/*实付款所在div*/
        margin: 40px;
        height: 40px;
    }
    div.submitOrderDiv{/*提交订单按钮所在div*/
        height: 40px;
        margin: 20px 0px;
    }
    div.orderItemTotalSumDiv span{/*实付款字样*/
        color: #999999;
    }
    span.orderItemTotalSumSpan{/*实付款金额*/
        color: #C40000 !important;
        font-size: 22px;
        font-weight: bold;
        border-bottom: 1px dotted #F2F6FF;
    }
    button.submitOrderButton{/*提交订单按钮*/
        border: 1px solid #C40000;
        background-color: #C40000;
        text-align: center;
        line-height: 40px;
        font-size: 14px;
        font-weight: 700;
        color: white;
        float: right;
        display:inline-block;
        margin:0px 10px;
        width:180px;
        height: 40px;
    }
    body{/*整个body*/
        font-size: 12px;
        font-family: Arial;
    }
</style>


</html>


<%@include file="../include/fore/footTotal.jsp"%>