/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Admin
 */
public class Comment {
    public int CommentID,UserID,VidID;
    public String Content,UserName;

    public Comment(String Content, String UserName) {
        this.Content = Content;
        this.UserName = UserName;
    }

    public String getUserName() {
        return UserName;
    }

    public void setUserName(String UserName) {
        this.UserName = UserName;
    }

    public Comment( int UserID, int VidID, String Content) {

        this.UserID = UserID;
        this.VidID = VidID;
        this.Content = Content;
    }

    public Comment(int CommentID, int UserID, int VidID, String Content) {
        this.CommentID = CommentID;
        this.UserID = UserID;
        this.VidID = VidID;
        this.Content = Content;
    }

    public Comment(String Content) {
        this.Content = Content;
    }





    public int getCommentID() {
        return CommentID;
    }

    public void setCommentID(int CommentID) {
        this.CommentID = CommentID;
    }

    public int getUserID() {
        return UserID;
    }

    public void setUserID(int UserID) {
        this.UserID = UserID;
    }

    public int getVidID() {
        return VidID;
    }

    public void setVidID(int VidID) {
        this.VidID = VidID;
    }

    public String getContent() {
        return Content;
    }

    public void setContent(String Content) {
        this.Content = Content;
    }

    public boolean getCommentText() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
    
}
