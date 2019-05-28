package org.sang.util;

import com.fasterxml.jackson.annotation.JsonProperty;

public class GoodUnit {
    @JsonProperty("Username")
    private String username;
    @JsonProperty("Id")
    private int id;

    public String getUsername(){return username;}

    public void setUsername(String username){this.username = username;}

    public int getId(){return id;}

    public void setId(int id){this.id = id;}
}
