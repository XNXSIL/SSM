package org.sang.service;

import org.sang.dao.UserDao;
import org.sang.entity.User;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;


@Service
public class UserService {
    @Resource
    private UserDao userDao;

    public User login(String username, String password) {
        User user = userDao.getUser(username, password);
        return user;
    }

    public String errorCode(String password1,String password2){
        if(password1 == null)
            return "请输入密码";

        if(password2 == null)
            return "重复密码";

        if(password1.length() < 8 || password1.length() > 15)
            return "请输入8-15位长度密码";

        if(!password1.equals(password2))
            return "两次密码不同";

        return null;
    }
    public void register(String username,String password){
        userDao.addUser(username,password);
    }

    public boolean isExist(String username){return userDao.userExist(username);}

    public void changeUserPhone(String username,String phone){userDao.changeUserPhone(username,phone);}

    public void changeUserPersonal_tag(String username,String personal_tag){userDao.changeUserPersonal_tag(username,personal_tag);}

    public void changeUserInstitute(String username,String institute){userDao.changeUserInstitute(username,institute);}

    public void changeUserReal_name(String username,String real_name){userDao.changeUserReal_name(username,real_name);}

    public void changeUserHead_protrait(String username,String head_protrait){userDao.changeUserHead_protrait(username,head_protrait);}

    public List<String> getAllFans(String username){return userDao.getAllFans(username);}
}
