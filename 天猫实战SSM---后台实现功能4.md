#天猫实战SSM---后台实现功能4


# 1 用户管理

用户只有查看功能而已

在adminNavigatory.jsp上：
```
<a class="navbar-brand" href="admin_user_list">用户管理</a>
```

UserController:
```
    @RequestMapping("admin_user_list")
    public String list(Model model, Page page) {
        List<User> users = userService.list();

        PageHelper.offsetPage(page.getStart(), page.getCount());
        int total = (int) new PageInfo(users).getTotal();
        page.setTotal(total);


        model.addAttribute("users", users);
        model.addAttribute("page", page);

        return "admin/listUser";
    }
}
```


UserServiceIMP:

```
    @Override
    public List<User> list() {
        UserExample userExample = new UserExample();
        userExample.setOrderByClause("id desc");

        return userMapper.selectByExample(userExample);
    }
```


# 2 订单管理

订单管理有2个功能：
![后台订单管理.jpg](https://i.loli.net/2018/09/28/5badbf5ab88ae.jpg)


外键关系：
![表格外键关系.jpg](https://i.loli.net/2018/09/28/5bae0bc138cd7.jpg)


完成后的业务层与外键关系
[![订单项的内容与外键关系.jpg](https://i.loli.net/2018/09/28/5bae0eb4c9bed.jpg)](https://i.loli.net/2018/09/28/5bae0eb4c9bed.jpg)



## 2.1 订单查看
在adminNavigatory.jsp上：
```
<a class="navbar-brand" href="admin_order_list">订单管理</a>
```

OrderController:
fill(Order order) :
     为什么要提供这个方法呢？ 因为在订单管理界面，首先是遍历多个订单，然后遍历这个订单下的多个订单项。
     而由MybatisGenerator逆向工程所创建的一套自动生成代码，是不具备一对多关系的，需要自己去二次开发。
     这里就是做订单与订单项的一对多关系。
```
    @RequestMapping("admin_order_list")
    public String list(Model model, Page page) {
        //1. 获取分页对象
        PageHelper.offsetPage(page.getStart(), page.getCount());
        //2. 查询订单集合
        List<Order> orders = orderService.list();
        //3. 获取订单总数并设置在分页对象上
        int total = (int) new PageInfo().getTotal();

        page.setTotal(total);
        //4. 借助orderItemService.fill()方法为这些订单填充上orderItems信息
        orderItemService.fill(orders);
        //5把订单集合和分页对象设置在model上
        model.addAttribute("orders", orders);
        model.addAttribute("page", page);
        //6. 服务端跳转到admin/listOrder.jsp页面
        //7. 在listOrder.jsp借助c:forEach把订单集合遍历出来
        //8. 遍历订单的时候，再把当前订单的orderItem订单项集合遍历出来
        return "admin/listOrder";
    }
```


OrderServiceIMP:
查询订单集合同时给订单设置用户属性（自己增加的用户属性）
```
    @Override
    public List<Order> list() {
        OrderExample orderExample = new OrderExample();
        orderExample.setOrderByClause("id desc");

        List<Order> orders = orderMapper.selectByExample(orderExample);
        setUser(orders);

        return orders;
    }
    
    public void setUser(List<Order> orders) {
        for (Order order : orders) {
            setUser(order);
        }
    }

    public void setUser(Order order) {
        int uid = order.getUid();
        User user = userService.get(uid);
        order.setUser(user);
    }
```




OrderItemServiceIMP：


 在fill(Order order)中
     1. 根据订单id查询出其对应的所有订单项
     2. 通过setProduct为所有的订单项设置Product属性
     3. 遍历所有的订单项，然后计算出该订单的总金额和总数量
    
    for (OrderItem orderItem : orderItems) {
            total += orderItem.getNumber() * orderItem.getProduct().getPromotePrice();
            totalNumber += orderItem.getNumber();
        }


4 最后再把订单项设置在订单的orderItems属性上。
```
public void fill(Order order) {
        OrderItemExample orderItemExample = new OrderItemExample();
        orderItemExample.createCriteria().andOidEqualTo(order.getId());
        orderItemExample.setOrderByClause("id desc");
        //1. 根据订单id查询出其对应的所有订单项
        List<OrderItem> orderItems = orderItemMapper.selectByExample(orderItemExample);
        //2. 通过setProduct为所有的订单项设置Product属性
        setProduct(orderItems);

        float total = 0;
        int totalNumber = 0;
        //3. 遍历所有的订单项，然后计算出该订单的总金额和总数量
        for (OrderItem orderItem : orderItems) {
            total += orderItem.getNumber() * orderItem.getProduct().getPromotePrice();
            totalNumber += orderItem.getNumber();
        }

        //4. 最后再把订单项设置在订单的orderItems属性上。
        order.setTotal(total);
        order.setTotalNumber(totalNumber);
        order.setOrderItems(orderItems);
    }
    
    public void setProduct(List<OrderItem> orderItems) {
        for (OrderItem orderItem : orderItems) {
            setProduct(orderItem);
        }
    }

    //已知订单项pid，要设置产品，根据pid查找到产品，然后设置产品
    public void setProduct(OrderItem orderItem) {
        Product product = productService.get(orderItem.getPid());
        orderItem.setProduct(product);
    }
```




## 2.2 发货操作

思路：
当订单状态是waitDelivery的时候，就会出现发货按钮
     1. 发货按钮链接跳转到admin_order_delivery
     2. OrderController.delivery()方法被调用
     2.1 注入订单对象
     2.2 修改发货时间，设置发货状态
     2.3 更新到数据库
     2.4 客户端跳转到admin_order_list页面

在ListOrder.jsp上：

```
<c:if test="${orders.status=='waitDelivery'}">
    <a href="admin_order_delivery?id=${orders.id}">
        <button class="btn btn-primary btn-xs">发货</button>
    </a>
</c:if>
```



在Order类上增加一个方法

```
 /*提供了一个getStatusDesc方法，用于把英文表达的Status信息转换为中文：*/

    public String getStatusDesc() {
        String desc = "未知";
        switch (status) {
            case OrderService.waitPay:
                desc = "待付款";
                break;
            case OrderService.waitDelivery:
                desc = "待发货";
                break;
            case OrderService.waitConfirm:
                desc = "待收货";
                break;
            case OrderService.waitReview:
                desc = "待评价";
                break;
            case OrderService.finish:
                desc = "完成";
                break;
            case OrderService.delete:
                desc = "删除";
                break;
            default:
                desc = "未知";
        }
        return desc;
    }
```



OrderController:
```
@RequestMapping("admin_order_delivery")
    //2.1 注入订单对象order,   注入我可以理解为调用参数
    public String delivery(Order order) {
        //2.2 修改发货时间，设置发货状态
        order.setDeliveryDate(new Date());
        order.setStatus(OrderService.waitConfirm);
        //2.3 更新到数据库
        orderService.update(order);
        return "redirect:admin_order_list";
    }
```
waitCongfirm是orderService的属性

```
public interface OrderService {
    String waitPay = "waitPay";
    String waitDelivery = "waitDelivery";
    String waitConfirm = "waitConfirm";
    String waitReview = "waitReview";
    String finish = "finish";
    String delete = "delete";
    }
```


OrderServiceIMP:

```
 @Override
    public void update(Order order) {
        orderMapper.updateByPrimaryKeySelective(order);
    }
```

