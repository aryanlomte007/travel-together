package com.travel;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/VerifyForgotOtpServlet")
public class VerifyForgotOtpServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null) {

            System.out.println("Session is NULL");

            response.sendRedirect("forgotPassword.jsp");

            return;

        }

        String enteredOtp = request.getParameter("otp");

        String sessionOtp = (String) session.getAttribute("forgotOtp");

        System.out.println("Entered OTP : " + enteredOtp);
        System.out.println("Session OTP : " + sessionOtp);

        if (sessionOtp == null) {

            System.out.println("Session OTP is NULL");

            response.sendRedirect("forgotPassword.jsp");

            return;

        }

        if (enteredOtp.equals(sessionOtp)) {

            System.out.println("OTP Verified Successfully");

            response.sendRedirect("resetPassword.jsp");

        } else {

            System.out.println("OTP Verification Failed");

            response.sendRedirect("verifyForgotOtp.jsp?error=otp");

        }

    }

}