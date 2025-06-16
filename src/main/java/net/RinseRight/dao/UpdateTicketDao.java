package net.RinseRight.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class UpdateTicketDao {

    public boolean updateTicket(int ticketID, String mode, String inquiryType, String subInquiryType, String inquiry, String suggestions) {
        String query = "UPDATE tickets SET mode=?, inquiryType=?, subInquiryType=?, inquiry=?, suggestions=? WHERE ticketID=?";

        if (mode == null) {
            mode = "default";
        }
        
        try (Connection con = DatabaseConnectionDao.getConnection();
             PreparedStatement pstmt = con.prepareStatement(query)) {
            pstmt.setString(1, mode);
            pstmt.setString(2, inquiryType);
            pstmt.setString(3, subInquiryType);
            pstmt.setString(4, inquiry);
            pstmt.setString(5, suggestions);
            pstmt.setInt(6, ticketID);

            int rowsAffected = pstmt.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
