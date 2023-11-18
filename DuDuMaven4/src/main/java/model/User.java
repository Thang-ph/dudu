/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author PC
 */
public class User {
    private int userID;
    private String username;
    private String password;
    private String firstname;
    private String lastname;
    private String gender;
    private String email;
    private String address;
    private String describe;
    private String dob;
    private String phone;
    private int role;
    private String avatar;
    private int shopID;

    public User(String username, String password, String firstname, String email, int role, String avatar) {
        this.username = username;
        this.password = password;
        this.firstname = firstname;
        this.email = email;
        this.role = role;
        this.avatar = avatar;
    }

 
 public User( String username, String password, String firstname, String lastname, String gender, String email, String address, String describe, String dob, String phone, int role, String avatar) {

        this.username = username;
        this.password = password;
        this.firstname = firstname;
        this.lastname = lastname;
        this.gender = gender;
        this.email = email;
        this.address = address;
        this.describe = describe;
        this.dob = dob;
        this.phone = phone;
        this.role = role;
        this.avatar = avatar;
    }

    public User(int userID, String username, String firstname, String lastname, String gender, String email, String address, String describe, String dob, String phone, int role, String avatar) {
        this.userID = userID;
        this.username = username;
        this.firstname = firstname;
        this.lastname = lastname;
        this.gender = gender;
        this.email = email;
        this.address = address;
        this.describe = describe;
        this.dob = dob;
        this.phone = phone;
        this.role = role;
        this.avatar = avatar;
    }


    public User(String username, String password) {
        this.username = username;
        this.password = password;
    }

    public User(String username, String password, int role) {
        this.username = username;
        this.password = password;
        this.role = role;
    }

    public User(int userID, String username, String password, String firstname, String lastname, String gender, String email, String address, String describe, String dob, String phone, int role, String avatar) {
        this.userID = userID;
        this.username = username;
        this.password = password;
        this.firstname = firstname;
        this.lastname = lastname;
        this.gender = gender;
        this.email = email;
        this.address = address;
        this.describe = describe;
        this.dob = dob;
        this.phone = phone;
        this.role = role;
        this.avatar = avatar;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

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

    public String getFirstname() {
        return firstname;
    }

    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }

    public String getLastname() {
        return lastname;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getDescribe() {
        return describe;
    }

    public void setDescribe(String describe) {
        this.describe = describe;
    }

    public String getDob() {
        return dob;
    }

    public void setDob(String dob) {
        this.dob = dob;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public User() {
    }

   
    
}
