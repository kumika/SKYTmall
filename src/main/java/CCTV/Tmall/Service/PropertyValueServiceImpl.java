package CCTV.Tmall.Service;

import CCTV.Tmall.mapper.PropertyValueMapper;
import CCTV.Tmall.pojo.Product;
import CCTV.Tmall.pojo.Property;
import CCTV.Tmall.pojo.PropertyValue;
import CCTV.Tmall.pojo.PropertyValueExample;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class PropertyValueServiceImpl implements PropertyValueService {


    @Autowired
    PropertyValueMapper propertyValueMapper;

    @Autowired
    PropertyService propertyService;



    /**
     3 init方法
         3.1 这个方法的作用是初始化PropertyValue。 为什么要初始化呢？
     因为对于PropertyValue的管理，没有增加，只有修改。 所以需要通过初始化来进行自动地增加，以便于后面的修改。
         3.2 首先根据产品获取分类，然后获取这个分类下的所有属性集合
         3.3 然后用属性和id产品id去查询，看看这个属性和这个产品，是否已经存在属性值了。
         3.4 如果不存在，那么就创建一个属性值，并设置其属性和产品，接着插入到数据库中。
         这样就完成了属性值的初始化。
     * @param product
     */
    @Override
    public void init(Product product) {
        //首先根据产品获取分类，然后获取这个分类下的所有属性集合
        List<Property> properties = propertyService.list(product.getCid());
        //然后用属性和id产品id去查询，看看这个属性和这个产品，是否已经存在属性值了。
        for (Property property : properties) {
            PropertyValue propertyValue = get(property.getId(), product.getId());
            //如果不存在，那么就创建一个属性值，并设置其属性和产品，接着插入到数据库中。
            //这样就完成了属性值的初始化。
            if (null == propertyValue) {
                propertyValue = new PropertyValue();
                propertyValue.setPid(product.getId());
                propertyValue.setPtid(property.getId());
                propertyValueMapper.insert(propertyValue);
            }
        }
    }

    @Override
    public void update(PropertyValue propertyValue) {
        propertyValueMapper.updateByPrimaryKeySelective(propertyValue);
    }

    /**
     * 根据属性id和产品id获取PropertyValue对象
     * @param ptid
     * @param pid
     * @return
     */
    @Override
    public PropertyValue get(int ptid, int pid) {
        PropertyValueExample propertyValueExample = new PropertyValueExample();
        propertyValueExample.createCriteria()
                .andPtidEqualTo(ptid)
                .andPidEqualTo(pid);

        List<PropertyValue> propertyValues = propertyValueMapper.selectByExample(propertyValueExample);
        if (propertyValues.isEmpty()) {
            return null;
        }
        return propertyValues.get(0);
    }

    /**
     * 根据产品id获取所有的属性值
     * @param pid
     * @return
     */
    @Override
    public List<PropertyValue> list(int pid) {
        PropertyValueExample propertyValueExample = new PropertyValueExample();
        propertyValueExample.createCriteria()
                .andPidEqualTo(pid);

        List<PropertyValue> propertyValues = propertyValueMapper.selectByExample(propertyValueExample);

        //产品属性值类新增加了一个叫属性的属性，数据库的表上没有该字段和数据，所以自己增加数据
        for (PropertyValue propertyValue : propertyValues) {
            Property property = propertyService.get(propertyValue.getPtid());
            propertyValue.setProperty(property);
        }
        return propertyValues;
    }















}
