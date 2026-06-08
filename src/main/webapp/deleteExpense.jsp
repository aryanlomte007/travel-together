<%@ page import="java.sql.*" %>
<%@ page import="com.travel.DBConnection" %>

<%
int id = Integer.parseInt(request.getParameter("id"));
int tripId = Integer.parseInt(request.getParameter("tripId"));

Connection con = DBConnection.getConnection();

PreparedStatement ps = con.prepareStatement(
"DELETE FROM expenses WHERE id=?"
);

ps.setInt(1, id);
ps.executeUpdate();

response.sendRedirect("expense.jsp?tripId=" + tripId);

con.close();
%>