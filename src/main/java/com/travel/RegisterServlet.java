package com.travel;

import java.io.IOException;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");

        // Password Validation
        if (!password.equals(confirmPassword)) {

            response.sendRedirect("register.jsp?error=password");

            return;
        }

        // Generate 6-digit OTP
        Random random = new Random();

        int otp = 100000 + random.nextInt(900000);

        // Store data in Session
        HttpSession session = request.getSession();

        session.setAttribute("firstName", firstName);
        session.setAttribute("lastName", lastName);
        session.setAttribute("username", username);
        session.setAttribute("email", email);
        session.setAttribute("password", password);
        session.setAttribute("otp", String.valueOf(otp));

        // Send OTP Email
        boolean sent = EmailUtility.sendOTP(email, String.valueOf(otp));

        if (sent) {

            response.sendRedirect("verifyOtp.jsp");

        } else {

            response.sendRedirect("register.jsp?error=email");

        }

    }

}