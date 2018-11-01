<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2018/9/12
  Time: 23:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/fore/header.jsp"%>
<%@ include file="../include/fore/top.jsp"%>
<html>
<div class="confirmPayPageDiv">
    <div class="confirmPayImageDiv">
        <img src="img/site/confirmPayFlow.png"/>
        <div class="confirmPayTime1">
            2016-09-14 11:14:45
        </div>
        <div class="confirmPayTime2">
            2016-09-14 11:14:47
        </div>
        <div class="confirmPayTime3">
            yyyy-MM-dd HH:mm:ss
        </div>
    </div>

    <div class="confirmPayOrderInfoDiv">
        <div class="confirmPayOrderInfoText">我已收到货，同意支付宝付款</div>
    </div>
    <div class="confirmPayOrderItemDiv">
        <div class="confirmPayOrderItemText">
            订单信息
        </div>
        <table class="confirmPayOrderItemTable">
            <thead>
            <tr>
                <th colspan="2">宝贝</th>
                <th width="120px">单价</th>
                <th width="120px">数量</th>
                <th width="120px">商品总价</th>
                <th width="120px">运费</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td><img src="../../../img/productSingle_middle/5848.jpg" width="50px"></td>
                <td class="confirmPayOrderItemProductLink">
                    <a href="#nowhere">罗宾 钢带女表 女士腕表 水钻夜光防水石英表 潮流时尚复古手表女</a>
                </td>
                <td>￥990.00</td>
                <td>1</td>
                <td><span class="conformPayProductPrice">￥792.00</span> </td>
                <td><span>快递 ： 0.00 </span> </td>
            </tr>
            <tr>
                <td><img src="../../../img/productSingle_middle/3676.jpg" width="50px"></td>
                <td class="confirmPayOrderItemProductLink">
                    <a href="#nowhere">科沃斯地宝凌云扫地机器人WiFi智能家用吸尘器超薄全自动洗擦地机</a>
                </td>
                <td>￥5,680.00</td>
                <td>1</td>
                <td><span class="conformPayProductPrice">￥3,692.00</span> </td>
                <td><span>快递 ： 0.00 </span> </td>
            </tr>
            </tbody>
        </table>
        <div class="confirmPayOrderItemText pull-right">
            实付款：<span class="confirmPayOrderItemSumPrice">￥4,484.00</span>
        </div>
    </div>
</div>

<style>
    body,table{/*body以及表格*/
        font-size: 12px;
        font-family: Arial;
    }
    div.confirmPayPageDiv{/*确认支付div*/
        max-width: 1013px;
        margin: 10px auto;
    }
    div.confirmPayImageDiv{/*确认支付图片所在div*/
        margin:5px auto 80px auto;
        width: 900px;
        position: relative;
    }
    div.confirmPayImageDiv div{/*时间信息所在div*/
        color: #999999;
    }
    div.confirmPayTime3{/*卖家发货时间*/
        position: absolute;
        top: 100px;
        left: 400px;
    }
    div.confirmPayTime2{/*付款到支付宝时间*/
        position: absolute;
        top: 100px;
        left: 190px;
    }
    div.confirmPayTime1{/*拍下商品时间*/
        position: absolute;
        top: 100px;
        left: -20px;
    }
    div.confirmPayOrderInfoText{/*同意付款字样*/
        margin: 10px 10px 0px 10px;
        font-size: 16px;
        font-weight: bold;
        color: black;
        padding-bottom: 15px;
        border-bottom: 1px solid #ADC8E6;
    }
    div.confirmPayOrderItemDiv{/*订单项列表div*/
        margin: 0px 20px;
    }
    div.confirmPayOrderItemText{/*v订单信息字样*/
        margin: 20px 10px;
        font-size: 14px;
        font-weight:normal;
        color: black;
    }
    table.confirmPayOrderItemTable{/*订单项列表所在表格*/
        border: 1px solid #DDDDDD;
        width: 100%;
    }
    table.confirmPayOrderItemTable thead{/*v表格的标题部分*/
        background-color: #E8F2FF;
        height: 33px;
    }
    table.confirmPayOrderItemTable tr{/*表格的每一行*/
        border: 1px solid #DDDDDD;
    }
    table.confirmPayOrderItemTable th, table.confirmPayOrderItemTable td{/*v单元格*/
        text-align: center;
    }
    table.confirmPayOrderItemTable td{/*订单项列表单元格*/
        padding: 20px;
    }
    td.confirmPayOrderItemProductLink{/*产品连接*/
        text-align: left !important;
    }
    span.conformPayProductPrice{/*产品单价*/
        font-size: 18px;
        font-weight: bold;
        color: #666666;
    }
    span.confirmPayOrderItemSumPrice{/*产品总价*/
        color: #C40000;
    }
    a{/*所有超链*/
        color:#999;
    }
    a:hover{/*鼠标悬停*/
        text-decoration:none;
        color: #C40000;
    }
</style>


<div class="confirmPayPageDiv">
    <div class="confirmPayOrderDetailDiv">
        <table class="confirmPayOrderDetailTable">
            <tbody>
            <tr>
                <td>订单编号：</td>
                <td>201609141114454899001 <img width="23px" src="../../../img/site/confirmOrderTmall.png"></td>
            </tr>
            <tr>
                <td>卖家昵称：</td>
                <td>天猫商铺 <span class="confirmPayOrderDetailWangWangGif"> </span></td>
            </tr>
            <tr>
                <td>收货信息： </td>
                <td>北京市 朝阳区 天安门 4栋二单元 490，朝阳群众， 15800000000，10000 </td>
            </tr>
            <tr>
                <td>成交时间：</td>
                <td>2016-09-14 11:14:45</td>
            </tr>
            </tbody>
        </table>
    </div>
    <div class="confirmPayButtonDiv">
        <div class="confirmPayWarning">请收到货后，再确认收货！否则您可能钱货两空！</div>
        <a href="#nowhere">
            <button class="confirmPayButton">确认支付</button></a>
    </div>
</div>

<style>
    div.confirmPayPageDiv{/*确认收货div*/
        max-width: 1013px;
        margin: 10px auto;
    }
    div.confirmPayOrderDetailDiv{/*订单详情div*/
        margin: 40px;
    }
    table.confirmPayOrderDetailTable{/*订单详情table*/
        width: 100%;
        border-top: 1px solid #DDDDDD;
    }
    table.confirmPayOrderDetailTable td{/*单元格*/
        padding: 8px;
        color: black;
        font-size: 14px;
    }
    span.confirmPayOrderDetailWangWangGif{/*旺旺图标*/
        display: inline-block;
        width: 67px;
        height: 22px;
        background-image:url(http://how2j.cn/tmall/img/site/wangwang.gif);
        background-repeat: no-repeat;
        background-color: transparent;
        position: relative;
        left: 2px;
    }
    div.confirmPayButtonDiv{/*确认按钮div*/
        border: 1px solid #F58B0F;
        margin: 20px;
    }
    div.confirmPayWarning{/*支付警告*/
        margin: 20px 80px;
        font-size: 18px;
        color: red;
        font-weight: bold;
    }
    button.confirmPayButton{/*确认按钮*/
        margin: 20px 80px;
        width:67px;
        height: 30px;
        border: 1px solid #E67C00;
        background-color: #F4A21D;
        border-radius: 4px;
        color: white;
        font-size:12px;
    }
    button.confirmPayButton:hover{/*确认按钮悬停状态*/
        background-color: #F6AE30;
    }
</style>
</html>

<%@include file="../include/fore/footTotal.jsp"%>
