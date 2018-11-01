package CCTV.Tmall.Service;

import CCTV.Tmall.Util.Page;
import CCTV.Tmall.pojo.Category;
import org.springframework.stereotype.Service;

import java.util.List;

public interface CategoryService {
  /*  List<Category> list(Page page);*/

 /*   int total();*/


    List<Category> list();

    void add(Category category);

    void delete(int id);

    Category get(int id);

    void update(Category category);
}
