package CCTV.Tmall.Util;

import org.springframework.web.multipart.MultipartFile;

public class UploadimageFile {

/*
        新增UploadedImageFile ，其中有一个MultipartFile 类型的属性，用于接受上传文件的注入。
            注： 这里的属性名称image必须和页面中的增加分类部分中的type="file"  name="image"的name值保持一致

        <input id="categoryPic" accept="image/*" type="file" name="image" />
*/
    MultipartFile image;

    public MultipartFile getImage() {
        return image;
    }

    public void setImage(MultipartFile image) {
        this.image = image;
    }
}
