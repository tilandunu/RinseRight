package net.RinseRight.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.RinseRight.dao.TicketDao;
import net.RinseRight.exception.TicketException;
import net.RinseRight.model.Ticket;

@WebServlet("/placeTicket")
public class PlaceTicketServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private TicketDao ticketDao = new TicketDao();

	public PlaceTicketServlet() {
		super();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		if (session != null) {
			int uID = (int) session.getAttribute("uID");
			String mode = request.getParameter("mode");
			String inquiryType = request.getParameter("inquiryType");
			String subInquiryType = request.getParameter("subInquiryType");
			String inquiry = request.getParameter("inquiry");
			String suggestions = request.getParameter("suggestions");

			Ticket ticket = new Ticket();
			ticket.setUID(uID);
			ticket.setMode(mode);
			ticket.setInquiryType(inquiryType);
			ticket.setSubInquiryType(subInquiryType);
			ticket.setInquiry(inquiry);
			ticket.setSuggestions(suggestions);

			try {
				// Pass the Ticket object to the DAO method
				boolean inserted = ticketDao.insertTicket(ticket);

				if (inserted) {
					request.setAttribute("message", "Ticket placed successfully");
					request.getRequestDispatcher("index.jsp").forward(request, response);
				} else {
					throw new TicketException("Failed to place ticket");
				}
			} catch (TicketException e) {
				request.setAttribute("message", e.getMessage());
				request.getRequestDispatcher("Ticket.jsp").forward(request, response);
			}
		} else {
			response.sendRedirect("login.jsp");
		}
	}
}
