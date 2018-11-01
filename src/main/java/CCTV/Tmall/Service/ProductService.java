package CCTV.Tmall.Service;

import CCTV.Tmall.pojo.Category;
import CCTV.Tmall.pojo.Product;

import java.util.List;

public interface ProductService {
    List<Product> list(int cid);

    void add(Product product);

    void update(Product product);

    Product get(int id);

    void delete(int id);

    void setFirstProductImage(Product product);

    void fill(List<Category> categoryList);

    void fillByRow(List<Category> categoryList);

    void setSaleAndReviewNumber(Product product);

    void fill(Category category);

    void setSaleAndReviewNumber(List<Product> productList);

    List<Product> search(String key);
}
