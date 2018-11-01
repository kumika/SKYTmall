package CCTV.Tmall.Service;


import CCTV.Tmall.pojo.Category;
import CCTV.Tmall.mapper.CategoryMapper;
import CCTV.Tmall.pojo.CategoryExample;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class CategoryServielmpl implements CategoryService {

    @Autowired
    CategoryMapper categoryMapper;

    public List<Category> list() {
        CategoryExample categoryExample = new CategoryExample();
        categoryExample.setOrderByClause("id desc");

        return categoryMapper.selectByExample(categoryExample);
    }

    public void add(Category category) {
        categoryMapper.insert(category);
    }

    public void delete(int id) {
        categoryMapper.deleteByPrimaryKey(id);
    }

    public Category get(int id) {
        return categoryMapper.selectByPrimaryKey(id);
    }

    public void update(Category category) {
        categoryMapper.updateByPrimaryKey(category);
    }




/*
    @Override
    public List<Category> list(Page page) {
        return categoryMapper.list(page);
    }
*/

/*    @Override
    public int total() {
        return categoryMapper.total();}
*/



}
