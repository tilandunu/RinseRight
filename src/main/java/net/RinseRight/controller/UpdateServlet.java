package net.RinseRight.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.RinseRight.dao.UpdateDao;
import net.RinseRight.model.User;

@WebServlet("/updateProfile")
public class UpdateServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UpdateDao updateDao = new UpdateDao();

    public UpdateServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("username");
        if (username != null) {
            User user = updateDao.getUserData(username);
            request.setAttribute("user", user);
            RequestDispatcher dispatcher = request.getRequestDispatcher("manageProfile.jsp");
            dispatcher.forward(request, response);
        } else {
            response.sendRedirect("login.jsp");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String phoneNumber = request.getParameter("phoneNumber");
        String address = request.getParameter("address");
        
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("username");

        User updatedUser = new User(firstName, lastName, email, phoneNumber, address, username, null);
        
        boolean success = updateDao.updateUserProfile(updatedUser);
        
        if (success) {
            request.setAttribute("message", "Profile updated successfully");
        } else {
            request.setAttribute("message", "Failed to update profile");
        }
        RequestDispatcher dispatcher = request.getRequestDispatcher("manageProfile.jsp");
        dispatcher.forward(request, response);
    }
}
