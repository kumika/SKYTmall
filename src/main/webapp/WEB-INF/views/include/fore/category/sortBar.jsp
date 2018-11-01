<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2018/9/29
  Time: 23:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>

<script>

    $(function(){
        $("input.sortBarPrice").keyup(function(){
            //$(this).val() 相当于  $(this).attr(“value”);
            var num= $(this).val();
            if(num.length==0){
                $("div.productUnit").show();
                return;
            }

            num = parseInt(num);
            if(isNaN(num))
                num= 1;
            if(num<=0)
                num = 1;
            $(this).val(num);

            var begin = $("input.beginPrice").val();
            var end = $("input.endPrice").val();
            if(!isNaN(begin) && !isNaN(end)){
                console.log(begin);
                console.log(end);
                $("div.productUnit").hide();
                $("div.productUnit").each(function(){
                    var price = $(this).attr("price");
                    price = new Number(price);

                    if(price<=end && price>=begin)
                        $(this).show();
                });
            }

        });
    });
</script>


<div class="categorySortBar">
    <table class="categorySortBarTable categorySortTable">
        <tbody>
        <%-- 根据sort参数判断哪个排序按钮高亮  每个排序按钮提交到本页面，
        测试：即/forecategory，并带上参数sort --%>
        <tr>
            <td <c:if test="${'all' == param.sort || empty param.sort}"> class="grayColumn" </c:if> >
                <a href="?cid=${category.id}&sort=all">
                    综合
                    <span class="glyphicon plyphicon-arrow-down"></span>
                </a>
            </td>

            <td <c:if test="${'review' == param.sort}"> class="grayColumn"</c:if> >
                <a href="?cid=${category.id}&sort=review">
                    人气
                    <span class="glyphicon plyphicon-arrow-down"></span>
                </a>
            </td>

            <td <c:if test="${'date' == param.sort}"> class="grayColumn" </c:if> >
                <a href="?cid=${category.id}&sort=date">
                    新品
                    <span class="glyphicon plyphicon-arrow-down"></span>
                </a>
            </td>

            <td <c:if test="${'saleCount' == param.sort}"> class="grayColumn" </c:if> >
                <a href="?cid=${category.id}&sort=saleCount">
                    销量
                    <span class="glyphicon plyphicon-arrow-down"></span>
                </a>
            </td>

            <td <c:if test="${'price' == param.sort}"> class="grayColumn" </c:if> >
                <a href="?cid=${category.id}&sort=price">
                    价格
                    <span class="glyphicon glyphicon-resize-vertical"></span>
                </a>
            </td>

        </tr>
        </tbody>
    </table>

    <table class="categorySortBarTable">
        <tbody>
        <tr>
            <td>
                <input type="text" placeholder="请输入" class="sortBarPrice beginPrice">
            </td>
            <td class="grayColumn priceMiddleColumn">-</td>
            <td>
                <input type="text" placeholder="请输入" class="sortBarPrice endPrice">
            </td>
        </tr>
        </tbody>
    </table>
</div>



























