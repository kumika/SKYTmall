package CCTV.Tmall.Service;

import CCTV.Tmall.mapper.ReviewMapper;
import CCTV.Tmall.pojo.Review;
import CCTV.Tmall.pojo.ReviewExample;
import CCTV.Tmall.pojo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ReviewServiceIMP implements  ReviewService{

    @Autowired
    UserService userService;


    @Autowired
    ReviewMapper reviewMapper;

    @Override
    public int getCount(Integer pid) {

        return list(pid).size();
    }

    @Override
    public void add(Review review) {
        reviewMapper.insert(review);
    }

    @Override
    public List<Review> list(Integer pid) {
        ReviewExample reviewExample = new ReviewExample();
        reviewExample.createCriteria().andPidEqualTo(pid);
        reviewExample.setOrderByClause("id desc");

        List<Review> reviews = reviewMapper.selectByExample(reviewExample);

        setUser(reviews);

        return reviews;
    }

    public void setUser(List<Review> reviews) {
        for (Review review : reviews) {
            setUser(review);
        }
    }

    public void setUser(Review review) {
        int uid = review.getUid();
        User user = userService.get(uid);
        review.setUser(user);
    }


}
