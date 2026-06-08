package com.travel;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/AddItineraryServlet")
public class AddItineraryServlet extends HttpServlet {

protected void doPost(HttpServletRequest request, HttpServletResponse response)
throws IOException {

int tripId = Integer.parseInt(request.getParameter("tripId"));
String plan = request.getParameter("plan");

try{

Connection con = DBConnection.getConnection();

PreparedStatement ps = con.prepareStatement(
"insert into itinerary(trip_id,day_plan) values(?,?)"
);

ps.setInt(1, tripId);
ps.setString(2, plan);

ps.executeUpdate();

response.sendRedirect("itinerary.jsp?tripId="+tripId);

}
catch(Exception e){
response.getWriter().println(e);
}

}
}