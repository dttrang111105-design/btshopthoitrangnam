
package model;


public class Contact {
    private int id;
    private String userName, msg;

    public Contact() {
    }

    public Contact(String username, String msg) {
        this.userName = username;
        this.msg = msg;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return userName;
    }

    public void setName(String name) {
        this.userName = name;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }
    
}
