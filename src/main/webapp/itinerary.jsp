<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.travel.DBConnection" %>

<%
int tripId = Integer.parseInt(request.getParameter("tripId"));
Connection con = DBConnection.getConnection();

/* ⭐ ADD PLAN */
if(request.getParameter("place") != null){

PreparedStatement ins = con.prepareStatement(
"INSERT INTO itinerary(trip_id,day_no,place,visit_time,notes) VALUES(?,?,?,?,?)"
);

ins.setInt(1, tripId);
ins.setInt(2, Integer.parseInt(request.getParameter("day")));
ins.setString(3, request.getParameter("place"));
ins.setString(4, request.getParameter("time"));
ins.setString(5, request.getParameter("notes"));

ins.executeUpdate();
}
%>

<html>
<head>
<title>Trip Itinerary</title>
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

<div style="width:750px;margin:40px auto;background:white;
padding:30px;border-radius:15px;
box-shadow:0 10px 30px rgba(0,0,0,0.15);">

<h2 style="text-align:center;margin-bottom:20px;">Trip Itinerary 🗺</h2>

<!-- ⭐ Add Plan -->
<form>
<input type="hidden" name="tripId" value="<%= tripId %>">

<input name="day" type="number" placeholder="Day Number"
required style="width:100%;padding:10px;margin-top:10px;border-radius:6px;border:1px solid #ccc;">

<input name="place" placeholder="Place to Visit"
required style="width:100%;padding:10px;margin-top:10px;border-radius:6px;border:1px solid #ccc;">

<input name="time" placeholder="Visit Time (ex: 10 AM)"
required style="width:100%;padding:10px;margin-top:10px;border-radius:6px;border:1px solid #ccc;">

<input name="notes" placeholder="Notes"
required style="width:100%;padding:10px;margin-top:10px;border-radius:6px;border:1px solid #ccc;">

<button style="margin-top:12px;padding:10px 25px;
background:#6f42c1;color:white;border:none;border-radius:6px;font-weight:bold;">
Add Plan
</button>
</form>

<hr style="margin:30px 0;">

<h3>Day Wise Plan</h3>

<%
PreparedStatement ps = con.prepareStatement(
"SELECT * FROM itinerary WHERE trip_id=? ORDER BY day_no, visit_time"
);
ps.setInt(1, tripId);
ResultSet rs = ps.executeQuery();

int lastDay = -1;
String dayRoute = "";
String fullRoute = "";

while(rs.next()){

int day = rs.getInt("day_no");

if(day != lastDay){

if(lastDay != -1){
%>

<a target="_blank"
href="https://www.google.com/maps/dir/<%= dayRoute %>"
style="display:inline-block;margin:10px 0;background:#28a745;color:white;padding:6px 14px;border-radius:6px;text-decoration:none;font-size:13px;">
📍 Day <%= lastDay %> Route
</a>

<%
}

dayRoute = "";
%>

<div style="
margin-top:20px;
background:#6f42c1;
color:white;
padding:8px 15px;
border-radius:8px;
font-weight:bold;">
📅 Day <%= day %>
</div>

<%
lastDay = day;
}

String place = rs.getString("place").replace(" ","+");
dayRoute += place + "/";
fullRoute += place + "/";
%>

<div style="
background:#f8f9fa;
margin-top:10px;
padding:12px;
border-radius:8px;
display:flex;
justify-content:space-between;
align-items:center;
">

<div>
<b><%= rs.getString("place") %></b><br>

<small>
🕒 <%= rs.getString("visit_time") %> |
📝 <%= rs.getString("notes") %>
</small>

<br>

<a target="_blank"
href="https://www.google.com/maps/search/<%= place %>"
style="display:inline-block;margin-top:5px;background:#17a2b8;color:white;padding:4px 10px;border-radius:5px;text-decoration:none;font-size:12px;">
📍 Open Map
</a>

</div>

<div>
<a href="deletePlan.jsp?id=<%= rs.getInt("id") %>&tripId=<%= tripId %>"
style="background:#ff4d4d;color:white;padding:5px 12px;
text-decoration:none;border-radius:5px;font-size:13px;">
Delete
</a>
</div>

</div>

<%
}
%>

<!-- ⭐ Last Day Route -->
<a target="_blank"
href="https://www.google.com/maps/dir/<%= dayRoute %>"
style="display:inline-block;margin:10px 0;background:#28a745;color:white;padding:6px 14px;border-radius:6px;text-decoration:none;font-size:13px;">
📍 Day <%= lastDay %> Route
</a>

<!-- ⭐ Full Trip Route -->
<a target="_blank"
href="https://www.google.com/maps/dir/<%= fullRoute %>"
style="display:block;text-align:center;margin-top:25px;background:#0077cc;color:white;padding:10px;border-radius:8px;text-decoration:none;font-weight:bold;">
🧭 Full Trip Route
</a>

<br>

<a href="tripDetails.jsp?id=<%= tripId %>"
style="text-decoration:none;color:#0077cc;font-weight:bold;">
⬅ Back to Trip
</a>

</div>

</body>
</html>

<%
rs.close();
ps.close();
con.close();
%>