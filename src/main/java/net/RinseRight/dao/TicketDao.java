package net.RinseRight.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import net.RinseRight.model.Ticket;

public class TicketDao {

    public boolean insertTicket(Ticket ticket) {
        // If mode is null, set it to "default"
        if (ticket.getMode() == null) {
            ticket.setMode("default");
        }

        String query = "INSERT INTO tickets (uID, mode, inquiryType, subInquiryType, inquiry, suggestions) VALUES (?, ?, ?, ?, ?, ?)";

        try (Connection con = DatabaseConnectionDao.getConnection();
             PreparedStatement pstmt = con.prepareStatement(query)) {
            pstmt.setInt(1, ticket.getUID());
            pstmt.setString(2, ticket.getMode());
            pstmt.setString(3, ticket.getInquiryType());
            pstmt.setString(4, ticket.getSubInquiryType());
            pstmt.setString(5, ticket.getInquiry());
            pstmt.setString(6, ticket.getSuggestions());

            int rowsAffected = pstmt.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    
    public Ticket getTicketById(int ticketID) {
        Ticket ticket = null;
        String query = "SELECT * FROM tickets WHERE ticketID = ?";

        try (Connection con = DatabaseConnectionDao.getConnection();
             PreparedStatement pstmt = con.prepareStatement(query)) {
            pstmt.setInt(1, ticketID);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                ticket = new Ticket();
                ticket.setTicketID(rs.getInt("ticketID"));
                ticket.setUID(rs.getInt("uID"));
                ticket.setInquiry(rs.getString("inquiry"));
                ticket.setSuggestions(rs.getString("suggestions"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return ticket;
    }
}
