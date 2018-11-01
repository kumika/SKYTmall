package CCTV.Tmall.Service;

import CCTV.Tmall.mapper.PropertyMapper;
import CCTV.Tmall.pojo.Property;
import CCTV.Tmall.pojo.PropertyExample;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class PropertyServiceImpl implements PropertyService {

    @Autowired
    PropertyMapper propertyMapper;


    public List<Property> list(int cid) {
        PropertyExample propertyExample = new PropertyExample();
        propertyExample.createCriteria().andCidEqualTo(cid);
        propertyExample.setOrderByClause("id desc");
        return propertyMapper.selectByExample(propertyExample);
    }

    public void add(Property property) {
        propertyMapper.insert(property);
    }

    @Override
    public Property get(int id) {
        return propertyMapper.selectByPrimaryKey(id);
    }

    public void update(Property property) {
        propertyMapper.updateByPrimaryKeySelective(property);
    }

    @Override
    public void delete(int id) {
        propertyMapper.deleteByPrimaryKey(id);
    }

}
