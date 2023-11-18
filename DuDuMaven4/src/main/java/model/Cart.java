/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import dal.ProductDAO;
import dal.UserDAO;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Pham Thang
 */
public class Cart {

    private List<Item> items;

    public Cart() {
        items = new ArrayList<>();
    }

    public List<Item> getItems() {
        return items;
    }

    public int getQuantityByIdTypeSizeUser(int productID, String type,String size,int userID) {
        if(getItemByIDTypeSizeUser(productID, type, size,userID)!=null){
                    return getItemByIDTypeSizeUser(productID, type, size,userID).getQuantity();

        }
        return 0;
    }

    private Item getItemByIDTypeSizeUser(int productID, String type, String size,int userID) {
        for (Item i : items) {
            if (i.getProduct().getProductID() == productID &&( i.getSize().equals(size)||size == null||size.equals("") ) && (i.getType().equals(type)||type==null||type.equals(""))&&i.getUser().getUserID()==userID) {
                return i;
            }
        }
        return null;
    }
    public void addItem(Item t){
        if(getItemByIDTypeSizeUser(t.getProduct().getProductID(), t.getType(), t.getSize(),t.getUser().getUserID())!=null){
            Item m=getItemByIDTypeSizeUser(t.getProduct().getProductID(), t.getType(), t.getSize(),t.getUser().getUserID());
            m.setQuantity(m.getQuantity()+t.getQuantity());
        }
        else{
            items.add(t);
        }
    }
    public void removeItem(int productID, String type, String size,int userID){
        if(getItemByIDTypeSizeUser(productID, type, size,userID )!=null){
            items.remove(getItemByIDTypeSizeUser(productID, type, size,userID));
        }
    }
    public double getTotalMoney(){
        double t=0;
        for (Item i : items) {
            t+=(i.getQuantity())*(i.getProduct().getPrice());
        }
        return t;
    }
//    public double getFinalTotalMoney(){
//        double t=0; 
//        for (Item i : items) {
//                t+=i.getQuantity()*i.getProduct().getPrice();
//            
//        }
//        return t;
//    }
//    private Product getProductByProductID(int productID,List<Product> list){
//        for(Product i:list){
//            if(i.getProductID()==productID)
//                return i;
//        }
//        return null;
//    }
    public Cart(String txt,int userID){
        ProductDAO pd=new ProductDAO();
        UserDAO ud=new UserDAO();
        items=new ArrayList<>();
        try{
        if(txt!=null && txt.length()!=0){
            String[] s=txt.split("/");
            for(String i:s){
                                String[] n=i.split(":");

                 int accountID=Integer.parseInt(n[4]);
                if(accountID==userID){
                int productID=Integer.parseInt(n[0]);
                String type=n[1];
                String size=n[2];
                int quantity=Integer.parseInt(n[3]);
                Product p=pd.getProductByProductID(productID);
                User u=ud.getUserbyID(userID);
                Item t=new Item(p, type,size , quantity,u);
                addItem(t);
                                }

            }
            
        }
        }
        catch(NumberFormatException e){
            System.out.println(e);
        }
    }

    public List<Item> getItemsByUserID(int userID) {
        List<Item> list=new ArrayList<>();
        for (Item i : items) {
            if(i.getUser().getUserID()==userID){
                list.add(i);
            }
        }
        return list;
    }
    public static void main(String[] args) {
      Cart cart=new Cart("1:White:M:3:1",1);
         System.out.println(cart.getItemByIDTypeSizeUser(1, "White","" , 1).getQuantity());
    }
}
