<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2018/9/13
  Time: 0:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/fore/header.jsp"%>
<%@ include file="../include/fore/top.jsp"%>
<html>

<div class="reviewDiv">
    <div class="reviewProductInfoDiv">
        <div class="reviewProductInfoImg">
            <img class="reviewProductImg" src="../../../img/productSingle/8697.jpg" width="100px" height="100px">
        </div>
        <div class="reviewProductInfoRightDiv">
            <div class="reviewProductInfoRightText">
                2016夏季新款女装雪纺衫短裤两件套 韩版时尚名媛休闲套装女夏装
            </div>
            <table class="reviewProductInfoTable">
                <tbody>
                <tr>
                    <td width="75px">价格：</td>
                    <td><span class="reviewProductInfoTablePrice">￥263.00</span> 元  </td>
                </tr>
                <tr>
                    <td>配送</td>
                    <td>快递:  0.00</td>
                </tr>
                <tr>
                    <td>月销量:</td>
                    <td><span class="reviewProductInfoTableSellNumber"> 50</span> 件 </td>
                </tr>
                </tbody>
            </table>
            <div class="reviewProductInfoRightBelowDiv">
                <span class="reviewProductInfoRightBelowImg">
                    <img src="../../../img/site/reviewLight.png"/>
                </span>
                <span class="reviewProductInfoRightBelowText">
                    现在查看的是 您所购买商品的信息于2016年09月12下单购买了此商品
                </span>
            </div>
        </div>
        <div style="clear: both;"></div>
    </div>
</div>

<style>
    div.reviewDiv{/*评价div*/
        max-width: 1013px;
        margin: 10px auto;
    }
    div.reviewProductInfoImg{/*图片所在div*/
        border: 1px solid #E7E7E7;
        width: 464px;
        text-align: center;
        float: left;
    }
    div.reviewProductInfoRightDiv{/*右侧div*/
        overflow: hidden;
        border-top: 1px solid #E7E7E7;
        padding: 30px 20px;
    }
    div.reviewProductInfoRightText{/*产品标题*/
        color: black;
        font-size: 16px;
        font-weight: bold;
    }
    table.reviewProductInfoTable{/*产品信息表格*/
        margin: 20px 10px;
        font-size:12px;
    }
    table.reviewProductInfoTable td{/*单元格*/
        padding-bottom: 5px;
        color: #999999;
    }
    span.reviewProductInfoTablePrice{/*产品价格*/
        color: #C40000;
        font-size: 20px;
        font-weight: bold;
    }
    span.reviewProductInfoTableSellNumber{/*月销量*/
        color: #C40000;
        font-size: 14px;
        font-weight: bold;
    }
    div.reviewProductInfoRightBelowDiv{/*购买日期信息所在div*/
        border: 1px solid #F6F5F3;
        background-color: #FDFBFA;
        height: 166px;
        padding:16px 0px 16px 81px;
    }
    span.reviewProductInfoRightBelowImg{/*小图片*/
        background-color: white;
        border: 1px solid #E1E1E1;
        display: inline-block;
        width: 23px;
        height: 42px;
        background-image:url(http://how2j.cn/tmall/img/site/reviewLight.png);
        background-repeat: no-repeat;
        padding: 0px;
    }
    span.reviewProductInfoRightBelowText{/*购买日期信息*/
        border: 1px solid #EFEFEF;
        display: inline-block;
        width: 200px;
        height: 42px;
        padding: 4px;
        position: relative;
        left: -4px;
        top: -7px;
        color: #666666;
        font-size:12px;
    }
    img.reviewProductImg{/*产品图片*/
        width:400px;
        height:400px;
    }
</style>

<div class="reviewDiv">
    <div class="reviewStasticsDiv">
        <div class="reviewStasticsLeft">
            <div class="reviewStasticsLeftTop"></div>
            <div class="reviewStasticsLeftContent">
                累计评价 <span class="reviewStasticsNumber"> 13</span>
            </div>
            <div class="reviewStasticsLeftFoot"></div>
        </div>

        <div class="reviewStasticsRight">
            <div class="reviewStasticsRightEmpty"></div>
            <div class="reviewStasticsFoot"></div>
        </div>
    </div>

    <div class="makeReviewDiv">
        <form method="post">
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
                <input type="hidden" value="952" name="oid">
                <input type="hidden" value="256" name="pid">
                <button type="button">提交评价</button>
            </div>
        </form>
    </div>
</div>

<style>
    div.reviewDiv{/*评价div*/
        max-width: 1013px;
        margin: 10px auto;
    }
    div.reviewStasticsDiv{/*累计评价div*/
        margin-top: 20px;
    }
    div.reviewStasticsLeft{/*累计评价左侧div*/
        width: 180px;
        float: left;
    }
    div.reviewStasticsLeftTop{/*累计评价左上div*/
        background-color: #C40000;
        height: 6px;
    }
    div.reviewStasticsLeftContent{/*累计评价左边内容*/
        line-height: 29px;
        border-left: 1px solid #D5D4D4;
        border-right: 1px solid #D5D4D4;
        background-color: #F6F5F1;
        text-align: center;
        font-size: 14px;
        color: #363535;
        font-weight: bold;
    }
    div.reviewStasticsLeftFoot{/*累计评价左下div*/
        height: 6px;
        border-left: 1px solid #D5D4D4;
        border-bottom: 1px solid #D5D4D4;
        background-color: #F6F5F1;
    }
    span.reviewStasticsNumber{/*累计评价数字*/
        color: #284CA5;
    }
    div.reviewStasticsRight{/*累计评价右侧div*/
        overflow: hidden;
    }
    div.reviewStasticsRightEmpty{/*累计评价右侧空白div*/
        height: 35px;
    }
    div.reviewStasticsFoot{/*累计评价右下div*/
        background-color: #F6F5F1;
        border: 1px solid #D5D4D4;
        border-left-width: 0px;
        height: 6px;
    }
    div.makeReviewDiv{/*进行评价div*/
        border: 1px solid #D1CCC8;
        margin: 20px 0px;
        background-color: #EFEFEF;
    }
    div.makeReviewText{/*其他买家，需要你的建议哦！*/
        font-size: 16px;
        color: #333333;
        font-weight: bold;
        margin: 20px 40px;
    }
    table.makeReviewTable{/*v评价商品表格*/
        margin: 20px 40px;
        font-size: 12px;
    }
    table.makeReviewTable td{/*单元格*/
        border: 1px solid #E7E7E7;
        padding: 10px;
        background-color: white;
    }
    table.makeReviewTable textarea{/*文本域*/
        border-width: 0px;
        resize: none;
        width: 420px;
        height: 120px;
    }
    td.makeReviewTableFirstTD{/*第一列*/
        background-color: #F6F6F6;
    }
    div.makeReviewButtonDiv{/*提交评价按钮所在div*/
        background-color: white;
        text-align: center;
        padding: 15px;
    }
    div.makeReviewButtonDiv button{/*提交评价按钮*/
        width: 72px;
        height: 26px;
        border-radius: 2px;
        background-color: #C40000;
        color: white;
        border-width: 0px;
        font-weight: bold;
    }
</style>

</html>

<%@include file="../include/fore/footTotal.jsp"%>
