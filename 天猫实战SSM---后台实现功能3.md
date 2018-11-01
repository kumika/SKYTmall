#天猫实战SSM---后台实现功能3

#1 产品管理

首先明白产品表与表之间的外键关连，才更好理解数据之间传输的关系
![表与表之间外键的联系.jpg](https://i.loli.net/2018/09/27/5bac58ba84f7e.jpg)


## 3.1 增加产品

这里的增加产品只是增加产品的基本信息，比如产品名称，小标题，价格，优惠价格·····

JSP：

注意： 这个cid是增加产品product的外键，关联分类的，**关键**

    <input type="hidden" name="cid" value="${category.id}">

表单代码：

```
<form method="post" id="addForm" action="admin_product_add" enctype="multipart/form-data">
                <table class="addTable">
                    <tr>
                        <td>产品名称</td>
                        <td><input  id="name" name="name" type="text" class="form-control"></td>
                    </tr>
                    <tr>
                        <td>产品小标题</td>
                        <td><input  id="subTitle" name="subTitle" type="text" class="form-control"></td>
                    </tr>
                    <tr>
                        <td>原价格</td>
                        <td><input  id="originalPrice" name="originalPrice" value="99.98" type="text" class="form-control"></td>
                    </tr>
                    <tr>
                        <td>优惠价格</td>
                        <td><input  id="promotePrice" name="promotePrice" value="19.98" type="text" class="form-control"></td>
                    </tr>
                    <tr>
                        <td>库存</td>
                        <td><input  id="stock" name="stock" value="199" type="text" class="form-control"></td>
                    </tr>
                    <tr class="submitTR">
                        <td colspan="2" align="center">
                            <input type="hidden" name="cid" value="${category.id}">
                            <button type="submit" class="btn btn-success">提 交</button>
                        </td>
                    </tr>
                </table>
            </form>
```

ProductController:

```
    @RequestMapping("admin_product_add")
    public String add(Product product) {
        product.setCreateDate(new Date());

        productService.add(product);
        return "redirect:admin_product_list?cid=" + product.getCid();
    }
```

ProductServiceIMP:

```
    @Override
    public void add(Product product) {
        productMapper.insert(product);
    }
```

## 3.2 展示产品和产品图片管理

### 3.2.1 展示产品
效果是： 从展示分类页面上点击产品管理，进入展示产品页面
![QQ截图20180927122323.jpg](https://i.loli.net/2018/09/27/5bac5b515e091.jpg)

产品图片和产品属性信息是分开存储的，而且此时产品还没有图片属性，所以我们自己增加图片属性和分类属性。
在查询的时候也要注意查询完成后产品是没有图片内容和分类内容的，它们的值都是Null。
产品类上增加图片属性，分类属性。
```
    private ProductImage firstProductImage;

    private List<ProductImage> productSingleImages;

    private List<ProductImage> productDetailImages;

    private Category category;
    //setter和getter就不写了
```

#### 3.2.1.1产品图片类

```
public class ProductImage {
    private Integer id;

    private Integer pid;

    private String type;
    
    //setter 和 getter
}
```
#### 3.2.1.2 查询产品

在ListCategory.jsp上：
```
<td><a href="admin_product_list?cid=${category.id}"><span class="glyphicon glyphicon-shopping-cart"></span></a> </td>
```

ProductController:


```
    @RequestMapping("admin_product_list")
    public String list(int cid, Model model, Page page) {
        Category category = categoryService.get(cid);

        PageHelper.offsetPage(page.getStart(), page.getCount());
        List<Product> productList = productService.list(cid);

        int total = (int) new PageInfo().getTotal();

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
```

ProductServiceIMP：

在业务层完成图片和产品的合并。
就是**完成产品的图片属性赋值，分类属性赋值。**
产品与分类的关联是外键cid，----》意思是知道产品的cid，就依据id查询知道category的id，从而得到category

    产品与产品图片的关联是外键Pid，----》意思是知道产品图片的pid，就依据id查询知道产品的id,从而得到产品图片
  
    反过来也是可以的，知道分类的id ，可以依据cid查询得到产品，
    知道产品的id ，可以依据pid查询得到产品图片。



```
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
 
     //根据产品的id ,图片的类型进行查询返回图片，然后产品setImage
    @Override
    public void setFirstProductImage(Product product) {
        List<ProductImage> productImageList = productImageService.list(product.getId(), ProductImageService.type_single);
        if (!productImageList.isEmpty()) {
            ProductImage productImage = productImageList.get(0);
            product.setFirstProductImage(productImage);
        }
    }


    public void setFirstProductImage(List<Product> productlist) {
        for (Product pro : productlist) {
            setFirstProductImage(pro);
        }
    }
    
```


**下面说明产品图片业务和分类业务：**

产品图片思路：
在给产品图片赋值，是需要**产品业务层**使用
查询单一图片方法`setFirstProductImage(product)`，或者列表查询图片方法`setFirstProductImage(List<Product> productlist)`。

然后方法体里使用**产品图片业务层**`ProductImageService`查询方法`list(产品id,图片类型)`。同时，图片是存在2种类型的，单一，中等大小类型。

查询方法得到图片列表，最后拿第一个元素赋值给产品。

========================================================

####在产品图片业务层创建ProductImageServiceIMP：
---------------------------------

注意： 查询的是pid，type这两个参数

    andPidEqualTo(pid).andTypeEqualTo(type);

查询
```
    @Override
    public List<ProductImage> list(int pid, String type) {
        ProductImageExample productImageExample = new ProductImageExample();
        productImageExample.createCriteria()
                .andPidEqualTo(pid)
                .andTypeEqualTo(type);
        productImageExample.setOrderByClause("id desc");

        return productImageMapper.selectByExample(productImageExample);
    }
```


**疑问： 为什么返回的图片是列表呢？业务层上需要拿图片列表对象的第一个元素？**


####赋值分类属性也是一样：
-----------
产品分类思路：
在产品业务层创建SetCategory（product）方法；

然后方法体里使用分类的业务层查询方法得到分类，

最后赋值给产品

单个分类赋值
```
    public void setCategory(Product product) {
        int cid = product.getCid();
        Category category = categoryService.get(cid);
        product.setCategory(category);
    } 
```
批量分类赋值（在单个基础上，增加for循环）
```
    public void setCategory(List<Product> productList) {
        for (Product pro : productList) {
            setCategory(pro);
        }
    }
```


拿个图显示下关系
![2.jpg](https://i.loli.net/2018/09/27/5bacd37caa470.jpg)


### 3.2.2 产品图片修改（增加）

图片增加和修改完成效果都是一样的。都是新建文件然后覆盖。

jsp:
注意---外键和图片类型都是隐藏的
```
 <input type="hidden" name="type" value="type_single" />
 <input type="hidden" name="pid" value="${product.id}" />
```
表单代码：
```
 <form method="post" class="addFormSingle" action="admin_productImage_add"
                                  enctype="multipart/form-data">
                                <table class="addTable">
                                    <tr>
                                        <td>请选择本地图片 尺寸400X400 为佳</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <input id="filepathSingle" type="file" name="image" />
                                        </td>
                                    </tr>
                                    <tr class="submitTR">
                                        <td align="center">
                                            <input type="hidden" name="type" value="type_single" />
                                            <input type="hidden" name="pid" value="${product.id}" />
                                            <button type="submit" class="btn btn-success">提 交</button>
                                        </td>
                                    </tr>
                                </table>
                            </form>
```


**ProductImageController：**
增加图片，因为有2种图片类型，所以在前面增加图片的代码上增加判断语句。

整体思路还是不变的：2次保存，一次是保存图片pojo类，一次是保存图片文件。
3个参数： pojo类：ProductImage, HttpSession session , uploadFile

1 根据自己想要的目录路径，根据图片id，新建空文件ImageFile，（图片id是作为文件名的）


2 根据上传的图片的类型属性进行判断，**可以分出不同类型，然后根据不同的类型创建目录路径，保证自己的每一条目录路径保存的都是相同类型图片**
EG：
```
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
```

3 上传图片文件uploadfile传输到ImageFile，完成，此时ImageFile是图片文件了。

 
4 上传图片类型作为判断条件，进入判断体内，
关键点：创建文件

    File XXXfile = new File（XXX目录路径，图片编号）

XXXFile此时是空文件，然后借助别的工具类把ImageFile和XXXFile作为参数放进某个方法里，就可以得到不同大小的图片了。


```
 if (ProductImageService.type_single.equals(productImage.getType())) {
        File file_small = new File(imageFolder_small, fileName);
        File file_middle = new File(imageFolder_middle, fileName);
        ImageUtil.resizeImage(newFile, 56, 56, file_small);
        ImageUtil.resizeImage(newFile, 217, 190, file_middle);
}
```

完整代码：

```
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
```

ProductImageServiceIMP:
```
    @Override
    public void add(ProductImage productImage) {
        productImageMapper.insert(productImage);
    }
```


### 3.2.3 产品图片删除

删除的思路也是和修改增加一样的，都是创建新文件，然后覆盖。

1 根据方法的参数查询得到图片文件，然后得到图片id 

2 根据图片文件属性判断是什么类型的，然后根据目录和图片id进行创建新文件（图片id是作为文件名的），用空文件覆盖旧文件完成删除数据作用。（一般用图片id作为文件名，这样创建文件同时也是覆盖）

3 对新建的空文件进行删除。

JSP：
```
<td><a href="admin_product_delete?id=${productList.id}" deleteLink="true"><span class="glyphicon glyphicon-trash"></span></a> </td>
```

ProductImageController：
```
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
```


ProductServiceIMP:
```
    @Override
    public ProductImage get(int id) {
        return productImageMapper.selectByPrimaryKey(id);
    }
    
    @Override
    public void delete(int id) {
        productImageMapper.deleteByPrimaryKey(id);
    }
```


## 3.3 产品属性修改


### 3.3.1 产品属性值的增加

产品属性值： 就是产品属性信息，随便修改的
![产品属性值.jpg](https://i.loli.net/2018/09/28/5badaa71a94c5.jpg)

这里需要跳转的过程比较多，因为产品属性值有2个外键。
根据外键来进行业务的来往 ，没有外键关联是无法进行数据相互查询传递的。

关键点在于：
**规则是===》分类管理产品属性**
产品属性值的2个外键， 在初始化的时候，外键是没有值的，需要赋值
而且产品属性值是作为产品的公共类处理的

**思路：**
 1 修改产品属性值需要确认这个值是否关联了**产品和属性，2个类**。此外，第一次点击编辑是没有产品属性值的，**因为此时属性值还没有和2个类进行关联**，所以需要初始化。
 2 需要将产品属性，产品2个类与产品属性值关联在一起，这个关联关键点在于外键。在初始化方法中**，查询得到产品，又根据产品的分类，查询得到同一个分类下的所有产品属性**，（规则是===》分类管理产品属性）
 这样2个类都得到了，然后产品属性值进行与2个外键关联与设置setter
 
3 产品属性值增加到数据库，完成增加OR修改。

4  完成属性值与属性关联后，根据外键，查询得到产品属性对象，然后属性值进行设置产品属性

**外键关联：**

![表与表之间外键的联系.jpg](https://i.loli.net/2018/09/27/5bac58ba84f7e.jpg)

**业务层上方法的调用与外键的关系：**

![业务层与外键的关联.jpg](https://i.loli.net/2018/09/28/5bada340af17a.jpg)

产品属性值是产品基本信息的拓展，可以修改，但是不能删除，为什么？ 
技术上可以用级联实现删除功能，但是怕错误操作，就没有实现。


通过产品管理界面的设置属性，跳到编辑页面
JSP：
```
<td><a href="admin_propertyValue_edit?pid=${productList.id}"><span class="glyphicon glyphicon-list"></span></a> </td>
```

PropertyValueController：
调用PropertyValueController的edit方法：
     1. 根据pid获取product对象，因为面包屑导航里需要显示产品的名称和分类的连接。
     2. 初始化属性值： propertyValueService.init(p)。 因为在第一次访问的时候，这些属性值是不存在的，需要进行初始化。
     3. 根据产品，获取其对应的属性值集合。
     4. 服务端跳转到editPropertyValue.jsp 上
     5. 在editPropertyValue.jsp上，用c:forEach遍历出这些属性值
```
    @RequestMapping("admin_propertyValue_edit")
    public String edit(Model model, int pid) {
        Product product = productService.get(pid);

        /*增加产品属性值*/
        propertyValueService.init(product);
        List<PropertyValue> propertyValues = propertyValueService.list(product.getId());

        model.addAttribute("product", product);
        model.addAttribute("propertyValues", propertyValues);
        return "admin/editPropertyValues";
    }
```


productServiceIMP:
```
    @Override
    public Product get(int id) {
        Product product = productMapper.selectByPrimaryKey(id);
        setCategory(product);
        setFirstProductImage(product);
        return product;
    }
```

**ProertyValueServiceIMP:**
3 init方法
         3.1 这个方法的作用是初始化PropertyValue。 为什么要初始化呢？
     因为对于PropertyValue的管理，没有增加，只有修改。 所以需要通过初始化来进行自动地增加，以便于后面的修改。
         3.2 首先根据产品获取分类，然后获取这个分类下的所有属性集合
         3.3 然后用属性和id产品id去查询，看看这个属性和这个产品，是否已经存在属性值了。
         3.4 如果不存在，那么就创建一个属性值，并设置其属性和产品，接着插入到数据库中。
         这样就完成了属性值的初始化。
```
    @Override
    public void init(Product product) {
        //首先根据产品获取分类，然后获取这个分类下的所有属性集合
        List<Property> properties = propertyService.list(product.getCid());
        for (Property property : properties) {
        //然后用属性和id产品id去查询，看看这个属性和这个产品，是否已经存在属性值了。
            PropertyValue propertyValue = get(property.getId(), product.getId());
            //如果不存在，那么就创建一个属性值，并设置其属性和产品，接着插入到数据库中。
            //这样就完成了属性值的初始化。
            if (null == propertyValue) {
                propertyValue = new PropertyValue();
                propertyValue.setPid(product.getId());
                propertyValue.setPtid(property.getId());
                propertyValueMapper.insert(propertyValue);
            }
        }
    }
    
    //根据属性id和产品id获取PropertyValue对象
    @Override
    public PropertyValue get(int ptid, int pid) {
        PropertyValueExample propertyValueExample = new PropertyValueExample();
        propertyValueExample.createCriteria()
                .andPtidEqualTo(ptid)
                .andPidEqualTo(pid);

        List<PropertyValue> propertyValues = propertyValueMapper.selectByExample(propertyValueExample);
        if (propertyValues.isEmpty()) {
            return null;
        }
        return propertyValues.get(0);
    }
```

propertyServiceIMP:
```
    public List<Property> list(int cid) {
        PropertyExample propertyExample = new PropertyExample();
        propertyExample.createCriteria().andCidEqualTo(cid);
        propertyExample.setOrderByClause("id desc");
        return propertyMapper.selectByExample(propertyExample);
    }
```



### 3.3.2 产品属性值的更新
思路：
修改功能采用的是使用post方式提交ajax的异步调用方式

     1. 监听输入框上的keyup事件
     2. 获取输入框里的值
     3. 获取输入框上的自定义属性pvid，这就是当前PropertyValue对应的id
     4. 把边框的颜色修改为黄色，表示正在修改的意思
     5. 借助JQuery的ajax函数 $.post，把id和值，提交到admin_propertyValue_update
     6. admin_propertyValue_update导致PropertyValueController的update方法被调用
     6.1 参数 PropertyValue 获取浏览器Ajax方式提交的参数
     6.2 通过 propertyValueService.update(propertyValue) 更新到数据库
     6.3 结合方法update上的注解@ResponseBody和return "success" 就会向浏览器返回字符串 "success"
     6.4 propertyValueService调用的是propertValueMapper.updateByPrimaryKeySelective(pv); 这个方法只会更新propertyValue存在的字段，而参数PropertyValue只有id和value有值，所以即便这个PropertyValue对象没有pid和ptid值，修改的时候也不会影响该PropertyValue的pid和ptid。
     7 浏览器判断如果返回值是"success",那么就把边框设置为绿色，表示修改成功，否则设置为红色，表示修改失败

在editPropertyValueJsp:
script:异步调用
```
<script>
    /*对分类名称做了为空判断，当为空的时候，不能提交*/
    $(function () {
        $("input.pvValue").keyup(function(){
            var value = $(this).val();
            var page = "admin_propertyValue_update";
            var pvid = $(this).attr("pvid");
            var parentSpan = $(this).parent("span");
            parentSpan.css("border","1px solid yellow");
            $.post(
                page,
                {"value":value,"id":pvid},
                function(result){
                    if("success"==result)
                        parentSpan.css("border","1px solid green");
                    else
                        parentSpan.css("border","1px solid red");
                }
            );
        });
    });
</script>
```

PropertyValueController:
```
    @RequestMapping("admin_propertyValue_update")
    @ResponseBody
    public String update(PropertyValue propertyValue) {
        propertyValueService.update(propertyValue);
        return "success";
    }
```

PropertyValueServiceIMP：
```
@Override
    public void update(PropertyValue propertyValue) {
        propertyValueMapper.updateByPrimaryKeySelective(propertyValue);
    }
```


## 3.4 产品信息修改

记住 修改是一定要拿修改对象的啊

产品信息修改，这里只是对产品的名称，小标题，价格···进行更新

###获得修改对象：
-------

在listProductjsp：

```
<td><a href="admin_product_edit?id=${productList.id}"><span class="glyphicon glyphicon-list"></span></a> </td>
```

ProductController:
```
    @RequestMapping("admin_product_edit")
    public String edit(int id, Model model) {
        Product product = productService.get(id);

        Category category = categoryService.get(product.getCid());
        product.setCategory(category);

        model.addAttribute("product", product);
        return "admin/editProduct";
    }
```

###正式更新对象
------
editProductjsp:
记得隐藏产品Id 和外键cid

    <input  type="hidden" name="id" value="${product.id}">
<input  type="hidden" name="cid" value="${product.category.id}">


表单代码
```
 <form method="post" id="editForm" action="admin_product_update" enctype="multipart/form-data">
                <table class="editTable">
                    <tr>
                        <td>产品名称</td>
                        <td><input  id="name" name="name" value="${product.name}" type="text" class="form-control"></td>
                    </tr>
                    <tr>
                        <td>产品小标题</td>
                        <td><input  id="subTitle" name="subTitle" value="${product.subTitle}" type="text" class="form-control"></td>
                    </tr>
                    <tr>
                        <td>原价格</td>
                        <td><input  id="originalPrice" name="originalPrice" value="${product.originalPrice}" type="text" class="form-control"></td>
                    </tr>
                    <tr>
                        <td>优惠价格</td>
                        <td><input  id="promotePrice" name="promotePrice" value="${product.promotePrice}" type="text" class="form-control"></td>
                    </tr>
                    <tr>
                        <td>库存</td>
                        <td><input  id="stock" name="stock" value="${product.stock}" type="text" class="form-control"></td>
                    </tr>
                    <tr class="submitTR">
                        <td colspan="2" align="center">
                            <input  type="hidden" name="id" value="${product.id}">
                            <input  type="hidden" name="cid" value="${product.category.id}">
                            <button type="submit" class="btn btn-success">提 交</button>
                        </td>
                    </tr>
                </table>
            </form>
```

ProductController:

```
    @RequestMapping("admin_product_update")
    public String update(Product product) {
        productService.update(product);
        return "redirect:/admin_product_list?cid=" + product.getCid();
    }
```

ProductServiceIMP:

```
@Override
    public void update(Product product) {
        productMapper.updateByPrimaryKeySelective(product);
    }
```

## 3.5 产品删除

是要将 产品图片删除完，才可以删除产品，没有实现级联删除嘛，有外键是不能删除的。


在listProduct.jsp:

```
<td><a href="admin_product_delete?id=${productList.id}" deleteLink="true"><span class="glyphicon glyphicon-trash"></span></a> </td>
```

ProductController:

```
    @RequestMapping("admin_product_delete")
    public String delete(int id) {
        Product product = productService.get(id);

        productService.delete(id);
        return "redirect:/admin_product_list?cid=" + product.getCid();
    }
```
ProductServiceIMP:

```
    @Override
    public void delete(int id) {
        productMapper.deleteByPrimaryKey(id);
    }
```









