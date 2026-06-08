package com.travel;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/EditBookingServlet")
public class EditTripServlet extends HttpServlet {

protected void doPost(HttpServletRequest request, HttpServletResponse response)
throws ServletException, IOException {

int id = Integer.parseInt(request.getParameter("id"));
String destination = request.getParameter("destination");
String date = request.getParameter("date");
int people = Integer.parseInt(request.getParameter("people"));
int budget = Integer.parseInt(request.getParameter("budget"));

try {

Connection con = DBConnection.getConnection();

PreparedStatement ps = con.prepareStatement(
"update bookings set destination=?, travel_date=?, people=?, budget=? where id=?"
);

ps.setString(1, destination);
ps.setString(2, date);
ps.setInt(3, people);
ps.setInt(4, budget);
ps.setInt(5, id);

ps.executeUpdate();

response.sendRedirect("viewBookings.jsp");

}
catch(Exception e){
response.getWriter().println(e);
}

}
}