<%@ page contentType="text/html;charset=UTF-8" %>

<%
String user = (String) session.getAttribute("user");
if(user == null){
    response.sendRedirect("auth.jsp");
    return;
}
%>

<html>
<head>
<title>Create Trip</title>
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
<a href="home.jsp" style="color:white;margin-right:20px;">Dashboard</a>
<a href="createTrip.jsp" style="color:yellow;margin-right:20px;">Create Trip</a>
<a href="LogoutServlet" style="background:white;color:#0077cc;padding:6px 15px;border-radius:15px;text-decoration:none;">Logout</a>
</div>

</div>

<!-- ⭐ Form -->
<div style="padding:70px;display:flex;justify-content:center;">

<div style="
background:white;
padding:40px;
width:420px;
border-radius:12px;
box-shadow:0 0 15px gray;
">

<h2 style="text-align:center;">Create New Trip ✈</h2>

<form action="CreateTripServlet" method="post">

<label>Trip Name</label>
<input required type="text" name="tripName" style="width:100%;padding:10px;margin-bottom:15px;">

<label>Destination</label>
<input required type="text" name="destination" style="width:100%;padding:10px;margin-bottom:15px;">

<label>Travel Date</label>
<input required type="date" name="travelDate" style="width:100%;padding:10px;margin-bottom:15px;">

<label>People</label>
<input required type="number" name="people" style="width:100%;padding:10px;margin-bottom:15px;">

<label>Budget</label>
<input required type="number" name="budget" style="width:100%;padding:10px;margin-bottom:20px;">

<button style="
width:100%;
padding:12px;
background:#0077cc;
color:white;
border:none;
border-radius:8px;
font-size:16px;
">
Create Trip
</button>

</form>

</div>

</div>

</body>
</html>