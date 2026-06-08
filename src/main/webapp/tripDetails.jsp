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
PreparedStatement ps = con.prepareStatement(
"SELECT * FROM trips WHERE id=?"
);
ps.setInt(1, id);
ResultSet rs = ps.executeQuery();

if(!rs.next()){
    out.println("<h2>Trip not found</h2>");
    return;
}

/* ⭐ TRIP STATUS */
java.sql.Date travelDate = rs.getDate("travel_date");
java.sql.Date today = new java.sql.Date(System.currentTimeMillis());

String status;

if(travelDate.after(today)){
    status = "Upcoming";
}
else if(travelDate.equals(today)){
    status = "Ongoing";
}
else{
    status = "Completed";
}

/* ⭐ COUNTDOWN */
long diff = travelDate.getTime() - today.getTime();
long daysLeft = diff / (1000 * 60 * 60 * 24);

/* ⭐ TOTAL EXPENSE */
PreparedStatement psExp = con.prepareStatement(
"SELECT SUM(amount) FROM expenses WHERE trip_id=?"
);
psExp.setInt(1, id);
ResultSet rsExp = psExp.executeQuery();

int totalExpense = 0;
if(rsExp.next()){
    totalExpense = rsExp.getInt(1);
}

/* ⭐ TOTAL PLANS */
PreparedStatement psPlan = con.prepareStatement(
"SELECT COUNT(*) FROM itinerary WHERE trip_id=?"
);
psPlan.setInt(1, id);
ResultSet rsPlan = psPlan.executeQuery();

int totalPlans = 0;
if(rsPlan.next()){
    totalPlans = rsPlan.getInt(1);
}

int budget = rs.getInt("budget");
int remaining = budget - totalExpense;
String dest = rs.getString("destination").replace(" ", "+");
%>

<html>
<head>
<title>Trip Details</title>
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
<a href="viewTrips.jsp" style="color:white;margin-right:20px;">My Trips</a>
<a href="profile.jsp"
style="background:white;color:#0077cc;padding:6px 15px;
border-radius:15px;text-decoration:none;">
Profile
</a>
</div>

</div>

<!-- ⭐ Card -->
<div style="padding:60px;display:flex;justify-content:center;">

<div style="
background:white;
padding:40px;
border-radius:15px;
box-shadow:0 10px 25px rgba(0,0,0,0.1);
width:520px;
text-align:center;
">

<h2><%= rs.getString("trip_name") %> ✈</h2>

<p><b>Destination:</b> <%= rs.getString("destination") %></p>
<p><b>Travel Date:</b> <%= rs.getString("travel_date") %></p>

<p><b>Status:</b>
<span style="font-weight:bold;color:
<%= status.equals("Upcoming") ? "blue" :
    status.equals("Ongoing") ? "green" :
    "red" %>;">
<%= status %>
</span>
</p>

<%
if(daysLeft > 0){
%>
<p style="color:#0077cc;font-weight:bold;">
⏳ <%= daysLeft %> days left for trip
</p>
<%
}
%>

<p><b>People:</b> <%= rs.getInt("people") %></p>
<p><b>Budget:</b> ₹ <%= budget %></p>

<hr style="margin:20px 0;">

<h3>Trip Summary 📊</h3>

<p>Total Expense: ₹ <%= totalExpense %></p>

<p style="font-weight:bold;
color:<%= remaining < 0 ? "red" : "green" %>;">
Remaining Budget: ₹ <%= remaining %>
</p>

<%
if(remaining < 0){
%>
<p style="color:red;font-weight:bold;">
⚠ Budget Exceeded
</p>
<%
}
%>

<p>Places Planned: <%= totalPlans %></p>

<hr style="margin:20px 0;">

<h3>Bookings ✈</h3>

<a target="_blank"
href="https://www.makemytrip.com/hotels/?city=<%= dest %>"
style="display:inline-block;margin:6px;background:#e74c3c;color:white;padding:8px 14px;border-radius:6px;text-decoration:none;">
🏨 Hotels (MMT)
</a>

<a target="_blank"
href="https://www.goibibo.com/hotels/find-hotels-in-<%= dest %>/"
style="display:inline-block;margin:6px;background:#f39c12;color:white;padding:8px 14px;border-radius:6px;text-decoration:none;">
🏨 Hotels (Goibibo)
</a>

<a target="_blank"
href="https://www.booking.com/searchresults.html?ss=<%= dest %>"
style="display:inline-block;margin:6px;background:#3498db;color:white;padding:8px 14px;border-radius:6px;text-decoration:none;">
🏨 Hotels (Booking)
</a>

<hr style="margin:25px 0;">

<a href="expense.jsp?tripId=<%= id %>"
style="background:#17a2b8;color:white;padding:10px 18px;border-radius:6px;text-decoration:none;margin-right:10px;">
Manage Expenses
</a>

<a href="itinerary.jsp?tripId=<%= id %>"
style="background:#6f42c1;color:white;padding:10px 18px;border-radius:6px;text-decoration:none;margin-right:10px;">
View Itinerary
</a>

<a href="editTrip.jsp?id=<%= id %>"
style="background:#ffc107;color:black;padding:10px 18px;border-radius:6px;text-decoration:none;">
Edit Trip
</a>

</div>
</div>

</body>
</html>

<%
rs.close();
ps.close();
rsExp.close();
psExp.close();
rsPlan.close();
psPlan.close();
con.close();
%>