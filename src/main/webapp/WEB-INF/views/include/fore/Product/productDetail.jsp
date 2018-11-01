<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2018/9/29
  Time: 11:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>




<div class="productDetailDiv" >

    <div class="productDetailTopPart">
        <a class="productDetailTopPartSelectedLink selected" href="#nowhere">商品详情</a>
        <a class="productDetailTopReviewLink" href="#nowhere">
            累积评价
            <span class="productDetailTopReviewLinkNumber">${product.reviewCount}</span>
        </a>
    </div>

    <div class="productParamterPart">
        <div class="productParamter">产品参数：</div>
        <%--显示属性值--%>
        <div class="productParamterList">
            <c:forEach items="${propertyValues}" var="propertyValues">
                <span>${propertyValues.property.name}: ${fn:substring(propertyValues.value,0 ,10 )}  </span>
            </c:forEach>
        </div>
        <div style="clear:both"></div>
    </div>

    <%--显示详情图片--%>
    <div class="productDetailImagesPart">
        <c:forEach items="${product.productDetailImages}" var="productDetailImage">
            <img src="img/ProductImageDetail/${productDetailImage.id}.jpg"/>
        </c:forEach>
    </div>


</div>




<%--<style>
    /*    产品详情div*/
    div.productDetailDiv{
        width: 790px;
        /*宽度: 790px*/
        margin: 40px auto;
        /*居中显示*/
    }
    /*    顶部div*/
    div.productDetailTopPart{
        border: 1px solid #DFDFDF;
        /*边框*/
        border-left-width: 0px;
        /*左边框去掉，因为“商品详情”四个字接下来会用红色边框显示*/
    }
    /*    被选中的超链*/
    a.selected{
        border-left: 1px solid #cfbfb1;
        /*左边框*/
        border-right: 1px solid #cfbfb1;
        /*右边框*/
        color: #b10000;
        /*字体颜色: #b10000*/
        display: inline-block;
        /*显示为内联，既可以设置大小，又能够不换行*/
        font-weight: bold;
        /*粗体*/
        line-height: 46px;
        /*文字垂直居中*/
        width: 90px;
        /*宽度: 90px*/
        text-align: center;
        /*文字水平居中*/
        position: relative;
        /*相对定位，为的是下一步使用:before新增加的元素做绝对定位。 因为绝对定位是基于定位了的父元素*/
    }
    /*    使用:before为超链上方加一个天猫色的横条*/
    a.selected:before{
        content:"";
        /*内容为空*/
        display: block;
        /*以块状显示，便于修改宽度*/
        border-width: 1px;
        /*边框宽度*/
        border-color: #b00000;
        /*边框颜色*/
        border-style: solid;
        /*边框实线*/
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
    /*使用:after 为超链上方加一个天猫色的美人尖*/
    a.selected:after{
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
    /*    累计评论超链*/
    a.productDetailTopReviewLink{
        padding: 0px 20px;
        /*左右内边距20px*/
        border-right: 1px dotted #D2D2D2;
        /*右侧边框呈点状*/
        color: #333333;
        /*字体颜色: #333333*/
    }
    /*    评论数量*/
    span.productDetailTopReviewLinkNumber{
        color: #3355B9;
        /*字体颜色: #3355B9*/
    }
    /*    参数列表div*/
    div.productParamterPart{
        border: 1px solid #DFDFDF;
        /*边框实线*/
        padding: 40px;
        /*内边距40px*/
    }
    /*    产品参数四个字*/
    div.productParamter{
        color: #999999;
        /*字体颜色: #999999*/
        font-weight: bold;
        /*粗体*/
        margin-bottom: 20px;
        /*下外边距20px*/
    }
    /*    产品参数项*/
    div.productParamterList span{
        display: block;
        /*以块状显示，自动换行*/
        width: 220px;
        /*宽度: 220px*/
        float: left;
        /*向左漂浮，这样可以水平摆放*/
        padding: 8px 0px;
        /*上下内边距8px*/
        color: #666666;
        /*字体颜色: #666666*/
    }
    /*    详情图片*/
    div.productDetailImagesPart img{
        display: block;
        /*显示为块级元素，自动换行*/
        width: 790px;
        /*宽度: 790px，详情图片都是这样的宽度的大图片*/
        margin:20px 0px;
        /*上下外边距*/
    }
    /*    整个body*/
    body{
        font-size: 12px;
        /*把所有文字的大小调成12px,这是天猫默认的文字大小*/
        font-family: Arial;
        /*字库使用Arial*/
    }
    /*    鼠标悬停*/
    a:hover{
        text-decoration:none;
        /*超链鼠标悬停的时候,没有下划线*/
        color: #C40000;
        /*超链鼠标悬停的时候,使用天猫红显示*/
    }
</style>--%>




