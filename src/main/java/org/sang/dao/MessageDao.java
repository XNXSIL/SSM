package org.sang.dao;

import org.apache.ibatis.annotations.Param;
import org.sang.entity.Comment;
import org.sang.entity.Message;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface MessageDao {
    //从start选取10条动态，按照日期分
    public List<Message> getRecentMessages(@Param("start") int start);

    public List<Message> getMyMessages(@Param("username") String username);

    //获取某条动态的所有图片
    public List<String> getAllPictures(@Param("id") int id);
    //获取某条动态的前10条评论
    public List<Comment> getRecentComments(@Param("id") int id, @Param("start") int start);

    public void subComment(@Param("username") String username,@Param("content") String content,@Param("date") String date,@Param("id") int id);

    public void subStore(@Param("username") String username,@Param("id") int id);

    public void cancelStore(@Param("username") String username,@Param("id") int id);

    public void subGood(@Param("username") String username,@Param("id") int id);

    public void cancelGood(@Param("username") String username,@Param("id") int id);

    public boolean isStore(@Param("username") String username,@Param("id") int id);

    public boolean isGood(@Param("username") String username,@Param("id") int id);

    public void addPicture(@Param("username") String username,@Param("filename") String filename,@Param("id") int id);

    public void addMessage(@Param("message") Message message);

    public void addMessageCount(@Param("username") String username);


}
