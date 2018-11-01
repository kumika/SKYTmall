<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" import="java.util.*"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../include/admin/adminHeader.jsp"%>
<%@include file="../include/admin/adminNavigator.jsp"%>

<script>
    /*对分类名称做了为空判断，当为空的时候，不能提交*/
    $(function () {
        $("input.pvValue").keyup(function(){
            var value = $(this).val();
            var page = "admin_propertyValue_update";
            var pvid = $(this).attr("pvid");
            var parentSpan = $(this).parent("span");
            parentSpan.css("border","1px solid yellow");
            $.post(
                page,
                {"value":value,"id":pvid},
                function(result){
                    if("success"==result)
                        parentSpan.css("border","1px solid green");
                    else
                        parentSpan.css("border","1px solid red");
                }
            );
        });
    });
</script>

<title>编辑产品属性</title>

<div class="workingArea">
    <ol class="breadcrumb">
        <li><a href="admin_category_list">所有分类</a> </li>
        <li><a href="admin_product_list?cid=${product.category.id}">${product.category.name}</a> </li>
        <li class="active">编辑产品属性</li>
    </ol>

    <div class="panel panel-warning editDiv">
       <c:forEach items="${propertyValues}" var="propertyValues">
           <div class="eachPV">
               <span class="pvName">${propertyValues.property.name}</span>
               <span class="pvValue"><input class="pvValue" pvid="${propertyValues.id}" type="text" value="${propertyValues.value}"></span>
           </div>
       </c:forEach>
        <div style="clear:both"></div>
    </div>

</div>


<%@ include file="../include/admin/adminFooter.jsp"%>


















