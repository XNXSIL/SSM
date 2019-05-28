package org.sang.controller;


import org.sang.entity.User;
import org.sang.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;


import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.net.URLDecoder;

@Controller

public class UserController {
    @Resource
    private UserService userService;

    @RequestMapping(value = {"/home","/"})
    public String welcome(){
        return "views/home";

    }

    @RequestMapping(value = "/login")
    public String login(HttpServletRequest request) {
        request.getSession().removeAttribute("error");
        return "admin/login";
    }

    @RequestMapping(value = "/dologin", method = RequestMethod.POST)
    public String doLogin(@RequestParam("username") String username, @RequestParam("password") String password,
                          HttpServletRequest request, Model model) {
        User user = userService.login(username,password);
        if (user != null) {
            request.getSession().setAttribute("user",user);
            model.addAttribute("user",user);
            return "redirect: /home";
        } else {
            model.addAttribute("error","用户名或密码错误");
            return "admin/login";
        }
    }

    @RequestMapping(value = "/register")
    public String register(HttpServletRequest request){
        request.getSession().removeAttribute("error");
        return "admin/register";
    }

    @RequestMapping(value = "/doregister",method = RequestMethod.POST)
    public String doregister(@RequestParam("username") String username,
                           @RequestParam("password1") String password1,
                           @RequestParam("password2") String password2,
                           @RequestParam(value = "remember",required = false) String remember,
                           HttpServletRequest request,HttpServletResponse response){
        String errorcode =  userService.errorCode(password1,password2);
        if(errorcode != null){
            request.getSession().setAttribute("error",errorcode);
            return "admin/register";
        }else{
            boolean exist = userService.isExist(username);
            if(exist){
                request.getSession().setAttribute("error","用户名已存在");
                return "admin/register";
            }else{
                request.getSession().removeAttribute("error");
                userService.register(username,password1);
                System.out.println(remember);
                if("true".equals(remember)){
                    Cookie cookie = new Cookie("user",username);
                    cookie.setMaxAge(60*60*24);
                    response.addCookie(cookie);
                }
                return "admin/login";
            }

        }

    }

    @RequestMapping(value = {"/getpicture/","/getpicture/{id:[\\u4e00-\\u9fa5_a-zA-Z0-9\\.\\-\\_]+}"})
    public void getpicture(@PathVariable(value = "id",required = false) String id,
                           HttpServletRequest request, HttpServletResponse response){
        if(id == null || "".equals(id))
            id = "user.jpg";
        id = URLDecoder.decode(id);
        String filepath = request.getSession().getServletContext().getRealPath("/")
                + "WEB-INF\\source\\head_portrait\\" + id;
        System.out.println(filepath);
        File file = new File(filepath);

        if(!file.exists() || !file.canRead()){
            System.out.println("file no found");
            filepath = request.getSession().getServletContext().getRealPath("/")
                    + "WEB-INF\\source\\head_portrait\\user.jpg";
            file = new File(filepath);
        }
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
    @RequestMapping(value = {"/profile/","/profile/{id}"})
    public String profile(@PathVariable(value = "id",required = false) String id,
                        HttpServletRequest request){
        User user = (User)request.getSession().getAttribute("user");
        if(user != null){
            String username = user.getUsername();
            if(username.equals(id)){
                return "admin/profile";
            }
        }
        return "admin/login";

    }
    @RequestMapping(value = {"/index/","/index/{id}"})
    public String index(@PathVariable(value = "id",required = false) String id,
                        HttpServletRequest request){
        User user = (User)request.getSession().getAttribute("user");
        if(user != null && user.getUsername().equals(id)){
            return "admin/index";
        }else{
            return "admin/login";
        }
    }

    @RequestMapping(value = "/help")
    public String help(){
        return "admin/help";
    }

    @RequestMapping(value = "/logout")
    public String logout(HttpServletRequest request){
        request.getSession().removeAttribute("user");
        request.getSession().removeAttribute("username");
        return "admin/login";
    }

    @RequestMapping(value = "/changeUserPhone",method = RequestMethod.POST)
    public String changeUserPhone(HttpServletRequest request){
        User user = (User)request.getSession().getAttribute("user");
        String username = user.getUsername();
        if(user == null)
            return "/login";
        String phone = request.getParameter("phone");
        userService.changeUserPhone(username,phone);
        user.setPhone(phone);
        request.getSession().setAttribute("user",user);
        return "admin/index";
    }

    @RequestMapping(value = "/changeUserPersonal_tag",method = RequestMethod.POST)
    public String changeUserPersonal_tag(HttpServletRequest request){
        User user = (User)request.getSession().getAttribute("user");
        String username = user.getUsername();
        String personal_tag = request.getParameter("personal_tag");
        if(user == null)
            return "/login";
        userService.changeUserPersonal_tag(username,personal_tag);
        user.setPersonal_tag(personal_tag);
        request.getSession().setAttribute("user",user);
        return "admin/index";
    }

    @RequestMapping(value = "/changeUserInstitute",method = RequestMethod.POST)
    public String changeUserInstitute(HttpServletRequest request){
        User user = (User)request.getSession().getAttribute("user");
        String username = user.getUsername();
        String institute = request.getParameter("institute");
        if(user == null)
            return "/login";
        userService.changeUserInstitute(username,institute);
        user.setInstitute(institute);
        request.getSession().setAttribute("user",user);
        return "admin/index";
    }

    @RequestMapping(value = "/changeUserReal_name",method = RequestMethod.POST)
    public String changeUserReal_name(HttpServletRequest request){
        User user = (User)request.getSession().getAttribute("user");
        String username = user.getUsername();
        String real_name = request.getParameter("real_name");
        if(user == null)
            return "/login";
        userService.changeUserReal_name(username,real_name);
        user.setReal_name(real_name);
        request.getSession().setAttribute("user",user);
        return "admin/index";
    }

    @RequestMapping(value = "/uploadhead",method = RequestMethod.POST)
    public String uploadhead(HttpServletRequest request,
                             @RequestParam("head") MultipartFile head_file){

        User user = (User)request.getSession().getAttribute("user");
        if(user != null && user.getUsername() != null){
            String name = user.getUsername() + ".jpg";
            String path = request.getSession().getServletContext().getRealPath("/")
                    + "WEB-INF\\source\\head_portrait\\";
            String filename = path + name;
            System.out.println(filename);
            File file = new File(filename);
            try {
                head_file.transferTo(file);
                userService.changeUserHead_protrait(user.getUsername(),name);
                user.setHead_protrait(name);
                request.getSession().setAttribute("user",user);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return "admin/index";
    }


}
