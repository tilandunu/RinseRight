package net.RinseRight.model;

public class Payment {
    private int paymentID;
    private int orderID;
    private String paymentMethod;
    private String cardNumber;
    private String cardType;
    private String CVV;
    private String deliveryAddress;
    private float totalAmount;

    // Constructors
    public Payment() {
    }

    public Payment(int paymentID, int orderID, String paymentMethod, String cardNumber, String cardType, String CVV, String deliveryMethod, float totalAmount) {
        this.paymentID = paymentID;
        this.orderID = orderID;
        this.paymentMethod = paymentMethod;
        this.cardNumber = cardNumber;
        this.cardType = cardType;
        this.CVV = CVV;
        this.deliveryAddress = deliveryAddress;
        this.totalAmount = totalAmount;
    }

    // Getters and Setters
    public int getPaymentID() {
        return paymentID;
    }

    public void setPaymentID(int paymentID) {
        this.paymentID = paymentID;
    }

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public String getDeliveryAddress() {
        return deliveryAddress;
    }

    public void setPaymentMethod(String paymentMethod) {
        this.paymentMethod = paymentMethod;
    }

    public String getCardNumber() {
        return cardNumber;
    }

    public void setCardNumber(String cardNumber) {
        this.cardNumber = cardNumber;
    }

    public String getCardType() {
        return cardType;
    }

    public void setCardType(String cardType) {
        this.cardType = cardType;
    }

    public String getCVV() {
        return CVV;
    }

    public void setCVV(String CVV) {
        this.CVV = CVV;
    }

    public void setDeliveryAddress(String deliveryAddress) {
        this.deliveryAddress = deliveryAddress;
    }

    public float getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(float totalAmount) {
        this.totalAmount = totalAmount;
    }

	public String getPaymentMethod() {
		return paymentMethod;
	}
}
