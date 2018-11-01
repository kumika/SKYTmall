package CCTV.Tmall.Service;

import CCTV.Tmall.mapper.ProductImageMapper;
import CCTV.Tmall.pojo.ProductImage;
import CCTV.Tmall.pojo.ProductImageExample;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductImageServiceImpl implements ProductImageService {

    @Autowired
    ProductImageMapper productImageMapper;


    @Override
    public List<ProductImage> list(int pid, String type) {
        ProductImageExample productImageExample = new ProductImageExample();
        productImageExample.createCriteria()
                .andPidEqualTo(pid)
                .andTypeEqualTo(type);
        productImageExample.setOrderByClause("id desc");

        return productImageMapper.selectByExample(productImageExample);
    }

    @Override
    public void add(ProductImage productImage) {
        productImageMapper.insert(productImage);
    }

    @Override
    public ProductImage get(int id) {
        return productImageMapper.selectByPrimaryKey(id);
    }

    @Override
    public void delete(int id) {
        productImageMapper.deleteByPrimaryKey(id);
    }


}
