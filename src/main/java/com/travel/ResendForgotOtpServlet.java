package com.travel;

import java.io.IOException;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/ResendForgotOtpServlet")
public class ResendForgotOtpServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null) {

            response.sendRedirect("forgotPassword.jsp");

            return;

        }

        String email = (String) session.getAttribute("forgotEmail");

        if (email == null) {

            response.sendRedirect("forgotPassword.jsp");

            return;

        }

        // Generate New OTP

        Random random = new Random();

        String otp = String.format("%06d",
                random.nextInt(1000000));

        // Save New OTP

        session.setAttribute("forgotOtp", otp);

        // Send Email

        boolean sent = EmailUtility.sendOTP(email, otp);

        if (sent) {

            response.sendRedirect("verifyForgotOtp.jsp?msg=resent");

        } else {

            response.sendRedirect("verifyForgotOtp.jsp?error=email");

        }

    }

}