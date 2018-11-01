package CCTV.Tmall.Controller;

import CCTV.Tmall.Service.CategoryService;
import CCTV.Tmall.Service.PropertyService;
import CCTV.Tmall.Util.Page;
import CCTV.Tmall.pojo.Category;
import CCTV.Tmall.pojo.Property;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class PropertyController {

    @Autowired
    CategoryService categoryService;

    @Autowired
    PropertyService propertyService;

    @RequestMapping("admin_property_list")
    public String list(int cid, Model model, Page page) {

        PageHelper.offsetPage(page.getStart(), page.getCount());

        Category category = categoryService.get(cid);

        List<Property> propertyList = propertyService.list(cid);

        int total = (int) new PageInfo(propertyList).getTotal();
        page.setTotal(total);
        page.setParam("&cid=" + category.getId());

        model.addAttribute("propertyList", propertyList);
        model.addAttribute("category", category);
        model.addAttribute("page", page);
        return "admin/listProperty";
    }


    @RequestMapping("admin_property_add")
    public String add(Property property) {
        propertyService.add(property);
        return "redirect:admin_property_list?cid=" + property.getCid();
    }


    @RequestMapping("admin_property_edit")
    public String edit(int id, Model model) {
        Property property = propertyService.get(id);
        Category category = categoryService.get(property.getCid());
        property.setCategory(category);

        model.addAttribute("property", property);
        return "admin/editProperty";
    }


    @RequestMapping("admin_property_update")
    public String update(Property property) {
        propertyService.update(property);
        return "redirect:admin_property_list?cid=" + property.getCid();
    }


    @RequestMapping("admin_property_delete")
    public String delete(int id) {
        Property property = propertyService.get(id);
        propertyService.delete(id);
        return "redirect:admin_property_list?cid=" + property.getCid();
    }
}
