<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" import="java.util.*"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../include/admin/adminHeader.jsp"%>
<%@include file="../include/admin/adminNavigator.jsp"%>

<script>
    /*对分类名称做了为空判断，当为空的时候，不能提交*/
    $(function () {
        $("#editForm").submit(function () {
            if (!checkEmpty("name", "属性名称"))
                return false;
            return true;
        });
    });

</script>

<title>编辑属性</title>

<div class="workingArea">
    <ol class="breadcrumb">
        <li><a href="admin_category_list">所有分类</a> </li>
        <li><a href="admin_property_list?cid=${property.category.id}">${property.category.name}</a> </li>
        <li class="active">编辑属性</li>
    </ol>

    <div class="panel panel-warning editDiv">
        <div class="panel-heading">编辑属性</div>
        <div class="panel-body">
            <form method="post" id="editForm" action="admin_property_update" enctype="multipart/form-data">
                <table class="editTable">
                    <tr>
                        <td>属性名称</td>
                        <td><input  id="name" name="name" value="${property.name}" type="text" class="form-control"></td>
                    </tr>

                    <tr class="submitTR">
                        <td colspan="2" align="center">
                            <input  type="hidden" name="id" value="${property.id}">
                            <input  type="hidden" name="cid" value="${property.category.id}">
                            <button type="submit" class="btn btn-success">提 交</button>
                        </td>
                    </tr>
                </table>
            </form>
        </div>
    </div>

</div>


<%@ include file="../include/admin/adminFooter.jsp"%>


















