package com.travel;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/AddExpenseServlet")
public class AddExpenseServlet extends HttpServlet {

protected void doPost(HttpServletRequest request, HttpServletResponse response)
throws IOException {

int tripId = Integer.parseInt(request.getParameter("tripId"));
String title = request.getParameter("title");
int amount = Integer.parseInt(request.getParameter("amount"));

try{

Connection con = DBConnection.getConnection();

PreparedStatement ps = con.prepareStatement(
"insert into expenses(trip_id,title,amount) values(?,?,?)"
);

ps.setInt(1, tripId);
ps.setString(2, title);
ps.setInt(3, amount);

ps.executeUpdate();

response.sendRedirect("expense.jsp?tripId="+tripId);

}
catch(Exception e){
response.getWriter().println(e);
}

}
}