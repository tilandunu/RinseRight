package net.RinseRight.model;

public class Order {
    private int orderID;
    private int userId;
    private String username;
    private String typeOfWash;
    private String typeOfAftercare;
    private String clothType;
    private String clothMaterial;
    private int quantity;
    private float finalAmount;

    // Constructors
    public Order() {
    }

    public Order(int userId, String typeOfWash, String typeOfAftercare, String clothType, String clothMaterial, int quantity, float finalAmount) {
        this.userId = userId;
        this.typeOfWash = typeOfWash;
        this.typeOfAftercare = typeOfAftercare;
        this.clothType = clothType;
        this.clothMaterial = clothMaterial;
        this.quantity = quantity;
        this.finalAmount = finalAmount;
    }
    
    public Order(String typeOfWash, String typeOfAftercare , float finalAmount) {
    	 this.typeOfWash = typeOfWash;
         this.typeOfAftercare = typeOfAftercare;
         this.finalAmount = finalAmount;
    }



	public Order(int orderID, String typeOfWash, String typeOfAftercare, float finalAmount) {
		super();
		this.orderID = orderID;
		this.typeOfWash = typeOfWash;
		this.typeOfAftercare = typeOfAftercare;
		this.finalAmount = finalAmount;
	}

	// Getters and setters
    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getTypeOfWash() {
        return typeOfWash;
    }

    public void setTypeOfWash(String typeOfWash) {
        this.typeOfWash = typeOfWash;
    }

    public String getTypeOfAftercare() {
        return typeOfAftercare;
    }

    public void setTypeOfAftercare(String typeOfAftercare) {
        this.typeOfAftercare = typeOfAftercare;
    }

    public String getClothType() {
        return clothType;
    }

    public void setClothType(String clothType) {
        this.clothType = clothType;
    }

    public String getClothMaterial() {
        return clothMaterial;
    }

    public void setClothMaterial(String clothMaterial) {
        this.clothMaterial = clothMaterial;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public float getFinalAmount() {
        return finalAmount;
    }

    public void setFinalAmount(float finalAmount) {
        this.finalAmount = finalAmount;
    }
    
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

}
