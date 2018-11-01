<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2018/9/13
  Time: 11:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/fore/header.jsp"%>
<html>


<div id="loginDiv">
    <div class="simpleLogo">
        <img src="../../../img/site/simpleLogo.png"/>
    </div>
    <img src="../../../img/site/loginBackground.png" id="loginBackgroundImg" class="loginBackgroundImg">
    <div class="loginSmallDiv" id="loginSmallDiv">
        <div class="login_acount_text">账户登录</div>
        <div class="loginInput">
            <span class="loginInputIcon">
                <span class="glyphicon glyphicon-user"></span>
            </span>
            <input type="text" placeholder="手机/会员名/邮箱" name="name" id="name">
        </div>
        <div class="loginInput">
            <span class="loginInputIcon">
                <span class="glyphicon glyphicon-lock"></span>
            </span>
            <input type="password" name="password" id="password" placeholder="密码">
        </div>
        <div>
            <a href="#nowhere" class="notImplementLink">忘记登陆密码</a>
            <a href="#nowhere" class="pull-right">免费注册</a>
        </div>
        <div style="margin-top: 20px">
            <button type="button" class="btn btn-block redButton">登录</button>
        </div>
    </div>
</div>

<style>
    div.simpleLogo{/*天猫图标logo所在div*/
        padding: 32px 0px;
    }
    img.loginBackgroundImg{/*背景图片*/
        display: block;
        margin: 0px auto;
    }
    div.loginSmallDiv{/*登录框div*/
        background-color: white;
        position: absolute;
        right: 80px;
        top: 180px;
        width: 350px;
        height: 400px;
        padding: 60px 25px 80px 25px;
    }
    div.login_acount_text{/*账号登录字样*/
        color: #3C3C3C;
        font-size: 16px;
        font-weight: bold;
    }
    div.loginInput{/*输入框所在div*/
        border: 1px solid #CBCBCB;
        margin: 20px 0px;
    }
    div.loginInput span.loginInputIcon{/*左侧放置图标的span*/
        margin: 0px;
        background-color: #CBCBCB;
        width: 40px;
        height: 40px;
        display:inline-block;
    }
    span.loginInputIcon span.glyphicon{/*用户和密码图标*/
        font-size: 22px;
        position: relative;
        left: 9px;
        top: 9px;
        color: #606060;
    }
    div.loginInput input{/*输入框*/
        display: inline-block;
        border: 0px solid transparent;
        width: 244px;
        height: 30px;
        position: relative;
        left: 6px;
        top: 6px;
    }
    body{/*整个body*/
        font-size: 12px;
        font-family: Arial;
    }
    a{/*所有超链*/
        color:#999;
    }
    a:hover{/*鼠标悬停*/
        text-decoration:none;
        color: #C40000;
    }
    button.redButton{/*登录按钮*/
        color: white;
        background-color: #C40000;
        font-size: 14px;
        font-weight: bold;
    }
</style>


</html>
<%@include file="../include/fore/footTotal.jsp"%>