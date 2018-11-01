<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2018/9/12
  Time: 23:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/fore/header.jsp" %>
<%@ include file="../include/fore/top.jsp" %>
<html>


<div class="payedDiv">
    <div class="payedTextDiv">
        <img src="../../../img/site/paySuccess.png"/>
        <span>您已成功付款</span>
    </div>
    <div class="payedAddressInfo">
        <ul>
            <li>收货地址： 北京市 朝阳区 天安门 3栋 2单元 402室</li>
            <li>实际付款：
                <span class="payedInfoPrice">
                    ￥2,124.15
                </span>
            </li>
            <li>预计08月08日送达</li>
        </ul>
        <div class="paedCheckLinkDiv">
            您可以
            <a href="#nowhere" class="payedCheckLink">查看已买到的宝贝</a>
            <a href="#nowhere" class="payedCheckLink">查看交易详情</a>
        </div>
    </div>
    <div class="payedSeperateLine"></div>
    <div class="warningDiv">
        <img src="../../../img/site/warning.png">
        <b>安全提醒：</b>下单后，<span class="redColor boldWord">用QQ给您发送链接办理退款的都是骗子！</span>
        天猫不存在系统升级，订单异常等问题，谨防假冒客服电话诈骗！
    </div>
</div>


<style>
    div.payedDiv { /*支付成功页面*/
        border: 1px solid #D4D4D4;
        max-width: 1013px;
        margin: 10px auto 20px auto;
    }

    div.payedTextDiv { /*您已成功付款字样所在div*/
        height: 61px;
        background-color: #ECFFDC;
        padding: 17px 0px 0px 25px;
    }

    div.payedTextDiv span { /*您已成功付款*/
        font-weight: bold;
        font-size: 14px;
        margin-left: 10px;
    }

    div.payedAddressInfo { /*地址信息所在div*/
        padding: 26px 35px;
    }

    div.payedAddressInfo li { /*地址信息列表*/
        background-image: url(http://how2j.cn/tmall/img/site/li_dot.png); /*背景图片*/
        background-repeat: no-repeat;
        background-color: transparent;
        background-attachment: scroll;
        background-position: 0px 13px;
        list-style-type: none;
        color: #333333;
        padding-left: 15px;
        padding-top: 5px;
    }

    span.payedInfoPrice { /*实付款*/
        color: #B10000;
        font-weight: bold;
        font-size: 14px;
        font-family: arial;
    }

    div.paedCheckLinkDiv { /*查看已买到的宝贝所在div*/
        margin-left: 38px;
    }

    a.payedCheckLink { /*两个查看连接*/
        color: #2D8CBA;
    }

    a.payedCheckLink:hover { /*两个查看连接鼠标悬停状态*/
        color: #2D8CBA;
        text-decoration: underline;
    }

    div.payedSeperateLine { /*分割线*/
        border-top: 1px dotted #D4D4D4;
        margin: 0px 31px;
    }

    div.warningDiv { /*警告div*/
        margin: 23px 45px;
        color: black;
    }

    body { /*整个body*/
        font-size: 12px;
        font-family: Arial;
    }

    .boldWord { /*文字粗体*/
        font-weight: bold;
    }

    .redColor { /*天猫红*/
        color: #C40000;
    }
</style>

</html>

<%@include file="../include/fore/footTotal.jsp" %>
