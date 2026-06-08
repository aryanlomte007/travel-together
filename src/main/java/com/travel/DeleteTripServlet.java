package com.travel;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/DeleteTripServlet")
public class DeleteTripServlet extends HttpServlet {

protected void doGet(HttpServletRequest request, HttpServletResponse response)
throws ServletException, IOException {

try{

int id = Integer.parseInt(request.getParameter("id"));

Connection con = DBConnection.getConnection();

PreparedStatement ps = con.prepareStatement(
"DELETE FROM trips WHERE id=?"
);

ps.setInt(1, id);

ps.executeUpdate();

response.sendRedirect("viewTrips.jsp");

}
catch(Exception e){
e.printStackTrace();
response.sendRedirect("viewTrips.jsp?error=1");
}

}
}