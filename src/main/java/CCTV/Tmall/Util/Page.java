package CCTV.Tmall.Util;

public class Page {
    int start;/*开始位置*/
    int count;/*每页显示的数量*/
    int lastR; /*查询分页最后一页显示开始的编号*/
    int total;/*总共有多少条数据*/
    String param;/* 参数(这个属性在后续有用到，但是分类的分页查询里并没有用到，请忽略)*/

    private static final int defaultCount = 5;  //默认每页显示5条


    public Page() {
        count = defaultCount;
    }

    public Page(int start, int count) {
        this();
        this.start = start;
        this.count = count;
    }

    public boolean isHasPreviouse() {
        if (start == 0) {
            return false;
        }
        return true;
    }



    public boolean isHasNext() {
        //只有一页的情况，就没有 下一页了
        if (start == getLast() ) {
            return false;
        }
        return true;
    }

    public int getLast() {
        int last;
        // 假设总数是50，是能够被5整除的，那么最后一页的开始就是45
        if (0 == total % count) {
            last = total - count;
        }
        // 假设总数是51，不能够被5整除的，那么最后一页的开始就是50
        else {
            last = total - total % count;
        }
        last = last < 0 ? 0 : last;
        return last;
    }

    public void caculateLast(int total) {
        // 假设总数是50，是能够被5整除的，那么最后一页的开始就是45
        if (0 == total % count) {
            lastR = total - count;
        }
        // 假设总数是51，不能够被5整除的，那么最后一页的开始就是50
        else {
            lastR = total - total % count;
        }
    }


    public int getTotalPage() {
        int totalPage;
        // 假设总数是50，是能够被5整除的，那么就有10页
        if (0 == total % count) {
            totalPage = total / count;
        }
        // 假设总数是51，不能够被5整除的，那么就有11页
        else {
            totalPage = total / count + 1;
        }
        if (0 == totalPage) {
            totalPage = 1;
        }
        return totalPage;
    }

    public int getLastR() {
        return lastR;
    }

    public void setLastR(int lastR) {
        this.lastR = lastR;
    }

    public int getStart() {
        return start;
    }

    public void setStart(int start) {
        this.start = start;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public String getParam() {
        return param;
    }

    public void setParam(String param) {
        this.param = param;
    }

    public static int getDefaultCount() {
        return defaultCount;
    }


    @Override
    public String toString() {
        return "Page{" +
                "start=" + start +
                ", count=" + count +
                ", lastR=" + lastR +
                ", total=" + total +
                ", param='" + param + '\'' +
                ", getStart()=" + getStart()
                + ", getCount()=" + getCount() + ", isHasPreviouse()=" + isHasPreviouse() + ", isHasNext()="
                + isHasNext() + ", getTotalPage()=" + getTotalPage() + ", getLast()=" + getLast() + "]";
    }
}
