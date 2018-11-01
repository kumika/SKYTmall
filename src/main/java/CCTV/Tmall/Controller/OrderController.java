package CCTV.Tmall.Controller;

import CCTV.Tmall.Service.OrderItemService;
import CCTV.Tmall.Service.OrderService;
import CCTV.Tmall.Util.Page;
import CCTV.Tmall.pojo.Order;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Date;
import java.util.List;

@Controller
public class OrderController {

    @Autowired
    OrderService orderService;

    @Autowired
    OrderItemService orderItemService;

    /**
     * admin_order_list 导致OrderController.list()方法被调用
     * 1. 获取分页对象
     * 2. 查询订单集合
     * 3. 获取订单总数并设置在分页对象上
     * 4. 借助orderItemService.fill()方法为这些订单填充上orderItems信息
     * 5. 把订单集合和分页对象设置在model上
     * 6. 服务端跳转到admin/listOrder.jsp页面
     * 7. 在listOrder.jsp借助c:forEach把订单集合遍历出来
     * 8. 遍历订单的时候，再把当前订单的orderItem订单项集合遍历出来
     *
     * @param model
     * @param page
     * @return
     */
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

    /**
     * 当订单状态是waitDelivery的时候，就会出现发货按钮
     1. 发货按钮链接跳转到admin_order_delivery
     2. OrderController.delivery()方法被调用
     2.1 注入订单对象
     2.2 修改发货时间，设置发货状态
     2.3 更新到数据库
     2.4 客户端跳转到admin_order_list页面
     * @param order
     * @return
     */
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
}
