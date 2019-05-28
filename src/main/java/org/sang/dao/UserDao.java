package org.sang.dao;

import org.apache.ibatis.annotations.Param;
import org.sang.entity.Message;
import org.sang.entity.User;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public interface UserDao {
    public User getUser(@Param("username") String username, @Param("password") String password);

    public List<String> getAllFans(@Param("username") String username);

    public void addUser(@Param("username") String username, @Param("password") String password);

    public boolean userExist(@Param(("username"))  String username);

    public void changeUserPhone(@Param("username") String username,@Param("phone") String phone);

    public void changeUserPersonal_tag(@Param("username") String username,@Param("personal_tag") String personal_tag);

    public void changeUserInstitute(@Param("username") String username,@Param("institute") String institute);

    public void changeUserReal_name(@Param("username") String username,@Param("real_name") String real_name);

    public void changeUserHead_protrait(@Param("username") String username,@Param("head_protrait") String head_protrait);


}
