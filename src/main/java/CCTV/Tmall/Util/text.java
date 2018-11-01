package CCTV.Tmall.Util;

public class text {
    int start;
    int count;
    int total;

    public boolean isHasPrevious() {
        if (start == 0) {
            return false;
        }
        return true;
    }

    public boolean isHasNext() {
        if (start == getLast()) {
            return false;
        }
        return true;
    }

    private int getLast() {
        int last; //最后一页开始的编号
        if (0 == total % count) {
            last = total - count;
        }
        else {
            last = total - total % count;
        }
        last = last < 0 ? 0 : last;
        return last;
    }

    public int getTotalPage() {
        int totalPage;//总页数

        if (0 == total % count) {
            totalPage = total / count;
        }
        else {
            totalPage = total / count + 1;
        }
        if (0 == totalPage) {
            totalPage = 1;
        }
        return totalPage;
    }


}
