<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2018/9/10
  Time: 11:01
  To change this template use File | Settings | File Templates.
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>



<div>
    <a href="${contextPath}">
        <img class="logo" id="logo" src="img/site/logo.gif">
    </a>

    <form action="foresearch" method="post">
        <div class="searchDiv">
            <input  type="text" placeholder="five  我想玩怪物猎人世界，有时间某 " name="keyword">
            <button class="searchButton" type="submit">搜索</button>
            <div class="searchBelow">
                <c:forEach items="${categories}" var="c" varStatus="st">
                    <c:if test="${st.count >= 0 and st.count <=4}">
                        <span>
                            <a href="forecategory?cid=${c.id}">${c.name}</a>
                            <c:if test="${st.count!=8}">
                                <span>|</span>
                            </c:if>
                        </span>
                    </c:if>
                </c:forEach>
            </div>
        </div>
    </form>
<div style="height: 50px"></div>
</div>





<style>
    div.searchDiv{/*搜索栏*/
        background-color: #C40000;
        /*搜索框div背景色是天猫红#C40000;*/
        width: 400px;
        /*宽度固定400px;*/
        margin: 50px auto;
        /*水平居中，并且有50px的上下外边距*/
        padding: 1px;
        /*有1px的内边距*/
        height: 40px;
        /*高度是40px；*/
        display: block;
        /*以块状元素显示，只有在以块状元素显示的时候,
        水平居中才有效果。 当然div默认也是块状元素显示的*/

        /*
            这里个人修改成：
                            margin ： 150px auto
                            水平居中，并且有150px的上下外边距
        */

    }
    div.searchDiv input{/*搜索栏中的输入框*/
        width: 275px;
        /*宽度275px*/
        border: 1px solid transparent;
        /*边框设置成透明的，否则会有边框阴影*/
        height: 36px;
        /*高度36px*/
        margin: 1px;
        /*外边距设置为1px，看上去输入框和边框之间就有很小的空隙*/
        outline:none;
        /*去掉输入框轮廓，否则获取焦点的时候会发生颜色变化*/
    }
    div.searchDiv button{/*搜索栏中的按钮*/
        width: 110px;
        /*宽度110px,这样加上左边的input的275px的宽度，正好把searchDiv填满*/
        border: 1px solid transparent;
        /*边框设置成透明的，否则会有边框阴影*/
        background-color: #C40000;
        /*背景色设置成天猫红，和searchDiv融为一体*/
        color: white;
        /*字体白色*/
        font-size: 20px;
        /*字体大小20px*/
        font-weight: bold;
        /*字体加粗*/
    }
    div.searchBelow{/*搜索栏下方的关键字*/
        margin-top: 3px;
        /*搜索栏下方的div，有3个像素的上外边距*/
        margin-left: -20px;
        /*-20个像素的左外边距*/
    }
    div.searchBelow span{/*关键字之间的竖棒*/
        color: #999;
        /*把不同的关键字之间的竖棒设置为灰色*/
    }
    div.searchBelow a{/*关键字超链*/
        padding: 0px 20px 0px 20px;
        /*超链之间的水平间隔20px*/
        font-size: 14px;
        /*超链文字大小14px*/
    }
    img.logo{/*logo图片*/
        position: absolute;
        /*logo图片使用绝对定位*/
        left: 0px;
        /*贴在左边*/
        top: 30px;
        /*距离上面30px*/
        z-index:-1;
        /*-1表示放在下面，免得图片挡住了输入框*/
        /*
        个人修改成： position： auto
                    top 20px
        */

    }
    body{/*整个body*/
        font-size:12px;
        /*把所有文字的大小调成12px,这是天猫默认的文字大小*/
        font-family:Arial;
/*        字库使用Arial*/
    }
    a{/*所有超链*/
        color:#999;
        /*所有的超链，都默认以灰色#999 形式表现出来*/
    }
    a:hover{/*鼠标悬停*/
        text-decoration:none;
        /*超链鼠标悬停的时候,没有下划线*/
        color:#C40000;
        /*超链鼠标悬停的时候,使用天猫红显示*/
    }
</style>

