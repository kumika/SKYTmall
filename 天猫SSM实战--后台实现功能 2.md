#天猫SSM实战--后台实现功能 2


# 1 显示分类图片


JSP：

```
  <td><img height="40px" src="img/category/${category.id}.jpg"/></td>
```


# 2 属性管理


## 1 显示属性

在分类的listCategory.JSP：

```
<td><a href="admin_property_list?cid=${category.id}"><span class="glyphicon glyphicon-th-list"></span></a> </td>
```


PropertyController:

```
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
```


PropertyServiceIMP:

```
    public List<Property> list(int cid) {
        PropertyExample propertyExample = new PropertyExample();
        propertyExample.createCriteria().andCidEqualTo(cid);
        propertyExample.setOrderByClause("id desc");
        return propertyMapper.selectByExample(propertyExample);
    }
```



##  2 增加属性

在listProperty.JSP：
注意：
```
 <input type="hidden" name="cid" value="${category.id}">
```
在增加属性的同时把Cid这个外键添加到属性对象中，让属性与当前分类产生关联
```
<form method="post" id="addForm" action="admin_property_add" enctype="multipart/form-data">
                <table class="addTable">
                    <tr>
                        <td>属性名称</td>
                        <td><input  id="name" name="name" type="text" class="form-control"></td>
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


PropertyController:

```
 @RequestMapping("admin_property_add")
    public String add(Property property) {
        propertyService.add(property);
        return "redirect:admin_property_list?cid=" + property.getCid();
    }
```

PropertyServiceIMP:

```
  public void add(Property property) {
        propertyMapper.insert(property);
    }
```



## 3 修改属性名称

修改是需要2部分组成，第1 拿到修改对象，第2 更新对象


### 3.1 得到更新的对象
JSP ：
```
<td><a href="admin_property_edit?id=${propertyList.id}"><span class="glyphicon glyphicon-edit"></span></a> </td>
```

PropertyController:

```
    @RequestMapping("admin_property_edit")
    public String edit(int id, Model model) {
        Property property = propertyService.get(id);
        Category category = categoryService.get(property.getCid());
        property.setCategory(category);

        model.addAttribute("property", property);
        return "admin/editProperty";
    }
```

PropertyServiceIMP:

```
   @Override
    public Property get(int id) {
        return propertyMapper.selectByPrimaryKey(id);
    }
```


### 3.2 更新部分

JSP：

关键点：
    将当前属性与外键Cid和 当前分类联系在一起
```
<input  type="hidden" name="id" value="${property.id}">
                            <input  type="hidden" name="cid" value="${property.category.id}">
```

完整的表单：

```
<form method="post" id="editForm" action="admin_property_update" enctype="multipart/form-data">
                <table class="editTable">
                    <tr>
                        <td>属性名称</td>
                        <td><input  id="name" name="name" value="${property.name}" type="text" class="form-control"></td>
                    </tr>

                    <tr class="submitTR">
                        <td colspan="2" align="center">
                            <input  type="hidden" name="id" value="${property.id}">
                            <input  type="hidden" name="cid" value="${property.category.id}">
                            <button type="submit" class="btn btn-success">提 交</button>
                        </td>
                    </tr>
                </table>
            </form>
```


PropertyController：

```
@RequestMapping("admin_property_update")
    public String update(Property property) {
        propertyService.update(property);
        return "redirect:admin_property_list?cid=" + property.getCid();
    }
```

PropertyServiceIMP:

```
    public void update(Property property) {
        propertyMapper.updateByPrimaryKeySelective(property);
    }
```


