#实战天猫SSM---前端实现功能 2 

# 具体单个产品页

产品的展示，需要产品图片，在页面上则需要一个集合好进行循环，不用一张张赋值，所以在product类上增加2个图片类型集合。


首页展示产品的页面：
```
<a href="foreproduct?pid=${p.id}"><img width="100px" src="img/ProductImage_middle/${p.firstProductImage.id}.jpg"></a>
```


跳转href的路径`foreproduct?pid=${p.id}`导致`ForeController.product()` 方法被调用

这里产品product，新增加了6个属性，
产品图片`firstProductImage`，
单个产品图片集合`productSingleImages`，
详情产品图片集合`productDetailImages`，
分类`category`，
累计评价`reviewCount`，
销量`saleCount`

评价对象review增加`user`属性

用户对象user增加一个显示匿名方法`getAnonymousName()`


方便页面进行展示产品。



**从首页的展示产品页面点击产品，触发跳转，调用ForeController的product()方法**

控制层：
----

[![单个产品页面.jpg](https://i.loli.net/2018/10/30/5bd81c4c16d4a.jpg)](https://i.loli.net/2018/10/30/5bd81c4c16d4a.jpg)


思路：

1 向方法注入 产品id 和模型
2 根据id获取产品
3 因为产品的新增属性值是null，所以需要自己赋值，根据产品id查找对应所有属性值

    3.1 查询产品图片集合，单个图片集合，详情图片集合
    3.2 查询产品所属于的分类
    3.3 查询产品所有的累积评价（返回评论对象集合）
    3.4 查询产品所有的销量
    3.5 查询产品的属性值（描述产品的性能，eg:手机屏幕参数····）

4 把查询得到的图片，分类，属性值，评价和销量赋值给产品
5 把产品，产品属性，评论放进模型（页面需要这3个对象），然后跳转到产品页，product.jsp


个人理解：

    数据库表上应该是定好的，页面展示出来，新增的属性应该是客户临时增加的要求，比如产品的属性，图片，累积评价····
    产品的属性和属性值 是2个对象。
    举例子：属性是屏幕，属性值是5.6寸， 屏幕是 porperty对象 和 5.6寸 propertyValue对象 这是作为2个对象看待的。


代码：
```
   @RequestMapping("foreproduct")
    //1. 获取参数pid
    public String product(int pid, Model model) {
        //2. 根据pid获取Product 对象p
        Product product = productService.get(pid);

        //3. 根据对象p，获取这个产品对应的单个图片集合
        //4. 根据对象p，获取这个产品对应的详情图片集合
        List<ProductImage> productSingleImages = productImageService.list(product.getId(), productImageService.type_single);
        List<ProductImage> productDetailImages = productImageService.list(product.getId(), productImageService.type_detail);


        //5. 获取产品的所有属性值
        List<PropertyValue> propertyValues = propertyValueService.list(product.getId());
        //6. 获取产品对应的所有的评价
        List<Review> reviews = reviewService.list(product.getId());
        //7. 设置产品的图片，分类,销量和评价数量
        productService.setSaleAndReviewNumber(product);
        product.setProductSingleImages(productSingleImages);
        product.setProductDetailImages(productDetailImages);


        model.addAttribute("reviews", reviews);
        model.addAttribute("product", product);
        model.addAttribute("propertyValues", propertyValues);

        return "fore/Product";
    }
```


业务层：
----

对产品操作的业务：

思路：

 根据产品id查询产品


    
因为查询返回产品对象后，新增的属性：分类，产品图片，2个图片类型集合，都是Null，所以要赋值。具体代码在首页功能那里粘贴了。（分类，产品图片这2个既是产品属性也是对象）
2个图片类型集合就先不用赋值，后面写。

一开始建立表格的时候是没有完善的，pojo类里新增的属性是方便页面展示需求，才增加的。2个图片类型集合就是方便页面展示产品图片所新增加的属性。



```
    @Override
    public Product get(int id) {
        Product product = productMapper.selectByPrimaryKey(id);
        setCategory(product);
        setFirstProductImage(product);
        return product;
    }
```







对图片操作的业务：

思路：

  **根据产品id 和 产品图片类型 查询出所要的产品图片类型集合**
  
 注意： 
 
 图片类型在jsp的提交页面上写死了，哪个div提交的图片就是什么类型的。
 
 图片类型，可以使用新的变量来表示，值一定要对，一般情况下都是这样想的。（物理学科上好像也是这样，出现不明原因，分出属性，一个个穷举验证）


**ProductImageServiceImpl：**

```
    @Override
    public List<ProductImage> list(int pid, String type) {
        ProductImageExample productImageExample = new ProductImageExample();
        productImageExample.createCriteria()
                .andPidEqualTo(pid)
                .andTypeEqualTo(type);
        productImageExample.setOrderByClause("id desc");

        return productImageMapper.selectByExample(productImageExample);
    }
```





对产品属性操作的业务：

产品 ---产品属性 -----产品属性值， 这个逻辑链条，3个都是对象，都有自己的属性



思路：

根据产品id 查询产品属性值对象，然后对每个产品属性值的属性赋值

**PropertyValueServiceImpl:**

```
    @Override
    public List<PropertyValue> list(int pid) {
        PropertyValueExample propertyValueExample = new PropertyValueExample();
        propertyValueExample.createCriteria()
                .andPidEqualTo(pid);

        List<PropertyValue> propertyValues = propertyValueMapper.selectByExample(propertyValueExample);

        for (PropertyValue propertyValue : propertyValues) {
            Property property = propertyService.get(propertyValue.getPtid());
            propertyValue.setProperty(property);
        }
        return propertyValues;
    }
```


对产品评价操作的业务：

思路：

根据产品Id 查询该产品的所有评论对象集合（方便页面需求，评论对象新增加个用户属性）


```
    @Override
    public List<Review> list(Integer pid) {
        ReviewExample reviewExample = new ReviewExample();
        reviewExample.createCriteria().andPidEqualTo(pid);
        reviewExample.setOrderByClause("id desc");

        List<Review> reviews = reviewMapper.selectByExample(reviewExample);

        setUser(reviews);

        return reviews;
    }
    
    public void setUser(List<Review> reviews) {
        for (Review review : reviews) {
            setUser(review);
        }
    }

    public void setUser(Review review) {
        int uid = review.getUid();
        User user = userService.get(uid);
        review.setUser(user);
    }
```



**对产品的评价数量，产品销量 查询操作业务：**


思路：

根据产品，查询 2个对象 评价数量和产品销量

 1 查询评论对象，然后对返回的评价对象集合计数**(调用到了评论对象的业务层)**
 2 因为产品销量是订单项的一个属性，所以查询产品销量是查询订单项对象**（调用到了订单项对象的业务层）**

```
    @Override
    public void setSaleAndReviewNumber(Product product) {
        int saleCount = orderItemService.getSaleCount(product.getId());
        product.setSaleCount(saleCount);

        int reviewCount = reviewService.getCount(product.getId());
        product.setReviewCount(reviewCount);
    }
```


评论对象查询评论数量的业务层：

思路：
　　根据产品id　查询评论对象，然后返回评价对象集合的数量
　　
**页面查询要是出现所有，全部···字眼，用list，而且要以产品为根，依靠产品属性查询需求对象，然后返回需求想要的值**　　

```
@Override
    public int getCount(Integer pid) {

        return list(pid).size();
    }
```




订单项对象查询订单产品数量的业务层

思路：
    
    产品作为根，依据产品Pid 外键获取所有订单，然后计算订单里面购买该产品的数量
    最后返回 该产品卖出的数量


**页面查询要是出现所有，全部···字眼，用list，而且要以产品为根，依靠产品属性查询需求对象，然后返回需求想要的值**　　
代码：

```
    @Override
    public int getSaleCount(Integer pid) {
        OrderItemExample orderItemExample = new OrderItemExample();
        orderItemExample.createCriteria().andPidEqualTo(pid);

        List<OrderItem> orderItems = orderItemMapper.selectByExample(orderItemExample);

        int result = 0;
        for (OrderItem orderItem : orderItems) {
            result += orderItem.getNumber();
        }

        return result;
    }
```


**完成显示产品的业务。**




#模仿登录

**使用jquery技术完成状态验证。**

在未登录状态下，点击购买或者加入购物车就会弹出这个模态对话框

在这个模态对话框上可以进行登录操作，如果账号和密码出错会出现 "账号密码错误" 提示


立即购买和加入购物车这两个按钮的监听是放在`imgAndInfo.jsp`页面中

这两个按钮都会通过JQuery的.post方法，用异步ajax的方式访问forecheckLogin，获取当前是否登录状态
如果返回的不是"success" 即表明是未登录状态，那么就会打开登录的模态窗口

    $("#loginModal").modal('show');


立即购买按钮：
```
$(".buyLink").click(function(){
    var page = "forecheckLogin";
    $.post(
            page,
            function(result){
                if("success"==result){
                   // 。。。略
                }
                else{
                    $("#loginModal").modal('show');                    
                }
            }
    );     
    return false;
});
```

加入购物车按钮：

```
$(".addCartLink").click(function(){
    var page = "forecheckLogin";
    $.post(
            page,
            function(result){
                if("success"==result){
                   // 。。。略
                }
                else{
                    $("#loginModal").modal('show');                    
                }
            }
    );     
    return false;
});
```


控制层：
----

ajax访问路径`/forecheckLogin`会导致`ForeController.checkLogin()`方法被调用。

思路：

**获取session中的"user"对象，判断user是否为空，完成状态判断。**
如果不为空，即表示已经登录，返回字符串"success"
如果为空，即表示未登录，返回字符串"fail"

**注意： 使用了异步ajax，在控制层都要使用@ResponseBody注解，不然数据传输不了**

代码：

```
  @RequestMapping("forecheckLogin")
    @ResponseBody
    public String checkLogin(HttpSession session) {
        User user = (User) session.getAttribute("user");
        if (null != user) {
            return "success";
        }
        return "fail";
    }
```


## 完成登录model.jsp

`modal.jsp` 页面被 `footer.jsp` 所包含，所以每个页面都是加载了的。
通过`imgAndInfo.jsp`页面中的购买按钮或者加入购物车按钮显示出来。

点击登录按钮时，使用`imgAndInfo.jsp` 页面中的ajax代码进行登录验证：


```
$("button.loginSubmitButton").click(function(){
            
            var name = $("#name").val();
            var password = $("#password").val();
            var page = "foreloginAjax";
            
            //判断账号，密码是否空
            if(0==name.length||0==password.length){
                $("span.errorMessage").html("请输入账号密码");
                $("div.loginErrorMessageDiv").show();
                return false;
            }
            /*post提交*/
            $.post(
                page,
                {"name":name,"password":password},
                function(result){
                    if("success"==result){
                        location.reload();
                    }
                    else{
                        $("span.errorMessage").html("账号密码错误");
                        $("div.loginErrorMessageDiv").show();
                    }
                }
            );

            return true;
        });
```



控制层：
----

访问路径`/foreloginAjax`,导致`ForeController.loginAjax()`方法被调用

    1. 获取账号密码
    2. 通过账号密码获取User对象
    2.1 如果User对象为空，那么就返回"fail"字符串。
    2.2 如果User对象不为空，那么就把User对象放在session中，并返回"success" 字符串


代码：
```
    @RequestMapping("foreloginAjax")
    @ResponseBody
    public String loginAjax(@RequestParam("name") String name,
                            @RequestParam("password") String password,
                            HttpSession session) {
        name = HtmlUtils.htmlEscape(name,"UTF-8");
        //查询得到user对象
        User user = userService.get(name, password);
        if (null == user) {
            return "fail";
        }
        session.setAttribute("user", user);
        return "success";
    }
```


业务层：
----

```
    @Override
    public User get(String name, String password) {
        UserExample userExample = new UserExample();
        userExample.createCriteria()
                .andNameEqualTo(name)
                .andPasswordEqualTo(password);
        List<User> users = userMapper.selectByExample(userExample);

        if (users.isEmpty()) {
            return null;
        }
        return users.get(0);
    }
```



#分类页（查询一类产品）

完成效果： **点击产品分类，查询完后跳转到分类页，此时没有排序。接着再分类页面上点击排序功能，页面按照排序更新**

分类页包含2个小页面
```
<%@include file="sortBar.jsp"%>
<%@include file="productByCategory.jsp"%>
```


分类这个页面有排序功能,下面主要讲分类页面上点击排序功能， 这个排序功能，展示产品就使用eachFor循环展示

[![大.jpg](https://i.loli.net/2018/10/08/5bbb7713c11c0.jpg)](https://i.loli.net/2018/10/08/5bbb7713c11c0.jpg)


**sortBar.jsp排序条上的script**

```
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
```



sortBar的div

根据sort参数判断哪个排序按钮高亮

复制修改review和href语句就可获得其他4个排序功能。


```
<td <c:if test="${'review' == param.sort}"> class="grayColumn"</c:if> >
                <a href="?cid=${category.id}&sort=review">
                    人气
                    <span class="glyphicon plyphicon-arrow-down"></span>
                </a>
            </td>
```

注意：

    href="?cid=${category.id}&sort=review"

这里href没有写明action，所以就是网址的`http://localhost:8888/forecategory?cid=357`中的`/foreCategory`作为action了，调用ForeController.category()方法



控制层：
----

[![查询一类.jpg](https://i.loli.net/2018/10/30/5bd81fcd02795.jpg)](https://i.loli.net/2018/10/30/5bd81fcd02795.jpg)


思路：
1 根据外键cid 查询到分类对象，并且填充
2 然后根据分类对象查询产品，
3 接着根据产品查询销量和评论，

4 获取参数sort

    4.1 如果sort==null，即不排序
    4.2 如果sort!=null，则根据sort的值，从5个Comparator比较器中选择一个对应的排序器进行排序

5 把category放在model中


```
    @RequestMapping("forecategory")
    public String category(int cid, String sort, Model model) {
        Category category = categoryService.get(cid);
        productService.fill(category);
        productService.setSaleAndReviewNumber(category.getProductList());
 /*
    Collections.sort(list, new PriceComparator())
            参数一：需要排序的list
            参数二：比较器，实现Comparator接口的类，返回一个int型的值，就相当于一个标志，告诉sort方法按什么顺序来对list进行排序。
            */
        if (null != sort) {
            switch (sort) {
                case "review":
                    Collections.sort(category.getProductList(), new ProductReviewComparator());
                    break;
                case "date":
                    Collections.sort(category.getProductList(), new ProductDateComparator());
                    break;
                case "saleCount":
                    Collections.sort(category.getProductList(), new ProductSaleCountComparator());
                    break;
                case "price":
                    Collections.sort(category.getProductList(), new ProductPriceComparator());
                    break;

                case "all":
                    Collections.sort(category.getProductList(), new ProductAllComparator());
                    break;
            }
        }
        model.addAttribute("category", category);
        return "fore/category";
    }
```



5个Comparator比较器：
----------------
Comparator是个接口，可重写compare()及equals()这两个方法,用于比较功能；
 如果是null的话，就是使用元素的默认顺序，如a,b,c,d,e,f,g，就是a,b,c,d,e,f,g这样，当然数字也是这样的。
 

1.ProductAllComparator 综合比较器
把 销量x评价 高的放前面

```
public class ProductAllComparator implements Comparator<Product> {
    @Override
    public int compare(Product o1, Product o2) {
        return o2.getReviewCount() * o2.getSaleCount() - o1.getReviewCount() * o1.getSaleCount();
    }
}
```

2.ProductReviewComparator 人气比较器
把 评价数量多的放前面

```
public class ProductReviewComparator implements Comparator<Product> {
    @Override
    public int compare(Product o1, Product o2) {
        return o2.getReviewCount() - o1.getReviewCount();
    }
}

```
3. ProductDateComparator 新品比较器
把 创建日期晚的放前面

```
public class ProductDateComparator implements Comparator<Product>{
    @Override
    public int compare(Product o1, Product o2) {
        return o2.getCreateDate().compareTo(o1.getCreateDate());
    }
}
```
4. ProductSaleCountComparator 销量比较器
把 销量高的放前面

```
public class ProductSaleCountComparator implements Comparator<Product> {

    @Override
    public int compare(Product o1, Product o2) {
        return o2.getSaleCount() - o2.getSaleCount();
    }
}
```
5. ProductPriceComparator 价格比较器
把 价格低的放前面

```
public class ProductPriceComparator implements Comparator<Product> {
    @Override
    public int compare(Product o1, Product o2) {
        /*(int) (o2.getPromotePrice() - o1.getPromotePrice());*/
        double result = o1.getPromotePrice() - o2.getPromotePrice();

        return (int) (result < 0 ? Math.floor(result) : Math.ceil(result));
    }
}
```



# 搜索

Mini-search..jsp或者search.jsp：

    <form action="foresearch" method="post" >
    <input type="text" name="keyword"  placeholder="平衡车 原汁机">



控制层：
----
[![搜索.jpg](https://i.loli.net/2018/10/30/5bd81edfca729.jpg)](https://i.loli.net/2018/10/30/5bd81edfca729.jpg)

思路：

1. 获取参数keyword
2. 根据keyword进行模糊查询，获取满足条件的前20个产品
3. 为这些产品设置销量和评价数量
4. 把产品结合设置在model的"productList"属性上
5. 服务端跳转到 searchResult.jsp 页面


代码：
```
    @RequestMapping("foresearch")
    public String search(String key, Model model) {
        PageHelper.offsetPage(0, 30);
        List<Product> productList = productService.search(key);
        productService.setSaleAndReviewNumber(productList);
        model.addAttribute("productList", productList);
        return "fore/searchResult";
    }
```




业务层：
----

思路：
    查询返回后，进行对产品的图片对象，分类对象赋值。而销量对象，评论对象的赋值是上面写过的。
    产品的4个新增对象，分成4个方法，分别赋值。这里有2个，上面的有2个。

```
    public List<Product> search(String key) {
        ProductExample productExample = new ProductExample();
        productExample.createCriteria().andNameLike("%" + key + "%");
        productExample.setOrderByClause("id desc");

        List result = productMapper.selectByExample(productExample);
        setFirstProductImage(result);
        setCategory(result);

        return result;
    }
```




