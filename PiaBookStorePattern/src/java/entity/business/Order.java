package entity.business;

import java.util.List;
import entity.user.User;

public class Order {

    private String orderId;
    private int orderStatus;
    private String receiverName;
    private String receiverAddress;
    private String receiverPhoneNo;
    private float totalPrice;
    private String note;
    private User user;
    private Cart cart;

    public Order(String orderId, int orderStatus, String receiverName, String receiverAddress, String receiverPhoneNo, float totalPrice, String note, User user, Cart cart) {
        this.orderId = orderId;
        this.orderStatus = orderStatus;
        this.receiverName = receiverName;
        this.receiverAddress = receiverAddress;
        this.receiverPhoneNo = receiverPhoneNo;
        this.totalPrice = totalPrice;
        this.note = note;
        this.user = user;
        this.cart = cart;
    }

    public Order() {
        super();
    }

    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }

    public int getOrderStatus() {
        return orderStatus;
    }

    public void setOrderStatus(int orderStatus) {
        this.orderStatus = orderStatus;
    }

    public String getReceiverName() {
        return receiverName;
    }

    public void setReceiverName(String receiverName) {
        this.receiverName = receiverName;
    }

    public String getReceiverAddress() {
        return receiverAddress;
    }

    public void setReceiverAddress(String receiverAddress) {
        this.receiverAddress = receiverAddress;
    }

    public String getReceiverPhoneNo() {
        return receiverPhoneNo;
    }

    public void setReceiverPhoneNo(String receiverPhoneNo) {
        this.receiverPhoneNo = receiverPhoneNo;
    }

    public float getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(float totalPrice) {
        this.totalPrice = totalPrice;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Cart getCart() {
        return cart;
    }

    public void setCart(Cart cart) {
        this.cart = cart;
    }

}
