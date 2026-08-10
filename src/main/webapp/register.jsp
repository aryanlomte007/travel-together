<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Travel Together | Register</title>

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
            REGISTER CARD
    =========================== -->

    <div class="register-card">

        <h2>Create Account</h2>

        <p class="desc">

            Join us and start planning smarter journeys.

        </p>

        <form action="RegisterServlet" method="post">

            <!-- First Name & Last Name -->

            <div class="register-row">

                <input
                    type="text"
                    name="firstName"
                    placeholder="First Name"
                    required>

                <input
                    type="text"
                    name="lastName"
                    placeholder="Last Name"
                    required>

            </div>

            <!-- Username & Email -->

            <div class="register-row">

                <input
                    type="text"
                    name="username"
                    placeholder="Username"
                    required>

                <input
                    type="email"
                    name="email"
                    placeholder="Email Address"
                    required>

            </div>

            <!-- Password & Confirm Password -->

            <div class="register-row">

                <div class="password-box">

                    <input
                        type="password"
                        id="password"
                        name="password"
                        placeholder="Password"
                        required>

                    <i class="fa-solid fa-eye toggle-password"
                       onclick="togglePassword('password', this)">
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

            </div>

            <button
                type="button"
                class="send-otp">

                Send OTP

            </button>

        </form>

        <div class="links">

            Already have an account?

            <a href="login.jsp">

                Login

            </a>

        </div>

    </div>

</div>

<script src="javascript/auth.js"></script>

</body>

</html>