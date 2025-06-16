package net.RinseRight.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import net.RinseRight.model.User;

public class ProfileDao {

    public User getUserData(String username) {
        User user = null;
        String query = "SELECT * FROM USERS WHERE username=?";
        
        try (Connection con = DatabaseConnectionDao.getConnection();
             PreparedStatement pstmt = con.prepareStatement(query)) {
            pstmt.setString(1, username);
            
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    String firstName = rs.getString("firstName");
                    String lastName = rs.getString("lastName");
                    String email = rs.getString("email");
                    String phoneNumber = rs.getString("phoneNumber");
                    String address = rs.getString("address");
                    
                    user = new User(firstName, lastName, email, phoneNumber, address);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return user;
    }
}
