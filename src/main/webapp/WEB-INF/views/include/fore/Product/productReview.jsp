<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2018/9/29
  Time: 11:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>

<div class="productReviewDiv" >
    <div class="productReviewTopPart">
        <a class="productReviewTopPartSelectedLink" href="#nowhere">商品详情</a>
        <a class="selected" href="#nowhere">
            累积评价
            <span class="productReviewTopReviewLinkNumber">${product.reviewCount}</span>
        </a>
    </div>

    <div class="productReviewContentPart">
        <c:forEach items="${reviews}" var="reviews">
            <div class="productReviewItem">
                <div class="productReviewItemDesc">
                    <div class="productReviewItemContent">
                        ${reviews.content}
                    </div>
                    <div class="productReviewItemDate">
                        <fmt:formatDate value="${reviews.createDate}" pattern="yyyy-MM-dd"/>
                    </div>
                </div>
                <div class="productReviewItemUserInfo">
                    ${reviews.user.anonymousName}<span class="userInfoGrayPart">（匿名）</span>
                </div>
                <div style="clear: both;"></div>
            </div>
        </c:forEach>
    </div>

</div>


<%--
<style>
    body{/*整个body*/
        font-size: 12px;
        /* 把所有文字的大小调成12px,这是天猫默认的文字大小*/
        font-family: Arial;
        /*字库使用Arial*/
    }
    div.productReviewDiv{/*评价div*/
        width: 790px;
        /*宽度: 790px*/
        margin: 40px auto;
        /*   居中显示*/
    }
    div.productReviewTopPart{/*标题div*/
        border: 1px solid #DFDFDF;
        /*边框*/
    }
    a.productReviewTopPartSelectedLink{/*商品详情超链*/
        padding: 0px 20px;
        /*左右内边距*/
        color: #333333;
        /*字体颜色: #333333*/
    }
    a.selected{/*累计评价超链*/
        border-left: 1px solid #cfbfb1;
        /*左侧边框*/
        border-right: 1px solid #cfbfb1;
        /*右侧边框*/
        color: #b10000;
        /*字体颜色: #b10000*/
        display: inline-block;
        /*显示为内联，既可以设置大小，又能够不换行*/
        font-weight: bold;
        /*粗体*/
        line-height: 46px;
        /*文本垂直居中*/
        width: 90px;
        /*宽度: 90px*/
        text-align: center;
        /*文本水平居中*/
        position: relative;
        /*   相对定位，为的是下一步使用:before新增加的元素做绝对定位。 因为绝对定位是基于定位了的父元素*/
    }
    a.selected:before{/*使用:before为超链上方加一个天猫色的横条*/
        content: "";
        /*内容为空*/
        display: block;
        /*以块状显示，便于修改宽度*/
        border-width: 1px;
        /*边框宽度*/
        border-style: solid;
        /*边框实线*/
        border-color: #b00000;
        /*边框颜色*/
        width: 90px;
        /*宽度: 90px，刚好和其父元素超链宽度一样*/
        height: 0;
        /*高度: 0，无高度仅仅显示边框*/
        position: absolute;
        /*绝对定位，其父元素超链是相当定位的，所以这绝对定位就会基于父元素*/
        top: -1px;
        /*向上移动一个像素*/
        margin-left: -1px;
        /*左外边距: -1px，向左边移动一个像素，导致和左边的边框重合*/
    }
    a.selected:after{/*使用:after 为超链上方加一个天猫色的美人尖*/
        content: "";
        /*内容为空*/
        display: block;
        /*以块状显示，便于修改宽度*/
        border-color: #b00000 transparent transparent;
        /*美人尖的原理是只有上边框，其他边框是透明色，#b00000 transparent transparent; 这种写法既表示只有上边框有颜色，其他都是透明色*/
        border-style: solid;
        /*边框实线*/
        border-width: 5px;
        /*边框宽度*/
        width: 0;
        /*宽度: 0*/
        height: 0;
        /*高度: 0*/
        position: absolute;
        /*绝对定位*/
        top: -1px;
        /*向上移动1个像素*/
        left: 50%;
        /*居中*/
        margin-left: -5px;
        /*向左边移动-5px*/
    }
    div.productReviewContentPart{/*评价内容div*/
        padding-top: 50px;
        /*   上内边距: 50px*/
    }
    div.productReviewItem{/*评价条目*/
        border-bottom: 1px solid #E3E3E3;
        /*下边框*/
        margin: 10px 0px;
        /*   上下外边距10px*/
    }
    div.productReviewItem div.productReviewItemDesc{/*评价描述*/
        width: 80%;
        /*宽度: 80%*/
        display: inline-block;
        /*显示为内联，既可以设置大小，又能够不换行*/
        color: #333333;
        /*字体颜色: #333333*/
        margin: 5px 20px;
        /*外边距*/
        float: left;
        /*向左漂浮，这样可以水平摆放*/
    }
    div.productReviewItemDate{/*评价日期*/
        margin: 15px 0px 0px 0px;
        /*上边距15px*/
        color: #CCCCCC;
        /*字体颜色: #CCCCCC*/
    }
    div.productReviewItem div.productReviewItemUserInfo{/*用户信息*/
        color: #404040;
        /*字体颜色: #404040*/
        margin: 5px 20px;
        /*外边距*/
        padding: 20px 0;
        /*上下内边距*/
    }
    span.userInfoGrayPart{/*用户匿名括弧*/
        color: #999999;
        /*   字体颜色: #999999*/
    }
    a:hover{/*超链鼠标悬停*/
        color:#C40000;
        /*天猫红*/
        text-decoration:none;
        /*超链鼠标悬停的时候,没有下划线*/
    }
</style>
--%>
