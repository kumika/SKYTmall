<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2018/9/10
  Time: 23:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/fore/header.jsp"%>
<%@ include file="../include/fore/top.jsp" %>
<%@ include file="../include/fore/search.jsp"%>


<html>

<div class="categoryWithCarousel">
        <div class="headbar">
            <div class="head">
                <span class="glyphicon glyphicon-th-list" style="margin-left: 10px"></span>
                <span style="margin-left: 10px">商品分类</span>
            </div>

            <div class="rightMenu">
                <span>
                    <a href="#nowhere">
                        <img src="../../../img/site/chaoshi.png">
                    </a>
                </span>
                <span>
                    <a href="#nowhere">
                        <img src="../../../img/site/guoji.png">
                    </a>
                </span>
                <span>
                    <a href="#nowhere">
                        平板电视
                    </a>
                </span>
                <span>
                    <a href="#nowhere">
                        电热水器
                    </a>
                </span>
            </div>
        </div>

        <div data-ride="carousel" class="carousel-of-product carousel slide" id="carousel-of-product">
            <!-- Indicators  轮播（Carousel）指标 -->
            <ol class="carousel-indicators">
                <li class="active" data-slide-to="0" data-target="#carousel-of-product"></li>
                <li data-slide-to="1" data-target="#carousel-of-product" class=""></li>
                <li data-slide-to="2" data-target="#carousel-of-product" class=""></li>
                <li data-slide-to="3" data-target="#carousel-of-product" class=""></li>
            </ol>
            <!-- Wrapper for slides 轮播（Carousel）项目 -->
            <div role="listbox" class="carousel-inner">
                <div class="item active">
                    <img src="../../../img/lunbo/1.jpg" class="carousel carouselImage"/>
                </div>
                <div class="item">
                    <img src="../../../img/lunbo/2.jpg" class="carouselImage"/>
                </div>
                <div class="item" >
                    <img src="../../../img/lunbo/3.jpg" class="carouselImage"/>
                </div>
                <div class="item">
                    <img src="../../../img/lunbo/4.jpg" class="carouselImage"/>
                </div>
            </div>
        </div>
        <div class="carouselBackgroundDiv"></div>
    </div>
<style>
    div.categoryWithCarousel { /*分类和轮播总体div*/
        width: 100%;
        /*宽度100%*/
        position: relative;
        /*把这个div设计为相对定位，是因为在后面的carouselBackgroundDiv是居于这个div进行绝对定位的。*/
    }
    div.categoryWithCarousel div.headbar{/*导航条*/
        background-color: #DD2727;
        /*背景色比天猫红淡一点*/
    }
    div.categoryWithCarousel div.head{/*导航条中的商品分类字样*/
        width: 200px;
        /*宽度200px*/
        background-color: #C60A0A;
        /*背景色比导航条深一点*/
        height: 36px;
        /*高度36px*/
        line-height: 36px;
        /*行高36px,这样文字可以垂直居中*/
        font-size: 16px;
        /*字体大小16px*/
        font-weight: bold;
        /*粗体*/
        color: white;
        /*文字白色*/
        margin-left: 20px;
        /*左边距20px*/
        display: inline-block;
        /*设置为内联块，即可以做到不换行水平摆放，也可以设置大小*/
    }
    div.categoryWithCarousel div.rightMenu{/*导航条右侧子菜单*/
        display: inline-block;
        /*右侧子菜单设置为内联块，即可以做到不换行水平摆放，也可以设置大小*/
    }
    div.categoryWithCarousel div.rightMenu a{/*导航中的超链*/
        font-size: 16px;
        /*文字大小16px*/
        color: white;
        /*文字颜色白色*/
        text-decoration:none;
        /*没有下划线*/
    }
    div.categoryWithCarousel div.rightMenu span{/*导航中的span*/
        margin: 0px 20px 0px 20px;
     /*   文字之间的距离20px*/
    }
    div.categoryWithCarousel div.rightMenu img{/*天猫超市和天猫国际图片*/
        height: 30px;
     /*   高度30px，把图片变小*/
    }
    div.carousel-of-product{/*轮播div*/
        height: 510px;
        /*高度510px*/
        width:1024px;
        /*宽度1024px,设置宽度是为了配合下面的margin实现居中效果*/
        margin:0px auto;
        /*元素居中*/
    }
    img.carouselImage{/*轮播中的图片*/
        height: 510px !important;
        /*图片的高度设置为和轮播div的高度一样*/
    }
    div.carouselBackgroundDiv{/*和图片一样颜色的背景div (当高分辨率，比如1920px的时候会看见，不然会被轮播遮挡)*/
        width:100%;
        /*宽度100%*/
        height:510px;
        /*高度510px*/
        background-color:#E8E8E8;
        /*背景色和图片的背景色一致*/
        position:absolute;
        /*绝对定位*/
        top:36px;
        /*向下移动36px*/
        z-index:-1;
        /*表示在轮播图片的下方*/
    }
</style>


<div class="categoryWithCarousel">
    <div style="position: relative">
        <div class="categoryMenu">
            <div class="eachCategory" cid="83">
                <span class="glyphicon glyphicon-link"></span>
                <a href="#nowhere">平板电视</a>
            </div>
            <div class="eachCategory" cid="82">
                <span class="glyphicon glyphicon-link"></span>
                <a href="#nowhere">马桶</a>
            </div>
            <div class="eachCategory" cid="81">
                <span class="glyphicon glyphicon-link"></span>
                <a href="#nowhere">沙发</a>
            </div>
            <div class="eachCategory" cid="80">
                <span class="glyphicon glyphicon-link"></span>
                <a href="#nowhere">电热水器</a>
            </div>
            <div class="eachCategory" cid="79">
                <span class="glyphicon glyphicon-link"></span>
                <a href="#nowhere">平衡车</a>
            </div>
            <div class="eachCategory" cid="78">
                <span class="glyphicon glyphicon-link"></span>
                <a href="#nowhere">扫地机器人</a>
            </div>
            <div class="eachCategory" cid="77">
                <span class="glyphicon glyphicon-link"></span>
                <a href="#nowhere">原汁机</a>
            </div>
            <div class="eachCategory" cid="76">
                <span class="glyphicon glyphicon-link"></span>
                <a href="#nowhere">冰箱</a>
            </div>
            <div class="eachCategory" cid="75">
                <span class="glyphicon glyphicon-link"></span>
                <a href="#nowhere">空调</a>
            </div>
            <div class="eachCategory" cid="74">
                <span class="glyphicon glyphicon-link"></span>
                <a href="#nowhere">女表</a>
            </div>
            <div class="eachCategory" cid="73">
                <span class="glyphicon glyphicon-link"></span>
                <a href="#nowhere">男表</a>
            </div>
            <div class="eachCategory" cid="72">
                <span class="glyphicon glyphicon-link"></span>
                <a href="#nowhere">男士手拿包</a>
            </div>
            <div class="eachCategory" cid="71">
                <span class="glyphicon glyphicon-link"></span>
                <a href="#nowhere">男士西服</a>
            </div>
            <div class="eachCategory" cid="69">
                <span class="glyphicon glyphicon-link"></span>
                <a href="#nowhere">时尚男士</a>
            </div>
            <div class="eachCategory" cid="68">
                <span class="glyphicon glyphicon-link"></span>
                <a href="#nowhere">品牌女装</a>
            </div>
            <div class="eachCategory" cid="64">
                <span class="glyphicon glyphicon-link"></span>
                <a href="#nowhere">太阳镜</a>
            </div>
            <div class="eachCategory" cid="60">
                <span class="glyphicon glyphicon-link"></span>
                <a href="#nowhere">安全座椅</a>
            </div>
        </div>
    </div>

    <div style="position: relative;left:0;top:0;">
        <div class="productsAsideCategorys" cid="83">
            <div class="row">
                <a href="#nowhere">屏大影院</a>
                <a href="#nowhere">周末</a>
                <a href="#nowhere">新品特惠</a>
                <a href="#nowhere">32吋电视机</a>
                <a href="#nowhere">智能网络</a>
                <div class="seperator"></div>
            </div>
            <div class="row">
                <a href="#nowhere">USB高清解</a>
                <a href="#nowhere">芒果TV在线</a>
                <a href="#nowhere">抢购价</a>
                <a href="#nowhere">USB解码</a>
                <a href="#nowhere">32英吋</a>
                <a href="#nowhere">10核</a>
                <a href="#nowhere">TCL品牌日</a>
                <div class="seperator"></div>
            </div>
            <div class="row">
                <a href="#nowhere"> 不要赠品</a>
                <a href="#nowhere">新品上市</a>
                <a href="#nowhere">4K硬屏</a>
                <a href="#nowhere">领100元券</a>
                <a href="#nowhere" style="color:rgb(135, 206, 250);">
                    智能高清</a>
                <a href="#nowhere">8月，酷暑</a>
                <a href="#nowhere"style="color:rgb(135, 206, 250);">
                    8月大促</a>
                <a href="#nowhere">天猫定制</a>
                <div class="seperator"></div>
            </div>
            <div class="row">
                <a href="#nowhere">智能操作系统</a>
                <a href="#nowhere">金色外观</a>
                <a href="#nowhere">三星屏幕</a>
                <a href="#nowhere">客厅爆款</a>
                <a href="#nowhere">八核配置</a>
                <a href="#nowhere"> 限时特惠</a>
                <div class="seperator"></div>
            </div>
            <div class="row">
                <a href="#nowhere">限时特惠</a>
                <a href="#nowhere">热销爆款</a>
                <a href="#nowhere">4K全高清</a>
                <a href="#nowhere">领100元券</a>
                <a href="#nowhere" style="color:rgb(135, 206, 250);">
                    六核智能</a>
                <a href="#nowhere">14核4K</a>
                <a href="#nowhere">YUNOS</a>
                <a href="#nowhere"style="color:rgb(135, 206, 250);">
                    YUNOS</a>
                <a href="#nowhere">64位处理器</a>
                <div class="seperator"></div>
            </div>
            <div class="row">
                <a href="#nowhere">YUNOS</a>
                <a href="#nowhere">微信电视</a>
                <a href="#nowhere">4k超清</a>
                <a href="#nowhere">64位真4K</a>
                <a href="#nowhere">10核机芯</a>
                <a href="#nowhere">V字黑釉底座</a>
                <a href="#nowhere">4K超清</a>
                <div class="seperator"></div>
            </div>
            <div class="row">
                <a href="#nowhere">64位14核</a>
                <a href="#nowhere">海量影视</a>
                <a href="#nowhere">人气爆款</a>
                <a href="#nowhere">限时特惠</a>
                <a href="#nowhere">真4K屏</a>
                <a href="#nowhere">65吋巨屏</a>
                <a href="#nowhere" style="color:rgb(135, 206, 250);">
                    4K超清视界</a>
                <a href="#nowhere">限时特惠</a>
                <div class="seperator"></div>
            </div>
            <div class="row">
                <a href="#nowhere">55寸旗舰</a>
                <a href="#nowhere">4K机皇</a>
                <a href="#nowhere">曲面机皇</a>
                <a href="#nowhere" style="color:rgb(135, 206, 250);">
                    轻薄4K</a>
                <div class="seperator"></div>
        </div>
    </div>
</div>
    <div style="height: 510px"></div>
</div>

<style>
    div.categoryMenu{/*分类菜单div*/
        width: 200px;
        /*宽度200px*/
        background-color: #e2e2e3;
        /*背景色*/
        margin-left: 20px;
        /*左外边距*/
        position: absolute;
        /*绝对定位*/
        left: 0;
        /*紧靠左边*/
        top: 0;
        /*紧靠上面*/
        z-index: 1;
        /*因为这个菜单会和上个知识点讲解的轮播重叠在一起，为了使得这个菜单变得可以点击，需要使用z-index,把它放在"上面"*/
    }
    div.categoryMenu a{/*菜单中的连接*/
        color: #000;
        /*颜色黑色*/
    }
    div.categoryMenu a:hover{/*菜单中的连接悬停状态*/
        color: lightskyblue;
        /*悬停时候变成天蓝色*/
        text-decoration: none;
        /*去掉下划线*/
    }
    div.productsAsideCategorys{/*分类对应的推荐商品列表*/
        width: 800px;
        /*宽度800*/
        height: 510px;
        /*高度510,510这个高度，刚好和轮播的高度一样，所以当显示的时候，就恰好把轮播遮挡起来*/
        background-color: white;
        /*背景白色*/
        margin-left: 220px;
        /*左外边距220刚好接着左边的菜单*/
        position: absolute;
        /*绝对定位*/
        left: 0;
    /*贴在左边(左外边距在此基础上起作用)*/
        top: 0;
        /*贴在上面*/
        z-index: 1;
        /*因为这个产品列表div会和上个知识点讲解的轮播重叠在一起，为了使得这个菜单变得可以点击，需要使用z-index,把它放在"上面"*/
    }
    div.productsAsideCategorys div.row{/*商品列表中的每一行*/
        margin: 20px 80px 0px 80px;
        /*左右外边距80px,上外边距20px*/
    }
    div.productsAsideCategorys div.row div.seperator{/*每一行的分隔符*/
        margin-top: 20px;
       /* 上外边距20px*/
        border-bottom-style: dashed;
        /*下边框虚线*/
        border-bottom-width: 1px;
        /*下边框1个像素*/
        border-bottom-color: #e7e7e7;
       /* 下边框颜色*/
    }
    div.productsAsideCategorys a{/*商品连接*/
        color: #999;
        /*商品连接颜色灰色*/
        font-size: 14px;
        /*大小14px*/
        margin: 8px;
        /*外边距8px*/
    }
    div.productsAsideCategorys a:hover{/*商品连接悬停状态*/
        color: #C40000;
        /*悬停呈现天猫红*/
        text-decoration: none;
        /*没有下划线*/
    }
    div.eachCategory{/*每个分类*/
        line-height: 30px;
        /*文字垂直居中*/
        padding-left: 10px;
        /*左内边距10px*/
        font-size: 14px;
        /*大小14px*/
    }
    div.eachCategory span{/*每个分类前面的小图标*/
        margin-right: 10px;
        /*图标和文字之间有10px距离*/
    }
    div.eachCategory:hover{/*分类div悬停状态*/
        background-color: white;
        /*背景色改成白色，感觉就和右边的产品列表连在一起了*/
    }
</style>

<div class="homepageCategoryProducts">
    <div class="eachHomepageCategoryProducts">
        <div class="left-mark"></div>
        <span class="categoryTitle">太阳镜</span>
        <br>
                <div class="productItem">
                    <a href="#nowhere">
                        <img width="100px" src="../../../img/productSingle_middle/9543.jpg"/>
                    </a>
                    <a href="#nowhere" class="productItemDescLink">
                        <span class="productItemDesc">[热销]
                            好先生同款墨镜孙红雷偏光男士太阳镜韩明星
                        </span>
                    </a>
                    <span class="productPrice">97.50</span>
                </div>
                <div class="productItem">
                    <a href="#nowhere">
                        <img width="100px" src="../../../img/productSingle_middle/9532.jpg"/>
                    </a>
                    <a href="#nowhere" class="productItemDescLink">
                                <span class="productItemDesc">[热销]
                                    陌森太阳眼镜男女2016偏光定制驾驶近视
                                </span>
                    </a>
                    <span class="productPrice"> 518.70</span>
                </div>
                <div class="productItem">
                    <a href="#nowhere">
                        <img width="100px" src="../../../img/productSingle_middle/9521.jpg"/>
                    </a>
                    <a href="#nowhere" class="productItemDescLink">
                                        <span class="productItemDesc">[热销]
                                            帕莎Prsr太阳镜女偏光镜潮范冰冰同款女
                                        </span>
                    </a>
                    <span class="productPrice">624.00</span>
                </div>
                <div class="productItem">
                    <a href="#nowhere">
                        <img width="100px" src="../../../img/productSingle_middle/9510.jpg"/>
                    </a>
                    <a href="#nowhere" class="productItemDescLink">
                                                <span class="productItemDesc">[热销]
                                                    变色眼镜男女款半框太阳镜大框潮流防辐射防
                                                </span>
                    </a>
                    <span class="productPrice">170.00</span>
                </div>
                <div class="productItem">
                    <a href="#nowhere">
                        <img width="100px" src="../../../img/productSingle_middle/9499.jpg"/>
                    </a>
                    <a href="#nowhere" class="productItemDescLink">
                                                        <span class="productItemDesc">[热销]
                                                            新款男士偏光太阳镜日夜两用墨镜潮运动开车
                                                        </span>
                    </a>
                    <span class="productPrice">551.00</span>
                </div>
        <div style="clear: both;"></div>
    </div>

    <div class="eachHomepageCategoryProducts">
        <div class="left-mark"></div>
        <span class="categoryTitle">安全座椅</span>
        <br>
        <div class="productItem">
            <a href="#nowhere">
                <img width="100px" src="../../../img/productSingle_middle/10192.jpg"/>
            </a>
            <a href="#nowhere" class="productItemDescLink">
                        <span class="productItemDesc">[热销]
                            新生儿婴儿提篮式安全座椅汽车用车载儿童安
                        </span>
            </a>
            <span class="productPrice">882.00</span>
        </div>
        <div class="productItem">
            <a href="#nowhere">
                <img width="100px" src="../../../img/productSingle_middle/10181.jpg"/>
            </a>
            <a href="#nowhere" class="productItemDescLink">
                                <span class="productItemDesc">[热销]
                                    REEBABY汽车儿童安全座椅ISOFI
                                </span>
            </a>
            <span class="productPrice"> 1,344.00</span>
        </div>
        <div class="productItem">
            <a href="#nowhere">
                <img width="100px" src="../../../img/productSingle_middle/10170.jpg"/>
            </a>
            <a href="#nowhere" class="productItemDescLink">
                                        <span class="productItemDesc">[热销]
                                            REEBABY儿童安全座椅9个月-12岁
                                        </span>
            </a>
            <span class="productPrice">1,216.00</span>
        </div>
        <div class="productItem">
            <a href="#nowhere">
                <img width="100px" src="../../../img/productSingle_middle/9510.jpg"/>
            </a>
            <a href="#nowhere" class="productItemDescLink">
                                                <span class="productItemDesc">[热销]
                                                    好孩子汽车儿童安全座椅goodbaby9
                                                </span>
            </a>
            <span class="productPrice">1,199.40</span>
        </div>
        <div class="productItem">
            <a href="#nowhere">
                <img width="100px" src="../../../img/productSingle_middle/10148.jpg"/>
            </a>
            <a href="#nowhere" class="productItemDescLink">
                                                        <span class="productItemDesc">[热销]
                                                            惠尔顿儿童安全座椅isofix硬接口汽车
                                                        </span>
            </a>
            <span class="productPrice">1,993.60</span>
        </div>
        <div style="clear: both;"></div>
    </div>
    <img src="../../../img/site/end.png" class="endpng" id="endpng"/>
</div>

<style>
    div.homepageCategoryProducts{/*整体的产品列表div*/
        background-color: #F5F5F5;
        /*背景色*/
        padding: 50px 10px 50px 10px;
        /*内边距上下50px，左右10px*/
        margin: 10px auto;
        /*居中*/
        max-width: 1013px;
        /*最大宽度1013px，如果用户的分辨率比较大，那么就会使产品列表整体宽度最大1013，并且居中，这样看上去好一点，而不是铺满整个屏幕*/
    }
    div.productItem{/*产品项*/
        width: 189px;
        /*宽度*/
        height: 285px;
        /*高度*/
        border: 1px solid white;
        /*边框*/
        background-color: white;
        /*背景色*/
        margin: 8px 4px;
        /*外边距*/
        float: left;
        /*向左漂浮，这样使得所有的产品项可以水平摆放*/
        cursor: pointer;
        /*鼠标指正变成点击状态*/
    }
    div.productItem span.productItemDesc{/*产品描述信息*/
        font-size: 12px;
        /*字体*/
        color: #666666;
        /*颜色*/
        display: block;
        /*以块状显示，自动换行*/
        padding: 16px;
        /*内边距*/
    }
    div.productItem span.productPrice{/*产品价格*/
        font-size: 16px;
        /*字体大小*/
        color: #FF003A;
        /*颜色*/
        display: block;
        /*以块状显示，自动换行*/
        padding-left: 16px;
        /*左内边距*/
        margin-top: -10px;
        /*上外边距*/
    }
    div.productItem img{/*图片*/
        width: 187px;
        /*宽度*/
        height: 190px;
        /*高度*/
    }
    div.productItem img:hover{/*产品图片鼠标悬停状态*/
        opacity: 0.7;
        /*变亮*/
        filter: alpha(opacity = 70);
        /*火狐浏览器下的变亮*/
    }
    div.eachHomepageCategoryProducts{/*一个分类下5个产品为一个div*/
        margin: 0px 0px 40px 0px;
        /*下外边距40px*/
    }
    a.productItemDescLink{/*产品超链*/
        display: inline-block;
        /*显示为内联*/
        height: 66px;
        /*高度66px*/
        text-decoration:none;
        /*无下划线*/
    }
    span.categoryTitle{/*分类名称*/
        font-size: 16px;
        /*字体大小*/
        margin-left: 30px;
        /*左外边距30px*/
        color: #646464;
        /*颜色*/
        font-weight: bold;
        /*粗体*/
    }
    div.left-mark{/*竖状条---分类*/
        display: inline-block;
        /*显示为内联元素*/
        height: 20px;
        /*高度20px*/
        vertical-align: top;
        /*垂直居顶*/
        width: 5px;
        /*宽度5px*/
        background-color: #19C8A9;
        /*背景色*/
    }
    img.endpng{/*最下方"END"字样图片*/
        display: block;
        /*显示为块级，为了居中效果*/
        width: 82px;
        /*宽度*/
        margin: 0 auto;
        /*居中*/
    }
</style>

</html>

<%--<%@include file="WEB-INF/views/include/foot1.jsp"%>
<%@include file="WEB-INF/views/include/foot2.jsp"%>--%>

<%@include file="../include/fore/footTotal.jsp"%>
