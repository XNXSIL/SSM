package org.sang.service;

import org.sang.dao.MessageDao;
import org.sang.entity.Comment;
import org.sang.entity.Message;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class MessageService {

    @Resource
    private MessageDao messageDao;

    public List<String> getAllPictures(int id){return messageDao.getAllPictures(id);}

    public List<Comment> getRecentComments(int id, int start){return messageDao.getRecentComments(id,start);}

    public List<Message> getRecentMessages(int start){return messageDao.getRecentMessages(start);}

    public List<Message> getMyMessages(String username){return messageDao.getMyMessages(username);}

    public List<Comment> subComment(String username,String content,String date,int id){messageDao.subComment(username,content,date,id);return messageDao.getRecentComments(id,0);}

    public void subStore(String username,int id){messageDao.subStore(username,id);}

    public void cancelStore(String username,int id){messageDao.cancelStore(username,id);}

    public void subGood(String username,int id){messageDao.subGood(username,id);}

    public void cancelGood(String username,int id){messageDao.cancelGood(username,id);}

    public boolean isStore(String username,int id){return messageDao.isStore(username,id);}

    public boolean isGood(String username,int id){return messageDao.isGood(username,id);}

    public void addPicture(String username,String filename,int id){messageDao.addPicture(username,filename,id);}

    public void addMessage(Message message){messageDao.addMessage(message);addMessageCount(message.getUsername());}

    public void addMessageCount(String username){messageDao.addMessageCount(username);}
}
