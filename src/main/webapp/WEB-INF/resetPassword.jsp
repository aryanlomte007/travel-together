<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Travel Together | Reset Password</title>

<!-- Google Font -->

<link rel="preconnect" href="https://fonts.googleapis.com">

<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">

<!-- Font Awesome -->

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">

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
        RESET PASSWORD CARD
    =========================== -->

    <div class="login-card">

        <h2>Reset Password</h2>

        <p class="desc">

            Create a new password for your account.

        </p>

        <form action="ResetPasswordServlet" method="post">

            <div class="password-box">

                <input
                    type="password"
                    id="newPassword"
                    name="newPassword"
                    placeholder="New Password"
                    required>

                <i class="fa-solid fa-eye toggle-password"
                   onclick="togglePassword('newPassword', this)">
                </i>

            </div>

            <div class="password-box">

                <input
                    type="password"
                    id="confirmPassword"
                    name="confirmPassword"
                    placeholder="Confirm Password"
                    required>

                <i class="fa-solid fa-eye toggle-password"
                   onclick="togglePassword('confirmPassword', this)">
                </i>

            </div>

            <button type="submit">

                Update Password

            </button>

        </form>

        <div class="links">

            <a href="login.jsp">

                Back to Login

            </a>

        </div>

    </div>

</div>

<script src="javascript/auth.js"></script>

</body>

</html>