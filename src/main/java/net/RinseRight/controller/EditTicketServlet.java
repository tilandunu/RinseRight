package net.RinseRight.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.RinseRight.dao.TicketDao;
import net.RinseRight.model.Ticket;

@WebServlet("/editTicket")
public class EditTicketServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private TicketDao ticketDao = new TicketDao();

    public EditTicketServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session != null) {
            int ticketID = Integer.parseInt(request.getParameter("ticketID"));
            Ticket ticket = ticketDao.getTicketById(ticketID);
            
            request.setAttribute("ticket", ticket);
            request.getRequestDispatcher("updateTicket.jsp").forward(request, response);
       
        } else {
            response.sendRedirect("login.jsp");
        }
    }
}
