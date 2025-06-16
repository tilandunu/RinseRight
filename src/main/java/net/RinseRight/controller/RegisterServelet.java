package net.RinseRight.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.RinseRight.dao.RegisterDao;
import net.RinseRight.model.User;

@WebServlet("/registerNew")
public class RegisterServelet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private RegisterDao registerDao = new RegisterDao();

    public RegisterServelet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.getWriter().append("Served at: ").append(request.getContextPath());

        RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
        dispatcher.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String phoneNumber = request.getParameter("phoneNumber");
        String address = request.getParameter("address");
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        User user = new User(firstName, lastName, email, phoneNumber, address, username, password);

        int result = registerDao.registerUser(user);
		if (result == 1) { // Registration successful
		    HttpSession session = request.getSession();
		    session.setAttribute("username", username);
		    request.setAttribute("message", "Registration successful");
		    RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
		    dispatcher.forward(request, response);
		} else { // Registration failed
		    request.setAttribute("message", "Registration unsuccessful, Username or Email already in use");
		    RequestDispatcher dispatcher = request.getRequestDispatcher("register.jsp");
		    dispatcher.forward(request, response);
		}
    }
}
