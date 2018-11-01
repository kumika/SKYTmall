package CCTV.Tmall.Service;

import CCTV.Tmall.pojo.Review;

import java.util.List;

public interface ReviewService {
    List<Review> list(Integer id);

    int getCount(Integer id);

    void add(Review review);
}
