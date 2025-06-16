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

import net.RinseRight.dao.RetrieveNonRespondedTicketDao;
import net.RinseRight.model.Ticket;

@WebServlet("/retrieveNonRespondedTicket")
public class RetrieveNonRespondedTicketServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private RetrieveNonRespondedTicketDao ticketDao = new RetrieveNonRespondedTicketDao();

    public RetrieveNonRespondedTicketServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        int uID = (int) session.getAttribute("uID");

        List<Ticket> nonRespondedTickets = ticketDao.getNonRespondedTickets(uID);

        request.setAttribute("nonRespondedTickets", nonRespondedTickets);
        RequestDispatcher dispatcher = request.getRequestDispatcher("viewTicketNonResponded.jsp");
        dispatcher.forward(request, response);
    }
}
