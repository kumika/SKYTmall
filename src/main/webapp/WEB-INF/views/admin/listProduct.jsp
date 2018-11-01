<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" import="java.util.*"%>


<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../include/admin/adminHeader.jsp"%>
<%@include file="../include/admin/adminNavigator.jsp"%>

<script>

    $(function () {
        $("#addForm").submit(function () {
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

<title>属性管理</title>

<div class="workingArea">
    <ol class="breadcrumb">
        <li><a href="admin_category_list">所有分类</a></li>
        <li><a href="admin_product_list?cid=${category.id}">${category.name}</a></li>
        <li class="active">产品管理</li>
    </ol>
    <div class="listDataTableDiv">
        <table class="table table-striped table-bordered table-hover  table-condensed">
            <thead>
            <tr class="success">
                <th>ID</th>
                <th>图片</th>
                <th>产品名称</th>
                <th>产品小标题</th>
                <th width="53px">原价格</th>
                <th width="80px">优惠价格</th>
                <th width="80px">库存数量</th>
                <th width="80px">图片管理</th>
                <th width="80px">设置属性</th>
                <th width="42px">编辑</th>
                <th width="42px">删除</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${productList}" var="productList">
                <tr>
                    <td>${productList.id}</td>

                    <td>
                        <c:if test="${!empty productList.firstProductImage}">
                            <img width="40px" src="img/ProductImageSingle/${productList.firstProductImage.id}.jpg"/>
                        </c:if>
                    </td>

                    <td>${productList.name}</td>
                    <td>${productList.subTitle}</td>
                    <td>${productList.originalPrice}</td>
                    <td>${productList.promotePrice}</td>
                    <td>${productList.stock}</td>
                    <td><a href="admin_productImage_list?pid=${productList.id}"><span class="glyphicon glyphicon-list"></span></a> </td>
                    <td><a href="admin_propertyValue_edit?pid=${productList.id}"><span class="glyphicon glyphicon-list"></span></a> </td>
                    <td><a href="admin_product_edit?id=${productList.id}"><span class="glyphicon glyphicon-list"></span></a> </td>
                    <td><a href="admin_product_delete?id=${productList.id}" deleteLink="true"><span class="glyphicon glyphicon-trash"></span></a> </td>

                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>


    <div class="pageDiv">
        <%@include file="../include/admin/adminpage.jsp"%>
    </div>

    <div class="panel panel-warning addDiv">
        <div class="panel-heading">新增产品</div>
        <div class="panel-body">
            <%--
                1. method="post" 用于保证中文的正确提交
                2. 必须有enctype="multipart/form-data"，这样才能上传文件
                3. accept="image/*" 这样把上传的文件类型限制在了图片
            --%>
            <form method="post" id="addForm" action="admin_product_add" enctype="multipart/form-data">
                <table class="addTable">
                    <tr>
                        <td>产品名称</td>
                        <td><input  id="name" name="name" type="text" class="form-control"></td>
                    </tr>
                    <tr>
                        <td>产品小标题</td>
                        <td><input  id="subTitle" name="subTitle" type="text" class="form-control"></td>
                    </tr>
                    <tr>
                        <td>原价格</td>
                        <td><input  id="originalPrice" name="originalPrice" value="99.98" type="text" class="form-control"></td>
                    </tr>
                    <tr>
                        <td>优惠价格</td>
                        <td><input  id="promotePrice" name="promotePrice" value="19.98" type="text" class="form-control"></td>
                    </tr>
                    <tr>
                        <td>库存</td>
                        <td><input  id="stock" name="stock" value="199" type="text" class="form-control"></td>
                    </tr>
                    <tr class="submitTR">
                        <td colspan="2" align="center">
                            <input type="hidden" name="cid" value="${category.id}">
                            <button type="submit" class="btn btn-success">提 交</button>
                        </td>
                    </tr>
                </table>
            </form>
        </div>
    </div>

</div>


<%@ include file="../include/admin/adminFooter.jsp"%>








