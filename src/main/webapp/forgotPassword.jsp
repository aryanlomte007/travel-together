<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Travel Together | Forgot Password</title>

<!-- Google Font -->

<link rel="preconnect" href="https://fonts.googleapis.com">

<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">

<!-- CSS -->

<link rel="stylesheet" href="css/auth.css">

</head>

<body class="login-page">

<div class="overlay">

    <!-- ==========================
            APP TITLE
    =========================== -->

    <div class="header">

        <h1 class="app-name">

            <span class="travel">

                Travel

            </span>

            <span class="together">

                Together

            </span>

        </h1>

        <p class="tagline">

            Your entire trip, in one single tap.

        </p>

    </div>

    <!-- ==========================
        FORGOT PASSWORD CARD
    =========================== -->

    <div class="login-card">

        <h2>Forgot Password?</h2>

        <p class="desc">

            Enter your registered email address.
            We'll send you a verification OTP.

        </p>

        <form action="ForgotPasswordServlet" method="post">

            <input
                type="email"
                name="email"
                placeholder="Enter Registered Email"
                required>

            <button type="submit">

                Send OTP

            </button>

        </form>

        <div class="links">

            Remember your password?

            <a href="login.jsp">

                Login

            </a>

        </div>

    </div>

</div>

</body>

</html>