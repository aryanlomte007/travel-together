package com.travel;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/ForgotPasswordServlet")
public class ForgotPasswordServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        System.out.println("===== ForgotPasswordServlet Called =====");

        String email = request.getParameter("email");

        System.out.println("Email Entered: " + email);

        try {

            Connection con = DBConnection.getConnection();

            String query = "SELECT * FROM users WHERE email=?";

            PreparedStatement ps = con.prepareStatement(query);

            ps.setString(1, email);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                System.out.println("Email Found in Database");

                // Generate 6-digit OTP

                Random random = new Random();

                String otp = String.format("%06d",
                        random.nextInt(1000000));

                System.out.println("Generated OTP : " + otp);

                // Store in Session

                HttpSession session = request.getSession();

                session.setAttribute("forgotOtp", otp);
                session.setAttribute("forgotEmail", email);

                // Send Email

                boolean sent = EmailUtility.sendOTP(email, otp);

                if (sent) {

                    System.out.println("OTP Sent Successfully");

                    response.sendRedirect("verifyForgotOtp.jsp");

                } else {

                    System.out.println("Email Sending Failed");

                    response.sendRedirect(
                            "forgotPassword.jsp?error=email");

                }

            } else {

                System.out.println("Email Not Found");

                response.sendRedirect(
                        "forgotPassword.jsp?error=notfound");

            }

            rs.close();
            ps.close();
            con.close();

        } catch (Exception e) {

            e.printStackTrace();

            response.sendRedirect(
                    "forgotPassword.jsp?error=server");

        }

    }

}