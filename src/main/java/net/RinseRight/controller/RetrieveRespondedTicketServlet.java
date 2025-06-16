package net.RinseRight.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.RinseRight.dao.RetrieveRespondedTicketDao;
import net.RinseRight.model.Ticket;

@WebServlet("/retrieveRespondedTicket")
public class RetrieveRespondedTicketServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private RetrieveRespondedTicketDao ticketDao = new RetrieveRespondedTicketDao();

    public RetrieveRespondedTicketServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        int uID = (int) session.getAttribute("uID");

        List<Ticket> respondedTickets = ticketDao.getRespondedTickets(uID);

        request.setAttribute("respondedTickets", respondedTickets);
        RequestDispatcher dispatcher = request.getRequestDispatcher("viewTicketResponded.jsp");
        dispatcher.forward(request, response);
    }
}
