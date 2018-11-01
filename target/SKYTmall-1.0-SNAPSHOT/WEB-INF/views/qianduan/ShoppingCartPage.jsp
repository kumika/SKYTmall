<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2018/9/12
  Time: 10:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/fore/header.jsp"%>
<%@ include file="../include/fore/top.jsp" %>
<%@ include file="../include/fore/search.jsp"%>

<html>

<div class="cartDiv">
    <div class="cartTitle pull-right">
        <span>已选商品（不含运费）</span>
        <span class="cartTitlePrice">￥0.00</span>
        <button class="createOrderButton" style="background-color: rgb(170,170,170);" disabled="disabled">结算</button>
    </div>
    <div style="text-align: center;color:grey;line-height: 100px;">
        订单项内容，在下个知识点讲解
    </div>
    <div class="cartFoot">
        <img src="../../../img/site/cartNotSelected.png" class="selectAllItem" selectit="false"/>
        <span>全选</span>
        <div class="pull-right">
            <span>已选商品<span class="cartSumNumber">0</span> 件</span>
            <span>合计（不含运费）：</span>
            <span class="cartSumPrice">￥0.00</span>
            <button class="createOrderButton" style="background-color: rgb(170,170,170)" disabled="disabled">结  算</button>
        </div>
    </div>
</div>

<style>
    span.cartSumPrice{/*下面的价格*/
        color: #C40000;
        /*字体颜色: #C40000*/
        font-weight: bold;
        /*粗体*/
        font-size: 20px;
        /*字体大小: 20px*/
    }
    span.cartSumNumber{
        color: #C40000;
        /*字体颜色: #C40000*/
        font-weight: bold;
        /*粗体*/
        font-size: 16px;
        /*字体大小: 16px*/
    }
    img.cartProductItemIfSelected, img.selectAllItem{/*选择框是一个图片，当鼠标放上去呈现点击状*/
        cursor: pointer;
       /* 鼠标呈现点击状*/
    }
    div.cartFoot button{/*下面的结算按钮*/
        background-color: #AAAAAA;
     /*   背景色: #AAAAAA*/
        border: 0px solid #AAAAAA;
        /*去掉边框*/
        color: white;
        /*字体颜色: white*/
        width: 120px;
        /*宽度: 120px*/
        height: 50px;
        /*高度: 50px*/
        font-size: 20px;
        /*字体大小: 20px*/
        text-align: center;
        /*文本水平居中*/
    }
    div.cartFoot{/*购物车的页脚*/
        background-color: #E5E5E5;
        /*背景色: #E5E5E5*/
        line-height: 50px;
        /*文本垂直居中*/
        margin: 20px 0px;
        /*上下外边距20px*/
        color: black;
        /*字体颜色: black*/
        padding-left: 20px;
        /*左内边距: 20px*/
    }
    span.cartTitlePrice{/*上面的价格信息*/
        color: #C40000;
        /*字体颜色: #C40000*/
        font-size: 14px;
        /*字体大小: 14px*/
        font-weight: bold;
        /*粗体*/
        margin-left: 5px;
        /*左外边距: 5px*/
        margin-right: 3px;
        /*右边距3px*/
    }
    div.cartTitle button{/*上面的结算按钮*/
        background-color: #AAAAAA;
        /*背景色: #AAAAAA*/
        border: 1px solid #AAAAAA;
        /*边框和背景色一个颜色*/
        color: white;
        /*字体颜色: white*/
        width: 53px;
        /*宽度: 53px*/
        height: 25px;
        /*高度: 25px*/
        border-radius: 2px;
        /*圆角*/
    }
    div.cartDiv{/*整个购物车div*/
        max-width: 1013px;
     /*   最大宽度1013，有时候用户的分辨率很高，比如1600x1200,使用1013可以使购物车这一块仅仅显示在中间，而不是平铺满整个屏幕，那样不好看*/
        margin: 10px auto;
        /*本元素居中显示*/
        color: black;
        /*字体颜色: black*/
    }
    body{
        font-size: 12px;
        /*把所有文字的大小调成12px,这是天猫默认的文字大小*/
        font-family: Arial;
        /*字库使用Arial*/
    }
</style>

<div class="cartDiv">
    <div class="cartProductList">
        <table class="cartProductTable">
            <thead>
                <tr>
                    <th class="selectAndImage">
                        <img src="../../../img/site/cartNotSelected.png" class="selectAllItem" selecttit="false"/>
                        全选
                    </th>
                    <th>商品信息</th>
                    <th>单价</th>
                    <th>数量</th>
                    <th width="120px">金额</th>
                    <th class="operation">操作</th>
                </tr>
            </thead>
            <tbody>
                <tr class="cartProductItemTR" oiid="936">
                    <td>
                        <img src="../../../img/site/cartNotSelected.png" class="cartProductItemIfSelected" oiid="936"
                             selectit="false"/>
                        <a href="#nowhere" style="display: none">
                            <img src="../../../img/site/cartSelected.png">
                            <img width="40px" src="../../../img/productSingle_middle/3665.jpg" class="cartProductImg">
                        </a>
                    </td>
                    <td>
                        <div class="cartProductLinkOutDiv">
                            <a class="cartProductLink" href="#nowhere">
                                美国iRobot扫地机器人吸尘器全自动家用智能扫地机650 天猫电器城
                            </a>
                            <div class="cartProductLinkInnerDiv">
                                <img title="支持信用卡支付" src="../../../img/site/creditcard.png">
                                <img title="消费者保障服务,承诺7天退货" src="../../../img/site/7day.png">
                                <img title="消费者保障服务,承诺如实描述" src="../../../img/site/promise.png">
                            </div>
                        </div>
                    </td>
                    <td>
                        <span class="cartProductItemOringalPrice">￥7580.0</span>
                        <span class="cartProductItemPromotionPrice">￥5306.0</span>
                    </td>
                    <td>
                        <div class="cartProductChangeNumberDiv">
                            <span pid="365" class="hidden orderItemStock">75</span>
                            <span pid="365" class="hidden orderItemPromotionPrice">5306</span>
                            <a href="#nowhere" class="numberMinus" pid="365">-</a>
                            <input value="4" autocomplete="off" class="orderItemNumberSetting" oiid="936" pid="365">
                            <a href="#nowhere" class="numberPlus" pid="365" stock="75">+</a>
                        </div>
                    </td>
                    <td>
                        <span pid="365" oiid="936" class="cartProductItemSmallSumPrice">￥5306</span>
                    </td>
                    <td>
                        <a href="#nowhere" oiid="936" class="deleteOrderItem">删除</a>
                    </td>
                </tr>

                <tr class="cartProductItemTR" oiid="935">
                    <td>
                        <img src="../../../img/site/cartNotSelected.png" class="cartProductItemIfSelected" oiid="935"
                             selectit="false"/>
                        <a href="#nowhere" style="display: none">
                            <img src="../../../img/site/cartSelected.png">
                            <img width="40px" src="../../../img/productSingle_middle/8510.jpg" class="cartProductImg">
                        </a>
                    </td>
                    <td>
                        <div class="cartProductLinkOutDiv">
                            <a class="cartProductLink" href="#nowhere">
                                阔腿裤三件套装女夏装2016新款大码雪纺时尚休闲气质棉麻九分裤潮
                            </a>
                            <div class="cartProductLinkInnerDiv">
                                <img title="支持信用卡支付" src="../../../img/site/creditcard.png">
                                <img title="消费者保障服务,承诺7天退货" src="../../../img/site/7day.png">
                                <img title="消费者保障服务,承诺如实描述" src="../../../img/site/promise.png">
                            </div>
                        </div>
                    </td>
                    <td>
                        <span class="cartProductItemOringalPrice">￥235.0</span>
                        <span class="cartProductItemPromotionPrice">￥152.75</span>
                    </td>
                    <td>
                        <div class="cartProductChangeNumberDiv">
                            <span pid="809" class="hidden orderItemStock">17</span>
                            <span pid="809" class="hidden orderItemPromotionPrice">152.75</span>
                            <a href="#nowhere" class="numberMinus" pid="809">-</a>
                            <input value="1" autocomplete="off" class="orderItemNumberSetting" oiid="935" pid="809">
                            <a href="#nowhere" class="numberPlus" pid="809" stock="17">+</a>
                        </div>
                    </td>
                    <td>
                        <span pid="809" oiid="935" class="cartProductItemSmallSumPrice">￥152.75</span>
                    </td>
                    <td>
                        <a href="#nowhere" oiid="935" class="deleteOrderItem">删除</a>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
</div>

<style>
/*    购物车div*/
    div.cartDiv{
        max-width: 1013px;
        /*最大宽度1013，有时候用户的分辨率很高，比如1600x1200,使用1013可以使购物车这一块仅仅显示在中间，而不是平铺满整个屏幕，那样不好看*/
        margin: 10px auto;
        /*本元素居中显示*/
        color: black;
        字体颜色: black
    }
/*    商品table*/
    table.cartProductTable{
        width: 100%;
        /*宽度: 100%*/
        font-size:12px;
        /*字体大小:12px*/
    }
/*    商品所在的每一行*/
    tr.cartProductItemTR{
        border: 1px solid #CCCCCC;
        /*边框*/
    }
/*    商品所在的每一列*/
    tr.cartProductItemTR td{
        padding: 20px 20px;
        /*内边距*/
    }
/*    表头信息的每一列*/
    table.cartProductTable th{
        font-weight: normal;
        /*正常字体粗细*/
        color: #3C3C3C;
        /*字体颜色: #3C3C3C*/
        padding: 20px 20px;
        /*内边距*/
    }
/*    商品图片*/
    img.cartProductImg{
        padding: 1px;
        /*内边距*/
        border: 1px solid #EEEEEE;
        /*边框*/
        width: 80px;
        /*宽度: 80px*/
        height: 80px;
        /*高度: 80px*/
    }
/*    图片所在列*/
    table.cartProductTable th.selectAndImage{
        width:100px;
        /*宽度:10px*/
    }
/*    最后一列*/
    table.cartProductTable th.operation{
        width:30px;
        /*宽度:30px*/
    }
/*    产品连接所在div*/
    div.cartProductLinkOutDiv{
        position: relative;
        /*相对定位，之所以要使用相对定位，是这个div里有用来放3个图标的另一个div:cartProductLinkInnerDiv,而cartProductLinkInnerDiv需要使用据对定位*/
        height: 80px;
        /*高度: 80px*/
    }
/*    产品连接*/
    a.cartProductLink{
        color: #3C3C3C;
        /*字体颜色: #3C3C3C*/
    }
/*    产品连接悬停状态*/
    a.cartProductLink:hover{
        color: #C40000;
        /*字体颜色: #C40000*/
        text-decoration: underline;
        /*有下划线*/
    }
/*    产品连接下面的三个图标所在div*/
    div.cartProductLinkInnerDiv{
        position: absolute;
        /*绝对定位*/
        bottom: 0;
        /*贴在下面*/
        height: 20px;
        /*高度: 20px*/
    }
/*    原始价格*/
    span.cartProductItemOringalPrice{
        text-decoration: line-through;
        /*删除线*/
        color: #9C9C9C;
        /*字体颜色: #9C9C9C*/
        display: block;
        /*以块状显示，自动换行, 并且可以修改宽度*/
        font-weight: bold;
        /*粗体*/
        font-size: 14px;
        /*字体大小: 14px*/
    }
/*    促销价格*/
    span.cartProductItemPromotionPrice{
        font-family: Arial;
        /*使用Arial字体的目的是为了把￥正常显示出来*/
        font-size: 14px;
        /*字体大小: 14px*/
        font-weight: bold;
        /*粗体*/
        color: #C40000;
        /*字体颜色: #C40000*/
    }
/*    调整数量div*/
    div.cartProductChangeNumberDiv{
        border: solid 1px #E5E5E5;
        /*边框*/
        width: 80px;
        /*宽度: 80px*/
    }
/*    增加和减少*/
    div.cartProductChangeNumberDiv a{
        width: 14px;
        /*宽度: 14px*/
        display: inline-block;
        /*显示为内联，既可以设置大小，又能够不换行*/
        text-align: center;
        /*文本水平居中*/
        color: black;
        /*字体颜色: black*/
        text-decoration: none;
        /*无下划线*/
    }
/*    数量输入框*/
    div.cartProductChangeNumberDiv input{
        border: solid 1px #AAAAAA;
        /*边框*/
        width: 42px;
        /*宽度: 42px*/
        display: inline-block;
        /*显示为内联，既可以设置大小，又能够不换行*/
    }
/*    小计金额*/
    span.cartProductItemSmallSumPrice{
        font-family: Arial;
        /*使用Arial字体的目的是为了把￥正常显示出来*/
        font-size: 14px;
        /*字体大小: 14px*/
        font-weight: bold;
        /*粗体*/
        color: #C40000;
        /*字体颜色: #C40000*/
    }
/*    最前方的是否选中图片*/
    img.cartProductItemIfSelected, img.selectAllItem{
        cursor: pointer;
       /* 鼠标呈点击状*/
    }
</style>

</html>

<%@include file="../include/fore/footTotal.jsp"%>
