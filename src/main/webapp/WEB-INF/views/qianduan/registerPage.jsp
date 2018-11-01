
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/fore/header.jsp" %>
<%@ include file="../include/fore/top.jsp" %>
<html>

<div class="registerDiv">
    <table align="center" class="registerTable">
        <tbody>
        <tr>
            <td class="registerTip registerTableLeftTD">设置会员名</td>
            <td></td>
        </tr>
        <tr>
            <td class="registerTableLeftTD">登录名</td>
            <td class="registerTableRightTD">
                <input placeholder="会员名一旦设置成功，无法修改" name="name" id="name">
            </td>
        </tr>
        <tr>
            <td class="registerTip registerTableLeftTD">设置登陆密码</td>
            <td class="registerTableRightTD">登陆时验证，保护账号信息</td>
        </tr>
        <tr>
            <td class="registerTableLeftTD">登陆密码</td>
            <td class="registerTableRightTD">
                <input type="password" placeholder="设置你的登陆密码" name="password" id="password">
            </td>
        </tr>
        <tr>
            <td class="registerTableLeftTD">登陆确认</td>
            <td class="registerTableRightTD">
                <input type="password" placeholder="请再次输入你的密码" id="repeatpassword">
            </td>
        </tr>
        <tr>
            <td class="registerButtonTD" colspan="2">
                <a href="#nowhere">
                    <button>提 交</button>
                </a>
            </td>
        </tr>
        </tbody>
    </table>
</div>

<style>
    div.registerDiv { /*注册页面div*/
        margin: 10px 20px;
        text-align: center;
    }

    table.registerTable { /*注册表格*/
        color: #3C3C3C;
        font-size: 16px;
        table-layout: fixed;
        margin-top: 50px;
    }

    table.registerTable td { /*单元格*/
        padding: 10px 30px;
    }

    table.registerTable input { /*输入框*/
        border: 1px solid #DEDEDE;
        width: 213px;
        height: 36px;
        font-size: 14px;
    }

    table.registerTable button { /*提交按钮*/
        width: 170px;
        height: 36px;
        border-radius: 2px;
        color: white;
        background-color: #C40000;
        border-width: 0px;
    }

    td.registerTip { /*提示文字*/
        font-weight: bold;
    }

    td.registerTableLeftTD { /*左侧单元格*/
        width: 300px;
        text-align: right;
    }

    td.registerTableRightTD { /*v右侧单元格*/
        width: 300px;
        text-align: left;
    }

    td.registerButtonTD { /*注册按钮*/
        text-align: center;
    }
</style>
</html>
<%@include file="../include/fore/footTotal.jsp" %>
