<%--- 模仿天猫整站ssm 教程 为how2j.cn 版权所有-->
<- 本教程仅用于学习使用，切勿用于非法用途，由此引起一切后果与本站无关-->
-- 供购买者学习，请勿私自传播，否则自行承担相关法律责任-->--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>


<script>

	/*
	产品列表div是productsAsideCategorys

首先每个菜单项eachCategory都有一个cid属性，取的是该分类的id值
然后这个菜单项对应的产品列表，也有一个一样的cid属性。

整体思路是：
1. 把所有的产品列表都隐藏
2. 当鼠标移动到菜单项上的时候，取出对应的cid
3. 根据cid，找到对应的产品列表
4. 显示该产品列表
5. 当鼠标移开的时候，隐藏对应的产品列表
*/

	/*显示产品列表函数*/
function showProductsAsideCategorys(cid){
	$("div.eachCategory[cid="+cid+"]").css("background-color","white");
	$("div.eachCategory[cid="+cid+"] a").css("color","#87CEFA");
	$("div.productsAsideCategorys[cid="+cid+"]").show();
}

/*隐藏产品列表函数*/
function hideProductsAsideCategorys(cid){
	$("div.eachCategory[cid="+cid+"]").css("background-color","#e2e2e3");
	$("div.eachCategory[cid="+cid+"] a").css("color","#000");
	$("div.productsAsideCategorys[cid="+cid+"]").hide();
}
$(function(){
    /*当鼠标移入菜单项的时候，显示对应的产品列表*/
    $("div.eachCategory").mouseenter(function(){
        var cid = $(this).attr("cid");
        showProductsAsideCategorys(cid);
    });
    /*当鼠标移出菜单项的时候，隐藏对应的产品列表*/
    $("div.eachCategory").mouseleave(function(){
        var cid = $(this).attr("cid");
        hideProductsAsideCategorys(cid);
    });
    /*当鼠标移入产品列表的时候，显示对应的产品列表*/
    $("div.productsAsideCategorys").mouseenter(function(){
    	var cid = $(this).attr("cid");
    	showProductsAsideCategorys(cid);
    });
    /*当鼠标移出产品列表的时候，隐藏对应的产品列表*/
    $("div.productsAsideCategorys").mouseleave(function(){
    	var cid = $(this).attr("cid");
    	hideProductsAsideCategorys(cid);
    });
	
	$("div.rightMenu span").mouseenter(function(){
		var left = $(this).position().left;
		var top = $(this).position().top;
		var width = $(this).css("width");
		var destLeft = parseInt(left) + parseInt(width)/2;
		$("img#catear").css("left",destLeft);
		$("img#catear").css("top",top-20);
		$("img#catear").fadeIn(500);
				
	});
	$("div.rightMenu span").mouseleave(function(){
		$("img#catear").hide();
	});
	
	var left = $("div#carousel-of-product").offset().left;
	$("div.categoryMenu").css("left",left-20);
	$("div.categoryWithCarousel div.head").css("margin-left",left);
	$("div.productsAsideCategorys").css("left",left-20);
	
	
});
</script>

<img src="img/site/catear.png" id="catear" class="catear"/>
	
<div class="categoryWithCarousel">


<div class="headbar show1">
	<div class="head ">
	
		<span style="margin-left:10px" class="glyphicon glyphicon-th-list"></span>
		<span style="margin-left:10px" >商品分类</span>
		
	</div>
	
	<div class="rightMenu">
		<span><a href=""><img src="img/site/chaoshi.png"/></a></span>
		<span><a href=""><img src="img/site/guoji.png"/></a></span>

		<c:forEach items="${categories}" var="c" varStatus="st">
			<c:if test="${st.count<=4}">
				<span>
				<a href="forecategory?cid=${c.id}">
					${c.name}
				</a></span>			
			</c:if>
		</c:forEach>
	</div>
	
</div>

	
<div style="position: relative">
	<%@include file="categoryMenu.jsp" %>
</div>

<div style="position: relative;left: 0;top: 0;">
	<%@include file="productsAsideCategorys.jsp" %>
</div>



<%@include file="carousel.jsp" %>

<div class="carouselBackgroundDiv">
</div>

</div>





