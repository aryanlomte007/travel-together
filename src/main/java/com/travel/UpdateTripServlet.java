package com.travel;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/UpdateTripServlet")
public class UpdateTripServlet extends HttpServlet {

protected void doPost(HttpServletRequest request, HttpServletResponse response)
throws ServletException, IOException {

int id = Integer.parseInt(request.getParameter("id"));
String tripName = request.getParameter("tripName");
String destination = request.getParameter("destination");
String date = request.getParameter("travelDate");
int people = Integer.parseInt(request.getParameter("people"));
int budget = Integer.parseInt(request.getParameter("budget"));

try{

Connection con = DBConnection.getConnection();

PreparedStatement ps = con.prepareStatement(
"UPDATE trips SET trip_name=?, destination=?, travel_date=?, people=?, budget=? WHERE id=?"
);

ps.setString(1, tripName);
ps.setString(2, destination);
ps.setString(3, date);
ps.setInt(4, people);
ps.setInt(5, budget);
ps.setInt(6, id);

ps.executeUpdate();

response.sendRedirect("viewTrips.jsp");

}catch(Exception e){
e.printStackTrace();
}

}
}