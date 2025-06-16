package net.RinseRight.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import net.RinseRight.model.User;

public class RegisterDao {

    public int registerUser(User user) {
        String query = "INSERT INTO USERS (firstName, lastName, email, phoneNumber, address, username, password) VALUES (?, ?, ?, ?, ?, ?, ?)";
        
        int result = 0;
        
        try (Connection con = DatabaseConnectionDao.getConnection();
             PreparedStatement pstmt = con.prepareStatement(query)) {
            pstmt.setString(1, user.getFirstName());
            pstmt.setString(2, user.getLastName());
            pstmt.setString(3, user.getEmail());
            pstmt.setString(4, user.getPhoneNumber());
            pstmt.setString(5, user.getAddress());
            pstmt.setString(6, user.getUsername());
            pstmt.setString(7, user.getPassword());
        
            System.out.println(pstmt);
            
            result = pstmt.executeUpdate();
        
        } catch (SQLException e) {
            e.printStackTrace();
        }
                
         return result;
    }
}
