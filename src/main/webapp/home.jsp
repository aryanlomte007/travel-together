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
<title>Home</title>
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
<a href="home.jsp" style="color:yellow;margin-right:20px;">Home</a>
<a href="viewTrips.jsp" style="color:white;margin-right:20px;">My Trips</a>
<a href="chat.jsp" style="color:white;margin-right:20px;">Chat</a>
<a href="profile.jsp"
style="background:white;color:#0077cc;padding:6px 15px;
border-radius:15px;text-decoration:none;">
Profile
</a>
</div>

</div>

<!-- ⭐ Main Card -->
<div style="padding:80px;display:flex;justify-content:center;">

<div style="
background:white;
padding:50px;
border-radius:15px;
box-shadow:0 10px 25px rgba(0,0,0,0.1);
width:420px;
text-align:center;
">

<h2>Welcome, <%= user %> 👋</h2>

<p style="color:gray;margin-bottom:35px;">
Plan and manage your trips easily.
</p>

<a href="createTrip.jsp" style="text-decoration:none;">
<button style="
width:100%;
padding:14px;
background:#0077cc;
color:white;
border:none;
border-radius:8px;
font-size:16px;
font-weight:bold;
cursor:pointer;
">
✈ Create New Trip
</button>
</a>

<br><br>

<a href="viewTrips.jsp" style="text-decoration:none;">
<button style="
width:100%;
padding:14px;
background:#28a745;
color:white;
border:none;
border-radius:8px;
font-size:16px;
font-weight:bold;
cursor:pointer;
">
📋 View My Trips
</button>
</a>

<br><br>

<a href="chat.jsp" style="text-decoration:none;">
<button style="
width:100%;
padding:14px;
background:#ff9800;
color:white;
border:none;
border-radius:8px;
font-size:16px;
font-weight:bold;
cursor:pointer;
">
💬 Group Chat
</button>
</a>

</div>

</div>

<!-- ⭐ Simple Travel Blog Section (TEXT ONLY) -->
<div style="padding:40px;text-align:center;">

<h2>🌍 Travel Inspiration</h2>

<p style="color:gray;max-width:600px;margin:auto;">
Explore amazing destinations like Goa beaches, Manali mountains,
Jaipur heritage sites, and Kerala backwaters. Plan your next trip
with ease using Travel Together.
</p>

</div>

</body>
</html>