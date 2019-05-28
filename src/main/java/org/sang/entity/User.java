package org.sang.entity;



import java.util.List;


public class User {
    private String username;
    private String password;
    private String head_protrait;
    private List<String> fans;
    private int fans_num;
    private int messages_num;
    private String phone;
    private String personal_tag;
    private String institute;
    private String real_name;

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getHead_protrait(){ return head_protrait;}

    public void setHead_protrait(String head_protrait){this.head_protrait = head_protrait;}

    public List<String> getFans(){return fans;}

    public void setFans(List<String> fans){this.fans = fans;}

    public int getFans_num(){return fans_num;}

    public void setFans_num(int fans_num){this.fans_num = fans_num;}

    public int getMessages_num(){return messages_num;}

    public void setMessages_num(int messages_num){this.messages_num = messages_num;}

    public String getPhone(){return phone;}

    public void setPhone(String phone){this.phone = phone;}

    public String getPersonal_tag(){return personal_tag;}

    public void setPersonal_tag(String personal_tag){this.personal_tag = personal_tag;}

    public String getInstitute(){return institute;}

    public void setInstitute(String institute){this.institute = institute;}

    public String getReal_name(){return real_name;}

    public void setReal_name(String real_name){this.real_name = real_name;}
}
