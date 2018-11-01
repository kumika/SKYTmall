<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2018/9/29
  Time: 11:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>

    $(function(){

        var stock = ${product.stock};


        $(".productNumberSetting").keyup(function(){
            var num= $(".productNumberSetting").val();
            num = parseInt(num);
            if(isNaN(num))
                num= 1;
            if(num<=0)
                num = 1;
            if(num>stock)
                num = stock;
            $(".productNumberSetting").val(num);
        });

        $(".increaseNumber").click(function(){
            var num= $(".productNumberSetting").val();
            num++;
            if(num>stock)
                num = stock;
            $(".productNumberSetting").val(num);
        });
        $(".decreaseNumber").click(function(){
            var num= $(".productNumberSetting").val();
            --num;
            if(num<=0)
                num=1;
            $(".productNumberSetting").val(num);
        });

        $(".addCartButton").removeAttr("disabled");

        /* 立即购买和加入购物车这两个按钮的监听：
        这两个按钮都会通过JQuery的.get方法，用异步ajax的方式访问forecheckLogin，
        获取当前是否登录状态，如果返回的不是"success" 即表明是未登录状态，
        那么就会打开登录的模态窗口*/

        /*监听 加入购物车按钮*/
        $(".addCartLink").click(function(){
            var page = "forecheckLogin";
            $.post(
                page,
                function(result){
                    if("success"==result){
                        var pid = ${product.id};
                        var num= $(".productNumberSetting").val();
                        var addCartpage = "foreaddCart";
                        $.post(
                            addCartpage,
                            {"pid":pid,"num":num},
                            function(result){
                                if("success"==result){
                                    $(".addCartButton").html("已加入购物车");
                                    $(".addCartButton").attr("disabled","disabled");
                                    $(".addCartButton").css("background-color","lightgray")
                                    $(".addCartButton").css("border-color","lightgray")
                                    $(".addCartButton").css("color","black")

                                }
                                else{

                                }
                            }
                        );
                    }
                    else{
                        $("#loginModal").modal('show');
                    }
                }
            );
            return false;
        });
        /*监听购买按钮*/
        $(".buyLink").click(function(){
            var page = "forecheckLogin";
            $.post(
                page,
                function(result){
                    if("success"==result){
                        var num = $(".productNumberSetting").val();
                        location.href= $(".buyLink").attr("href")+"&num="+num;
                    }
                    else{
                        $("#loginModal").modal('show');
                    }
                }
            );
            return false;
        });

        /*  modal.jsp 页面被 footer.jsp 所包含，所以每个页面都是加载了的。
            通过imgAndInfo.jsp页面中的购买按钮或者加入购物车按钮显示出来。
            点击登录按钮时,ajax代码进行登录验证：*/
        $("button.loginSubmitButton").click(function(){
            var name = $("#name").val();
            var password = $("#password").val();
            var page = "foreloginAjax";

            //判断账号，密码是否空
            if(0==name.length||0==password.length){
                $("span.errorMessage").html("请输入账号密码");
                $("div.loginErrorMessageDiv").show();
                return false;
            }


            /*post提交*/
            $.post(
                page,
                {"name":name,"password":password},
                function(result){
                    if("success"==result){
                        location.reload();
                    }
                    else{
                        $("span.errorMessage").html("账号密码错误");
                        $("div.loginErrorMessageDiv").show();
                    }
                }
            );

            return true;
        });

        $("img.smallImage").mouseenter(function(){
            var bigImageURL = $(this).attr("bigImageURL");
            $("img.bigImg").attr("src",bigImageURL);
        });

        $("img.bigImg").load(
            function(){
                $("img.smallImage").each(function(){
                    var bigImageURL = $(this).attr("bigImageURL");
                    img = new Image();
                    img.src = bigImageURL;

                    img.onload = function(){
                        $("div.img4load").append($(img));
                    };
                });
            }
        );
    });

</script>


<div class="imgAndInfo">
    <div class="imgInimgAndInfo">
        <img  class="bigImg" src="img/ProductImageSingle/${product.firstProductImage.id}.jpg"/>
        <%--5张小图片--%>
        <div class="smallImageDiv">
            <c:forEach items="${product.productSingleImages}" var="productSingleImages">
                <img  class="smallImage"
                      src="img/ProductImage_small/${productSingleImages.id}.jpg"
                      bigImageURL="img/ProductImageSingle/${productSingleImages.id}.jpg"
                />
            </c:forEach>
        </div>
        <div class="img4load hidden" ></div>
    </div>


    <div class="infoInimgAndInfo">

        <div class="productTitle">
            ${product.name}
        </div>

        <div class="productSubTitle">
            ${product.subTitle}
        </div>

        <div class="productPrice">
            <div class="juhuasuan">
                <span class="juhuasuanBig">聚划算</span>
                <span>此商品即将参加聚划算，<span class="juhuasuanTime">1天19小时</span>
                后开始，</span>
            </div>

            <div class="productPriceDiv">
                <div class="gouwujuanDiv">
                    <img height="16px" src="img/site/gouwujuan.png"/>
                    <span> 全天猫实物商品通用</span>
                </div>
                <div class="originalDiv">
                    <span class="originalPriceDesc">价格</span>
                    <span class="originalPriceYuan">￥</span>
                    <span class="originalPrice">
                        <fmt:formatNumber value="${product.originalPrice}" type="number" minFractionDigits="2"/>
                    </span>
                </div>
                <div class="promotionDiv">
                    <span class="promotionPriceDesc">促销价</span>
                    <span class="promotionPriceYuan">￥</span>
                    <span class="promotionPrice">
                        <fmt:formatNumber value="${product.promotePrice}" type="number" minFractionDigits="2"/>
                    </span>
                </div>
            </div>
        </div>

        <div class="productSaleAndReviewNumber">
            <div>销量<span class="redColor boldWord">${product.saleCount}</span></div>
            <div>累计评价<span class="redColor boldWord">${product.reviewCount}</span></div>
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
                            <img src="img/site/increase.png"/>
                        </span>
                    </a>
                    <span class="updownMiddle"></span>
                    <a class="decreaseNumber" href="#nowhere">
                        <span class="updown">
                            <img src="img/site/decrease.png"/>
                        </span>
                    </a>
                </span>
            件</span>
            <span>库存${product.stock}件</span>
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
            <a href="forebuyone?pid=${product.id}" class="buyLink"><button class="buyButton">立即购买</button> </a>
            <a href="#nowhere" class="addCartLink"><button class="addCartButton"><span class="glyphicon glyphicon-shopping-cart"></span>加入购物车</button> </a>
        </div>

    </div>
    <div style="clear:both"></div>
</div>



<%--
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
</style>--%>
