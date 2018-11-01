package CCTV.Tmall.Service;

import CCTV.Tmall.mapper.OrderItemMapper;
import CCTV.Tmall.mapper.ProductMapper;
import CCTV.Tmall.pojo.Order;
import CCTV.Tmall.pojo.OrderItem;
import CCTV.Tmall.pojo.OrderItemExample;
import CCTV.Tmall.pojo.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrderItemServiceImpl implements OrderItemService {

    @Autowired
    ProductMapper productMapper;

    @Autowired
    OrderItemMapper orderItemMapper;

    @Autowired
    ProductService productService;

    /**
     * 在fill(List<Order> orders) 中，就是遍历每个订单，然后挨个调用fill(Order order)
     * @param orders
     */
    @Override
    public void fill(List<Order> orders) {
        for (Order order :  orders) {
            fill(order);
        }
    }

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

    @Override
    public List<OrderItem> listByUser(Integer uid) {
        OrderItemExample orderItemExample = new OrderItemExample();
        //查询没有生成订单的订单项集合, 查询条件：订单字段null, 字段uid
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

    @Override
    public OrderItem get(int id) {
        OrderItem result = orderItemMapper.selectByPrimaryKey(id);

        setProduct(result);
        return result;
    }

    @Override
    public void delete(int oiid) {
        orderItemMapper.deleteByPrimaryKey(oiid);
    }

    /**
     * fill(Order order) :
     为什么要提供这个方法呢？ 因为在订单管理界面，首先是遍历多个订单，然后遍历这个订单下的多个订单项。
     而由MybatisGenerator逆向工程所创建的一套自动生成代码，是不具备一对多关系的，需要自己去二次开发。
     这里就是做订单与订单项的一对多关系。
     在fill(Order order)中：
     1. 根据订单id查询出其对应的所有订单项
     2. 通过setProduct为所有的订单项设置Product属性
     3. 遍历所有的订单项，然后计算出该订单的总金额和总数量
     4. 最后再把订单项设置在订单的orderItems属性上。
     * @param order
     */
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
}
