#天猫实战SSM--前台前端实现与服务器交互





# 置顶导航页面top.jsp

置顶导航页面
这里会根据用户是否登录，决定是否显示退出按钮，或者登录注册按钮，以及购物车中的商品数量

![6220.png](https://i.loli.net/2018/09/16/5b9e76ea121de.png)

原版静态的前端
-------

```
<nav class="top">
        <a href="#nowhere">
            <span class="glyphicon glyphicon-home redColor"></span>
            天猫首页
        </a>
        <span>喵，欢迎来天猫</span>
            <a href="#nowhere">请登录</a>
            <a href="#nowhere">免费注册</a>
        <%--向右飘逸定位使用Bootstrap的pull-right样式，
        其实这个样式很简单，就是使用的float:right. !important;表示高优先级--%>
        <span class="pull-right"></span>
            <a href="#nowhere">我的订阅</a>
            <a href="#nowhere">
                <span class="glyphicon glyphicon-shopping-cart redColor"></span>
                购物车<strong>0</strong>
            </a>
    </nav>
```

交互的前端
-----

```
<nav class="top ">
    <a href="${contextPath}">
        <span style="color:#C40000;margin:0px" class=" glyphicon glyphicon-home redColor"></span>
        天猫首页
    </a>
 
    <span>喵，欢迎来天猫</span>

 <%-- 如果用户成功登录，则显示如下： --%>
    <c:if test="${!empty user}">
        <a href="loginPage">${user.name}</a>
        <a href="forelogout">退出</a>
    </c:if>
 <%--如果取不到用户信息则显示如下： --%>
    <c:if test="${empty user}">
        <a href="loginPage">请登录</a>
        <a href="registerPage">免费注册</a>
    </c:if>
 <%--向右飘逸定位使用Bootstrap的pull-right样式，
        其实这个样式很简单，就是使用的float:right. !important;表示高优先级--%>
    <span class="pull-right">
            <a href="forebought">我的订单</a>
            <a href="forecart">
            <span style="color:#C40000;margin:0px" class=" glyphicon glyphicon-shopping-cart redColor"></span>
            购物车<strong>${cartTotalItemNumber}</strong>件</a>
        </span>
 
</nav>
```


# 搜索 search.jsp


这里会从request的属性"cs" 中获取到分类集合，并取第5个到第8个，一共4个来显示。

![6221.png](https://i.loli.net/2018/09/16/5b9e76ea13c1a.png)


静态的前端：
------
```
<a href="#nowhere">
        <img class="logo" id="logo" src="img/site/logo.gif">
    </a>

    <div class="searchDiv">
        <input  type="text" placeholder="时尚男鞋  太阳镜 " name="keyword">
        <button class="searchButton" type="submit">搜索</button>
        <div class="searchBelow">
            <span>
                <a href="#nowhere">平衡车</a> <span> | </span>
            </span>
            <span>
                <a href="#nowhere">扫地机器人</a> <span> | </span>
            </span>
            <span>
                <a href="#nowhere">原汁机</a> <span> | </span>
            </span>
            <span>
                <a href="#nowhere">冰箱</a> <span> | </span>
            </span>
        </div>
    </div>
```


交互服务器的前端
--------

网页上的：
```
<a href="${contextPath}">
        <img class="logo" id="logo" src="img/site/logo.gif">
    </a>
    <form action="foresearch" method="post">
        <div class="searchDiv">
            <input  type="text" placeholder="时尚男鞋  太阳镜 " name="keyword">
            <button class="searchButton" type="submit">搜索</button>
            <div class="searchBelow">
                <c:forEach items="${cs}" var="c" varStatus="st">
                    <c:if test="${st.count >= 5 and st.count <=8}">
                        <span>
                            <a href="forecategory?cid=${c.id}">${c.name}</a>
                            <c:if test="${st.count!=8}">
                                <span> | </span>
                            </c:if>
                        </span>
                    </c:if>
                </c:forEach>
            </div>
        </div>
    </form>
```










































