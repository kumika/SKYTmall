package CCTV.Tmall.Service;

import CCTV.Tmall.mapper.UserMapper;
import CCTV.Tmall.pojo.User;
import CCTV.Tmall.pojo.UserExample;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    UserMapper userMapper;

    @Override
    public List<User> list() {
        UserExample userExample = new UserExample();
        userExample.setOrderByClause("id desc");

        return userMapper.selectByExample(userExample);
    }

    @Override
    public User get(int uid) {
        return userMapper.selectByPrimaryKey(uid);
    }

    @Override
    public boolean isExist(String name) {
        UserExample userExample = new UserExample();
        userExample.createCriteria().andNameEqualTo(name);

        List<User> result = userMapper.selectByExample(userExample);

        if (!result.isEmpty())
        return true;

        return false;
    }

    @Override
    public void add(User user) {
        userMapper.insert(user);
    }

    @Override
    public User get(String name, String password) {
        UserExample userExample = new UserExample();
        userExample.createCriteria()
                .andNameEqualTo(name)
                .andPasswordEqualTo(password);
        List<User> users = userMapper.selectByExample(userExample);

        if (users.isEmpty()) {
            return null;
        }
        return users.get(0);
    }

}
