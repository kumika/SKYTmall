package comparator;

import CCTV.Tmall.pojo.Product;

import java.util.Comparator;

/**
 * Comparator是个接口，可重写compare()及equals()这两个方法,用于比较功能；
 如果是null的话，就是使用元素的默认顺序，如a,b,c,d,e,f,g，就是a,b,c,d,e,f,g这样，当然数字也是这样的。

 * ProductAllComparator 综合比较器
 把 销量x评价 高的放前面
 */
public class ProductAllComparator implements Comparator<Product> {
    @Override
    public int compare(Product o1, Product o2) {
        return o2.getReviewCount() * o2.getSaleCount() - o1.getReviewCount() * o1.getSaleCount();
    }
}
