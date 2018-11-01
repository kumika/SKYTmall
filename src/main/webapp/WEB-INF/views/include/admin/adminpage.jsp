<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" import="java.util.*" %>


<script>
    $(function () {
        $("ul.pagination li.disabled a").click(function () {
            return false;
        });
    });
</script>
<nav>
    <ul class="pagination">

        <%--首页超链：--%>
        <li <c:if test="${!page.hasPreviouse}">class="disabled"</c:if>>
            <a  href="?start=0${page.param}" aria-label="Previous" >
                <span aria-hidden="true">«</span>
            </a>
        </li>

            <%--
            获取JavaBean的属性，只需要通过.符号操作就可以了
                 像这样 ${hero.name} ，就会自动调用getName方法了
                如果属性是boolean类型，那么就会自动调用isXXX方法了
            --%>

            <%--上一页超链：--%>
        <li <c:if test="${!page.hasPreviouse}">class="disabled"</c:if>>
            <a  href="?start=${page.start-page.count}${page.param}" aria-label="Previous" >
                <span aria-hidden="true">‹</span>
            </a>
        </li>

            <%--  中间页 :  --%>
        <c:forEach begin="0" end="${page.totalPage-1}" varStatus="status">
            <c:if test="${status.count*page.count-page.start<=20 && status.count*page.count-page.start>=-10}">

                <li <c:if test="${status.index*page.count==page.start}">class="disabled"</c:if>>
                    <a
                            href="?start=${status.index*page.count}${page.param}"
                            <c:if test="${status.index*page.count==page.start}">class="current"</c:if>
                    >${status.count}</a>
                </li>

            </c:if>

        </c:forEach>


            <%-- 下一页超链：--%>
        <li <c:if test="${!page.hasNext}">class="disabled"</c:if>>
            <a href="?start=${page.start+page.count}${page.param}" aria-label="Next">
                <span aria-hidden="true">›</span>
            </a>
        </li>
            <%-- 最后一页: --%>
        <li <c:if test="${!page.hasNext}">class="disabled"</c:if>>
            <a href="?start=${page.last}${page.param}" aria-label="Next">
                <span aria-hidden="true">»</span>
            </a>
        </li>
    </ul>
</nav>



