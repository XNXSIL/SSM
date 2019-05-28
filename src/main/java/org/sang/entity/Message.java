package org.sang.entity;

import com.fasterxml.jackson.annotation.JsonProperty;

import java.util.List;


public class Message {
    @JsonProperty("Username")
    private String username;
    @JsonProperty("Content")
    private String content;
    @JsonProperty("Date")
    private String date;
    @JsonProperty("Pictures")
    private List<String> pictures;
    @JsonProperty("Comments")
    private List<Comment> comments;
    @JsonProperty("Id")
    private int id;
    @JsonProperty("StoreCount")
    private int store_count;
    @JsonProperty("CommentCount")
    private int comment_count;
    @JsonProperty("GoodCount")
    private int good_count;

    public String getUsername(){return username;}

    public void setUsername(String username){this.username = username;}

    public String getContent(){return content;}

    public void setContent(String content){this.content = content;}

    public String getDate(){return date;}

    public void setDate(String date){this.date = date;}

    public List<Comment> getComments() { return comments; }

    public void setComments(List<Comment> comments){this.comments = comments;}

    public List<String> getPictures(){return pictures;}

    public void setPictures(List<String> pictures){this.pictures = pictures;}

    public int getId(){return id;}

    public void setId(int id){this.id = id;}

    public int getStore_count(){return store_count;}

    public void setStore_count(int store_count){this.store_count = store_count;}

    public int getComment_count(){return comment_count;}

    public void setComment_count(int comment_count){this.comment_count = comment_count;}

    public int getGood_count(){return good_count;}

    public void setGood_count(int good_count){this.good_count = good_count;}

    @Override
    public String toString(){
        return "Message [Username="+ username  +
                ", Content=" + content + ", Date=" + date +
                ", Pictures=" + pictures + ", Comments" + comments +
                ", Id=" + id + ", StoreCount=" + store_count +
                ", CommentCount=" + comment_count + ", GoodCount" + good_count + "]";
    }
}
