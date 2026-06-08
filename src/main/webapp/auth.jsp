<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
<title>TravelTogether</title>

<script>
function showLogin(){
document.getElementById("loginBox").style.display="block";
document.getElementById("registerBox").style.display="none";
}

function showRegister(){
document.getElementById("loginBox").style.display="none";
document.getElementById("registerBox").style.display="block";
}
</script>

</head>

<body style="margin:0;font-family:Arial;background:#0077cc;">

<div style="display:flex;justify-content:center;align-items:center;height:100vh;">

<div style="background:white;padding:40px;width:350px;border-radius:10px;box-shadow:0 0 15px gray;text-align:center;">

<h2>TravelTogether ✈️</h2>

<%
String error = request.getParameter("error");
String msg = request.getParameter("msg");

if("login".equals(error)){
%>
<p style="color:red;">Invalid username or password</p>
<% } %>

<% if("registered".equals(msg)){ %>
<p style="color:green;">Registration successful. Please login.</p>
<% } %>

<button onclick="showLogin()" style="margin:5px;">Login</button>
<button onclick="showRegister()" style="margin:5px;">Register</button>

<!-- Login -->
<div id="loginBox">

<form action="LoginServlet" method="post">

<input required type="text" name="username" placeholder="Username"
style="width:100%;padding:10px;margin:10px 0;"><br>

<input required type="password" name="password" placeholder="Password"
style="width:100%;padding:10px;margin:10px 0;"><br>

<button type="submit"
style="width:100%;padding:12px;background:#0077cc;color:white;border:none;border-radius:5px;">
Login
</button>

</form>

</div>

<!-- Register -->
<div id="registerBox" style="display:none;">

<form action="RegisterServlet" method="post">

<input required type="text" name="username" placeholder="Username"
style="width:100%;padding:10px;margin:10px 0;"><br>

<input required type="password" name="password" placeholder="Password"
style="width:100%;padding:10px;margin:10px 0;"><br>

<button type="submit"
style="width:100%;padding:12px;background:#28a745;color:white;border:none;border-radius:5px;">
Register
</button>

</form>

</div>

</div>
</div>

</body>
</html>