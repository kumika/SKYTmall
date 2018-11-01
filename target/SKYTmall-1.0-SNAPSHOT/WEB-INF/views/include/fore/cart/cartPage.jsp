<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2018/9/30
  Time: 15:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>

<div class="cartDiv">
    <div class="cartTitle pull-right">
        <span>已选商品（不含运费）</span>
        <span class="cartTitlePrice">￥0.00</span>
        <button class="createOrderButton" style="background-color: rgb(170,170,170);" disabled="disabled">结算</button>
    </div>

    <div class="cartProductList">
        <table class="cartProductTable">
            <thead>
            <tr>
                <th class="selectAndImage">
                    <img src="img/site/cartNotSelected.png" class="selectAllItem" selectit="false"/>
                    全选
                </th>
                <th>商品信息</th>
                <th>单价</th>
                <th>数量</th>
                <th width="120px">金额</th>
                <th class="operation">操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${orderItems}" var="orderItem">
            <tr class="cartProductItemTR" oiid="${orderItem.id}">
                <td>
                    <img src="img/site/cartNotSelected.png" class="cartProductItemIfSelected" oiid="${orderItem.id}"
                         selectit="false"/>
                    <a href="#nowhere" style="display: none"><img src="img/site/cartSelected.png"></a>
                    <img  src="img/ProductImage_middle/${orderItem.product.firstProductImage.id}.jpg" class="cartProductImg">
                </td>
                <td>
                    <div class="cartProductLinkOutDiv">
                        <a class="cartProductLink" href="foreproduct?pid=${orderItem.product.id}">
                            ${orderItem.product.name}
                        </a>
                        <div class="cartProductLinkInnerDiv">
                            <img title="支持信用卡支付" src="img/site/creditcard.png">
                            <img title="消费者保障服务,承诺7天退货" src="img/site/7day.png">
                            <img title="消费者保障服务,承诺如实描述" src="img/site/promise.png">
                        </div>
                    </div>
                </td>
                <td>
                    <span class="cartProductItemOringalPrice">￥${orderItem.product.originalPrice} </span>
                    <span class="cartProductItemPromotionPrice">￥${orderItem.product.promotePrice} </span>
                </td>


               <td>
                    <div class="cartProductChangeNumberDiv">
                        <span pid="${orderItem.product.id}" class="hidden orderItemStock">${orderItem.product.stock}</span>
                        <span pid="${orderItem.product.id}" class="hidden orderItemPromotePrice">${orderItem.product.promotePrice}</span>
                        <a href="#nowhere" class="numberMinus" pid="${orderItem.product.id}">-</a>
                        <input value="${orderItem.number}" autocomplete="off" class="orderItemNumberSetting" oiid="${orderItem.id}" pid="${orderItem.product.id}">
                        <a href="#nowhere" class="numberPlus" pid="${orderItem.product.id}" stock="${orderItem.product.stock}">+</a>
                    </div>
                </td>
                <td>
                    <span class="cartProductItemSmallSumPrice" oiid="${orderItem.id}" pid="${orderItem.product.id}" >
                        ￥<fmt:formatNumber type="number" value="${orderItem.product.promotePrice*orderItem.number}" minFractionDigits="2"/>
                    </span>
                </td>
                <td>
                    <a href="#nowhere" oiid="${orderItem.id}" class="deleteOrderItem">删除</a>
                </td>
            </tr>

            </c:forEach>
            </tbody>
        </table>
    </div>

    <div class="cartFoot">
        <img src="img/site/cartNotSelected.png" class="selectAllItem" selectit="false"/>
        <span>全选</span>
        <div class="pull-right">
            <span>已选商品<span class="cartSumNumber">0</span> 件</span>
            <span>合计（不含运费）：</span>
            <span class="cartSumPrice">￥0.00</span>
            <button class="createOrderButton"  disabled="disabled">结  算</button>
        </div>
    </div>

</div>


<script>
    var deleteOrderItem = false;
    var deleteOrderItemid = 0;
    $(function(){

        $("a.deleteOrderItem").click(function(){
            deleteOrderItem = false;
            var oiid = $(this).attr("oiid")
            deleteOrderItemid = oiid;
            $("#deleteConfirmModal").modal('show');
        });
        $("button.deleteConfirmButton").click(function(){
            deleteOrderItem = true;
            $("#deleteConfirmModal").modal('hide');
        });

        /*点击删除按钮后，根据下面中的js代码，会通过Ajax访问/foredeleteOrderItem路径，
        导致ForeController.deleteOrderItem方法被调用*/

        $('#deleteConfirmModal').on('hidden.bs.modal', function (e) {
            if(deleteOrderItem){
                var page="foredeleteOrderItem";
                $.post(
                    page,
                    {"oiid":deleteOrderItemid},
                    function(result){
                        if("success"==result){
                            $("tr.cartProductItemTR[oiid="+deleteOrderItemid+"]").hide();
                        }
                        else{
                            location.href="loginPage";
                        }
                    }
                );
            }
        })

        $("img.cartProductItemIfSelected").click(function(){
            var selectit = $(this).attr("selectit")
            if("selectit"==selectit){
                $(this).attr("src","img/site/cartNotSelected.png");
                $(this).attr("selectit","false")
                $(this).parents("tr.cartProductItemTR").css("background-color","#fff");
            }
            else{
                $(this).attr("src","img/site/cartSelected.png");
                $(this).attr("selectit","selectit")
                $(this).parents("tr.cartProductItemTR").css("background-color","#FFF8E1");
            }
            syncSelect();
            syncCreateOrderButton();
            calcCartSumPriceAndNumber();
        });
        $("img.selectAllItem").click(function(){
            var selectit = $(this).attr("selectit")
            if("selectit"==selectit){
                $("img.selectAllItem").attr("src","img/site/cartNotSelected.png");
                $("img.selectAllItem").attr("selectit","false")
                $(".cartProductItemIfSelected").each(function(){
                    $(this).attr("src","img/site/cartNotSelected.png");
                    $(this).attr("selectit","false");
                    $(this).parents("tr.cartProductItemTR").css("background-color","#fff");
                });
            }
            else{
                $("img.selectAllItem").attr("src","img/site/cartSelected.png");
                $("img.selectAllItem").attr("selectit","selectit")
                $(".cartProductItemIfSelected").each(function(){
                    $(this).attr("src","img/site/cartSelected.png");
                    $(this).attr("selectit","selectit");
                    $(this).parents("tr.cartProductItemTR").css("background-color","#FFF8E1");
                });
            }
            syncCreateOrderButton();
            calcCartSumPriceAndNumber();


        });

        $(".orderItemNumberSetting").keyup(function(){
            var pid=$(this).attr("pid");
            var stock= $("span.orderItemStock[pid="+pid+"]").text();
            var price= $("span.orderItemPromotePrice[pid="+pid+"]").text();

            var num= $(".orderItemNumberSetting[pid="+pid+"]").val();
            num = parseInt(num);
            if(isNaN(num))
                num= 1;
            if(num<=0)
                num = 1;
            if(num>stock)
                num = stock;

            syncPrice(pid,num,price);
        });

        $(".numberPlus").click(function(){

            var pid=$(this).attr("pid");
            var stock= $("span.orderItemStock[pid="+pid+"]").text();
            var price= $("span.orderItemPromotePrice[pid="+pid+"]").text();
            var num= $(".orderItemNumberSetting[pid="+pid+"]").val();

            num++;
            if(num>stock)
                num = stock;
            syncPrice(pid,num,price);
        });
        $(".numberMinus").click(function(){
            var pid=$(this).attr("pid");
            var stock= $("span.orderItemStock[pid="+pid+"]").text();
            var price= $("span.orderItemPromotePrice[pid="+pid+"]").text();

            var num= $(".orderItemNumberSetting[pid="+pid+"]").val();
            --num;
            if(num<=0)
                num=1;
            syncPrice(pid,num,price);
        });

        $("button.createOrderButton").click(function(){
            var params = "";
            $(".cartProductItemIfSelected").each(function(){
                if("selectit"==$(this).attr("selectit")){
                    var oiid = $(this).attr("oiid");
                    params += "&oiid="+oiid;
                }
            });
            params = params.substring(1);
            location.href="forebuy?"+params;
        });



    })

    function syncCreateOrderButton(){
        var selectAny = false;
        $(".cartProductItemIfSelected").each(function(){
            if("selectit"==$(this).attr("selectit")){
                selectAny = true;
            }
        });

        if(selectAny){
            $("button.createOrderButton").css("background-color","#C40000");
            $("button.createOrderButton").removeAttr("disabled");
        }
        else{
            $("button.createOrderButton").css("background-color","#AAAAAA");
            $("button.createOrderButton").attr("disabled","disabled");
        }

    }
    function syncSelect(){
        var selectAll = true;
        $(".cartProductItemIfSelected").each(function(){
            if("false"==$(this).attr("selectit")){
                selectAll = false;
            }
        });

        if(selectAll)
            $("img.selectAllItem").attr("src","img/site/cartSelected.png");
        else
            $("img.selectAllItem").attr("src","img/site/cartNotSelected.png");



    }
    function calcCartSumPriceAndNumber(){
        var sum = 0;
        var totalNumber = 0;
        $("img.cartProductItemIfSelected[selectit='selectit']").each(function(){
            var oiid = $(this).attr("oiid");
            var price =$(".cartProductItemSmallSumPrice[oiid="+oiid+"]").text();
            price = price.replace(/,/g, "");
            price = price.replace(/￥/g, "");
            sum += new Number(price);

            var num =$(".orderItemNumberSetting[oiid="+oiid+"]").val();
            totalNumber += new Number(num);

        });

        $("span.cartSumPrice").html("￥"+formatMoney(sum));
        $("span.cartTitlePrice").html("￥"+formatMoney(sum));
        $("span.cartSumNumber").html(totalNumber);
    }
    function syncPrice(pid,num,price){
        $(".orderItemNumberSetting[pid="+pid+"]").val(num);
        var cartProductItemSmallSumPrice = formatMoney(num*price);
        $(".cartProductItemSmallSumPrice[pid="+pid+"]").html("￥"+cartProductItemSmallSumPrice);
        calcCartSumPriceAndNumber();


        /*点击增加或者减少按钮后，
        根据下面中的js代码，会通过Ajax访问/forechangeOrderItem路径，
        导致ForeController.changeOrderItem()方法被调用*/
        var page = "forechangeOrderItem";
        $.post(
            page,
            {"pid":pid,"number":num},
            function(result){
                if("success"!=result){
                    location.href="loginPage";
                }
            }
        );

    }
</script>
