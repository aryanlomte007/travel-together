<%@ page contentType="text/html;charset=UTF-8" %>

<%
String user = (String) session.getAttribute("user");
if(user == null){
    response.sendRedirect("login.jsp");
    return;
}
%>

<html>
<head>
<title>Group Chat</title>
</head>

<body style="margin:0;font-family:Arial;background:#f4f6f8;">

<!-- Navbar -->
<div style="background:#0077cc;color:white;padding:15px;">
    <h2>Travel Together - Group Chat</h2>
</div>

<!-- Chat Box -->
<div style="width:60%;margin:30px auto;background:white;
padding:20px;border-radius:10px;box-shadow:0 0 10px #ccc;">

    <h3>Trip Members Chat</h3>

    <!-- Messages Area -->
    <div style="height:250px;border:1px solid #ccc;
    padding:10px;overflow-y:scroll;margin-bottom:15px;">
        <p><b>Rahul:</b> When are we leaving?</p>
        <p><b>Priya:</b> Morning 6 AM.</p>
    </div>

    <!-- Message Input -->
    <input type="text" placeholder="Type message..."
    style="width:75%;padding:10px;border-radius:5px;border:1px solid #ccc;">

    <button style="padding:10px 20px;background:#0077cc;
    color:white;border:none;border-radius:5px;">
    Send
    </button>

</div>

</body>
</html>