<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2018/9/13
  Time: 0:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/fore/header.jsp" %>
<%@ include file="../include/fore/top.jsp" %>
<html>


<div class="orderFinishDiv">
    <div class="orderFinishTextDiv">
        <img src="../../../img/site/orderFinish.png">
        <span>交易已经成功，卖家将收到您的货款。</span>
    </div>
</div>

<style>
    div.orderFinishDiv { /*收货成功div*/
        border: 1px solid #E5E5E5;
        padding: 40px;
        max-width: 1013px;
        margin: 10px auto;
    }

    div.orderFinishDiv span { /*收货成功文字*/
        font-size: 14px;
        color: black;
        font-weight: bold;
        margin-left: 20px;
        padding-top: 20px;
    }
</style>

<body>

</body>
</html>
<%@include file="../include/fore/footTotal.jsp" %>


