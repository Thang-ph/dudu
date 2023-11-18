/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author ADMIN
 */
public class Warehouse {

    private int warehouseID;
    private Product product;
    private String type;
    private String size;
    private int quantity;

    public Warehouse(int warehouseID, Product product, String type, String size, int quantity) {
        this.warehouseID = warehouseID;
        this.product = product;
        this.type = type;
        this.size = size;
        this.quantity = quantity;
    }

    public Warehouse() {
    }

    public Warehouse(int warehouseID, String type, String size, int quantity) {
        this.warehouseID = warehouseID;
        this.type = type;
        this.size = size;
        this.quantity = quantity;
    }

    public Warehouse(Product product, String type, String size, int quantity) {
        this.product = product;
        this.type = type;
        this.size = size;
        this.quantity = quantity;
    }


    public int getWarehouseID() {
        return warehouseID;
    }

    public void setWarehouseID(int warehouseID) {
        this.warehouseID = warehouseID;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

}
