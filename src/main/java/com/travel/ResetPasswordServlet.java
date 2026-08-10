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

@WebServlet("/ResetPasswordServlet")
public class ResetPasswordServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request,
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

        String newPassword = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("confirmPassword");

        // Password Match Check

        if (!newPassword.equals(confirmPassword)) {

            response.sendRedirect("resetPassword.jsp?error=password");

            return;

        }

        try {

            Connection con = DBConnection.getConnection();

            String query =
                    "UPDATE users SET password=? WHERE email=?";

            PreparedStatement ps = con.prepareStatement(query);

            ps.setString(1, newPassword);
            ps.setString(2, email);

            int rows = ps.executeUpdate();

            ps.close();
            con.close();

            if (rows > 0) {

                session.removeAttribute("forgotOtp");
                session.removeAttribute("forgotEmail");

                response.sendRedirect("login.jsp?success=reset");

            } else {

                response.sendRedirect("resetPassword.jsp?error=database");

            }

        } catch (Exception e) {

            e.printStackTrace();

            response.sendRedirect("resetPassword.jsp?error=server");

        }

    }

}