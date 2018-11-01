<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" import="java.util.*"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../include/admin/adminHeader.jsp"%>
<%@include file="../include/admin/adminNavigator.jsp"%>

<script>
    /*对分类名称做了为空判断，当为空的时候，不能提交*/
    $(function () {
        $("#editForm").submit(function () {
            if (!checkEmpty("name", "产品名称"))
                return false;
            if (!checkEmpty("originalPrice", "原价格"))
                return false;
            if (!checkEmpty("promotePrice", "促销价格"))
                return false;
            if (!checkEmpty("stock", "库存"))
                return false;
            return true;
        });
    });

</script>

<title>编辑属性</title>

<div class="workingArea">
    <ol class="breadcrumb">
        <li><a href="admin_category_list">所有分类</a> </li>
        <li><a href="admin_product_list?cid=${product.category.id}">${product.category.name}</a> </li>
        <li class="active">${product.name}</li>
        <li class="active">编辑属性</li>
    </ol>

    <div class="panel panel-warning editDiv">
        <div class="panel-heading">编辑产品</div>
        <div class="panel-body">
            <form method="post" id="editForm" action="admin_product_update" enctype="multipart/form-data">
                <table class="editTable">
                    <tr>
                        <td>产品名称</td>
                        <td><input  id="name" name="name" value="${product.name}" type="text" class="form-control"></td>
                    </tr>
                    <tr>
                        <td>产品小标题</td>
                        <td><input  id="subTitle" name="subTitle" value="${product.subTitle}" type="text" class="form-control"></td>
                    </tr>
                    <tr>
                        <td>原价格</td>
                        <td><input  id="originalPrice" name="originalPrice" value="${product.originalPrice}" type="text" class="form-control"></td>
                    </tr>
                    <tr>
                        <td>优惠价格</td>
                        <td><input  id="promotePrice" name="promotePrice" value="${product.promotePrice}" type="text" class="form-control"></td>
                    </tr>
                    <tr>
                        <td>库存</td>
                        <td><input  id="stock" name="stock" value="${product.stock}" type="text" class="form-control"></td>
                    </tr>
                    <tr class="submitTR">
                        <td colspan="2" align="center">
                            <input  type="hidden" name="id" value="${product.id}">
                            <input  type="hidden" name="cid" value="${product.category.id}">
                            <button type="submit" class="btn btn-success">提 交</button>
                        </td>
                    </tr>
                </table>
            </form>
        </div>
    </div>

</div>


<%@ include file="../include/admin/adminFooter.jsp"%>


















