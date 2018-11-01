#实战天猫SSM---前端实现功能 3 


需要登录的前台功能，这些功能都是和购买支付流程息息相关的，所以我们先把购买的业务流程捋一捋

接着再把购物流程各个环节与表关系搞清楚，这个开发人员必须明白的部分，这个部分稀里糊涂，后面做出来的功能就会越来越乱


#  登录部分

# 1 购买的业务流程

1. 登录
2. 访问产品页
3. 立即购买
4. 进入结算页面
5. 加入购物车
6. 查看购物车
7. 选中购物车中的商品
8. 又到了第4步的结算页面
9. 在结算页面生成订单
10. 付款
11. 确认收货
12. 评价

![购物过程.jpg](https://i.loli.net/2018/09/30/5bb0419a163ec.jpg)



# 2 购物流程环节与表关系


围绕购物流程最重要的两个表是OrderItem 和 Order表

关于OrderItem的业务行为
1. 立即购买 —— 新增 OrderItem
2. 加入购物车 —— 新增 OrderItem
3. 查看购物车 —— 显示未和Order关联的OrderItem
4. 选中购物车中的商品 —— 选中OrderItem
5. 结算页面 —— 显示选中的OrderItem

6. 生成订单 —— 新增Order
7 .付款 —— 修改Order状态
8. 我的订单 —— 显示Order
9. 确认收货 —— 修改Order状态


![购物流程环节与表关系.jpg](https://i.loli.net/2018/09/30/5bb04550a2e16.jpg)



#功能实现：

## 1 立即购买

点击购买所产生的动作是，OrderItem表里插入一条数据， 
该数据内容：
1. pid =844 购买的商品id
2. oid = null, 这个订单项还没有生成对应的订单，即还在购物车中
3. uid= 3，用户的id是3
4. number=3, 购买了3件产品



###**ForeController：**

访问的地址 /forebuyone 导致ForeController.buyone()方法被调用
1. 获取参数pid
2. 获取参数num
3. 根据pid获取产品对象p
4. 从session中获取用户对象user

接下来就是新增订单项OrderItem， 新增订单项要考虑两个情况
a. 如果已经存在这个产品对应的OrderItem，并且还没有生成订单，即还在购物车中。 那么就应该在对应的OrderItem基础上，调整数量
a.1 基于用户对象user，查询没有生成订单的订单项集合
a.2 遍历这个集合
a.3 如果产品是一样的话，就进行数量追加
a.4 获取这个订单项的 id

b. 如果不存在对应的OrderItem,那么就新增一个订单项OrderItem
b.1 生成新的订单项
b.2 设置数量，用户和产品
b.3 插入到数据库
b.4 获取这个订单项的 id

最后， 基于这个订单项id客户端跳转到结算页面/forebuy

代码：
```
    @RequestMapping("forebuyone")
    public String buyone(int pid, int num, HttpSession session) {
        Product product = productService.get(pid);
        int oiid = 0;

        User user = (User) session.getAttribute("user");
        boolean found = false;

        List<OrderItem> orderItems = orderItemService.listByUser(user.getId());

        for (OrderItem orderItem : orderItems) {
            if (orderItem.getProduct().getId().intValue() == product.getId().intValue()) {
                orderItem.setNumber(orderItem.getNumber() + num);
                orderItemService.update(orderItem);
                found = true;
                oiid = orderItem.getId();
                break;
            }
        }

        if (!found) {
            OrderItem orderItem = new OrderItem();
            orderItem.setUid(user.getId());
            orderItem.setNumber(num);
            orderItem.setPid(pid);
            orderItemService.add(orderItem);
            oiid = orderItem.getId();
        }
        return "redirect:forebuy?oiid=" + oiid;
    }
```


### **OrderItemServiceIMP:**


```
    @Override
    public List<OrderItem> listByUser(Integer uid) {
        OrderItemExample orderItemExample = new OrderItemExample();
        orderItemExample.createCriteria().andUidEqualTo(uid).andOidIsNull();
        List<OrderItem> result = orderItemMapper.selectByExample(orderItemExample);

        setProduct(result);

        return result;
    }

    @Override
    public void update(OrderItem orderItem) {
        orderItemMapper.updateByPrimaryKeySelective(orderItem);
    }

    @Override
    public void add(OrderItem orderItem) {
        orderItemMapper.insert(orderItem);
    }
```



# 订单状态


在开始实现订单相关功能之前，我们把订单的状态捋一捋，这样有助于代码思路更加清晰
1. 首先是创建订单，刚创建好之后，订单处于**`waitPay 待付款`**状态
2. 接着是付款，付款后，订单处于**`waitDelivery 待发货`**状态
3. 前两步都是前台用户操作导致的，接下来需要到后台做发货操作，发货后，订单处于**`waitConfirm 待确认收货`**状态
4. 接着又是前台用户进行确认收货操作，操作之后，订单处于**`waitReview 待评价`**状态
5. 最后进行评价，评价之后，订单处于**`finish 完成`**状态

以上状态都是一个接一个的，不能跳状态进行。
比较特殊的是，无论当前订单处于哪个状态，都可以进行删除操作。 像订单这样极其重要的业务数据，实际上是不允许真正从数据库中删除掉的，而是把状态标记为删除，以表示其被删掉了，所以在删除之后，订单处于 **`delete 已删除`**状态

![订单流程.jpg](https://i.loli.net/2018/09/30/5bb0a9df2bda8.jpg)

























