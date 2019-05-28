package org.sang.entity;

import com.fasterxml.jackson.annotation.JsonProperty;

public class Comment {
    @JsonProperty("Username")
    private String username;
    @JsonProperty("Date")
    private String date;
    @JsonProperty("Content")
    private String content;

    public String getUsername(){return username;}

    public void setUsername(String username){this.username = username;}

    public String getDate(){return date;}

    public void setDate(String date){this.date = date;}

    public String getContent(){return content;}

    public void setContent(String content){this.content = content;}

    @Override
    public String toString(){
        return "Comment [Username="+ username +", Date="+ date +
                ", Content="+ content + "]";
    }
}
