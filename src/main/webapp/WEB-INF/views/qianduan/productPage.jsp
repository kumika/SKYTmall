<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2018/9/11
  Time: 17:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/fore/header.jsp"%>
<%@ include file="../include/fore/top.jsp" %>
<%@ include file="../include/fore/search.jsp"%>


<html>
<div class="imgAndInfo">
    <div class="imgInimgAndInfo">
        <img width="100px" class="bigImg" src="../../../img/productSingle/8619.jpg"/>
        <div class="smallImageDiv">
            <img width="56px" class="smallImage" src="../../../img/productSingle/8620.jpg"/>
            <img width="56px" class="smallImage" src="../../../img/productSingle/8619.jpg"/>
            <img width="56px" class="smallImage" src="img/productSingle/8618.jpg"/>
            <img width="56px" class="smallImage" src="img/productSingle/8617.jpg"/>
            <img width="56px" class="smallImage" src="img/productSingle/8616.jpg"/>
        </div>
    </div>
    <div style="clear: both"></div>
</div>
<style>
    div.imgAndInfo{/*图片和基本信息所在的div*/
        margin: 40px 20px;
        /*外边距*/
    }
    div.imgInimgAndInfo{/*图片所在的div*/
        width: 400px;
        /*宽度: 400px*/
        float: left;
        /*向左漂浮，这样可以水平摆放，为的是和右边的基本信息保持水平摆放关系.
        在本知识点，暂时看不到右边的基本信息*/
    }
    div.imgAndInfo img.bigImg{/*大图片*/
        width: 400px;
        /*宽度: 400px*/
        height: 400px;
        /*高度: 400px*/
        padding: 20px;
        /*内边距*/
        border: 1px solid #F2F2F2;
        /*边框*/
    }
    div.imgAndInfo div.smallImageDiv{/*小图片所在的div*/
        width: 80%;
        /*宽度: 80%*/
        margin: 20px auto;
        /*居中显示*/
    }
    div.imgAndInfo img.smallImage{/*小图片*/
        width: 60px;
        /*宽度: 60px*/
        height: 60px;
        /*高度: 60px*/
        border: 2px solid white;
        /*边框设置为2个像素白色，鼠标悬浮的时候就会设置为黑色*/
    }
    div.imgAndInfo img.smallImage:hover{/*小图片鼠标悬浮效果*/
        border: 2px solid black;
        /*边框设置为2个像素黑色*/
    }
</style>


<div class="imgAndInfo">
    <div class="imgInimgAndInfo">
        <img width="100px" src="../../../img/productSingle/8619.jpg"/>
    </div>
    <div class="infoInimgAndInfo">
        <div class="productTitle">
            名媛2016新款女装夏两件套裤韩版雪纺七分裤阔腿裤休闲时尚套装女
        </div>
        <div class="productSubTitle">
            高端定制 高档棉麻 现货即发 加购物车 领优惠卷
        </div>


        <div class="productPrice">
            <div class="juhuasuan">
                <span class="juhuasuanBig">聚划算</span>
                <span>此商品即将参加聚划算，<span class="juhuasuanTime">1天19小时</span>
                后开始，</span>
            </div>
            <div class="productPriceDiv">
                <div class="gouwujuanDiv">
                    <img height="16px" src="../../../img/site/gouwujuan.png"/>
                    <span> 全天猫实物商品通用</span>
                </div>
                <div class="originalDiv">
                    <span class="originalPriceDesc">价格</span>
                    <span class="originalPriceYuan">￥</span>
                    <span class="originalPrice">399.00</span>
                </div>
                <div class="promotionDiv">
                    <span class="promotionPriceDesc">促销价</span>
                    <span class="promotionPriceYuan">￥</span>
                    <span class="promotionPrice">375.00</span>
                </div>
            </div>
        </div>



        <div class="productSaleAndReviewNumber">
            <div>销量<span class="redColor boldWord">50</span></div>
            <div>累计评价<span class="redColor boldWord">19</span></div>
        </div>

        <div class="productNumber">
            <span>数量</span>
            <span>
                <span class="productNumberSettingSpan">
                    <input type="text" value="1" class="productNumberSetting"/>
                </span>
                <span class="arrow">
                    <a class="increaseNumber" href="#nowhere">
                        <span class="updown">
                            <img src="../../../img/site/increase.png"/>
                        </span>
                    </a>
                    <span class="updownMiddle"></span>
                    <a class="decreaseNumber" href="#nowhere">
                        <span class="updown">
                            <img src="../../../img/site/decrease.png"/>
                        </span>
                    </a>
                </span>
            件</span>
            <span>库存88件</span>
        </div>


        <div class="serviceCommitment">
            <span class="serviceCommitmentDesc">服务承诺</span>
            <span class="serviceCommitmentLink">
                <a href="#nowhere">正品保证</a>
                <a href="#nowhere">极速退款</a>
                <a href="#nowhere">赠运费险</a>
                <a href="#nowhere">七天无理由退换</a>
            </span>
        </div>

        <div class="buyDiv">
            <a href="#nowhere" class="buyLink"><button class="buyButton">立即购买</button> </a>
            <a href="#nowhere" class="addCarLink"><button class="buyButton">加入购物车</button> </a>
        </div>
    </div>
    <div style="clear:both"></div>
</div>
<style>
/*    整个body*/
    body{
        font-size: 12px;
        /*把所有文字的大小调成12px,这是天猫默认的文字大小*/
        font-family: Arial;
        /*字库使用Arial*/
    }
/*    包括图片和基本信息的div*/
    div.imgAndInfo{
        margin: 40px 20px;
        /*左右外边距40px 上下20px*/
    }
/*    图片div，这里为了强调右边的基本信息，左侧只放了一个图片。*/
    div.imgInimgAndInfo{
        width: 100px;
        /*宽度: 100px*/
        float: left;
        /*向左漂浮，这样就可以和右边的基本信息内容水平摆放*/
    }
/*    基本信息div*/
    div.infoInimgAndInfo{
        padding: 0px 20px;
        /*左右内边距20px*/
        overflow: hidden;
        /*隐藏溢出部分。 结合图片div的float:left,就可以做到基本信息div和图片div水平摆放，并且基本信息div自动占用剩下所有的宽度*/
    }
    产品标题
    div.infoInimgAndInfo div.productTitle{
        color: black;
        /*字体颜色: black*/
        font-size: 16px;
        /*字体大小: 16px*/
        font-weight: bold;
        /*粗体*/
        margin: 0px 10px;
        /*水平外边距10px*/
    }
/*    产品小标题*/
    div.infoInimgAndInfo div.productSubTitle{
        color: #DD2727;
        /*字体颜色: #DD2727*/
        font-size: 12px;
        /*字体大小: 12px*/
        margin: 0px 10px;
        /*水平外边距10px*/
    }
/*    聚划算div*/
    div.infoInimgAndInfo div.juhuasuan{
        background-color: #2DA77A;
        /*背景色: #2DA77A*/
        color: white;
        /*字体颜色: white*/
        text-align: center;
        /*文本水平居中*/
        line-height: 40px;
        /*文本垂直居中*/
        margin-top: 10px;
        /*上外边距: 10px*/
    }
/*    聚划算几个大字*/
    div.infoInimgAndInfo span.juhuasuanBig{
        font-size: 18px;
        /*字体大小: 18px*/
        font-weight: bold;
        /*粗体*/
        font-family: 黑体;
        /*字体黑体*/
    }
    /*聚划算日期*/
    div.infoInimgAndInfo span.juhuasuanTime{
        color: #FFC057;
        /*字体颜色: #FFC057*/
        font-weight: bold;
        /*粗体*/
    }
/*    产品价格信息*/
    div.infoInimgAndInfo div.productPriceDiv{
        background-image:url(http://how2j.cn/tmall/img/site/priceBackground.png);
        /*背景图片*/
        height: 102px;
        /*高度: 102px*/
        padding: 10px;
        /*内边距10px*/
        color: #666666;
        /*字体颜色: #666666*/
    }
/*    购物卷div*/
    div.infoInimgAndInfo div.gouwujuanDiv{
        margin-top: 5px;
        /*上外边距: 5px*/
    }
/*    原始价格所在div*/
    div.infoInimgAndInfo div.originalDiv{
        margin-top: 5px;
        /*上外边距: 5px*/
    }
/*    原始价格文字*/
    div.infoInimgAndInfo span.originalPriceDesc{
        color: #999999;
        /*字体颜色: #999999*/
        display: inline-block;
        /*显示为内联，既可以设置大小，又能够不换行*/
        width: 68px;
        /*宽度: 68px*/
    }
/*    原始价格-价格数字*/
    div.infoInimgAndInfo span.originalPrice{
        font-family: Arial;
        /*字体Arial*/
        font-size: 12px;
        /*字体大小: 12px*/
        color: #333333;
        /*字体颜色: #333333*/
        text-decoration: line-through;
        /*删除线*/
    }
/*    促销价格 人民币标示*/
    div.infoInimgAndInfo span.promotionPriceYuan{
        font-family: Arial;
        /*字体Arial*/
        font-size: 18px;
        /*字体大小: 18px*/
        color: #C40000;
        /*字体颜色: #C40000*/
    }
/*    促销价格-价格数字*/
    div.infoInimgAndInfo span.promotionPrice{
        color: #c40000;
        /*字体颜色: #c40000*/
        font-family: Arial;
        /*字体Arial*/
        font-size: 30px;
        /*字体大小: 30px*/
        font-weight: bold;
        /*粗体*/
    }
/*    促销价格文字*/
    div.infoInimgAndInfo span.promotionPriceDesc{
        color: #999999;
        /*字体颜色: #999999*/
        display: inline-block;
        /*显示为内联，既可以设置大小，又能够不换行*/
        width: 68px;
        /*宽度: 68px*/
        position: relative;
        /*相对定位*/
        left: 0px;
        /*水平不动*/
        top: -10px;
        /*垂直向上移动10px*/
    }
/*    销量和累计评价共同的div*/
    div.infoInimgAndInfo div.productSaleAndReviewNumber{
        margin: 20px 0px;
        /*上下外边距20px*/
        border-top-style: dotted;
        /*上边框虚线*/
        border-top-color: #C9C9C9;
        /*上边框颜色*/
        border-top-width: 1px;
        /*上边框宽度1px*/
        border-bottom-style: dotted;
        /*下边框虚线*/
        border-bottom-color: #C9C9C9;
        /*下边框颜色*/
        border-bottom-width: 1px;
        /*下边框宽度1px*/
        padding: 10px;
        /*内边距10px*/
    }
/*    销量和累计评价分别的div*/
    div.infoInimgAndInfo div.productSaleAndReviewNumber div{
        display: inline-block;
        /*显示为内联，既可以设置大小，又能够不换行*/
        width: 49%;
        /*宽度: 49%*/
        text-align: center;
        /*文本居中*/
        color: #999999;
        /*字体颜色: #999999*/
        font-size: 12px;
      /*  字体大小: 12px*/
    }
    /*销量所处的div*/
    div.infoInimgAndInfo div.productSaleAndReviewNumber div:first-child{
        border-right-width: 1px;
        /*右边框宽度1px*/
        border-right-style: solid;
        /*右边框实线*/
        border-right-color: #E5DFDA;
      /*  右边框颜色*/
    }
    /*产品数量和库存所在div*/
    div.infoInimgAndInfo div.productNumber{
        color: #999999;
        /*字体颜色: #999999*/
    }
/*    输入数字的input所在的span*/
    div.infoInimgAndInfo span.productNumberSettingSpan{
        border: 1px solid #999;
        /*边框*/
        display: inline-block;
        /*显示为内联，既可以设置大小，又能够不换行*/
        width: 43px;
        /*宽度: 43px*/
        height: 32px;
        /*高度: 32px*/
        padding-top:7px;
        /*上内边距 7px，把input顶下去*/
    }
/*    输入数字的input*/
    div.infoInimgAndInfo input.productNumberSetting{
        border: 0px;
        /*无边框*/
        height: 80%;
        /*高度: 80%*/
        width: 80%;
        /*宽度: 80%*/
    }
/*    上下箭头所使用的图片*/
    div.productNumber span.updown img{
        display:inline-block;
        /*设置成内联块，可以调整其垂直向上对齐*/
        vertical-align:top;
        /*确保垂直向上对齐，因为在不同的浏览器下，img元素可能表现出不贴在上面的现象。 贴在上面之后，再借助其所在span的内边距的padding-top就可以很方便的调整其位置*/
    }
/*    上下箭头所在的两个span*/
    div.productNumber span.updown{
        border: 1px solid #999;
        /*边框*/
        display: block;
        /*以块状显示，自动换行*/
        width: 20px;
        /*宽度: 20px*/
        height: 14px;
        /*高度: 14px*/
        text-align: center;
        /*水平居中*/
        padding-top:4px;
        /*上内边距 4px*/
    }
/*    上下箭头中间的span*/
    div.productNumber span.updownMiddle{
        height: 4px;
        /*高度: 4px*/
        display: block;
        /*以块状显示，自动换行*/
    }
/*    上下箭头图标所在的span的父span*/
    div.productNumber span.arrow{
        display: inline-block;
        /*显示为内联，既可以设置大小，又能够不换行*/
        width: 22px;
        /*宽度: 22px*/
        height: 32px;
        /*高度: 32px*/
        vertical-align:top;
        /*垂直贴在上面*/
    }
/*    服务承诺信息所在div*/
    div.serviceCommitment{
        margin: 20px 0px;
        /*上下外边距20px*/
    }
/*    服务承诺四个字所在span*/
    div.infoInimgAndInfo span.serviceCommitmentDesc{
        color: #999999;
        /*字体颜色: #999999*/
    }
    /*服务承诺右侧四个连接所在span*/
    div.infoInimgAndInfo span.serviceCommitmentLink a{
        color: #666666;
        /*字体颜色: #666666*/
    }
    /*立即购买和加入购物车所在div*/
    div.buyDiv{
        margin: 20px auto;
        /*div本身居中显示*/
        text-align: center;
        /*内容水平居中显示*/
    }
/*    立即购买和加入购物车按钮*/
    div.buyDiv button{
        display: inline-block;
        /*显示为内联，既可以设置大小，又能够不换行*/
        margin: 0px 10px;
        /*左右外边距10px*/
        width: 180px;
        /*宽度: 180px*/
        height: 40px;
        /*高度: 40px*/
    }
/*    立即购买按钮*/
    button.buyButton{
        border: 1px solid #C40000;
        /*边框*/
        background-color: #FFEDED;
        /*背景色: #FFEDED*/
        text-align: center;
        /*内容水平居中*/
        line-height: 40px;
        /*内容垂直居中*/
        font-size: 16px;
        /*字体大小: 16px*/
        color: #C40000;
        /*字体颜色: #C40000*/
        font-family: arial;
        /*字体arial*/
    }
/*    加入购物车按钮*/
    button.addCartButton{
        border: 1px solid #C40000;
        /*外边框*/
        background-color: #C40000;
        /*背景色: #C40000，和外边框一个颜色*/
        text-align: center;
        /*内容水平居中*/
        line-height: 40px;
        /*内容垂直居中*/
        font-size: 16px;
        /*字体大小: 16px*/
        color: white;
        /*字体颜色: white*/
        font-family: arial;
      /*  字体arial*/
    }
    /*加入购物车前的图标*/
    button.addCartButton span.glyphicon{
        font-size: 12px;
/*        字体大小: 12px*/
        margin-right: 8px;
        /*右外边距8px*/
    }
/*    超链鼠标悬停*/
    a:hover{
        text-decoration:none;
        /*超链鼠标悬停的时候,没有下划线*/
    }
/*    销量和累计评价后的数字*/
    .redColor{
        color: #C40000;
        /*字体颜色: #C40000*/
    }
    /*销量和累计评价后的数字*/
    .boldWord{
        font-weight: bold;
       /* 粗体*/
    }
</style>


<div class="productDetailDiv" style="display:block">
    <div class="productDetailTopPart">
        <a class="productDetailTopPartSelectedLink selected" href="#nowhere">商品详情</a>
        <a class="productDetailTopReviewLink" href="#nowhere">
                累积评价
                <span class="productDetailTopReviewLinkNumber">19</span>
        </a>
    </div>

    <div class="productParamterPart">
        <div class="productParamter">产品参数：</div>
        <div class="productParamterList">
            <span>材质成分:  聚酯纤维100% </span>
            <span>品牌:  Emyche/艾米秋 </span>
            <span>货号:  129668 </span>
            <span>尺码:  L M S XL X </span>
            <span>上市年份季节:  2016年夏季 </span>
            <span>颜色分类:  白色 黑色 浅蓝 </span>
            <span>适用年龄:  18-25周岁 </span>
        </div>
        <div style="clear:both"></div>
    </div>

    <div class="productDetailImagesPart">
        <img src="../../../img/productDetail/8626.jpg"/>
    </div>
</div>
<style>
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
</style>


<div class="productPageDiv">
    <div class="productReviewDiv" style="display: block">
        <div class="productReviewTopPart">
            <a class="productReviewTopPartSelectedLink" href="#nowhere">商品详情</a>
            <a class="selected" href="#nowhere">
                累积评价
                <span class="productReviewTopReviewLinkNumber">19</span>
            </a>
        </div>
        <div class="productReviewContentPart">
            <div class="productReviewItem">
                <div class="productReviewItemDesc">
                    <div class="productReviewItemContent">
                        不错的购物，包装很精细，布料也不错舒服，
                        因为之前一直购买品牌装，很好的一次网购，
                        生完宝宝刚刚一个多月我一百五十斤穿2XL不错
                    </div>
                    <div class="productReviewItemDate">2016-08-10</div>
                </div>
                <div class="productReviewItemUserInfo">
                    哀****莉<span class="userInfoGrayPart">（匿名）</span>
                </div>
                <div style="clear: both;"></div>
            </div>

            <div class="productReviewItem">
                <div class="productReviewItemDesc">
                    <div class="productReviewItemContent">
                        面料很好，大小也刚刚好，本来买之前还担心，犹豫，
                        等货到了，比我心中想象的好很多，
                        大家放心购买，很满意的购物，以后还会来??
                    </div>
                    <div class="productReviewItemDate">2016-08-10</div>
                </div>
                <div class="producReviewItemUserInfo">
                    贤*闲<span class="userInfoGrayPart">（匿名）</span>
                </div>
                <div style="clear: both;"></div>
            </div>

            <div class="productReviewItem">
                <div class="productReviewItemDesc">
                    <div class="productReviewItemContent">
                        <span>商品：</span>宝贝料子和手感都不错，是值这价，
                        卖家很贴心的送了内衣带，5分好评是必须的。喜欢的可以 下手了
                    </div>
                    <div class="productReviewItemDate">2016-08-10</div>
                </div>
                <div class="producReviewItemUserInfo">
                    孤*****爱<span class="userInfoGrayPart">（匿名）</span>
                </div>
                <div style="clear: both;"></div>
            </div>

        </div>
    </div>
</div>

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

</html>

<%@include file="../include/fore/footTotal.jsp"%>
