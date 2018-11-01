package CCTV.Tmall.Service;

import CCTV.Tmall.pojo.Order;
import CCTV.Tmall.pojo.OrderItem;

import java.util.List;

public interface OrderService {


    String waitPay = "waitPay";
    String waitDelivery = "waitDelivery";
    String waitConfirm = "waitConfirm";
    String waitReview = "waitReview";
    String finish = "finish";
    String delete = "delete";


    List<Order> list();


    void update(Order order);

    Order get(int oid);

    float add(Order order, List<OrderItem> orderItems);

    List list(Integer id, String delete);
}
