package CCTV.Tmall.pojo;

import java.util.List;

public class Category {
    private Integer id;

    private String name;

    /*自己添加的*/
    private List<Product> productList;
/*
    productsByRow这个属性的类型是List<List<Product>> productsByRow。
     即一个分类又对应多个 List<Product>，提供这个属性，是为了在首页竖状导航的分类名称右边显示推荐产品列表。

     具体解释：一个分类会对应多行产品，而一行产品里又有多个产品记录。
     为了实现界面上的这个功能，为Category类设计了
     List<List<Product>> productsByRow
     这样一个集合属性*/
    private List<List<Product>> productsByRow;

    public List<Product> getProductList() {
        return productList;
    }

    public void setProductList(List<Product> productList) {
        this.productList = productList;
    }

    public List<List<Product>> getProductsByRow() {
        return productsByRow;
    }

    public void setProductsByRow(List<List<Product>> productsByRow) {
        this.productsByRow = productsByRow;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }
}