package net.RinseRight.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class DeleteOrderDao {

    public boolean deleteOrder(int orderID) {
        String query = "DELETE FROM orders WHERE orderID = ?";

        try (Connection con = DatabaseConnectionDao.getConnection();
             PreparedStatement pstmt = con.prepareStatement(query)) {
            pstmt.setInt(1, orderID);

            int rowsAffected = pstmt.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
