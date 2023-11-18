/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Admin
 */
public class Video {
    String title,videourl,hashtag,userID;

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }
    public String getVideourl() {
        return videourl;
    }
    public void setVideourl(String videourl) {
        this.videourl = videourl;
    }

    public String getHashtag() {
        return hashtag;
    }

    public void setHashtag(String hashtag) {
        this.hashtag = hashtag;
    }

    public Video(String title, String videourl, String hashtag, String userID) {
        this.title = title;
        this.videourl = videourl;
        this.hashtag = hashtag;
        this.userID = userID;
    }

    public Video() {
  
    }

    
    
}
