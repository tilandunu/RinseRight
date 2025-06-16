package net.RinseRight.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import net.RinseRight.exception.DatabaseException;
import net.RinseRight.model.Order;

public class OrderDao {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/rinseright";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "root";

    public int getUserIdByUsername(String username) throws DatabaseException {
        int userId = -1; // Default value if user is not found
        String query = "SELECT uID FROM users WHERE username = ?";
        try (Connection con = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
             PreparedStatement pstmt = con.prepareStatement(query)) {
            pstmt.setString(1, username);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    userId = rs.getInt("uID");
                }
            }
        } catch (SQLException e) {
            throw new DatabaseException("Failed to retrieve user ID by username.", e);
        }
        return userId;
    }

    public int addOrder(Order order) throws DatabaseException {
        int orderId = -1;
        try (Connection con = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
             PreparedStatement pstmt = con.prepareStatement("INSERT INTO orders (uID, typeOfWash, typeOfAftercare, clothType, clothMaterial, quantity, orderStatus, finalAmount) VALUES (?, ?, ?, ?, ?, ?, ?, ?)", PreparedStatement.RETURN_GENERATED_KEYS)) {
            int userId = getUserIdByUsername(order.getUsername());
            pstmt.setInt(1, userId);
            pstmt.setString(2, order.getTypeOfWash());
            pstmt.setString(3, order.getTypeOfAftercare());
            pstmt.setString(4, order.getClothType());
            pstmt.setString(5, order.getClothMaterial());
            pstmt.setInt(6, order.getQuantity());
            pstmt.setString(7, "pending");
            pstmt.setFloat(8, order.getFinalAmount());
            pstmt.executeUpdate();

            // Retrieve the generated order ID
            try (ResultSet generatedKeys = pstmt.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    orderId = generatedKeys.getInt(1);
                }
            }
        } catch (SQLException e) {
            throw new DatabaseException("Failed to add order to the database.", e);
        }
        return orderId;
    }
    
    public void updateOrderStatus(int orderId, String status) throws DatabaseException {
        try (Connection con = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
             PreparedStatement pstmt = con.prepareStatement("UPDATE orders SET orderStatus = ? WHERE orderID = ?")) {
            pstmt.setString(1, status);
            pstmt.setInt(2, orderId);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new DatabaseException("Failed to update order status.", e);
        }
    }
}
