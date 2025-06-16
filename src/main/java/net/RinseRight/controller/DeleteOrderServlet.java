package net.RinseRight.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.RinseRight.dao.DeleteOrderDao;

@WebServlet("/deleteOrder")
public class DeleteOrderServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve order ID from request parameter
        int orderID = Integer.parseInt(request.getParameter("orderID"));

        // Initialize DeleteOrderDao
        DeleteOrderDao deleteOrderDao = new DeleteOrderDao();

        // Attempt to delete the order
		boolean success = deleteOrderDao.deleteOrder(orderID);

		if (success) {
		    // Order deletion successful
		    response.sendRedirect("http://localhost:8080/RinseRight/currentOrders"); // Redirect to a suitable page
		} else {
			response.sendRedirect("index.jsp");// Order deletion failed
		    // Handle failure appropriately, maybe show an error message
		}
    }
}
