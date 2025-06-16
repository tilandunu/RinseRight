package net.RinseRight.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import net.RinseRight.model.Ticket;

public class RetrieveNonRespondedTicketDao {

    public List<Ticket> getNonRespondedTickets(int uID) {
        String query = "SELECT * FROM tickets WHERE uID = ? AND ticketStatus = 'pending'";
        List<Ticket> nonRespondedTickets = new ArrayList<>();

        try (Connection con = DatabaseConnectionDao.getConnection();
             PreparedStatement pstmt = con.prepareStatement(query)) {
            pstmt.setInt(1, uID);

            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    int ticketID = rs.getInt("ticketID");
                    String mode = rs.getString("mode");
                    String inquiryType = rs.getString("inquiryType");
                    String subInquiryType = rs.getString("subInquiryType");
                    String inquiry = rs.getString("inquiry");
                    String suggestions = rs.getString("suggestions");
                    String ticketStatus = rs.getString("ticketStatus");
                    String response = rs.getString("response");

                    Ticket ticket = new Ticket(ticketID, uID, mode, inquiryType, subInquiryType, inquiry, suggestions, ticketStatus, response);
                    nonRespondedTickets.add(ticket);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return nonRespondedTickets;
    }
}
