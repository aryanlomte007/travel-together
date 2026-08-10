<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Travel Together | Verify OTP</title>

<!-- Google Font -->

<link rel="preconnect" href="https://fonts.googleapis.com">

<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">

<!-- CSS -->

<link rel="stylesheet" href="css/auth.css">

</head>

<body class="register-page">

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
            OTP CARD
    =========================== -->

    <div class="otp-card">

        <h2>Verify Your Email 📧</h2>

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

            <br><br>

            <a href="#" id="resendOtp">

                Resend OTP (<span id="timer">30</span>s)

            </a>

        </div>

    </div>

</div>

<script src="javascript/verifyOtp.js"></script>

</body>

</html>