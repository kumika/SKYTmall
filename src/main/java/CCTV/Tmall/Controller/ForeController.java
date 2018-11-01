package CCTV.Tmall.Controller;

import CCTV.Tmall.Service.*;
import CCTV.Tmall.pojo.*;
import com.github.pagehelper.PageHelper;
import comparator.*;
import org.apache.commons.lang.math.RandomUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.util.HtmlUtils;

import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;

@Controller
public class ForeController {

    @Autowired
    OrderService orderService;

    @Autowired
    OrderItemService orderItemService;


    @Autowired
    ReviewService reviewService;

    @Autowired
    PropertyValueService propertyValueService;

    @Autowired
    ProductImageService productImageService;

    @Autowired
    UserService userService;

    @Autowired
    CategoryService categoryService;

    @Autowired
    ProductService productService;

    /**
     * 在RegisterPage.jsp上跳过来的
     *
     * @param model
     * @param user
     * @return
     */
    @RequestMapping("foreRegister")
    public String register(Model model, User user) {
        String name = user.getName();
        /*
        为什么要用 HtmlUtils.htmlEscape？
        因为有些同学在恶意注册的时候，会使用诸如 <script>alert('papapa')</script> 这样的名称，
        会导致网页打开就弹出一个对话框。 那么在转义之后，就没有这个问题了。
        */
        name = HtmlUtils.htmlEscape(name);

        user.setName(name);
        boolean exist = userService.isExist(name);

        if (exist) {
            String msg = "用户名已经被使用,不能使用";
            model.addAttribute("msg", msg);
            /*
                model.addAttribute("user", null); 这句话的用处是当用户存在，
                服务端跳转到register.jsp的时候不带上参数user,
                否则当注册失败的时候，会在原本是“请登录”的超链位置显示刚才注册的名称
            */
            model.addAttribute("user", null);
            return "fore/register";
        }
        userService.add(user);
        return "redirect:registerSuccessPage";
    }

    /**
     * 在LoginPage.jsp上跳转过来的
     * 1. 获取账号密码
     * 2. 把账号通过HtmlUtils.htmlEscape进行转义
     * 3. 根据账号和密码获取User对象
     * 3.1 如果对象为空，则服务端跳转回login.jsp，也带上错误信息，并且使用 loginPage.jsp 中的办法显示错误信息
     * 3.2 如果对象存在，则把对象保存在session中，并客户端跳转到首页"forehome"
     *
     * @return
     */
    @RequestMapping("forelogin")
    public String login(@RequestParam("name") String name, @RequestParam("password") String password,
                        Model model, HttpSession session) {
        name = HtmlUtils.htmlEscape(name, "UTF-8");
        User user = userService.get(name, password);

        if (null == user) {
            model.addAttribute("msg", "账号密码错误");
            return "fore/login";
        }
        session.setAttribute("user", user);
        return "redirect:forehome";
    }

    /**
     * 思路：
         1. 查询所有分类
         2. 为这些分类填充产品集合
         3. 为这些分类填充推荐产品集合
         4. 服务端跳转到home.jsp
     *
     * 下面是解释竖状导航的分类行数问题：
     productsByRow这个属性的类型是List<List<Product>> productsByRow。
     即一个分类又对应多个 List<Product>，提供这个属性，是为了在首页竖状导航的分类名称右边显示推荐产品列表。

     具体解释：一个分类会对应多行产品，而一行产品里又有多个产品记录。
     为了实现界面上的这个功能，为Category类设计了
     List<List<Product>> productsByRow
     这样一个集合属性
     * @param model
     * @return
     */
    @RequestMapping("forehome")
    public String home(Model model) {
        //1. 查询所有分类，查询返回的分类对象，只有Id 和name有值，
        // 自己增加的属性productList,和productByRow是null的，
        // 因为表的字段只有Id和name，在pojo类增加属性是不能增加到表字段的
        List<Category> categoryList = categoryService.list();
        //2. 为这些分类填充产品集合
        productService.fill(categoryList);
        //3. 为这些分类填充推荐产品集合
        productService.fillByRow(categoryList);

        model.addAttribute("categories", categoryList);
        //4. 服务端跳转到home.jsp
        return "fore/home";
    }

    /**
     * 在top.jsp上跳转过来的
     *
     * @param session
     * @return
     */
    @RequestMapping("forelogout")
    public String forelogout(HttpSession session) {
        session.removeAttribute("user");

        return "redirect:forehome";
    }


    /**测试阶段，通过访问地址

http://127.0.0.1:8080/tmall_ssm/foreproduct?pid=844
导致ForeController.product() 方法被调用
1. 获取参数pid
2. 根据pid获取Product 对象p
3. 根据对象p，获取这个产品对应的单个图片集合
4. 根据对象p，获取这个产品对应的详情图片集合
5. 获取产品的所有属性值
6. 获取产品对应的所有的评价
7. 设置产品的销量和评价数量
8. 把上述取值放在request属性上
9. 服务端跳转到 "product.jsp" 页面

假如是实际上，就是点击产品跳转过来的，但是现在没有
*/
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


    /**
    imgAndInfo.jsp上的ajax访问路径/forecheckLogin会导致ForeController.checkLogin()方法被调用。
        获取session中的"user"对象
        如果不为空，即表示已经登录，返回字符串"success"
        如果为空，即表示未登录，返回字符串"fail"

        通过JQuery的.get方法，用异步ajax的方式访问forecheckLogin，
        获取当前是否登录状态，如果返回的不是"success" 即表明是未登录状态，
        那么就会打开登录的模态窗口
    */
    @RequestMapping("forecheckLogin")
    @ResponseBody
    public String checkLogin(HttpSession session) {
        User user = (User) session.getAttribute("user");
        if (null != user) {
            return "success";
        }
        return "fail";
    }


    /**
    点击了登录按钮之后，访问路径/foreloginAjax,导致ForeController.loginAjax()方法被调用
    1. 获取账号密码
    2. 通过账号密码获取User对象
    2.1 如果User对象为空，那么就返回"fail"字符串。
    2.2 如果User对象不为空，那么就把User对象放在session中，并返回"success" 字符串

    foreloginAjax出现在imgAndInfo.jsp上
    */
    @RequestMapping("foreloginAjax")
    @ResponseBody
    public String loginAjax(@RequestParam("name") String name,
                            @RequestParam("password") String password,
                            HttpSession session) {
        name = HtmlUtils.htmlEscape(name,"UTF-8");
        User user = userService.get(name, password);
        if (null == user) {
            return "fail";
        }
        session.setAttribute("user", user);
        return "success";
    }

    //卧槽，是分类向导那里的，categoryMenu.jsp上的
    //forecategory好像是测试用的，测试地址：http://127.0.0.1:8080/tmall_ssm/forecategory?cid=74&categorycount=2
    @RequestMapping("forecategory")
    public String category(int cid, String sort, Model model) {
        Category category = categoryService.get(cid);
        productService.fill(category);
        productService.setSaleAndReviewNumber(category.getProductList());

        if (null != sort) {
            /*
            Collections.sort(list, new PriceComparator())
            参数一：需要排序的list
            参数二：比较器，一实现Comparator接口的类，返回一个int型的值，就相当于个标志，告诉sort方法按什么顺序来对list进行排序。
            */
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

    /*在公共页的跳转*/
    @RequestMapping("foresearch")
    public String search(String key, Model model) {
        PageHelper.offsetPage(0, 30);
        List<Product> productList = productService.search(key);
        productService.setSaleAndReviewNumber(productList);
        model.addAttribute("productList", productList);
        return "fore/searchResult";
    }

    /*imgAndInfo.jsp跳转过来 */

    /**
     * 访问的地址 /forebuyone 导致ForeController.buyone()方法被调用
     1. 获取参数pid
     2. 获取参数num
     3. 根据pid获取产品对象p
     4. 从session中获取用户对象user

     接下来就是新增订单项OrderItem， 新增订单项要考虑两个情况
     a. 如果已经存在这个产品对应的OrderItem，并且还没有生成订单，即还在购物车中。 那
     么就应该在对应的OrderItem基础上，调整数量
     a.1 基于用户对象user，查询没有生成订单的订单项集合
     a.2 遍历这个集合
     a.3 如果产品是一样的话，就进行数量追加
     a.4 获取这个订单项的 id

     b. 如果不存在对应的OrderItem,那么就新增一个订单项OrderItem
     b.1 生成新的订单项
     b.2 设置数量，用户和产品
     b.3 插入到数据库
     b.4 获取这个订单项的 id
     * @param pid
     * @param num
     * @param session
     * @return
     */
    @RequestMapping("forebuyone")
    public String buyone(int pid, int num, HttpSession session) {
        //3. 根据pid获取产品对象p
        Product product = productService.get(pid);
        int oiid = 0;
        //4. 从session中获取用户对象user
        User user = (User) session.getAttribute("user");
        //作为判断存在订单项的标准。（常规想法，引入新的变量，来表述一个物体的状态
        boolean found = false;
        //根据user的id查询订单，
        // 这里订单和购物车，我没有理解好。
        // 正确理解是：订单和购物车，订单里面包含多个订单项，
        // 订单项=购物车，订单项在结算的时候才增加到订单上，单纯的创建订单项=拿到购物车
        // 产品放进购物车则是产品增加到订单项上
        // 在结算的时候有2种情况：
        // 1 要是购买的产品没有存在在购物车上，则需要新建一个订单项对象，增加产品
        // 2 购买的产品存在在购物车上，则订单项上对应产品的数量增加就可以了

        //a.1 基于用户对象user，查询没有生成订单的订单项集合（订单项要是有订单外键oid的值，则说明该订单项结算过了
        List<OrderItem> orderItems = orderItemService.listByUser(user.getId());
        //a.2 遍历这个集合
        for (OrderItem orderItem : orderItems) {
            //订单项上产品和购买产品对比，判断购物车是否有相同产品，有的就增加购物车产品总数量
            if (orderItem.getProduct().getId().intValue() == product.getId().intValue()) {
                //增加购物车产品总数量
                orderItem.setNumber(orderItem.getNumber() + num);
                //更新订单项
                orderItemService.update(orderItem);
                found = true;
                //a.4 获取这个订单项的 id
                oiid = orderItem.getId();
                break;
            }
        }
        //b. 如果不存在对应的OrderItem,那么就新增一个订单项OrderItem，
        // 就是说明没有购物车，现在去拿购物车
        if (!found) {
            //b.1 生成新的订单项
            OrderItem orderItem = new OrderItem();
            //b.2 设置数量，用户和产品
            orderItem.setUid(user.getId());
            orderItem.setNumber(num);
            orderItem.setPid(pid);
            //b.3 插入到数据库
            orderItemService.add(orderItem);
            oiid = orderItem.getId();
        }
        //基于这个订单项id客户端跳转到结算页面/forebuy
        //就是拿着这个购物车去柜台
        return "redirect:forebuy?oiid=" + oiid;
    }

    /*测试*/
    /*  访问路径：http://127.0.0.1:8080/tmall_ssm/forebuy?oiid=1
    1. 通过字符串数组获取参数oiid
为什么这里要用字符串数组试图获取多个oiid，而不是int类型仅仅获取一个oiid?
因为根据购物流程环节与表关系，结算页面还需要显示在购物车中选中的多条OrderItem数据，
所以为了兼容从购物车页面跳转过来的需求，要用字符串数组获取多个oiid
2. 准备一个泛型是OrderItem的集合orderItems
3. 根据前面步骤获取的oiids，从数据库中取出OrderItem对象，并放入orderItems集合中
4. 累计这些orderItems的价格总数，赋值在total上
5. 把订单项集合放在session的属性 "orderItems" 上
6. 把总价格放在 model的属性 "total" 上
7. 服务端跳转到buy.jsp*/
    @RequestMapping("forebuy")
    //1. 通过字符串数组获取参数oiid
    public String buy(Model model, String[] oiid, HttpSession session) {
        //2. 准备一个泛型是OrderItem的集合orderItems，这个就是订单了
        List<OrderItem> orderItems = new ArrayList<>();
        //总消费价格
        float total = 0;
        //3. 根据前面步骤获取的oiids，从数据库中取出OrderItem对象，并放入orderItems集合中
        for (String strid : oiid) {
            int id = Integer.parseInt(strid);
           //获得订单项
            OrderItem orderItem = orderItemService.get(id);
            //4. 累计这些orderItems的价格总数，赋值在total上
            //计算每一个订单项的消费价格，然后相加，得到总消费价格
            //产品的价格 X  订单项上的数量（这里一类产品就是一个订单项）
            total += orderItem.getProduct().getPromotePrice() * orderItem.getNumber();
            //订单集合上增加订单项
            orderItems.add(orderItem);
        }
        //5. 把订单项集合放在session的属性 "orderItems" 上
        session.setAttribute("orderItems", orderItems);
        //6. 把总价格放在 model的属性 "total" 上
        model.addAttribute("total", total);
        return "fore/buy";
    }

    /* 测试：http://127.0.0.1:8080/tmall_ssm/foreaddCart?pid=264&num=4*/

    /**
     * 是在imgAndInfo.jsp上的异步ajax上，在监听增加到购物车按钮中，使用jquery的$.post方法传输过来的
     * @param pid
     * @param num
     * @param model
     * @param session
     * @return
     */
    @RequestMapping("foreaddCart")
    @ResponseBody
    public String addCart(int pid, int num, Model model, HttpSession session) {
        Product product = productService.get(pid);

        User user = (User) session.getAttribute("user");
        boolean found = false;

        List<OrderItem> orderItems = orderItemService.listByUser(user.getId());
        for (OrderItem orderItem : orderItems) {
            if (orderItem.getProduct().getId().intValue() == product.getId().intValue()) {
                orderItem.setNumber(orderItem.getNumber() + num);
                orderItemService.update(orderItem);
                found = true;
                break;
            }
        }

        if (!found) {
            OrderItem orderItem = new OrderItem();
            orderItem.setUid(user.getId());
            orderItem.setNumber(num);
            orderItem.setPid(pid);
            orderItemService.add(orderItem);
        }
        return "success";
    }

    /**
     * 访问地址/forecart导致ForeController.cart()方法被调用
     * 1. 通过session获取当前用户,所以一定要登录才访问，否则拿不到用户对象,会报错
     * 2. 获取为这个用户关联的订单项集合 ois
     * 3. 把ois放在model中
     * 4. 服务端跳转到cart.jsp
     *
     * @param model
     * @param session
     * @return
     */
    @RequestMapping("forecart")
    public String cart(Model model, HttpSession session) {
        User user = (User) session.getAttribute("user");

        List<OrderItem> orderItems = orderItemService.listByUser(user.getId());
        model.addAttribute("orderItems",orderItems);
        return "fore/cart";
    }

    /**
     * cartPage.jsp 中的js代码，会通过Ajax访问/forechangeOrderItem路径
     * 1. 判断用户是否登录
     * 2. 获取pid和number
     * 3. 遍历出用户当前所有的未生成订单的OrderItem
     * 4. 根据pid找到匹配的OrderItem，并修改数量后更新到数据库
     * 5. 返回字符串"success"
     *
     * @param model
     * @param session
     * @param pid
     * @param number
     * @return
     */
    @RequestMapping("forechangeOrderItem")
    @ResponseBody
    // 1 获取pid和number
    public String changeOrderItem(Model model, HttpSession session, int pid, int number) {
        User user = (User) session.getAttribute("user");
        //2. 判断用户是否登录
        if (null == user) return "fail";

        //3. 遍历出用户当前所有的未生成订单的OrderItem
        List<OrderItem> orderItems = orderItemService.listByUser(user.getId());
        for (OrderItem orderItem : orderItems) {
            //4. 根据pid找到匹配的OrderItem，并修改数量后更新到数据库
            if (orderItem.getProduct().getId().intValue() == pid) {
                orderItem.setNumber(number);
                orderItemService.update(orderItem);
                break;
            }
        }
        return "success";
    }


    @RequestMapping("foredeleteOrderItem")
    @ResponseBody
    public String deleteOrderItem(Model model, HttpSession session, int oiid) {
        User user = (User) session.getAttribute("user");

        if (null == user) return "fail";

        orderItemService.delete(oiid);
        return "success";
    }

    /**
     * alipayPage.jsp页面上的确认访问按钮提交数据到/forepayed,
     * 导致ForeController.payed方法被调用
     * 1.1 获取参数oid
     * 1.2 根据oid获取到订单对象order
     * 1.3 修改订单对象的状态和支付时间
     * 1.4 更新这个订单对象到数据库
     * 1.5 把这个订单对象放在model的属性"o"上
     * 1.6 服务端跳转到payed.jsp
     *
     * @param oid
     * @param total
     * @param model
     * @return
     */
    @RequestMapping("forepayed")
    //1 获取参数oid
    public String payed(int oid, float total, Model model) {
        //2 根据oid获取到订单对象order
        Order order = orderService.get(oid);
        //3 修改订单对象的状态和支付时间
        order.setStatus(OrderService.waitDelivery);
        order.setPayDate(new Date());
        //4 更新这个订单对象到数据库
        orderService.update(order);
        //5 把这个订单对象放在model的属性"order"上
        model.addAttribute("order", order);
        //6 服务端跳转到payed.jsp
        return "fore/payed";
    }

    /**
     * 提交订单访问路径 /forecreateOrder, 导致ForeController.createOrder 方法被调用
     * 1. 从session中获取user对象
     * 2. 根据当前时间加上一个4位随机数生成订单号
     * 3. 通过参数Order接受地址，邮编，收货人，用户留言等信息
     * 4. 根据上述参数，对订单对象赋值
     * 5. 把订单状态设置为等待支付
     * 6. 从session中获取订单项集合 ( 在结算功能的ForeController.buy() 13行，订单项集合被放到了session中 )
     * 7. 把订单加入到数据库，并且遍历订单项集合，设置每个订单项的order，更新到数据库
     * 8. 统计本次订单的总金额
     * 9. 客户端跳转到确认支付页forealipay，并带上订单id和总金额
     *
     * @param model
     * @param order
     * @param session
     * @return
     */
    @RequestMapping("forecreateOrder")
    public String creaeteOrder(Model model, Order order, HttpSession session) {
        //1. 从session中获取user对象
        User user = (User) session.getAttribute("user");
        //2. 根据当前时间加上一个4位随机数生成订单号
        String orderCode = new SimpleDateFormat("yyyyMMddHHmmssSSS").format(new Date()) + RandomUtils.nextInt(1000);
        //3. 通过参数Order接受地址，邮编，收货人，用户留言等信息
        //4. 根据上述参数，对订单对象赋值
        order.setOrderCode(orderCode);
        order.setCreateDate(new Date());
        order.setUid(user.getId());
        //5. 把订单状态设置为等待支付
        order.setStatus(OrderService.waitPay);
        //6. 从session中获取订单项集合 ( 在结算功能的ForeController.buy() 13行，订单项集合被放到了session中 )
        List<OrderItem> orderItems = (List<OrderItem>) session.getAttribute("orderItems");
        //7. 把订单加入到数据库，并且遍历订单项集合，设置每个订单项的order，更新到数据库
        //8. 统计本次订单的总金额
        float total = orderService.add(order, orderItems);
        //9. 客户端跳转到确认支付页forealipay，并带上订单id和总金额
        return "redirect:forealipay?oid=" + order.getId() + "&total=" + total;
    }

    /**
     * /forebought导致ForeController.bought()方法被调用
     * 1. 通过session获取用户user
     * 2. 查询user所有的状态不是"delete" 的订单集合os
     * 3. 为这些订单填充订单项
     * 4. 把os放在model的属性"os"上
     * 5. 服务端跳转到bought.jsp
     *
     * @param model
     * @param session
     * @return
     */
    @RequestMapping("forebought")
    public String bought(Model model, HttpSession session) {
        User user = (User) session.getAttribute("user");

        List<Order> orders = orderService.list(user.getId(), OrderService.delete);

        orderItemService.fill(orders);

        model.addAttribute("orders", orders);
        return "fore/bought";
    }

    /**
     * 1.1 获取参数oid
     * 1.2 根据oid获取订单对象o
     * 1.3 修改状态
     * 1.4 更新到数据库
     * 1.5 返回字符串"success"
     * boughtPage.jsp 中的javascript代码获取返回字符串是success的时候，隐藏掉当前这行订单数据。
     *
     * @param model
     * @param oid
     * @return
     */
    @RequestMapping("foredeleteOrder")
    @ResponseBody
    public String deleteOrder(Model model, int oid) {
        Order order = orderService.get(oid);
        order.setStatus(OrderService.delete);
        orderService.update(order);
        return "success";
    }


    /**
     * 最后的确认支付按钮，提交到路径/foreorderConfirmed，
     * 导致ForeController.orderConfirmed()方法被调用
     * <p>
     * 1.1 获取参数oid
     * 1.2 根据参数oid获取Order对象o
     * 1.3 修改对象o的状态为等待评价，修改其确认支付时间
     * 1.4 更新到数据库
     * 1.5 服务端跳转到orderConfirmed.jsp页面
     *
     * @param model
     * @param oid
     * @return
     */
    @RequestMapping("foreorderConfirmed")
    public String orderConfirmed(Model model, int oid) {
        Order order = orderService.get(oid);

        order.setStatus(OrderService.waitReview);
        order.setConfirmDate(new Date());
        orderService.update(order);
        return "fore/orderConfirmed";
    }

    /**
     * 2.1 获取参数oid
     * 2.2 通过oid获取订单对象o
     * 2.3 为订单对象填充订单项
     * 2.4 把订单对象放在request的属性"o"上
     * 2.5 服务端跳转到 confirmPay.jsp
     *
     * @param model
     * @param oid
     * @return
     */
    @RequestMapping("foreconfirmPay")
    public String confirmPay(Model model, int oid) {
        Order order = orderService.get(oid);

        orderItemService.fill(order);
        model.addAttribute("order", order);
        return "fore/confirmPay";
    }

    /**
     * 1.1 获取参数oid
     * 1.2 根据oid获取订单对象o
     * 1.3 为订单对象填充订单项
     * 1.4 获取第一个订单项对应的产品,因为在评价页面需要显示一个产品图片，那么就使用这第一个产品的图片了
     * 1.5 获取这个产品的评价集合
     * 1.6 为产品设置评价数量和销量
     * 1.7 把产品，订单和评价集合放在request上
     * 1.8 服务端跳转到 review.jsp
     *
     * @param model
     * @param oid
     * @return
     */
    @RequestMapping("forereview")
    public String review(Model model, int oid) {
        Order order = orderService.get(oid);
        orderItemService.fill(order);
        Product product = order.getOrderItems().get(0).getProduct();
        List<Review> reviews = reviewService.list(product.getId());

        productService.setSaleAndReviewNumber(product);

        model.addAttribute("product", product);
        model.addAttribute("reviews", reviews);
        model.addAttribute("order", order);

        return "fore/review";
    }

    /**
     1.1 获取参数oid
     1.2 根据oid获取订单对象o
     1.3 修改订单对象状态
     1.4 更新订单对象到数据库
     1.5 获取参数pid
     1.6 根据pid获取产品对象
     1.7 获取参数content (评价信息)
     1.8 对评价信息进行转义，道理同注册ForeController.register()
     1.9 从session中获取当前用户
     1.10 创建评价对象review
     1.11 为评价对象review设置 评价信息，产品，时间，用户
     1.12 增加到数据库
     1.13.客户端跳转到/forereview： 评价产品页面，并带上参数showonly=true
     * @param model
     * @param session
     * @param content
     * @param oid
     * @param pid
     * @return
     */
    @RequestMapping("foredoreview")
    public String doreview(Model model, HttpSession session,String content,
                           @RequestParam("oid")int oid,@RequestParam("pid")int pid) {

        Order order = orderService.get(oid);

        order.setStatus(OrderService.finish);
        orderService.update(order);

        Product product = productService.get(pid);
        content = HtmlUtils.htmlEscape(content);

        User user = (User) session.getAttribute("user");
        Review review = new Review();
        review.setContent(content);
        review.setPid(pid);
        review.setCreateDate(new Date());
        review.setUid(user.getId());
        reviewService.add(review);
        /*在reviewPage.jsp中，当参数showonly==true，那么就显示当前产品的所有评价信息*/
        return "redirect:forereview?oid="+oid+"&showonly=true";
    }
}







