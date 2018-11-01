#天猫实战SSM--建立表格SQL语句

#1 建立表格顺序

在建表过程中，会设置外键约束，所以表和表之间有依赖关系。 因此会**先建立被外键指向的表**，比如User,Category，然后再是其他表


# 2 用户表

```
create table User (
    id int(11) not null auto_increment primary key,
    name varchar(255) default null,
    password varchar(255) default null
)
```

# 3 分类表

```
create table Category(
    id int(11) not null auto_increment primary key,
    name varchar(255) default null
)
```

# 4 属性表

从这个表开始， 就有外键约束了。
本表的外键cid，指向分类表的id字段

```
create table Property(
    id int(11) not null auto_increment primary key,
    cid int(11) default null,
    name varchar(255) default null,
    constraint fk_Property_Category foreigh key (cid) reference Category (id) 
)
```

# 5 产品表

产品表字段稍多,标注下
name: 产品名称
subTitle: 小标题
originalPrice: 原始价格
promotePrice: 优惠价格
stock: 库存
createDate: 创建日期

本表的外键cid，指向分类表的id字段


```
ceate table Product(
    id int(11) not null auto_increment primary key,
    name varchar(255) default null,
    subTitle varchar(255) default null,
    originalPrice float default null,
    promotePrice float default null,
    stock int(11) default null,
    createDate  datetime default null,
    
    cid int(11) default null,
    constraint fk_Product_Category foreigt key (cid) reference Category (id)
)
```

# 6 属性值表


本表有两个外键
外键ptid，指向属性表的id字段
外键pid，指向产品表的id字段

```
ceate table PropertyValue(
    id int(11) not null auto_increment primary key,
    value varchar(255) default null,
    
    pid int(11) default null,
    ptid int(11) default null,
    constraint fk_PropertyValue_Property foreigh key (pid) reference Property(id),
    constraint fk_PropertyValue_Product foreigh key (ptid) reference Product(id)
)
```


# 7 产品图片表

type表示类型，产品图片分单个图片和详情图片两种

本表的外键pid，指向产品表的id字段


```
create table ProductImage(
    id int(11) not null auto_increment primary key,
    type varchar(255) default null,
    
    pid int(11) default null,
    constraint fk_ProductImage_Product foreigh key (pid) reference Product(id)
)

```

# 8 评价表

外键pid,指向产品表的id字段
外键uid,指向用户表的Id字段

```
create table Review (
    id int(11) not null auto_increment primary key,
    content varchar(4000) default null,
    createDate datetime default null,
    
    uid int(11) default null,
    pid int(11) default null,
    constraint fk_Review_User foreigh key (uid) reference User(id),
    constraint fk_Review_Product foreigh key (pid) reference Product(id)
)

```

# 9 订单表

订单表的字段也比较多，讲解一下：
orderCode： 订单号
address:收货地址
post: 邮编
receiver: 收货人信息
mobile: 手机号码
userMessage: 用户备注信息
createDate: 订单创建日期
payDate: 支付日期
deliveryDate: 发货日期
confirmDate：确认收货日期
status: 订单状态
外键uid，指向用户表id字段

```
create table Order_(
    id int(11) not null auto_increment primary key,
    orderCode varchar(255) default null,
    address varchar(255) default null,
    post int(11) default null,
    mobile int(11) default null,
    receiver varchar(255) default null,
    userMessage varchar(255) default null,
    createDate datetime default null,
    payDate datetime default null,
    deliveryDate datetime default null,
    confirmDate datetime default null,
    status varchar(255) default null,
    
    uid int(11) default null,
    constraint fk_Order_User foreiht key (uid) reference User(id)
)
```



# 10 订单项

这个表是外键最多的一个表
外键pid，指向产品表id字段
外键oid，指向订单表id字段
外键uid，指向用户表id字段
number字段表示购买数量

```
create table OrderItem(
    id int(11) not null auto_increment primary key,
    number int(11) default null,
    
    pid int(11) default null,
    uid int(11) default null,
    oid int(11) default null,
    
    constraint fk_OrderItem_Order foreigh key (oid) reference Order_(id),
    constraint fk_OrderItem_User foreigh key (uid) reference Order_(id),
    constraint fk_OrderItem_Product foreigh key(pid) reference Order_(id)
)
```


