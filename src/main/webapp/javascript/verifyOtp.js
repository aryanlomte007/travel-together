document.addEventListener("DOMContentLoaded", function () {

    const resendBtn = document.getElementById("resendOtp");
    const timer = document.getElementById("timer");

    if (!resendBtn || !timer) return;

    let seconds = 30;

    resendBtn.style.pointerEvents = "none";
    resendBtn.style.opacity = "0.5";

    timer.textContent = seconds;

    const countdown = setInterval(function () {

        seconds--;

        timer.textContent = seconds;

        if (seconds <= 0) {

            clearInterval(countdown);

            resendBtn.innerHTML = "Resend OTP";

            resendBtn.style.pointerEvents = "auto";
            resendBtn.style.opacity = "1";

            resendBtn.href = "RegisterServlet?resend=true";

        }

    }, 1000);

});