package CCTV.Tmall.Controller;

import CCTV.Tmall.Service.ProductImageService;
import CCTV.Tmall.Service.ProductService;
import CCTV.Tmall.Util.ImageUtil;
import CCTV.Tmall.Util.Page;
import CCTV.Tmall.Util.UploadimageFile;
import CCTV.Tmall.pojo.Product;
import CCTV.Tmall.pojo.ProductImage;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpSession;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.List;

@Controller
public class ProductImageController {

    @Autowired
    ProductService productService;

    @Autowired
    ProductImageService productImageService;


    /**
     * 根据产品id和图片类型查询的list方法
     * <p>
     * 通过产品页面的图片管理访问ProductImageController的list()方法
     * 1. 获取参数pid
     * 2. 根据pid获取Product对象
     * 3. 根据pid对象获取单个图片的集合pisSingle
     * 4. 根据pid对象获取详情图片的集合pisDetail
     * 5. 把product 对象，pisSingle ，pisDetail放在model上
     * 6. 服务端跳转到admin/listProductImage.jsp页面
     * 7. 在listProductImage.jsp，使用c:forEach 遍历pisSingle
     * 8. 在listProductImage.jsp，使用c:forEach 遍历pisDetail
     *
     * @param pid
     * @param model
     * @return
     */
    @RequestMapping("admin_productImage_list")
    public String list(int pid, Model model) {
        Product product = productService.get(pid);

        List<ProductImage> pisSingle = productImageService.list(pid, ProductImageService.type_single);
        List<ProductImage> pisDetail = productImageService.list(pid, ProductImageService.type_detail);

        model.addAttribute("product", product);
        model.addAttribute("pisSingle", pisSingle);
        model.addAttribute("pisDetail", pisDetail);

        return "admin/listProductImage";
    }

    /**
     * @param productImage
     * @param session
     * @param uploadimageFile
     * @return
     */
    @RequestMapping("admin_productImage_add")
    public String add(ProductImage productImage, HttpSession session, UploadimageFile uploadimageFile) {
        productImageService.add(productImage);

        String fileName = productImage.getId() + ".jpg";
        String imageFolder;
        String imageFolder_small = null;
        String imageFolder_middle = null;

        if (ProductImageService.type_single.equals(productImage.getType())) {
            imageFolder = session.getServletContext().getRealPath("img/ProductImageSingle");
            imageFolder_small = session.getServletContext().getRealPath("img/ProductImage_small");
            imageFolder_middle = session.getServletContext().getRealPath("img/ProductImage_middle");
        } else {
            imageFolder = session.getServletContext().getRealPath("img/ProductImageDetail");
        }

        File newFile = new File(imageFolder, fileName);
        newFile.getParentFile().mkdirs();

        try {
            uploadimageFile.getImage().transferTo(newFile);
            BufferedImage bufferedImage = ImageUtil.change2jpg(newFile);
            ImageIO.write(bufferedImage, "jpg", newFile);

            if (ProductImageService.type_single.equals(productImage.getType())) {
                File file_small = new File(imageFolder_small, fileName);
                File file_middle = new File(imageFolder_middle, fileName);

                ImageUtil.resizeImage(newFile, 56, 56, file_small);
                ImageUtil.resizeImage(newFile, 217, 190, file_middle);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }

        return "redirect:admin_productImage_list?pid=" + productImage.getPid();
    }


    /**
     * 点击删除超链，进入ProductImageController的delete方法
     1. 获取id
     2. 根据id获取ProductImage 对象pi
     3. 借助productImageService，删除数据
     4. 如果是单个图片，那么删除3张正常，中等，小号图片
     5. 如果是详情图片，那么删除一张图片
     6. 客户端跳转到admin_productImage_list地址
     * @param id
     * @param session
     * @return
     */
    @RequestMapping("admin_productImage_delete")
    public String delete(int id, HttpSession session) {
        ProductImage productImage = productImageService.get(id);

        String fileName = productImage.getId() + ".jpg";
        String imageFloder;
        String imageFloder_small = null;
        String imageFloder_middel = null;


        if (ProductImageService.type_single.equals(productImage.getType())) {
            imageFloder = session.getServletContext().getRealPath("img/ProductImageSingle");
            imageFloder_small = session.getServletContext().getRealPath("img/ProductImage_small");
            imageFloder_middel = session.getServletContext().getRealPath("img/ProductImage_middle");

            File imagefile = new File(imageFloder, fileName);
            File imagefile_small = new File(imageFloder_small, fileName);
            File imagefile_middel = new File(imageFloder_middel, fileName);

            imagefile.delete();
            imagefile_small.delete();
            imagefile_middel.delete();
        }
        else {
            imageFloder = session.getServletContext().getRealPath("img/ProductImageDetail");
            File imageFile = new File(imageFloder, fileName);

            imageFile.delete();
        }

        productImageService.delete(id);
        return "redirect:admin_productImage_list?pid=" + productImage.getPid();
    }
}
