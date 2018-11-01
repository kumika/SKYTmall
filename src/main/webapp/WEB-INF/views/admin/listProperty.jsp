<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" import="java.util.*"%>


<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../include/admin/adminHeader.jsp"%>
<%@include file="../include/admin/adminNavigator.jsp"%>

<script>
    $(function () {
        $("#addForm").submit(function() {
            if (checkEmpty("name", "属性名称"))
                return true;
            return false;
        });
    })
</script>

<title>属性管理</title>

<div class="workingArea">
    <ol class="breadcrumb">
        <li><a href="admin_category_list">所有分类</a></li>
        <li><a href="admin_property_list?cid=${category.id}">${category.name}</a></li>
        <li class="active">属性管理</li>
    </ol>
    <div class="listDataTableDiv">
        <table class="table table-striped table-bordered table-hover  table-condensed">
            <thead>
            <tr class="success">
                <th>ID</th>
                <th>属性名称</th>
                <th>编辑</th>
                <th>删除</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${propertyList}" var="propertyList">
                <tr>
                    <td>${propertyList.id}</td>
                    <td>${propertyList.name}</td>
                    <td><a href="admin_property_edit?id=${propertyList.id}"><span class="glyphicon glyphicon-edit"></span></a> </td>
                    <td><a href="admin_property_delete?id=${propertyList.id}" deleteLink="true"><span class="glyphicon glyphicon-trash"></span></a> </td>

                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>


    <div class="pageDiv">
        <%@include file="../include/admin/adminpage.jsp"%>
    </div>

    <div class="panel panel-warning addDiv">
        <div class="panel-heading">新增属性</div>
        <div class="panel-body">
            <%--
                1. method="post" 用于保证中文的正确提交
                2. 必须有enctype="multipart/form-data"，这样才能上传文件
                3. accept="image/*" 这样把上传的文件类型限制在了图片
            --%>
            <form method="post" id="addForm" action="admin_property_add" enctype="multipart/form-data">
                <table class="addTable">
                    <tr>
                        <td>属性名称</td>
                        <td><input  id="name" name="name" type="text" class="form-control"></td>
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








