package comparator;

import CCTV.Tmall.pojo.Product;

import java.util.Comparator;

/**
 * Comparator是个接口，可重写compare()及equals()这两个方法,用于比较功能；
 如果是null的话，就是使用元素的默认顺序，如a,b,c,d,e,f,g，就是a,b,c,d,e,f,g这样，当然数字也是这样的。

 * ProductPriceComparator 价格比较器
 把 价格低的放前面
 */
public class ProductPriceComparator implements Comparator<Product> {
    @Override
    public int compare(Product o1, Product o2) {
        /*(int) (o2.getPromotePrice() - o1.getPromotePrice());*/
        double result = o1.getPromotePrice() - o2.getPromotePrice();

        return (int) (result < 0 ? Math.floor(result) : Math.ceil(result));
    }
}
