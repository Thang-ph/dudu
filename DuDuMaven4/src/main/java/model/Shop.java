/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Pham Thang
 */
public class Shop {
    private int shopID;
    private String name;
    private User user;
    private double rate;
  @Override
  public boolean equals(Object o) {
    if (o instanceof Shop) {
      Shop shop = (Shop) o;
      return this.shopID == shop.shopID;
    }
    return false;
  }

  @Override
  public int hashCode() {
    return shopID;
  }

    public Shop() {
    }

    public Shop(int shopID, String name, User user, double rate) {
        this.shopID = shopID;
        this.name = name;
        this.user = user;
        this.rate = rate;
    }

    public int getShopID() {
        return shopID;
    }

    public void setShopID(int shopID) {
        this.shopID = shopID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public double getRate() {
        return rate;
    }

    public void setRate(double rate) {
        this.rate = rate;
    }

  
}
