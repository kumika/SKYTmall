package CCTV.Tmall.Service;

import CCTV.Tmall.pojo.Property;

import java.util.List;

public interface PropertyService {
    List<Property> list(int cid);

    void add(Property property);

    Property get(int id);

    void update(Property property);

    void delete(int id);
}
