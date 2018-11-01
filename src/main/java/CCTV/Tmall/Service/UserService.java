package CCTV.Tmall.Service;

import CCTV.Tmall.pojo.User;

import java.util.List;

public interface UserService {

    List<User> list();

    User get(int uid);

    boolean isExist(String name);

    void add(User user);

    User get(String name, String password);
}
