<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.travel.DBConnection" %>

<%
int tripId = Integer.parseInt(request.getParameter("tripId"));
Connection con = DBConnection.getConnection();

/* ⭐ ADD EXPENSE */
if(request.getParameter("title") != null){

PreparedStatement ins = con.prepareStatement(
"INSERT INTO expenses(trip_id,title,amount,paid_by) VALUES(?,?,?,?)"
);

ins.setInt(1, tripId);
ins.setString(2, request.getParameter("title"));
ins.setInt(3, Integer.parseInt(request.getParameter("amount")));
ins.setString(4, request.getParameter("paid_by"));

ins.executeUpdate();
}
%>

<html>
<head>
<title>Manage Expenses</title>
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

<div style="width:650px;margin:40px auto;background:white;
padding:30px;border-radius:12px;
box-shadow:0 8px 25px rgba(0,0,0,0.12);">

<h2 style="text-align:center;margin-bottom:20px;">Manage Expenses 💰</h2>

<!-- ⭐ Add Expense Form -->
<form>

<input type="hidden" name="tripId" value="<%= tripId %>">

<input name="title" placeholder="Expense Title"
required style="width:100%;padding:10px;margin-top:10px;border-radius:6px;border:1px solid #ccc;">

<input name="amount" type="number" placeholder="Amount"
required style="width:100%;padding:10px;margin-top:10px;border-radius:6px;border:1px solid #ccc;">

<input name="paid_by" placeholder="Paid By"
required style="width:100%;padding:10px;margin-top:10px;border-radius:6px;border:1px solid #ccc;">

<button style="margin-top:12px;padding:10px 22px;
background:#0077cc;color:white;border:none;border-radius:6px;font-weight:bold;">
Add Expense
</button>

</form>

<hr style="margin:25px 0;">

<h3>Expense List</h3>

<table style="width:100%;border-collapse:collapse;font-size:15px;">

<tr style="background:#0077cc;color:white;">
<th style="padding:10px;">Title</th>
<th style="padding:10px;">Amount</th>
<th style="padding:10px;">Paid By</th>
<th style="padding:10px;">Action</th>
</tr>

<%
PreparedStatement ps = con.prepareStatement(
"SELECT * FROM expenses WHERE trip_id=?"
);

ps.setInt(1, tripId);
ResultSet rs = ps.executeQuery();

int total = 0;

while(rs.next()){
total += rs.getInt("amount");
%>

<tr style="text-align:center;border-bottom:1px solid #eee;">

<td style="padding:8px;"><%= rs.getString("title") %></td>
<td style="padding:8px;">₹ <%= rs.getInt("amount") %></td>
<td style="padding:8px;"><%= rs.getString("paid_by") %></td>

<td style="padding:8px;">
<a href="deleteExpense.jsp?id=<%= rs.getInt("id") %>&tripId=<%= tripId %>"
style="background:#ff4d4d;color:white;padding:5px 12px;
text-decoration:none;border-radius:5px;font-size:13px;">
Delete
</a>
</td>

</tr>

<%
}
%>

</table>

<%
/* ⭐ GET PEOPLE COUNT */
PreparedStatement psPeople = con.prepareStatement(
"SELECT people FROM trips WHERE id=?"
);
psPeople.setInt(1, tripId);
ResultSet rsPeople = psPeople.executeQuery();

int people = 1;

if(rsPeople.next()){
people = rsPeople.getInt("people");
}

int perPerson = 0;
if(people > 0){
perPerson = total / people;
}
%>

<h3 style="margin-top:15px;">Total Expense: ₹ <%= total %></h3>
<h3>Cost Per Person: ₹ <%= perPerson %></h3>

<br>

<a href="tripDetails.jsp?id=<%= tripId %>"
style="text-decoration:none;color:#0077cc;font-weight:bold;">
⬅ Back to Trip
</a>

</div>

</body>
</html>

<%
rsPeople.close();
psPeople.close();
rs.close();
ps.close();
con.close();
%>