<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2018/9/10
  Time: 16:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>

<div>
    <a href="${contextPath}">
        <img class="simpleLogo" id="simpleLogo"  src="img/site/simpleLogo.png">
    </a>
    <div class="simpleSearchDiv pull-right">
        <input type="text" name="keyword"  placeholder="平衡车 原汁机">
        <button type="button" class="searchButton">搜天猫</button>
        <div class="searchBelow">
            <c:forEach items="${categories}" var="category" varStatus="categories">
                <c:if test="${categories.count>=8 and categories.count<=11}">

                    <span>
                    <a href="forecategory?cid=${category.id}">
                        ${category.name}
                    </a>
                        <c:if test="${categories!=11}">
                            <span> | </span>
                        </c:if>
                    </span>
                </c:if>
            </c:forEach>
        </div>
    </div>
    <div style="clear: both"></div>
</div>

<%--
<style>
    div.simpleSearchDiv{/*简单搜索栏*/
        background-color: #C40000;
        /*背景色天猫红*/
        width: 300px;
        /*宽度300px*/
        margin: 10px 20px 40px;
        /*外边距*/
        padding: 1px;
        /*内边距1px*/
        height: 40px;
        /*高度40px*/
        display: block;
        /*用块状显示，只有使用块状显示的时候，上下外边距才会生效*/
    }
    div.simpleSearchDiv input{/*输入框*/
        width: 225px;
        /*按钮宽度225px*/
        border: 1px solid transparent;
        /*边框透明不然会有阴影，看上去就不是嵌进去的*/
        height: 34px;
        /*高度34px*/
        margin: 2px;
        /*外边距2px，显得和外面的div有一定的距离*/
        outline:none;
        /*去掉输入框轮廓，否则获取焦点的时候会发生颜色变化*/
    }
    div.simpleSearchDiv button{/*搜天猫按钮*/
        width: 60px;
        /*按钮宽度60px*/
        border: 1px solid transparent;
        /*边框透明不然会有阴影，看上去就不是嵌进去的*/
        background-color: #C40000;
        /*背景色天猫红，和div的背景色一样，按钮轮廓就会消失*/
        color: white;
        /*文字颜色白色*/
        font-size: 14px;
        /*文字大小*/
            /* font-weight:bold */;
     /*   首页的搜索框字体是粗体，这里没有使用*/
    }
    div.searchBelow{/*关键字所在div*/
        margin-top: 3px;
        /*下方关键字所在的div，上外边距*/
        margin-left: -20px;
     /*   左边距，结合超链的内边距，正好使得超链出现在开始的位置*/
    }
    div.searchBelow span{/*关键字之间的 | */
        color: #999;
        /*设置为灰色*/
    }
    div.searchBelow a{/*关键字超链*/
        padding: 0px 20px 0px 20px;
        /*超链的左右内编剧*/
        font-size: 14px;
     /*   超链文字大小*/
    }
    img.simpleLogo{/*logo图片*/
        position: absolute;
        /*logo图片使用绝对定位*/
        left: 10px;
        /*左边距离*/
        top: 50px;
        /*上方距离*/
        width: 140px;
     /*   宽度*/
    }
    body{/*整个body*/
        font-size: 12px;
       /* 把所有文字的大小调成12px,这是天猫默认的文字大小*/
        font-family: Arial;
        /*字库使用Arial*/
    }
    a{
        color:#999;
       /* 所有的超链，都默认以灰色#999 形式表现出来*/
    }
    a:hover{/*鼠标悬停*/
        text-decoration:none;
        /*超链鼠标悬停的时候,没有下划线*/
        color: #C40000;
        /*超链鼠标悬停的时候,使用天猫红显示*/
    }
</style>--%>

