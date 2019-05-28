package org.sang.util;

import com.fasterxml.jackson.annotation.JsonProperty;

public class TransmissionUnit {
    @JsonProperty("Username")
    private String username;
    @JsonProperty("Content")
    private String content;
    @JsonProperty("Id")
    private int id;

    public String getUsername(){return username;}

    public void setUsername(String username){this.username = username;}

    public String getContent(){return content;}

    public void setContent(String content){this.content = content;}

    public int getId(){return id;}

    public void setId(int id){this.id = id;}
}
