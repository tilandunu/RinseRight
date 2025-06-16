package net.RinseRight.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import net.RinseRight.exception.DatabaseException;
import net.RinseRight.model.Payment;

public class PaymentDao {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/rinseright";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "root";
    
    public void addPayment(Payment payment) throws DatabaseException {
        try (Connection con = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
             PreparedStatement pstmt = con.prepareStatement("INSERT INTO payments (orderID, paymentMethod, cardNumber, cardType, CVV, deliveryAddress, totalAmount) VALUES (?, ?, ?, ?, ?, ?, ?)")) {
            pstmt.setInt(1, payment.getOrderID());
            pstmt.setString(2, payment.getPaymentMethod());
            pstmt.setString(3, payment.getCardNumber());
            pstmt.setString(4, payment.getCardType());
            pstmt.setString(5, payment.getCVV());
            pstmt.setString(6, payment.getDeliveryAddress());
            pstmt.setFloat(7, payment.getTotalAmount());
            pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new DatabaseException("Failed to add payment to the database.", e);
        }
    }
}
