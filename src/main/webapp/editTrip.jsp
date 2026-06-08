<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.travel.DBConnection" %>

<%
String user = (String) session.getAttribute("user");
if(user == null){
    response.sendRedirect("auth.jsp");
    return;
}

int id = Integer.parseInt(request.getParameter("id"));

Connection con = DBConnection.getConnection();

/* ⭐ UPDATE LOGIC */
if(request.getParameter("trip_name") != null){

PreparedStatement upd = con.prepareStatement(
"UPDATE trips SET trip_name=?, destination=?, travel_date=?, people=?, budget=? WHERE id=?"
);

upd.setString(1, request.getParameter("trip_name"));
upd.setString(2, request.getParameter("destination"));
upd.setString(3, request.getParameter("travel_date"));
upd.setInt(4, Integer.parseInt(request.getParameter("people")));
upd.setInt(5, Integer.parseInt(request.getParameter("budget")));
upd.setInt(6, id);

upd.executeUpdate();

response.sendRedirect("tripDetails.jsp?id=" + id);
}

/* ⭐ FETCH DATA */
PreparedStatement ps = con.prepareStatement(
"SELECT * FROM trips WHERE id=?"
);
ps.setInt(1, id);
ResultSet rs = ps.executeQuery();

if(!rs.next()){
    out.println("Trip not found");
    return;
}
%>

<html>
<head>
<title>Edit Trip</title>
</head>

<body style="margin:0;font-family:Arial;background:#f4f6f9;">

<!-- ⭐ Navbar -->
<div style="
background: linear-gradient(90deg,#0077cc,#00c6ff);
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
<a href="viewTrips.jsp" style="color:white;margin-right:20px;">My Trips</a>
<a href="profile.jsp"
style="background:white;color:#0077cc;padding:6px 15px;
border-radius:15px;text-decoration:none;">
Profile
</a>
</div>

</div>

<div style="width:500px;margin:60px auto;background:white;
padding:35px;border-radius:12px;
box-shadow:0 8px 25px rgba(0,0,0,0.12);">

<h2 style="text-align:center;">Edit Trip ✏</h2>

<form>

<input type="hidden" name="id" value="<%= id %>">

<input name="trip_name"
value="<%= rs.getString("trip_name") %>"
required style="width:100%;padding:10px;margin-top:12px;border-radius:6px;border:1px solid #ccc;">

<input name="destination"
value="<%= rs.getString("destination") %>"
required style="width:100%;padding:10px;margin-top:12px;border-radius:6px;border:1px solid #ccc;">

<input type="date" name="travel_date"
value="<%= rs.getString("travel_date") %>"
required style="width:100%;padding:10px;margin-top:12px;border-radius:6px;border:1px solid #ccc;">

<input type="number" name="people"
value="<%= rs.getInt("people") %>"
required style="width:100%;padding:10px;margin-top:12px;border-radius:6px;border:1px solid #ccc;">

<input type="number" name="budget"
value="<%= rs.getInt("budget") %>"
required style="width:100%;padding:10px;margin-top:12px;border-radius:6px;border:1px solid #ccc;">

<button style="margin-top:15px;padding:10px 25px;
background:#ffc107;border:none;border-radius:6px;font-weight:bold;">
Update Trip
</button>

</form>

<br>

<a href="tripDetails.jsp?id=<%= id %>"
style="text-decoration:none;color:#0077cc;font-weight:bold;">
⬅ Back
</a>

</div>

</body>
</html>

<%
rs.close();
ps.close();
con.close();
%>