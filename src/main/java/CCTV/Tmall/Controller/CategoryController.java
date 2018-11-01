package CCTV.Tmall.Controller;

import CCTV.Tmall.Service.CategoryService;
import CCTV.Tmall.Util.ImageUtil;
import CCTV.Tmall.Util.Page;
import CCTV.Tmall.Util.UploadimageFile;
import CCTV.Tmall.pojo.Category;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpSession;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.List;

@Controller
public class CategoryController {
    @Autowired
    CategoryService categoryService;

    @RequestMapping("admin_category_list")
    public String list(Model model, Page page) {

        //通过分页插件指定分页参数, 开始编号，每页显示多少个
        PageHelper.offsetPage(page.getStart(), page.getCount());
        /*调用list() 获取对应分页的数据*/
        List<Category> categories = categoryService.list();
        /*通过PageInfo获取总数*/
        int total = (int)new PageInfo(categories).getTotal();
        page.setTotal(total);

        model.addAttribute("categories", categories);
        model.addAttribute("page", page);
        return "admin/listCategory";
    }

    /**
     * 1. add方法映射路径admin_category_add的访问
     * 1.1 参数 Category c接受页面提交的分类名称
     * 1.2 参数 session 用于在后续获取当前应用的路径
     * 1.3 UploadedImageFile 用于接受上传的图片
     * 2. 通过categoryService保存c对象
     * 3. 通过session获取ControllerContext,再通过getRealPath定位存放分类图片的路径。
     * 如果严格按照本教程的做法，使用idea中的tomcat部署的话，那么图片就会存放在:E:\project\tmall_ssm\target\tmall_ssm\img\category 这里
     * 4. 根据分类id创建文件名
     * 5. 如果/img/category目录不存在，则创建该目录，否则后续保存浏览器传过来图片，会提示无法保存
     * 6. 通过UploadedImageFile 把浏览器传递过来的图片保存在上述指定的位置
     * 7. 通过ImageUtil.change2jpg(file); 确保图片格式一定是jpg，而不仅仅是后缀名是jpg.
     * 8. 客户端跳转到admin_category_list
     *
     * @param category  参数 Category category接受页面提交的分类名称
     * @param session  参数 session 用于在后续获取当前应用的路径
     * @param uploadimageFile 参数 UploadedImageFile 用于接受上传的图片
     * @return
     * @throws IOException
     */
    @RequestMapping("admin_category_add")
    public String add(Category category, HttpSession session, UploadimageFile uploadimageFile) throws IOException {
        /*通过categoryService保存category对象*/
        categoryService.add(category);
        /*通过session获取ControllerContext,再通过getRealPath定位存放分类图片的路径。
        *
        request.getSession().getServletContext() 获取的是Servlet容器对象,相当于tomcat容器了.
        getRealPath(“/”) 获取实际路径,
        “/”指代项目根目录,所以代码返回的是项目在容器中的实际发布运行的根路径。
        session.getServletContext().getRealPath("img/category")这个路径就是“根路径/img/category”

        1. 先用可运行项目跑起来，是可以实现上传功能的
        2. session.getServletContext.getRealPath("") 拿到的是运行时环境，而在idea里部署的话，
            运行环境不会是源代码webapp/img目录呢
        3. maven项目里src目录下的java,webapp和resource目录都不会参与部署，如果是通过idea部署的话，
            部署的位置是/target/tmall_ssm目录下呢
        4. 从你的截图来看，你应该采用的是tomcat独立部署方式吧。 这就对了呀，独立部署，
            那么获取到的路径肯定是tomcat那里的目录嘛。
            想想真实环境，开发是在windows上做的，部署是在linux上做的，那么获取到的img路径，难道不应该是在linux上吗？ 对嘛

        */
        File imageFolder = new File(session.getServletContext().getRealPath("img/category"));
        System.out.println("根路径：  " + session.getServletContext());
        System.out.println("实际路径：  " + session.getServletContext().getRealPath("/"));

        /*根据分类id创建文件名*/
        File file = new File(imageFolder, category.getId() + ".jpg");
       /*如果/img/category目录不存在，则创建该目录，否则后续保存浏览器传过来图片，会提示无法保存*/
        if (!file.getParentFile().exists()) {
            /*如果父文件夹不存在并且最后一级子文件夹不存在，它就自动新建所有路经里写的文件夹；
            如果父文件夹存在，它就直接在已经存在的父文件夹下新建子文件夹*/
            file.getParentFile().mkdirs();
        }
        /*通过UploadedImageFile 把浏览器传递过来的图片保存在上述指定的位置
        * transfer是把浏览器上传的文件保存在服务器
        * */
        uploadimageFile.getImage().transferTo(file);
        /*通过ImageUtil.change2jpg(file); 确保图片格式一定是jpg，而不仅仅是后缀名是jpg.*/
        BufferedImage bufferedImage = ImageUtil.change2jpg(file);
        /*确保图片格式一定是jpg*/
        ImageIO.write(bufferedImage, "jgp", file);

        return "redirect:/admin_category_list";
    }

    /**
     * 进行2次删除，一次删除是删除数据库的数据，一次删除是删除服务器上的图片文件
     *
     * @param session
     * @param id
     * @return
     */
    @RequestMapping("admin_category_delete")
    public String delete(HttpSession session, int id) {

        categoryService.delete(id);

        File imgeFolder = new File(session.getServletContext().getRealPath("img/category"));
        File file = new File(imgeFolder, id + ".jpg");
        file.delete();

        return "redirect:/admin_category_list";
    }


    @RequestMapping("admin_category_edit")
    public String edit(int id, Model model) {
        Category category = categoryService.get(id);
        model.addAttribute("category", category);
        return "admin/editCategory";
    }

    /**
     * 新增update方法
     1. update 方法映射路径admin_category_update的访问
     1.1 参数 Category c接受页面提交的分类名称
     1.2 参数 session 用于在后续获取当前应用的路径
     1.3 UploadedImageFile 用于接受上传的图片
     2. 通过categoryService更新c对象
     3. 首先判断是否有上传图片，如果有上传，那么通过session获取ControllerContext,再通过getRealPath定位存放分类图片的路径。
     如果严格按照本教程的做法，使用idea中的tomcat部署的话，那么图片就会存放在:E:\project\tmall_ssm\target\tmall_ssm\img\category 这里
     4. 根据分类id创建文件名
     5. 通过UploadedImageFile 把浏览器传递过来的图片保存在上述指定的位置
     6. 通过ImageUtil.change2jpg(file); 确保图片格式一定是jpg，而不仅仅是后缀名是jpg.
     7. 客户端跳转到admin_category_list
     * @param session
     * @param category
     * @param uploadImageFile
     * @return
     */
    @RequestMapping("admin_category_update")
    public String update(HttpSession session, Category category, UploadimageFile uploadImageFile) throws IOException {
        categoryService.update(category);

        MultipartFile image = uploadImageFile.getImage();
        if (null != image && !image.isEmpty()) {
            File imageFolder = new File(session.getServletContext().getRealPath("img/category"));
            File file = new File(imageFolder, category.getId() + ".jpg");
            image.transferTo(file);
            BufferedImage bufferedImage = ImageUtil.change2jpg(file);
            ImageIO.write(bufferedImage, "jpg", file);
        }
        return "redirect:/admin_category_list";
    }
}









