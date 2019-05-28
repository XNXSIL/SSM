package org.sang.controller;


import org.sang.entity.Comment;
import org.sang.entity.Message;
import org.sang.entity.User;
import org.sang.service.MessageService;
import org.sang.util.GoodUnit;
import org.sang.util.StoreUnit;
import org.sang.util.TransmissionUnit;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;


@Controller
public class MessageController {
    @Resource
    private MessageService messageService;

    @RequestMapping(value = "/getRecentMessage",method = RequestMethod.POST)
    @ResponseBody
    public List<Message> getRecentMessage(){
        List<Message> messages = messageService.getRecentMessages(0);
        return messages;
    }

    @RequestMapping(value = "/subcomment",method = RequestMethod.POST)
    @ResponseBody
    public List<Comment> subcomment(@RequestBody TransmissionUnit transmissionUnit,
                                    HttpServletRequest request){
        User user = (User)request.getSession().getAttribute("user");
        if(user != null && user.getUsername().equals(transmissionUnit.getUsername())){
            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm");
            String date = format.format(new Date());
            return messageService.subComment(transmissionUnit.getUsername(),transmissionUnit.getContent(),date,transmissionUnit.getId());
        }
        return null;
    }

    @RequestMapping(value = "/substore",method = RequestMethod.POST)
    @ResponseBody
    public String store(@RequestBody StoreUnit storeUnit,
                        HttpServletRequest request){
        User user = (User)request.getSession().getAttribute("user");
        if(user != null && user.getUsername().equals(storeUnit.getUsername())){
            messageService.subStore(storeUnit.getUsername(),storeUnit.getId());
            return "success";
        }
        return "error";
    }

    @RequestMapping(value = "/cancelstore",method = RequestMethod.POST)
    @ResponseBody
    public String cancelstore(@RequestBody StoreUnit storeUnit,
                        HttpServletRequest request){
        User user = (User)request.getSession().getAttribute("user");
        System.out.println(storeUnit.getUsername());
        System.out.println(storeUnit.getId());
        if(user != null && user.getUsername().equals(storeUnit.getUsername())){
            messageService.cancelStore(storeUnit.getUsername(),storeUnit.getId());
            return "success";
        }
        return "error";
    }

    @RequestMapping(value = "/subgood",method = RequestMethod.POST)
    @ResponseBody
    public String good(@RequestBody GoodUnit goodUnit,
                        HttpServletRequest request){
        User user = (User)request.getSession().getAttribute("user");
        if(user != null && user.getUsername().equals(goodUnit.getUsername())){
            messageService.subGood(goodUnit.getUsername(),goodUnit.getId());
            return "success";
        }
        return "error";
    }

    @RequestMapping(value = "/cancelgood",method = RequestMethod.POST)
    @ResponseBody
    public String cancelgood(@RequestBody GoodUnit goodUnit,
                              HttpServletRequest request){
        User user = (User)request.getSession().getAttribute("user");
        System.out.println(goodUnit.getUsername());
        System.out.println(goodUnit.getId());
        if(user != null && user.getUsername().equals(goodUnit.getUsername())){
            messageService.cancelGood(goodUnit.getUsername(),goodUnit.getId());
            return "success";
        }
        return "error";
    }

    @RequestMapping(value = "/getsource/{id:[a-zA-Z0-9\\.\\-\\_]+}")
    public void getsource(@PathVariable(value = "id") String id,
                           HttpServletRequest request, HttpServletResponse response){
        String filepath = request.getSession().getServletContext().getRealPath("/")
                + "WEB-INF\\source\\user_picture\\" + id;
        System.out.println(filepath);
        File file = new File(filepath);
        if(file.exists() && file.canRead()){
            try(FileInputStream inputStream = new FileInputStream(file)){
                byte[] data = new byte[(int)file.length()];
                int length = inputStream.read(data);
                response.setContentType("image/*,");
                try(OutputStream stream = response.getOutputStream()){
                    stream.write(data);
                    stream.flush();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    @RequestMapping(value = "/isstore/{index}",method = RequestMethod.POST)
    @ResponseBody
    public String isstore(@PathVariable("index") int index,
                          HttpServletRequest request){
        User user = (User) request.getSession().getAttribute("user");
        if(user != null){
            if(messageService.isStore(user.getUsername(),index))
                return "success";
            else
                return "error";
        }
        return "error";
    }
    @RequestMapping(value = "/isgood/{index}",method = RequestMethod.POST)
    @ResponseBody
    public String isgood(@PathVariable("index") int index,
                          HttpServletRequest request){
        User user = (User) request.getSession().getAttribute("user");
        if(user != null){
            if(messageService.isGood(user.getUsername(),index))
                return "success";
            else
                return "error";
        }
        return "error";
    }

    @RequestMapping(value = "/subcontent",method = RequestMethod.POST)
    public String uploadhead(HttpServletRequest request,
                             @RequestParam("picture") MultipartFile[] picture,
                             @RequestParam("content") String content){

        User user = (User)request.getSession().getAttribute("user");
        if(user == null)
            return "admin/login";

        if(user != null && user.getUsername() != null){
            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm");
            String date = format.format(new Date());
            Message message = new Message();
            message.setContent(content);
            message.setDate(date);
            message.setUsername(user.getUsername());
            messageService.addMessage(message);
            user.setMessages_num(user.getMessages_num()+1);
            for(int i=0; i<picture.length && picture[i] != null; i++){
                String name = picture[i].getOriginalFilename();
                if(name == null || name.equals(""))
                    continue;
                String path = request.getSession().getServletContext().getRealPath("/")
                        + "WEB-INF\\source\\user_picture\\";
                String filename = path + name;
                File file = new File(filename);
                try{
                    picture[i].transferTo(file);
                    messageService.addPicture(message.getUsername(),name,message.getId());
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
        return "views/home";
    }

    @RequestMapping(value = "/getMyMessage",method = RequestMethod.POST)
    @ResponseBody
    public List<Message> getMyMessage(HttpServletRequest request){
        User user = (User)request.getSession().getAttribute("user");
        List<Message> messages = messageService.getMyMessages(user.getUsername());
        return messages;
    }
}
