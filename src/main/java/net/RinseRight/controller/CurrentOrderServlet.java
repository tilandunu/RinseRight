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

import net.RinseRight.dao.CurrentOrderDao;
import net.RinseRight.model.Order;

@WebServlet("/currentOrders")
public class CurrentOrderServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private CurrentOrderDao currentOrderDao = new CurrentOrderDao();

    public CurrentOrderServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("username");

        List<Order> currentOrders = currentOrderDao.getCurrentOrders(username);

        request.setAttribute("currentOrders", currentOrders);
        RequestDispatcher dispatcher = request.getRequestDispatcher("currentOrders.jsp");
        dispatcher.forward(request, response);
    }
}
