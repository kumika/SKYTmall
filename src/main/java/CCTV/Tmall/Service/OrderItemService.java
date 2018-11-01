package CCTV.Tmall.Service;

import CCTV.Tmall.pojo.Order;
import CCTV.Tmall.pojo.OrderItem;

import java.util.List;

public interface OrderItemService {
    void fill(List<Order> orders);

    int getSaleCount(Integer id);

    List<OrderItem> listByUser(Integer id);

    void update(OrderItem orderItem);

    void add(OrderItem orderItem);

    OrderItem get(int id);

    void delete(int oiid);

    void fill(Order order);
}
