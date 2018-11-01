#天猫SSM实战--后台实现功能 1


#分3个大的功能管理--分类管理--用户管理--订单管理

因为先实现的是后台功能，前台的功能还没有做，所以是未完成版的，以后代码会有改动。

# 1 分类管理

目标效果：

![分类项目.jpg](https://i.loli.net/2018/09/26/5bab4ccd49952.jpg)

![增加分类.jpg](https://i.loli.net/2018/09/26/5bab4ccd12113.jpg)

主要功能:

![分类管理.jpg](https://i.loli.net/2018/09/26/5bab4b8da5db8.jpg)



## 1 分类管理（管理分类）



### 1.1 查询所有分类功能

#### 1.1.1 查询所有分类功能jsp:
----

 查询所有的分类

```
 <a class="navbar-brand" href="admin_category_list">分类管理</a>
```


#### 1.1.2 CategoryController：
-------------------

因为分页功能是分开的，所以要是有分页功能的都要有page参数

```
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
```


#### 1.1.3 CategoryServiceIMP
------------------

生成的Mapper和Dao 都是使用mybatis的逆向工程，查询，增加，更新，修改都是使用自动生成的方法，未有改动。所以也不粘贴上来了

```
    public List<Category> list() {
        CategoryExample categoryExample = new CategoryExample();
        categoryExample.setOrderByClause("id desc");

        return categoryMapper.selectByExample(categoryExample);
    }
```



### 1.2 增加分类(包括上传图片)

#### 1.2.1 增加分类功能jsp:

 1. method="post" 用于保证中文的正确提交
 2. 必须有enctype="multipart/form-data"，这样才能上传文件
 3. accept="image/*" 这样把上传的文件类型限制在了图片

**关键点在于要有enctype="mutipart/form-date"这个属性和 name="image"**  

个人理解：在controller的方法上，无论jsp的提交表单是什么类型，只要pojo类上能对应上name的，这个Pojo类就可作为参数注入到方法上（要是pojo类的属性与表单name对应不全，那pojo类的属性就有null值）

```
<form method="post" id="addForm" action="admin_category_add" enctype="multipart/form-data">
                <table class="addTable">
                    <tr>
                        <td>分类名称</td>
                        <td><input  id="name" name="name" type="text" class="form-control"></td>
                    </tr>
                    <tr>
                        <td>分类圖片</td>
                        <td>
                            <input id="categoryPic" accept="image/*" type="file" name="image" />
                        </td>
                    </tr>
                    <tr class="submitTR">
                        <td colspan="2" align="center">
                            <button type="submit" class="btn btn-success">提 交</button>
                        </td>
                    </tr>
                </table>
            </form>
```


#### 1.2.2 CategoryController:

图片类 uploadImageFile  是接收表单上传图片的pojo类

**MultipartFile 类型的属性，用于接受上传文件的注入
jsp上的enctype="multipart/form-data"**


```
public class UploadimageFile {
//MultipartFile 类型的属性，用于接受上传文件的注入
//jsp上的enctype="multipart/form-data"
  MultipartFile image;

<!-- setter 和 getter -->
}
```


思路：（分2部分保存，一个保存表单对象，一个保存上传图片文件）
1 方法参数1 ： pojo类 category
2 方法参数2 ： 图片类 uploadImageFile  
3 方法参数3 ： HttpSession session

4 对category对象增加到数据库中
**============完成category对象保存，下面是对图片文件保存=======**
5 创建新的文件
5.1 根据session.getServletContext().getRealPath("img/category"),获得存放文件目录,然后创建新文件 File file = new File(目录路径)

5.2 根据自己需要的文件名创建新的文件File file = new File(文件，文件名)

5.3 确保目录真实存在file.getParentFile().mkdirs()

6 把上传的文件传输到新的文件中,其中使用MultipartFile 类的方法transferTo()。进行

uploadImageFile.getImage().transferTo(file)


7 返回页面重新查询，重定向admin_category_list

```
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
```


#### 1.2.3 CategoryServiceIMP


```
  public void add(Category category) {
        categoryMapper.insert(category);
    }
```



### 1.3 删除分类功能

删除分类，因为这有分类图片，所以要删除2次 ，一次是删除分类，一次删除图片。
毕竟保存多少次，就删除多少次嘛

**删除文件需要文件是空的**

file 的删除api解释：Deletes the file or directory denoted by this abstract pathname.（通过抽象路径名进行文件OR指定路径）

#### 1.3.1 删除功能Jsp：

那个《span》标签内容是删除图标trash
```
<td><a href="admin_category_delete?id=${category.id}" deleteLink="true"><span class="glyphicon glyphicon-trash"></span></a> </td>
```


#### 1.3.2 CategoryController：

删除思路：

1 删除category对象

CategoryService.delete(id)

2 删除服务器上保存的图片
2.1 创建一个一样路径,一样名字的文件，覆盖图片文件
2.2 这样空的文件就可以删除了

```
    @RequestMapping("admin_category_delete")
    public String delete(HttpSession session, int id) {

        categoryService.delete(id);

        File imgeFolder = new File(session.getServletContext().getRealPath("img/category"));
        File file = new File(imgeFolder, id + ".jpg");
        file.delete();

        return "redirect:/admin_category_list";
    }

```

#### 1.3.3 CategoryServiceIMP：

```
  public void delete(int id) {
        categoryMapper.deleteByPrimaryKey(id);
    }
```




### 1.4 修改分类功能（修改上传图片）

其实所谓修改上传图片，就是新的图片整个覆盖旧的图片

修改2个内容 
1 分类名称
2 修改图片

================================
想更正自己的一个惯性思维，老是觉得修改是一步到位的，但是其实是分2个部分的。

第1部分是**拿到需要修改的分类**  category

第2部分 是根据上传表单的内容更新拿到的分类，进行修改更新


#### 1.4.1 第 1 部分 拿到分类

Jsp：
```
<td><a href="admin_category_edit?id=${category.id}"><span class="glyphicon glyphicon-edit"></span></a> </td>
```

Controller:
拿到需要更新的分类，然后进行跳转到展示需要更新分类的页面，更新表单在那里。
```
    @RequestMapping("admin_category_edit")
    public String edit(int id, Model model) {
        Category category = categoryService.get(id);
        model.addAttribute("category", category);
        return "admin/editCategory";
    }
```

ServiceIMP:

```
   public Category get(int id) {
        return categoryMapper.selectByPrimaryKey(id);
    }
```


#### 1.4.2 第 2 部分 更新分类

这里更新2样，分类名称，图片，所以不要忘记**enctype="mutipart-data"**

JSP的表单：

```
 <form method="post" id="editForm" action="admin_category_update" enctype="multipart/form-data">
                <table class="editTable">
                    <tr>
                        <td>分类名称</td>
                        <td><input  id="name" name="name" value="${category.name}" type="text" class="form-control"></td>
                    </tr>
                    <tr>
                        <td>分类圖片</td>
                        <td>
                            <input id="categoryPic" accept="image/*" type="file" name="image" />
                        </td>
                    </tr>
                    <tr class="submitTR">
                        <td colspan="2" align="center">
                            <input  type="hidden" name="id" value="${category.id}">
                            <button type="submit" class="btn btn-success">提 交</button>
                        </td>
                    </tr>
                </table>
            </form>
```


Controller：

几乎是与增加分类与图片是一样的，区别在于这要判断上传图片是否为空
```
MultipartFile image = uploadImageFile.getImage();
        if (null != image && !image.isEmpty()) {
```
更新也是分2部分更新，更新分类  和  更新 图片

思路：
3个参数 上传图片，分类对象，HttpSession

1 对分类对象进行更新CategoryService.update(catogory)

2 根据Session.getServletContext().getRealPath(目录路径)，得到目录路径，然后创建新的文件File file = new File(目录路径) ，接着根据一样的文件名创建文件 File  NewFile = new File(file,一样的文件名)

3 上传的文件image,传输到这个新的文件 image.transferTo(NewFile)

```
    @RequestMapping("admin_category_update")
    public String update(HttpSession session, Category category, UploadimageFile uploadImageFile) throws IOException {
        categoryService.update(category);
        //判断上传文件是否为空
        MultipartFile image = uploadImageFile.getImage();
        if (null != image && !image.isEmpty()) {
            File imageFolder = new File(session.getServletContext().getRealPath("img/category"));
            File file = new File(imageFolder, category.getId() + ".jpg");
            image.transferTo(file);
            //下面的都是确保图片是jpg格式
            BufferedImage bufferedImage = ImageUtil.change2jpg(file);
            ImageIO.write(bufferedImage, "jpg", file);
        }
        return "redirect:/admin_category_list";
    }
```


CategoryServiceIMP：

```
 public void update(Category category) {
        categoryMapper.updateByPrimaryKey(category);
    }
```




















