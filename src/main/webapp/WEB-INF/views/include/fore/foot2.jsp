<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2018/9/10
  Time: 23:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>


<div class="footer" id="footer">
    <img src="img/site/cateye.png" id="cateye" class="cateye"/>

    <div class="copyright" id="copyright">
        <div class="white_link">
        <a href="#nowhere">关于天猫</a>
        <a href="#nowhere"> 帮助中心</a>
        <a href="#nowhere">开放平台</a>
        <a href="#nowhere">  诚聘英才</a>
        <a href="#nowhere">联系我们</a>
        <a href="#nowhere">网站合作</a>
        <a href="#nowhere">知识产权</a>
        <a href="#nowhere">  廉正举报 </a>
        </div>

        <div class="white_link">
            <a href="#nowhere"> 阿里巴巴集团</a><span class="slash"> | </span>
            <a href="#nowhere"> 淘宝网</a><span class="slash"> | </span>
            <a href="#nowhere">天猫 </a><span class="slash"> | </span>
            <a href="#nowhere">  聚划算</a><span class="slash"> | </span>
            <a href="#nowhere">全球速卖通</a><span class="slash"> | </span>
            <a href="#nowhere">全球速卖通</a><span class="slash"> | </span>
            <a href="#nowhere">阿里巴巴国际交易市场</a><span class="slash"> | </span>
            <a href="#nowhere">1688</a><span class="slash"> | </span>
            <a href="#nowhere">阿里妈妈</a><span class="slash"> | </span>
            <a href="#nowhere">  阿里旅行·去啊  </a><span class="slash"> | </span>
            <a href="#nowhere">  阿里云计算    </a><span class="slash"> | </span>
            <a href="#nowhere">    阿里通信    </a><span class="slash"> | </span>
            <a href="#nowhere">  YunOS    </a><span class="slash"> | </span>
            <a href="#nowhere">  阿里旅行·去啊    </a><span class="slash"> | </span>
            <a href="#nowhere">  万网    </a><span class="slash"> | </span>
            <a href="#nowhere">  高德   </a><span class="slash"> | </span>
            <a href="#nowhere">  优视    </a><span class="slash"> | </span>
            <a href="#nowhere">  友盟    </a><span class="slash"> | </span>
            <a href="#nowhere">  虾米    </a><span class="slash"> | </span>
            <a href="#nowhere">  天天动听    </a><span class="slash"> | </span>
            <a href="#nowhere">  来往    </a><span class="slash"> | </span>
            <a href="#nowhere">  钉钉    </a><span class="slash"> | </span>
            <a href="#nowhere">  支付宝    </a><span class="slash"> | </span>
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


<style>
    div.footer{/*页脚*/
        margin: 0px 0px;
        /*无外边距*/
        border-top-style: solid;
        /*上边框实线*/
        border-top-width: 1px;
        /*上边框1个像素*/
        border-top-color: #e7e7e7;
        /*上边框颜色*/
    }
    div.copyright{/*页脚二div*/
        background-color: black;
        /*背景色变为黑色*/
        border-top-style: solid;
        /*上边框实线*/
        border-top-width: 2px;
        /*上边框2个像素*/
        border-top-color: #C40000;
        /*上边框天猫红*/
    }
    div.copyright span.slash{/*竖线 | */
         color: white;
         /*白色*/
     }
    div.footer div.copyright div.white_link a{/*应该变成白色的超链*/
        color: white;
        /*白色*/
        padding: 0px 5px;
        /*水平内边距5px*/
    }
    div.footer div.copyright div.white_link{/*超链之间的间隔*/
        padding: 10px 0px;
        /*上下内边距10px*/
        margin-left: 10px;
        /*左外边距10px*/
    }
    div.license{/*下面关于经营许可证部分的div*/
        margin-left: 10px;
        /*做外边距10px*/
        padding-bottom: 30px;
        /*下内边距30px*/
    }
    div.license span{/*经营许可证部分字体的颜色*/
        color: #A4A4A4;
        /*颜色#A4A4A4;*/
    }
    div.license div.copyRightYear{/*版本信息中的年月*/
        margin: 10px 0px;
        /*上下外边距10px*/
        color: #686868;
        /*颜色#686868;*/
    }
    img.cateye{/*猫耳朵图片*/
        margin-left: 20px;
        /*左外边距20px*/
    }
    body{/*整个body*/
        font-size: 12px;
        /*把所有文字的大小调成12px,这是天猫默认的文字大小*/
        font-family: Arial;
        /*字库使用Arial*/
    }
</style>
</html>
