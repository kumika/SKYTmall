package CCTV.Tmall.Controller;

import CCTV.Tmall.Service.CategoryService;
import CCTV.Tmall.Service.ProductService;
import CCTV.Tmall.Util.Page;
import CCTV.Tmall.pojo.Category;
import CCTV.Tmall.pojo.Product;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Date;
import java.util.List;

@Controller
public class ProductController {
    @Autowired
    ProductService productService;

    @Autowired
    CategoryService categoryService;

    /**
     * 1. 获取分类 cid,和分页对象page
     * 2. 通过PageHelper设置分页参数
     * 3. 基于cid，获取当前分类下的产品集合
     * 4. 通过PageInfo获取产品总数
     * 5. 把总数设置给分页page对象
     * 6. 拼接字符串"&cid="+c.getId()，设置给page对象的Param值。 因为产品分页都是基于当前分类下的分页，所以分页的时候需要传递这个cid
     * 7. 把产品集合设置到 request的 "ps" 产品上
     * 8. 把分类对象设置到 request的 "c" 产品上。 ( 这个c有什么用呢？ 在 其他-面包屑导航 中会用于显示分类名称)
     * 9. 把分页对象设置到 request的 "page" 对象上
     * 10. 服务端跳转到admin/listProduct.jsp页面
     * 11. 在listProduct.jsp页面上使用c:forEach 遍历ps集合，并显示
     *
     * @param cid
     * @param model
     * @param page
     * @return
     */
    @RequestMapping("admin_product_list")
    public String list(int cid, Model model, Page page) {
        Category category = categoryService.get(cid);

        PageHelper.offsetPage(page.getStart(), page.getCount());
        List<Product> productList = productService.list(cid);

        int total = (int) new PageInfo(productList).getTotal();

        page.setTotal(total);
        /*
        拼接字符串"&cid="+c.getId()，设置给page对象的Param值。
        因为产品分页都是基于当前分类下的分页，所以分页的时候需要传递这个cid
        */
        page.setParam("&cid=" + category.getId());

        model.addAttribute("productList", productList);
        model.addAttribute("category", category);
        model.addAttribute("page", page);

        return "admin/listProduct";
    }

    /**
     * 1. 在listProduct.jsp提交数据的时候，除了提交产品名称，小标题，原价格，优惠价格，库存外还会提交cid
     * 2. 在ProductController中获取Product对象，并插入到数据库
     * 3. 客户端跳转到admin_product_list,并带上参数cid
     *
     * @param product
     * @return
     */
    @RequestMapping("admin_product_add")
    public String add(Product product) {
        product.setCreateDate(new Date());

        productService.add(product);
        return "redirect:admin_product_list?cid=" + product.getCid();
    }


    /**
     * 1. 在ProductController的edit方法中，根据id获取product对象
     2. 根据product对象的cid产品获取Category对象，并把其设置在product对象的category产品上
     3. 把product对象放在request的 "p" 产品中
     3. 服务端跳转到admin/editProduct.jsp
     4. 在editProduct.jsp中显示产品名称
     5. 在editProduct.jsp中隐式提供id和cid( cid 通过 p.category.id 获取)
     * @param id
     * @param model
     * @return
     */
    @RequestMapping("admin_product_edit")
    public String edit(int id, Model model) {
        Product product = productService.get(id);

        Category category = categoryService.get(product.getCid());
        product.setCategory(category);

        model.addAttribute("product", product);
        return "admin/editProduct";
    }

    /**
     * 1. 在ProductController的update方法中获取Product对象
     * 2. 借助productService更新这个对象到数据库
     * 3. 客户端跳转到admin_product_list，并带上参数cid
     *
     * @param product
     * @return
     */
    @RequestMapping("admin_product_update")
    public String update(Product product) {
        productService.update(product);
        return "redirect:/admin_product_list?cid=" + product.getCid();
    }


    @RequestMapping("admin_product_delete")
    public String delete(int id) {
        Product product = productService.get(id);

        productService.delete(id);
        return "redirect:/admin_product_list?cid=" + product.getCid();
    }
}
