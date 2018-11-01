<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2018/9/10
  Time: 9:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>

<%-- 顶部导航栏 --%>



<nav class="top">
    <a href="${contextPath}">
        <span class="glyphicon glyphicon-home redColor"></span>
        天猫首页
    </a>

    <span>喵，欢迎来天猫</span>
    <%--如果取不到用户信息则显示如下： --%>
    <c:if test="${empty user}">
        <a href="loginPage">请登录</a>
        <a href="registerPage">免费注册</a>
    </c:if>
    <%-- 如果用户成功登录，则显示如下： --%>
    <c:if test="${!empty user}">
        <a href="loginPage">${user.name}</a>
        <a href="forelogout">退出</a>
    </c:if>

    <%--向右飘逸定位使用Bootstrap的pull-right样式，
    其实这个样式很简单，就是使用的float:right. !important;表示高优先级--%>
    <span class="pull-right">
        <a href="forebought">我的订单</a>
        <a href="forecart">
            <span class="glyphicon glyphicon-shopping-cart redColor"></span>
            <%--cartTotalItemNumber变量 是在拦截器中创建的--%>
            购物车<strong>${cartTotalItemNumber}</strong>件
        </a>
    </span>
</nav>



<%--<style>
    body{
        &lt;%&ndash;把所有文字的大小调成12px,这是天猫默认的文字大小&ndash;%&gt;
        font-size:12px;
        &lt;%&ndash;字库使用Arial&ndash;%&gt;
        font-family:Arial;
    }
    a{
        /*所有的超链，都以灰色#999 形式表现出来*/
        color: #999;
    }
    .redColor{
        /*天猫整个网站使用的天猫红都是#C40000,
        在这个例子里首页和购物车图标使用了本样式
            其实就是鼠标移动上图标后，图标变成红色
        */
        color: #C40000 !important;
    }
    nav.top{
        /*置顶导航nav*/

        background-color: #f2f2f2;
        /*背景色#f2f2f2;*/
        padding-top: 5px;
        /*上内边距是5px*/
        padding-bottom: 5px;
        /*下内边距是5px*/
        border-bottom:1px solid #e7e7e7;
        /*下边缘有1个像素的实线边框，颜色是比背景色#f2f2f2略深的#e7e7e7*/
    }
    nav.top span, nav.top a{/*置顶导航里的span和超链*/
        color: #999;
       /* 颜色#999*/
        margin: 0px 10px 0px 10px;
        /*并且有左右外边距10px，但是没有上下外边距*/
    }
    nav.top a:hover{/*超链悬停*/
        color: #C40000;
        /*当鼠标移动到超链上的时候，颜色变为天猫红 #C40000*/
        text-decoration:none;
        /*去掉下划线*/
    }
</style>--%>
