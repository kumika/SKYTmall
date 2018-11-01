package CCTV.Tmall.Service;

import CCTV.Tmall.pojo.Product;
import CCTV.Tmall.pojo.PropertyValue;

import java.util.List;

public interface PropertyValueService {
    void init(Product product);

    void update(PropertyValue propertyValue);

    PropertyValue get(int ptid, int pid);

    List<PropertyValue> list(int pid);

}
