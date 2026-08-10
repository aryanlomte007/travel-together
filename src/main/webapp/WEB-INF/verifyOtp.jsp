<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Verify OTP | Travel Together</title>

<link rel="preconnect" href="https://fonts.googleapis.com">

<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">

<link rel="stylesheet" href="css/auth.css">

</head>

<body class="otp-page">

<div class="otp-overlay">

    <!-- App Title -->

    <div class="otp-header">

        <h1 class="app-name">

            <span class="travel">Travel</span>

            <span class="together">Together</span>

        </h1>

        <p class="tagline">

            Verify your email to continue.

        </p>

    </div>

    <!-- OTP Card -->

    <div class="otp-card">

        <h2>Email Verification 📧</h2>

        <p class="desc">

            Enter the 6-digit OTP sent to your email.

        </p>

        <form action="VerifyOtpServlet" method="post">

            <input
                type="text"
                name="otp"
                maxlength="6"
                placeholder="Enter OTP"
                required>

            <button type="submit">

                Verify OTP

            </button>

        </form>

        <div class="links">

            Didn't receive the OTP?

            <a href="register.jsp">

                Register Again

            </a>

        </div>

    </div>

</div>

</body>

</html>