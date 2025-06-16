package net.RinseRight.controller;

import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import net.RinseRight.dao.OrderDao;
import net.RinseRight.exception.DatabaseException;
import net.RinseRight.exception.InvalidInputException;
import net.RinseRight.exception.OrderException;
import net.RinseRight.model.Order;

@WebServlet("/placeOrder")
public class OrderServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Retrieve user information from session
            HttpSession session = request.getSession();
            String username = (String) session.getAttribute("username");

            if (username == null) {
                throw new InvalidInputException("User is not logged in.");
            }

            // Retrieve order details from the form
            String typeOfWash = request.getParameter("typeOfWash");
            String typeOfAftercare = request.getParameter("typeOfAftercare");
            String clothType = request.getParameter("clothType");
            String clothMaterial = request.getParameter("clothMaterial");
            
            if (typeOfWash == null || typeOfAftercare == null || clothType == null || clothMaterial == null) {
                throw new InvalidInputException("One or more order details are missing.");
            }
            
            int quantity;
            float finalAmount;
            try {
                quantity = Integer.parseInt(request.getParameter("quantity"));
                finalAmount = Float.parseFloat(request.getParameter("finalAmount"));
            } catch (NumberFormatException e) {
                throw new InvalidInputException("Invalid quantity or final amount format.", e);
            }

            // Create Order object
            Order order = new Order();
            order.setUsername(username); // Set the username in the order object
            order.setTypeOfWash(typeOfWash);
            order.setTypeOfAftercare(typeOfAftercare);
            order.setClothType(clothType);
            order.setClothMaterial(clothMaterial);
            order.setQuantity(quantity);
            order.setFinalAmount(finalAmount);

            // Store the order in the database
            OrderDao orderDao = new OrderDao();
            int orderId = orderDao.addOrder(order); // Get the orderId after adding order

            // Store orderID and finalAmount in session
            session.setAttribute("orderID", orderId);
            session.setAttribute("finalAmount", finalAmount);

            // Redirect to a success page
            response.sendRedirect("payment.jsp");
            
        } catch (InvalidInputException | DatabaseException e) {
            e.printStackTrace();
            request.setAttribute("message", e.getMessage());
            request.getRequestDispatcher("order.jsp").forward(request, response);
        }
    }
}
