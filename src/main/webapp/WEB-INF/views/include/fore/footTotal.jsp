<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2018/9/13
  Time: 21:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>



<%@include file="modal.jsp" %>

<div style="display: block;" class="footer" id="footer">

    <div class="workArea">
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

    <div class="workArea">
        <img src="img/site/cateye.png" id="cateye" class="cateye"/>

        <div class="copyright" id="copyright">
            <div class="white_link">
                <a href="#nowhere">关于天猫</a>
                <a href="#nowhere"> 帮助中心</a>
                <a href="#nowhere">开放平台</a>
                <a href="#nowhere"> 诚聘英才</a>
                <a href="#nowhere">联系我们</a>
                <a href="#nowhere">网站合作</a>
                <a href="#nowhere">知识产权</a>
                <a href="#nowhere"> 廉正举报 </a>
            </div>
            <div class="white_link">
                <a href="#nowhere"> 阿里巴巴集团</a><span class="slash"> | </span>
                <a href="#nowhere"> 淘宝网</a><span class="slash"> | </span>
                <a href="#nowhere">天猫 </a><span class="slash"> | </span>
                <a href="#nowhere"> 聚划算</a><span class="slash"> | </span>
                <a href="#nowhere">全球速卖通</a><span class="slash"> | </span>
                <a href="#nowhere">全球速卖通</a><span class="slash"> | </span>
                <a href="#nowhere">阿里巴巴国际交易市场</a><span class="slash"> | </span>
                <a href="#nowhere">1688</a><span class="slash"> | </span>
                <a href="#nowhere">阿里妈妈</a><span class="slash"> | </span>
                <a href="#nowhere"> 阿里旅行·去啊 </a><span class="slash"> | </span>
                <a href="#nowhere"> 阿里云计算 </a><span class="slash"> | </span>
                <a href="#nowhere"> 阿里通信 </a><span class="slash"> | </span>
                <a href="#nowhere"> YunOS </a><span class="slash"> | </span>
                <a href="#nowhere"> 阿里旅行·去啊 </a><span class="slash"> | </span>
                <a href="#nowhere"> 万网 </a><span class="slash"> | </span>
                <a href="#nowhere"> 高德 </a><span class="slash"> | </span>
                <a href="#nowhere"> 优视 </a><span class="slash"> | </span>
                <a href="#nowhere"> 友盟 </a><span class="slash"> | </span>
                <a href="#nowhere"> 虾米 </a><span class="slash"> | </span>
                <a href="#nowhere"> 天天动听 </a><span class="slash"> | </span>
                <a href="#nowhere"> 来往 </a><span class="slash"> | </span>
                <a href="#nowhere"> 钉钉 </a><span class="slash"> | </span>
                <a href="#nowhere"> 支付宝 </a><span class="slash"> | </span>
            </div>
            <div class="license">
                <span>增值电信业务经营许可证： 浙B2-20110446</span>
                <span>网络文化经营许可证：浙网文[2015]0295-065号</span>
                <span>互联网医疗保健信息服务 审核同意书 浙卫网审【2014】6号 </span>
                <span>互联网药品信息服务资质证书编号：浙-（经营性）-2012-0005</span>
                <div class="copyRightYear">© 2003-2016 TMALL.COM 版权所有</div>

                <div>
                    <img src="img/site/copyRight1.jpg"/>
                    <img src="img/site/copyRight2.jpg"/>
                </div>
            </div>
        </div>
    </div>


</div>
<%--
<style>
    div.footer { /*页脚*/
        margin: 0px 0px;
        /*无外边距*/
        border-top-style: solid;
        /*上边框实线*/
        border-top-width: 1px;
        /*上边框1个像素*/
        border-top-color: #e7e7e7;
        /*上边框颜色*/
    }

    div.copyright { /*页脚二div*/
        background-color: black;
        /*背景色变为黑色*/
        border-top-style: solid;
        /*上边框实线*/
        border-top-width: 2px;
        /*上边框2个像素*/
        border-top-color: #C40000;
        /*上边框天猫红*/
    }

    div.copyright span.slash { /*竖线 | */
        color: white;
        /*白色*/
    }

    div.footer div.copyright div.white_link a { /*应该变成白色的超链*/
        color: white;
        /*白色*/
        padding: 0px 5px;
        /*水平内边距5px*/
    }

    div.footer div.copyright div.white_link { /*超链之间的间隔*/
        padding: 10px 0px;
        /*上下内边距10px*/
        margin-left: 10px;
        /*左外边距10px*/
    }

    div.license { /*下面关于经营许可证部分的div*/
        margin-left: 10px;
        /*做外边距10px*/
        padding-bottom: 30px;
        /*下内边距30px*/
    }

    div.license span { /*经营许可证部分字体的颜色*/
        color: #A4A4A4;
        /*颜色#A4A4A4;*/
    }

    div.license div.copyRightYear { /*版本信息中的年月*/
        margin: 10px 0px;
        /*上下外边距10px*/
        color: #686868;
        /*颜色#686868;*/
    }

    img.cateye { /*猫耳朵图片*/
        margin-left: 20px;
        /*左外边距20px*/
    }

    body { /*整个body*/
        font-size: 12px;
        /*把所有文字的大小调成12px,这是天猫默认的文字大小*/
        font-family: Arial;
        /*字库使用Arial*/
    }
</style>
<style>
    div.footer { /*页脚div*/
        margin: 0px 0px;
        /*无外边距*/
        border-top-style: solid;
        /*上边框实线*/
        border-top-width: 1px;
        /*上边框1个像素*/
        border-top-color: #e7e7e7;
        /*上边框颜色*/
    }

    div.footer_ensure { /*品质保障图片所在div*/
        margin-top: 24px;
        /*上外边距*/
        margin-bottom: 24px;
        /*下外边距*/
        text-align: center;
        /*图片居中*/
    }

    div.footer_desc { /*购物指南等超链所在div*/
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

    div.footer_desc div.descColumn { /*购物指南，天猫保障等列*/
        width: 20%;
        /*刚好有5列，所以每列占用20%*/
        float: left;
        /*漂浮起来，使得这些列水平摆放*/
        padding-left: 15px;
        /*左内边距15px*/
    }

    div.footer_desc div.descColumn span.descColumnTitle { /*购物指南等字样*/
        color: #646464;
        /*颜色*/
        font-weight: bold;
        /*粗体*/
        font-size: 16px;
        /*文本大小16px*/
    }

    div.footer_desc a { /*超链*/
        display: block;
        /*超链默认是inline,会水平摆放，改成block出现换行效果*/
        padding-top: 3px;
        /*3px内边距*/
    }

    body { /*整个body*/
        font-size: 12px;
        /*把所有文字的大小调成12px,这是天猫默认的文字大小*/
        font-family: Arial;
        /*字库使用Arial*/
    }

    a { /*所有超链*/
        color: #999;
        /*   所有的超链，都默认以灰色#999 形式表现出来*/
    }

    a:hover { /*鼠标悬停*/
        text-decoration: none;
        /*超链鼠标悬停的时候,没有下划线*/
        color: #C40000;
        /*超链鼠标悬停的时候,使用天猫红显示*/
    }
</style>--%>
</html>