

package model;

import java.text.NumberFormat;
import java.util.Locale;


public class Product {
    private int id;
    private String name, image, desc, category, type;
    private double price;

    public Product() {
    }

    public Product(int id, String name, String image, String desc, String category, String type, double price) {
        this.id = id;
        this.name = name;
        this.image = image;
        this.desc = desc;
        this.category = category;
        this.type = type;
        this.price = price;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }
    
    public double getPrice() {
        if (this.type != null && this.type.trim().equalsIgnoreCase("sale")) {
            return this.price * 0.8;
        }
        return this.price;
    }

    public void setPrice(double price) {
        this.price = price;
    }   
    
    public String getFormattedPrice() {
        NumberFormat formatter = NumberFormat.getInstance(new Locale("vi", "VN"));
        return formatter.format(getPrice()); // dùng getPrice() để đã tính giảm giá
    }
}
