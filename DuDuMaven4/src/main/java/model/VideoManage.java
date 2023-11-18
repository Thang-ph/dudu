/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Admin
 */
public class VideoManage {
        String title,videourl,hashtag,userName,userlastname,userAva,comment,productname,productimg;
        int vidID,userID,productID,vlike;

    public VideoManage(String title,int UserID, String videourl, String hashtag, String userName,String userlastname, int vidID, String productname, String productimg, int productID) {
        this.title = title;
        this.userID = UserID;
        this.videourl = videourl;
        this.hashtag = hashtag;
        this.userName = userName;
        this.userlastname = userlastname;
        this.vidID = vidID;
        this.productname = productname;
        this.productimg = productimg;
        this.productID = productID;
    }

    

  
    public String getTitle() {
        return title;
    }

    public VideoManage(String title,int UserID, String videourl, String hashtag, String userName,String userlastname, int vidID, String productname, String productimg, int productID,int vlike) {
        this.title = title;
        this.userID = UserID;
        this.videourl = videourl;
        this.hashtag = hashtag;
        this.userName = userName;
        this.userlastname = userlastname;
        this.vidID = vidID;
        this.productname = productname;
        this.productimg = productimg;
        this.productID = productID;
        this.vlike = vlike;
    }

    public String getUserlastname() {
        return userlastname;
    }

    public void setUserlastname(String userlastname) {
        this.userlastname = userlastname;
    }

    public String getProductname() {
        return productname;
    }

    public void setProductname(String productname) {
        this.productname = productname;
    }

    public String getProductimg() {
        return productimg;
    }

    public void setProductimg(String productimg) {
        this.productimg = productimg;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
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

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserAva() {
        return userAva;
    }

    public void setUserAva(String userAva) {
        this.userAva = userAva;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public int getVidID() {
        return vidID;
    }

    public void setVidID(int vidID) {
        this.vidID = vidID;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public VideoManage(String title, String videourl, String hashtag, String userName) {
        this.title = title;
        this.videourl = videourl;
        this.hashtag = hashtag;
        this.userName = userName;
    }

    public int getVlike() {
        return vlike;
    }

    public void setVlike(int vlike) {
        this.vlike = vlike;
    }
        
        
}
