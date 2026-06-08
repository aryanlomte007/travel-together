<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.travel.DBConnection" %>

<%
String user = (String) session.getAttribute("user");
String role = (String) session.getAttribute("role");

if(user == null){
    response.sendRedirect("auth.jsp");
    return;
}

Connection con = DBConnection.getConnection();

PreparedStatement ps;

if("admin".equals(role)){
    ps = con.prepareStatement("SELECT * FROM trips");
}else{
    ps = con.prepareStatement("SELECT * FROM trips WHERE created_by=?");
    ps.setString(1, user);
}

ResultSet rs = ps.executeQuery();
%>

<html>
<head>
<title>My Trips</title>
</head>

<body style="margin:0;font-family:Arial;background:#f4f6f9;">

<!-- ⭐ Navbar -->
<div style="
background:linear-gradient(90deg,#0077cc,#00c6ff);
padding:15px 30px;
display:flex;
justify-content:space-between;
align-items:center;
">

<div style="color:white;font-size:22px;font-weight:bold;">
✈ Travel Together
</div>

<div>
<a href="home.jsp" style="color:white;margin-right:20px;">Home</a>
<a href="viewTrips.jsp" style="color:yellow;margin-right:20px;">My Trips</a>
<a href="profile.jsp"
style="background:white;color:#0077cc;padding:6px 15px;
border-radius:15px;text-decoration:none;">
Profile
</a>
</div>

</div>

<!-- ⭐ Container -->
<div style="padding:60px;display:flex;justify-content:center;">

<div style="
background:white;
padding:40px;
border-radius:15px;
box-shadow:0 10px 25px rgba(0,0,0,0.1);
width:85%;
">

<h2 style="text-align:center;margin-bottom:25px;">My Trips ✈</h2>

<table style="width:100%;border-collapse:collapse;font-size:16px;">

<tr style="background:#0077cc;color:white;">
<th style="padding:14px;">Trip Name</th>
<th style="padding:14px;">Destination</th>
<th style="padding:14px;">Date</th>
<th style="padding:14px;">People</th>
<th style="padding:14px;">Budget</th>
<th style="padding:14px;">Action</th>
</tr>

<%
boolean hasData = false;

while(rs.next()){
hasData = true;
%>

<tr style="text-align:center;border-bottom:1px solid #eee;">

<td style="padding:12px;"><%= rs.getString("trip_name") %></td>
<td style="padding:12px;"><%= rs.getString("destination") %></td>
<td style="padding:12px;"><%= rs.getString("travel_date") %></td>
<td style="padding:12px;"><%= rs.getInt("people") %></td>
<td style="padding:12px;">₹ <%= rs.getInt("budget") %></td>

<td style="padding:12px;">

<a href="tripDetails.jsp?id=<%= rs.getInt("id") %>"
style="background:#0077cc;color:white;padding:6px 12px;border-radius:6px;text-decoration:none;font-weight:bold;">
Open
</a>

<a href="editTrip.jsp?id=<%= rs.getInt("id") %>"
style="background:#ffc107;color:black;padding:6px 12px;border-radius:6px;text-decoration:none;font-weight:bold;margin-left:6px;">
Edit
</a>

<%
if("admin".equals(role)){
%>
<a href="DeleteTripServlet?id=<%= rs.getInt("id") %>"
style="background:#ff4d4d;color:white;padding:6px 12px;border-radius:6px;text-decoration:none;font-weight:bold;margin-left:6px;">
Delete
</a>
<%
}
%>

</td>

</tr>

<%
}

if(!hasData){
%>

<tr>
<td colspan="6" style="padding:40px;text-align:center;color:gray;font-size:18px;">
😕 No trips created yet
</td>
</tr>

<%
}
%>

</table>

</div>
</div>

</body>
</html>

<%
rs.close();
ps.close();
con.close();
%>