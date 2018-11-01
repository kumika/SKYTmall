<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2018/9/11
  Time: 16:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/fore/header.jsp"%>
<%@ include file="../include/fore/top.jsp" %>
<%@ include file="../include/fore/search.jsp"%>
<html>

<div class="categoryPageDiv">
    <img src="../../../img/category/72.jpg">
    <div class="categorySortBar">
        <table class="categorySortBarTable categorySortTable">
            <tbody>
                <tr>
                    <td class="grayColumn"><a href="#nowhere">综合<span class="glyphicon plyphicon-arrow-down"></span> </a> </td>
                    <td><a href="#nowhere">人气<span class="glyphicon glyphicon-arrow-down"></span> </a> </td>
                    <td><a href="#nowhere">新品<span class="glyphicon glyphicon-arrow-down"></span> </a> </td>
                    <td><a href="#nowhere">销量<span class="glyphicon glyphicon-arrow-down"></span> </a> </td>
                    <td><a href="#nowhere">价格<span class="glyphicon glyphicon-resize-vertical"></span> </a> </td>
                </tr>
            </tbody>
        </table>
        <table class="categorySortBarTable">
            <tbody>
            <tr>
                <td>
                    <input type="text" placeholder="请输入" class="sortBarPrice beginPrice">
                </td>
                <td class="grayColumn priceMiddleColumn">-</td>
                <td>
                    <input type="text" placeholder="请输入" class="sortBarPrice endPrice">
                </td>
            </tr>
            </tbody>
        </table>
    </div>
</div>

<style>
    div.categoryPageDiv{/*整个分类div*/
        max-width: 1013px;
        /*最大宽度1013px，如果用户的分辨率比较大，
        那么就会使产品列表整体宽度最大1013，并且居中，
        这样看上去好一点，而不是铺满整个屏幕*/
        margin: 10px auto;
        /*居中显示*/
    }
    div.categorySortBar{/*排序按钮栏*/
        background-color: #FAF9F9;
       /* 背景色: #FAF9F9*/
        margin: 40px 20px 20px 20px;
        /*外边距*/
        padding: 4px;
        /*内边距 4px*/
    }
    table.categorySortBarTable{/*排序栏中的两个表格*/
        border-collapse: collapse;
        /*单元格之间没有空隙*/
        display:inline-block;
     /*   显示为内联，既可以设置大小，又能够不换行*/
    }
    table.categorySortBarTable span.glyphicon{/*排序表格中的Bootstrap图标*/
        font-size: 10px;
        /*字体大小: 10px*/
    }
    table.categorySortBarTable td{/*排序表格中的单元格*/
        height:17px;
        /*高度:17px*/
        font-size:12px;
        /*字体大小:12px*/
        border:1px solid #CCCCCC;
        /*边框*/
        padding:3px;
        /*内边距 3px*/
    }
    table.categorySortBarTable td.grayColumn{/*默认选中的那个单元格*/
        background-color: #F1EDEC;
     /*   背景色: #F1EDEC*/
    }
    table.categorySortBarTable td a{/*超链*/
        color: #806F66;
     /*   字体颜色: #806F66*/
    }
    table.categorySortBarTable td a:hover{/*超链鼠标悬浮状态*/
        color: #C40000;
     /*   字体颜色: #C40000*/
    }
    table.categorySortBarTable input{/*价格区间输入框*/
        border-width: 0px;
        /*隐藏边框*/
        height: 15px;
        /*高度: 15px*/
        width: 50px;
     /*   宽度: 50px*/
    }
    table.categorySortBarTable td.priceMiddleColumn{/*}价格区间中间的棒棒*/
        width: 5px;
        /*宽度: 5px*/
        vertical-align: middle;
        /*垂直居中*/
        color: #CCCCCC;
     /*   字体颜色: #CCCCCC*/
    }
    table.categorySortTable td:hover{/*几个排序按钮所在td鼠标悬停状态*/
        background-color: #F1EDEC;
     /*   背景色: #F1EDEC*/
    }
    body{/*整个body*/
        font-size: 12px ;
     /*   把所有文字的大小调成12px,这是天猫默认的文字大小*/
        font-family: Arial;
        /*字库使用Arial*/
    }
</style>

<div class="categoryPageDiv">
    <div class="categoryProducts">
        <div price="799.2" class="productUnit">
            <div class="productUnitFrame">
                <a href="#nowhere">
                    <img width="100px" src="../../../img/productSingle_middle/7058.jpg" class="productImage"/>
                </a>
                <span class="productPrice">￥799.20</span>
                <a href="#nowhere" class="productLink">
                    MAXFEEL休闲男士手包真皮手拿包大容量信封包手抓包夹包软韩版潮
                </a>
                <a href="#nowhere" class="tmallLink">天猫专卖</a>
                <div class="show1 productInfo">
                    <span class="monthDeal">月成交<span class="productDealNumber">16笔</span> </span>
                    <span class="productReview">评价<span class="productReviewNumber">16</span> </span>
                    <span class="wangwang">
                        <a href="#nowhere" class="wangwanglink">
                            <img src="../../../img/site/wangwang.png"/>
                        </a>
                    </span>
                </div>
            </div>
        </div>

        <div price="511.2" class="productUnit">
            <div class="productUnitFrame">
                <a href="#nowhere">
                    <img width="100px" src="../../../img/productSingle_middle/7047.jpg" class="productImage"/>
                </a>
                <span class="productPrice">￥511.20</span>
                <a href="#nowhere" class="productLink">
                    宾度 男士手包真皮大容量手拿包牛皮个性潮男包手抓包软皮信封包
                </a>
                <a href="#nowhere" class="tmallLink">天猫专卖</a>
                <div class="show1 productInfo">
                    <span class="monthDeal">月成交<span class="productDealNumber">49笔</span> </span>
                    <span class="productReview">评价<span class="productReviewNumber">17</span> </span>
                    <span class="wangwang">
                        <a href="#nowhere" class="wangwanglink">
                            <img src="../../../img/site/wangwang.png"/>
                        </a>
                    </span>
                </div>
            </div>
        </div>

        <div price="448.2" class="productUnit">
            <div class="productUnitFrame">
                <a href="#nowhere">
                    <img width="100px" src="../../../img/productSingle_middle/7036.jpg" class="productImage"/>
                </a>
                <span class="productPrice">￥448.20</span>
                <a href="#nowhere" class="productLink">
                    唯美诺新款男士手包男包真皮大容量小羊皮手拿包信封包软皮夹包潮
                </a>
                <a href="#nowhere" class="tmallLink">天猫专卖</a>
                <div class="show1 productInfo">
                    <span class="monthDeal">月成交<span class="productDealNumber">49笔</span> </span>
                    <span class="productReview">评价<span class="productReviewNumber">17</span> </span>
                    <span class="wangwang">
                        <a href="#nowhere" class="wangwanglink">
                            <img src="../../../img/site/wangwang.png"/>
                        </a>
                    </span>
                </div>
            </div>
        </div>

        <div price="448.2" class="productUnit">
            <div class="productUnitFrame">
                <a href="#nowhere">
                    <img width="100px" src="../../../img/productSingle_middle/7036.jpg" class="productImage"/>
                </a>
                <span class="productPrice">￥448.20</span>
                <a href="#nowhere" class="productLink">
                    唯美诺新款男士手包男包真皮大容量小羊皮手拿包信封包软皮夹包潮
                </a>
                <a href="#nowhere" class="tmallLink">天猫专卖</a>
                <div class="show1 productInfo">
                    <span class="monthDeal">月成交<span class="productDealNumber">49笔</span> </span>
                    <span class="productReview">评价<span class="productReviewNumber">17</span> </span>
                    <span class="wangwang">
                        <a href="#nowhere" class="wangwanglink">
                            <img src="../../../img/site/wangwang.png"/>
                        </a>
                    </span>
                </div>
            </div>
        </div>
        <div price="411.6" class="productUnit">
            <div class="productUnitFrame">
                <a href="#nowhere">
                    <img width="100px" src="http://how2j.cn/tmall/img/productSingle_middle/7025.jpg" class="productImage">
                </a>
                <span class="productPrice">¥411.60</span>
                <a href="#nowhere" class="productLink">
                    英伦邦纹男士手包牛皮大容量真皮手拿包手抓包双拉链商务正品软皮
                </a>
                <a href="#nowhere" class="tmallLink">天猫专卖</a>
                <div class="show1 productInfo">
                    <span class="monthDeal ">月成交 <span class="productDealNumber">25笔</span></span>
                    <span class="productReview">评价<span class="productReviewNumber">19</span></span>
                    <span class="wangwang">
                    <a href="#nowhere" class="wangwanglink">
                        <img src="http://how2j.cn/tmall/img/site/wangwang.png">
                    </a>
                    </span>
                </div>
            </div>
        </div>
        <div price="157.25" class="productUnit">
            <div class="productUnitFrame">
                <a href="#nowhere">
                    <img width="100px" src="http://how2j.cn/tmall/img/productSingle_middle/7014.jpg" class="productImage">
                </a>
                <span class="productPrice">¥157.25</span>
                <a href="#nowhere" class="productLink">
                    劳迪莱斯男士手包休闲手拿包牛皮大容量钱包男包软面小包包手抓包
                </a>
                <a href="#nowhere" class="tmallLink">天猫专卖</a>
                <div class="show1 productInfo">
                    <span class="monthDeal ">月成交 <span class="productDealNumber">17笔</span></span>
                    <span class="productReview">评价<span class="productReviewNumber">16</span></span>
                    <span class="wangwang">
                    <a href="#nowhere" class="wangwanglink">
                        <img src="http://how2j.cn/tmall/img/site/wangwang.png">
                    </a>
                    </span>
                </div>
            </div>
        </div>
        <div price="268.2" class="productUnit">
            <div class="productUnitFrame">
                <a href="#nowhere">
                    <img width="100px" src="http://how2j.cn/tmall/img/productSingle_middle/7003.jpg" class="productImage">
                </a>
                <span class="productPrice">¥268.20</span>
                <a href="#nowhere" class="productLink">
                    帕朗尼男士手拿包真皮手包商务休闲头层牛皮软牛皮大容量休闲钱包
                </a>
                <a href="#nowhere" class="tmallLink">天猫专卖</a>
                <div class="show1 productInfo">
                    <span class="monthDeal ">月成交 <span class="productDealNumber">5笔</span></span>
                    <span class="productReview">评价<span class="productReviewNumber">19</span></span>
                    <span class="wangwang">
                    <a href="#nowhere" class="wangwanglink">
                        <img src="http://how2j.cn/tmall/img/site/wangwang.png">
                    </a>
                    </span>
                </div>
            </div>
        </div>
        <div price="233.4" class="productUnit">
            <div class="productUnitFrame">
                <a href="#nowhere">
                    <img width="100px" src="http://how2j.cn/tmall/img/productSingle_middle/6992.jpg" class="productImage">
                </a>
                <span class="productPrice">¥233.40</span>
                <a href="#nowhere" class="productLink">
                    编织手包手拿包男信封大容量手抓包真皮韩版潮商务休闲牛皮男包
                </a>
                <a href="#nowhere" class="tmallLink">天猫专卖</a>
                <div class="show1 productInfo">
                    <span class="monthDeal ">月成交 <span class="productDealNumber">8笔</span></span>
                    <span class="productReview">评价<span class="productReviewNumber">19</span></span>
                    <span class="wangwang">
                    <a href="#nowhere" class="wangwanglink">
                        <img src="http://how2j.cn/tmall/img/site/wangwang.png">
                    </a>
                    </span>
                </div>
            </div>
        </div>
        <div price="952.0" class="productUnit">
            <div class="productUnitFrame">
                <a href="#nowhere">
                    <img width="100px" src="http://how2j.cn/tmall/img/productSingle_middle/6981.jpg" class="productImage">
                </a>
                <span class="productPrice">¥952.00</span>
                <a href="#nowhere" class="productLink">
                    犟牛男士手包真皮手拿包头层牛皮商务大容量手抓包软皮夹包信封包
                </a>
                <a href="#nowhere" class="tmallLink">天猫专卖</a>
                <div class="show1 productInfo">
                    <span class="monthDeal ">月成交 <span class="productDealNumber">20笔</span></span>
                    <span class="productReview">评价<span class="productReviewNumber">16</span></span>
                    <span class="wangwang">
                    <a href="#nowhere" class="wangwanglink">
                        <img src="http://how2j.cn/tmall/img/site/wangwang.png">
                    </a>
                    </span>
                </div>
            </div>
        </div>

        <div style="clear: both"></div>
    </div>
</div>

<style>
    /*整个body*/
    body{
        font-size: 12px;
      /*  把所有文字的大小调成12px,这是天猫默认的文字大小*/
        font-family: Arial;
        /*字库使用Arial*/
    }
    /*整个分类div*/
    div.categoryPageDiv{
        max-width: 1013px;
      /*  最大宽度1013px，如果用户的分辨率比较大，那么就会使产品列表整体宽度最大1013，并且居中，这样看上去好一点，而不是铺满整个屏幕*/
        margin: 10px auto;
        /*居中显示*/
    }
/*    产品列表div*/
    div.categoryProducts{
        padding: 0px 20px 40px 20px;
        /*内边距*/
    }
/*    产品项*/
    div.productUnit{
        width: 225px;
        /*宽度: 225px*/
        height: 338px;
        /*高度: 338px*/
        border: 3px solid #fff;
       /* 边框3个像素，但是是白色的，只有当鼠标移动上来的时候，才会变成天猫红*/
        background-color: white;
        /*背景色: white*/
        margin: 12px 5px;
        /*外边距*/
        float: left;
        /*向左漂浮，这样可以水平摆放*/
    }
/*    产品项的鼠标悬浮状态*/
    div.productUnit:hover{
        border:3px solid #C40000;
        /*边框变成天猫红*/
    }
    /*产品项的边框*/
    div.productUnitFrame{
        border:1px solid #eee;
        /*这个是又一个边框，在鼠标没有悬停的时候，显示为灰色*/
        height:100%;
        /*高度100%*/
    }
/*    产品项的边框鼠标悬停状态*/
    div.productUnitFrame:hover{
        border:1px solid #C40000;
        /*颜色变为天猫红，和外层3个像素的div融为一体，一共表现为厚实的4个像素*/
    }
    /*产品图片*/
    div.productUnit img.productImage{
        width: 100%;
/*        宽度: 100%*/
        height: 190px;
        /*高度: 190px*/
    }
/*    产品价格*/
    div.productUnit span.productPrice{
        font-size: 20px;
        /*字体大小: 20px*/
        color: #CC0000;
        /*字体颜色: #CC0000*/
        display: block;
        /*以块状显示，自动换行*/
        padding-left: 4px;
        /*左内边距: 4px*/
    }
    /*产品链接*/
    div.productUnit a.productLink{
        margin: 10px 0px;
/*        上下外边距10px*/
        color: #333333;
        /*字体颜色: #333333*/
        display: block;
        /*以块状显示，自动换行*/
        height:34px;
        /*高度34px*/
    }
/*    产品链接鼠标悬停状态*/
    div.productUnit a.productLink:hover{
        text-decoration: underline;
        /*有下划线*/
        color: #C40000;
        /*字体颜色: #C40000*/
    }
    /*天猫专卖链接*/
    div.productUnit a.tmallLink{
        margin: 10px 0px;
        /*上下外边距10px*/
        color: #999999;
        /*字体颜色: #999999*/
        display:block;
/*        以块状显示，自动换行*/
        text-decoration: underline;
        /*有下划线*/
    }
/*    天猫专卖链接鼠标悬停状态*/
    div.productUnit a.tmallLink:hover{
        text-decoration: underline;
        /*有下划线*/
        color: #C40000;
        /*字体颜色: #C40000*/
    }
  /*  成交，评价，旺旺所在的div*/
    div.productUnit div.productInfo{
        border-top-width: 1px;
        /*上边框宽度1px*/
        border-top-style: solid;
        /*上边框宽度实线*/
        border-top-color: #EEEEEE;
        /*上边框颜色*/
        color:#999999;
        /*文字颜色#999999*/
    }
/*    月成交数量*/
    div.productUnit span.productDealNumber{
        font-weight: bold;
        /*粗体*/
        color: #B57C5B;
        /*字体颜色: #B57C5B*/
    }
/*    评价所在span*/
    div.productUnit span.productReview{
        border-left-width: 1px;
        /*左边框宽度1px*/
        border-left-style: solid;
        /*左边框实线*/
        border-left-color: #EEEEEE;
        /*左边框颜色#EEEEEE*/
        border-right-width: 1px;
        /*右边框宽度1px*/
        border-right-style: solid;
        /*右边框实线*/
        border-right-color: #EEEEEE;
        /*右边框颜色#EEEEEE*/
    }
    /*评价数量*/
    div.productUnit span.productReviewNumber{
        font-weight: bold;
      /*  粗体*/
        color: #3388BB;
        /*字体颜色: #3388BB*/
    }
    /*月成交和评价所在span*/
    div.productUnit span.monthDeal, div.productUnit span.productReview{
        display: inline-block;
        /*显示为内联，既可以设置大小，又能够不换行*/
        width: 90px;
        /*宽度: 90px*/
        height:29px;
        /*高度: 29px*/
        padding-top: 5px;
/*        上内边距: 5px*/
        padding-left: 5px;
        /*左内边距: 5px*/
    }
    /*旺旺所在span*/
    div.productUnit span.wangwang{
        padding-left: 3px;
        /*左内边距: 3px*/
    }
</style>


</html>

<%@include file="../include/fore/footTotal.jsp"%>
