package com.travel;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/CreateTripServlet")
public class CreateTripServlet extends HttpServlet {

protected void doPost(HttpServletRequest request, HttpServletResponse response)
throws ServletException, IOException {

HttpSession session = request.getSession();
String user = (String) session.getAttribute("user");

System.out.println("USER = " + user);

String tripName = request.getParameter("tripName");
String destination = request.getParameter("destination");
String travelDate = request.getParameter("travelDate");
String peopleStr = request.getParameter("people");
String budgetStr = request.getParameter("budget");

System.out.println(tripName + " " + destination + " " + travelDate + " " + peopleStr + " " + budgetStr);

try {

int people = Integer.parseInt(peopleStr);
int budget = Integer.parseInt(budgetStr);

Connection con = DBConnection.getConnection();

PreparedStatement ps = con.prepareStatement(
"INSERT INTO trips(trip_name,destination,travel_date,people,budget,created_by) VALUES(?,?,?,?,?,?)"
);

ps.setString(1, tripName);
ps.setString(2, destination);
ps.setString(3, travelDate);
ps.setInt(4, people);
ps.setInt(5, budget);
ps.setString(6, user);

int rows = ps.executeUpdate();

System.out.println("Inserted rows = " + rows);

response.sendRedirect("home.jsp");

}
catch(Exception e){
e.printStackTrace();
response.getWriter().println("ERROR = " + e);
}

}
}