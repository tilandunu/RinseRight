package net.RinseRight.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class LoginDao {

    public int validateUser(String username, String password) {
        String query = "SELECT uID FROM users WHERE username = ? AND password = ?";
        int uID = 0;

        try (Connection con = DatabaseConnectionDao.getConnection();
             PreparedStatement pstmt = con.prepareStatement(query)) {
            pstmt.setString(1, username);
            pstmt.setString(2, password);

            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                uID = rs.getInt("uID");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return uID;
    }
}
