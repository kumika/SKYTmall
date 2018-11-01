package CCTV.Tmall.Service;

import CCTV.Tmall.mapper.ProductMapper;
import CCTV.Tmall.pojo.Category;
import CCTV.Tmall.pojo.Product;
import CCTV.Tmall.pojo.ProductExample;
import CCTV.Tmall.pojo.ProductImage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class ProductServiceImpl implements ProductService {

    @Autowired
    OrderItemService orderItemService;

    @Autowired
    ReviewService reviewService;

    @Autowired
    ProductMapper productMapper;

    @Autowired
    CategoryService categoryService;

    @Autowired
    ProductImageService productImageService;

    @Override
    public List<Product> list(int cid) {
        ProductExample productExample = new ProductExample();
        productExample.createCriteria().andCidEqualTo(cid);
        productExample.setOrderByClause("id desc");
        List<Product> productList =  productMapper.selectByExample(productExample);
        setFirstProductImage(productList);
        setCategory(productList);

        return productList;
    }

    public void setCategory(List<Product> productList) {
        for (Product pro : productList) {
            setCategory(pro);
        }
    }

    public void setCategory(Product product) {
        int cid = product.getCid();
        Category category = categoryService.get(cid);
        product.setCategory(category);
    }


    @Override
    public void add(Product product) {
        productMapper.insert(product);
    }

    @Override
    public void update(Product product) {
        productMapper.updateByPrimaryKeySelective(product);
    }

    @Override
    public Product get(int id) {
        Product product = productMapper.selectByPrimaryKey(id);
        setCategory(product);
        setFirstProductImage(product);
        return product;
    }







    @Override
    public void delete(int id) {
        productMapper.deleteByPrimaryKey(id);
    }

    //根据产品的id ,图片的类型进行查询返回图片，然后产品setImage
    @Override
    public void setFirstProductImage(Product product) {
        List<ProductImage> productImageList = productImageService.list(product.getId(), ProductImageService.type_single);
        if (!productImageList.isEmpty()) {
            ProductImage productImage = productImageList.get(0);
            product.setFirstProductImage(productImage);
        }
    }

    @Override
    public void setSaleAndReviewNumber(List<Product> productList) {
        for (Product product : productList) {
            setSaleAndReviewNumber(product);
        }
    }

    @Override
    public List<Product> search(String key) {
        ProductExample productExample = new ProductExample();
        productExample.createCriteria().andNameLike("%" + key + "%");
        productExample.setOrderByClause("id desc");

        List result = productMapper.selectByExample(productExample);
        setFirstProductImage(result);
        setCategory(result);

        return result;
    }

    /**
     * 为多个分类填充产品集合
     * @param categoryList
     */
    @Override
    public void fill(List<Category> categoryList) {
        for (Category category : categoryList) {
            fill(category);
        }
    }

    /**
     * 为分类填充产品集合
     * @param category
     */
    public void fill(Category category) {
        List<Product> productList = list(category.getId());
        category.setProductList(productList);
    }


    /**
     * 为多个分类填充推荐产品集合，即把分类下的产品集合，
     * 按照8个为一行，拆成多行，以利于后续页面上进行显示
     * @param categoryList
     */
    @Override
    public void fillByRow(List<Category> categoryList) {
        int productNumberEachRow = 8;
        //竖状导航分类，把一行行的产品填充到分类所在的行上，
        // 其实就是把那些产品增加到分类对象上，然后在页面上进行分行
        for (Category category : categoryList) {
            //根据分类查询到的产品进行排列成一行
            List<Product> productList = category.getProductList();
            //productByRow是分类所在的行
            List<List<Product>> productByRow = new ArrayList<>();
            //一行8个产品，现在是直接把8个做为一个整体行
            for (int i = 0; i<productList.size();i+=productNumberEachRow) {
                //确定一行多少个产品
                int size = i + productNumberEachRow;
                size = size > productList.size() ? productList.size() : size;
                //把8个做为一个整体行，超过8个则余下的是作为下个循环进行放入
                List<Product> productsOfEachRow = productList.subList(i, size);
                //拥有8个产品的一个整行放在分类所在的行
                productByRow.add(productsOfEachRow);
            }
            //增加该分类的导航产品行
            category.setProductsByRow(productByRow);
        }
    }

    @Override
    public void setSaleAndReviewNumber(Product product) {
        int saleCount = orderItemService.getSaleCount(product.getId());
        product.setSaleCount(saleCount);

        int reviewCount = reviewService.getCount(product.getId());
        product.setReviewCount(reviewCount);
    }


    public void setFirstProductImage(List<Product> product) {
        for (Product pro : product) {
            setFirstProductImage(pro);
        }
    }



}
