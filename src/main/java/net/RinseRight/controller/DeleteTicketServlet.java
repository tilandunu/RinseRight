package net.RinseRight.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.RinseRight.dao.DeleteDao;

@WebServlet("/deleteTicket")
public class DeleteTicketServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve ticket ID from request parameter
        int ticketID = Integer.parseInt(request.getParameter("ticketID"));

        // Initialize DeleteDao
        DeleteDao deleteDao = new DeleteDao();

        // Attempt to delete the ticket
		boolean success = deleteDao.deleteTicket(ticketID);

		if (success) {
		    // Ticket deletion successful
		    response.sendRedirect("http://localhost:8080/RinseRight/retrieveNonRespondedTicket"); // Redirect to a suitable page
		} else {
			response.sendRedirect("index.jsp");// Ticket deletion failed
		    // Handle failure appropriately, maybe show an error message
		}
    }
}
