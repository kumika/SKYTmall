package CCTV.Tmall.Service;

import CCTV.Tmall.mapper.OrderMapper;
import CCTV.Tmall.pojo.Order;
import CCTV.Tmall.pojo.OrderExample;
import CCTV.Tmall.pojo.OrderItem;
import CCTV.Tmall.pojo.User;
import org.omg.CORBA.Object;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class OrderServiceImpl implements OrderService {

    @Autowired
    OrderMapper orderMapper;

    @Autowired
    UserService userService;


    @Autowired
    OrderItemService orderItemService;

    @Override
    public List<Order> list() {
        OrderExample orderExample = new OrderExample();
        orderExample.setOrderByClause("id desc");

        List<Order> orders = orderMapper.selectByExample(orderExample);
        setUser(orders);

        return orders;
    }

    @Override
    public void update(Order order) {
        orderMapper.updateByPrimaryKeySelective(order);
    }

    @Override
    public Order get(int oid) {
        return orderMapper.selectByPrimaryKey(oid);
    }

    @Override
    @Transactional(propagation= Propagation.REQUIRED,rollbackForClassName="Exception")
    public float add(Order order, List<OrderItem> orderItems) {
        float total = 0;
        add(order);


        //用来模拟当增加订单后出现异常，观察事务管理是否预期发生。
        // （需要把false修改为true才能观察到）
        if (false) throw new RuntimeException();

        //订单项更新，订单项对象的订单属性更新，然后计算订单项总价格，最后返回
        for (OrderItem orderItem : orderItems) {
            orderItem.setOid(order.getId());
            orderItemService.update(orderItem);
            total += orderItem.getProduct().getPromotePrice() * orderItem.getNumber();
        }

        return total;
    }

    @Override
    public List list(Integer uid, String status) {
        OrderExample orderExample = new OrderExample();
        orderExample.createCriteria().andUidEqualTo(uid).andStatusNotEqualTo(status);
        orderExample.setOrderByClause("id desc");

        return orderMapper.selectByExample(orderExample);
    }

    public void add(Order order) {
        orderMapper.insert(order);
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


}
