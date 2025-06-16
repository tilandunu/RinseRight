package net.RinseRight.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.RinseRight.dao.UpdateTicketDao;

@WebServlet("/updateTicket")
public class UpdateTicketServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UpdateTicketDao updateTicketDao = new UpdateTicketDao();

    public UpdateTicketServlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session != null) {
            int ticketID = Integer.parseInt(request.getParameter("ticketID"));
            String mode = request.getParameter("mode");
            String inquiryType = request.getParameter("inquiryType");
            String subInquiryType = request.getParameter("subInquiryType");
            String inquiry = request.getParameter("inquiry");
            String suggestions = request.getParameter("suggestions");
            
            boolean updated = updateTicketDao.updateTicket(ticketID, mode, inquiryType, subInquiryType, inquiry, suggestions);
            
            if (updated) {
                request.setAttribute("message", "Ticket updated successfully");
                response.sendRedirect("http://localhost:8080/RinseRight/retrieveNonRespondedTicket");
            } else {
                request.setAttribute("message", "Failed to update ticket");
                request.getRequestDispatcher("error.jsp").forward(request, response);
            }
        } else {
            response.sendRedirect("login.jsp");
        }
    }
}
