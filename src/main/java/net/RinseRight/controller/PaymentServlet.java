package net.RinseRight.controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import net.RinseRight.dao.OrderDao;
import net.RinseRight.dao.PaymentDao;
import net.RinseRight.exception.DatabaseException;
import net.RinseRight.exception.InvalidInputException;
import net.RinseRight.model.Payment;

@WebServlet("/processPayment")
public class PaymentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Retrieve order information from session
            HttpSession session = request.getSession();
            Integer orderId = (Integer) session.getAttribute("orderID");
            Float finalAmount = (Float) session.getAttribute("finalAmount");

            if (orderId == null || finalAmount == null) {
                throw new InvalidInputException("Order information is missing in session.");
            }

            // Retrieve payment details from the form
            String paymentMethod = request.getParameter("paymentMethod");
            String cardNumber = request.getParameter("cardNumber");
            String cardType = request.getParameter("cardType");
            String cvv = request.getParameter("CVV");
            String deliveryAddress = request.getParameter("deliveryAddress");

            if (paymentMethod == null || cardNumber == null || cardType == null || cvv == null || deliveryAddress == null) {
                throw new InvalidInputException("One or more payment details are missing.");
            }

            // Create Payment object
            Payment payment = new Payment();
            payment.setOrderID(orderId);
            payment.setPaymentMethod(paymentMethod);
            payment.setCardNumber(cardNumber);
            payment.setCardType(cardType);
            payment.setCVV(cvv);
            payment.setDeliveryAddress(deliveryAddress);
            payment.setTotalAmount(finalAmount);

            // Store the payment in the database
            PaymentDao paymentDao = new PaymentDao();
            paymentDao.addPayment(payment);
            
            // Update order status
            OrderDao orderDao = new OrderDao();
            orderDao.updateOrderStatus(orderId, "approved");

            // Redirect to a success page
            request.setAttribute("message", "Payment Successful");
            RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
            dispatcher.forward(request, response);
        } catch (InvalidInputException | DatabaseException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", e.getMessage());
            request.getRequestDispatcher("payment.jsp").forward(request, response);
        }
    }
}
