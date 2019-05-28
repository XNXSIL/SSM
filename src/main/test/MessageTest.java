import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.sang.config.MyMVCConfig;
import org.sang.dao.MessageDao;
import org.sang.entity.Message;
import org.sang.service.MessageService;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

public class MessageTest {

    private MessageDao messageDao = null;
    private SqlSession sqlSession = null;

    @Before
    public void setup() throws IOException {

    }


    @Test
    public void MessageTest() throws IOException {
//        //序列化与反序列化测试
//        Message message = new Message();
//        message.setContent("大家好");
//        List<String> comments = new ArrayList<String>();
//        comments.add("说的真棒");
//        comments.add("嗯嗯");
//        List<String> picture = new ArrayList<String>();
//        picture.add("xnxsil.jpg");
//        picture.add("user.jpg");
////        message.setComments(comments);
//        message.setPictures(picture);
//        message.setDate("2018-12-20");
//        ObjectMapper mapper = new ObjectMapper();
//        String json = mapper.writeValueAsString(message);
//        System.out.println(json);
//        Message obj = mapper.readValue(json,Message.class);
//        System.out.println(obj);
//

    }

    @Test
    public void MessageDateBases(){
        List<Message> messages = messageDao.getRecentMessages(0);
    }
}
