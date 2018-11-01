<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2018/9/10
  Time: 17:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>


<div style="display: block;" class="footer" id="footer">
    <div class="footer_ensure" id="footer_ensure">
        <img src="img/site/ensure.png">
    </div>

    <div class="footer_desc" id="footer_desc">
        <div class="descColumn">
            <span class="descColumnTitle">购物指南</span>
            <a href="#nowhere">免费注册</a>
            <a href="#nowhere">开通支付宝</a>
            <a href="#nowhere">支付宝充值</a>
        </div>
        <div class="descColumn">
            <span class="descColumnTitle">天猫保障</span>
            <a href="#nowhere">发票保障</a>
            <a href="#nowhere">售后规则</a>
            <a href="#nowhere">缺货赔付</a>
        </div>
        <div class="descColumn">
            <span class="descColumnTitle">支付方式</span>
            <a href="#nowhere">快捷支付</a>
            <a href="#nowhere">信用卡</a>
            <a href="#nowhere">蚂蚁花呗</a>
            <a href="#nowhere">货到付款</a>
        </div>
        <div class="descColumn">
            <span class="descColumnTitle">商家服务</span>
            <a href="#nowhere">商家入驻</a>
            <a href="#nowhere">商家中心</a>
            <a href="#nowhere">天猫智库</a>
            <a href="#nowhere">天猫规则</a>
            <a href="#nowhere">物流服务</a>
            <a href="#nowhere">喵言喵语</a>
            <a href="#nowhere">运营服务</a>
        </div>
        <div class="descColumn">
            <span>手机天猫</span>
            <a href="#nowhere">
                <img src="img/site/ma.png">
            </a>
        </div>
    </div>
    <div style="clear: both"></div>
</div>
<style>
    div.footer{/*页脚div*/
        margin: 0px 0px;
        /*无外边距*/
        border-top-style: solid;
        /*上边框实线*/
        border-top-width: 1px;
        /*上边框1个像素*/
        border-top-color: #e7e7e7;
        /*上边框颜色*/
    }
    div.footer_ensure{/*品质保障图片所在div*/
        margin-top: 24px;
        /*上外边距*/
        margin-bottom: 24px;
        /*下外边距*/
        text-align: center;
        /*图片居中*/
    }
    div.footer_desc{/*购物指南等超链所在div*/
        border-top-style: solid;
        /*上边框实线*/
        border-top-width: 1px;
        /*上边框1个像素*/
        border-top-color: #e7e7e7;
        /*上边框颜色*/
        padding-top: 30px;
        /*上内边距*/
        margin: 0px 20px;
        /*左右外边距20px*/
    }
    div.footer_desc div.descColumn{/*购物指南，天猫保障等列*/
        width: 20%;
        /*刚好有5列，所以每列占用20%*/
        float: left;
        /*漂浮起来，使得这些列水平摆放*/
        padding-left: 15px;
        /*左内边距15px*/
    }
    div.footer_desc div.descColumn span.descColumnTitle{/*购物指南等字样*/
        color: #646464;
        /*颜色*/
        font-weight: bold;
        /*粗体*/
        font-size: 16px;
        /*文本大小16px*/
    }
    div.footer_desc a{/*超链*/
        display: block;
        /*超链默认是inline,会水平摆放，改成block出现换行效果*/
        padding-top: 3px;
        /*3px内边距*/
    }
    body{/*整个body*/
        font-size: 12px;
        /*把所有文字的大小调成12px,这是天猫默认的文字大小*/
        font-family: Arial;
        /*字库使用Arial*/
    }
    a{/*所有超链*/
        color:#999;
     /*   所有的超链，都默认以灰色#999 形式表现出来*/
    }
    a:hover{/*鼠标悬停*/
        text-decoration:none;
        /*超链鼠标悬停的时候,没有下划线*/
        color: #C40000;
        /*超链鼠标悬停的时候,使用天猫红显示*/
    }
</style>
</html>
