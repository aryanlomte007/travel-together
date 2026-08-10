package com.travel;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/VerifyOtpServlet")
public class VerifyOtpServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        String enteredOtp = request.getParameter("otp");
        String sessionOtp = (String) session.getAttribute("otp");

        if (sessionOtp == null) {

            response.sendRedirect("register.jsp");
            return;

        }

        if (enteredOtp.equals(sessionOtp)) {

            String firstName = (String) session.getAttribute("firstName");
            String lastName = (String) session.getAttribute("lastName");
            String username = (String) session.getAttribute("username");
            String email = (String) session.getAttribute("email");
            String password = (String) session.getAttribute("password");

            try {

                Connection con = DBConnection.getConnection();

                String query =
                        "INSERT INTO users(first_name,last_name,username,email,password,role) VALUES(?,?,?,?,?,?)";

                PreparedStatement ps = con.prepareStatement(query);

                ps.setString(1, firstName);
                ps.setString(2, lastName);
                ps.setString(3, username);
                ps.setString(4, email);
                ps.setString(5, password);
                ps.setString(6, "user");

                ps.executeUpdate();

                ps.close();
                con.close();

                session.invalidate();

                response.sendRedirect("login.jsp?success=registered");

            } catch (Exception e) {

                e.printStackTrace();

                response.sendRedirect("register.jsp?error=database");

            }

        } else {

            response.sendRedirect("verifyOtp.jsp?error=otp");

        }

    }

}