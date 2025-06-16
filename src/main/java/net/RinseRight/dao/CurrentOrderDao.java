package net.RinseRight.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import net.RinseRight.model.Order;

public class CurrentOrderDao {

    public List<Order> getCurrentOrders(String username) {
        String query = "SELECT o.orderID, o.typeOfWash, o.typeOfAftercare, o.finalAmount " +
                       "FROM orders o " +
                       "JOIN users u ON o.uID = u.uID " +
                       "WHERE u.username = ? and o.orderStatus = 'approved'";
        List<Order> currentOrders = new ArrayList<>();

        try (Connection con = DatabaseConnectionDao.getConnection();
             PreparedStatement pstmt = con.prepareStatement(query)) {
            pstmt.setString(1, username);

            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                int orderID = rs.getInt("orderID");
                String typeOfWash = rs.getString("typeOfWash");
                String typeOfAftercare = rs.getString("typeOfAftercare");
                float finalAmount = rs.getFloat("finalAmount");

                Order order = new Order(orderID, typeOfWash, typeOfAftercare, finalAmount);
                currentOrders.add(order);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return currentOrders;
    }
}
