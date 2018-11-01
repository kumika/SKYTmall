<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2018/9/12
  Time: 22:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/fore/header.jsp"%>
<%@ include file="../include/fore/top.jsp"%>
<html>

<div class="aliPayPageDiv">
    <div class="aliPayPageLogo">
        <img src="../../../img/site/simpleLogo.png" class="pull-left"/>
        <div style="clear:both"></div>
    </div>
    <div>
        <span class="confirmMoneyText">扫一扫付款（元）</span>
        <span class="confirmMoney">￥1,359.20</span>
    </div>
    <div>
        <img src="../../../img/site/MyAlipay.png" class="aliPayImg">
    </div>
    <div>
        <a href="#nowhere">
            <button class="confirmPay">确认支付</button>
        </a>
    </div>
</div>

<style>
    body{/*整个body*/
        font-size: 12px;
        font-family: Arial;
    }
    div.aliPayPageDiv{/*支付页面div*/
        text-align: center;
        padding-bottom: 40px;
        max-width: 1013px;
        margin: 10px auto;
    }
    div.aliPayPageLogo{/*支付图片所在div*/
        margin: 20px;
    }
    span.confirmMoneyText{/*扫一扫付款*/
        color: #4D4D4D;
    }
    span.confirmMoney{/*金额*/
        display: block;
        color: #FF6600;
        font-weight: bold;
        font-size: 20px;
        margin: 10px;
    }
    button.confirmPay{/*确认支付按钮*/
        background-color: #00AAEE;
        border: 1px solid #00AAEE;
        text-align: center;
        line-height: 31px;
        font-size: 14px;
        font-weight: 700;
        color: white;
        width: 107px;
        margin-top: 20px;
    }
</style>
</html>
<%@include file="../include/fore/footTotal.jsp"%>

