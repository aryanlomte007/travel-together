/* ==========================================
        REGISTER PAGE VALIDATION
========================================== */

document.addEventListener("DOMContentLoaded", function () {

    const form = document.querySelector("form");
    const sendOtpBtn = document.querySelector(".send-otp");

    if (form && sendOtpBtn) {

        sendOtpBtn.addEventListener("click", function () {

            // Required Fields Check

            if (!form.checkValidity()) {

                form.reportValidity();
                return;

            }

            // Password Match Check

            const password = document.querySelector(
                "input[name='password']"
            ).value;

            const confirmPassword = document.querySelector(
                "input[name='confirmPassword']"
            ).value;

            if (password !== confirmPassword) {

                alert("Passwords do not match.");

                return;

            }

            // Disable Button

            sendOtpBtn.disabled = true;

            sendOtpBtn.innerHTML = "Sending OTP...";

            form.submit();

        });

    }

});


/* ==========================================
        SHOW / HIDE PASSWORD
========================================== */

function togglePassword(id, icon){

    const input = document.getElementById(id);

    if(input.type === "password"){

        input.type = "text";

        icon.classList.remove("fa-eye");
        icon.classList.add("fa-eye-slash");

    }else{

        input.type = "password";

        icon.classList.remove("fa-eye-slash");
        icon.classList.add("fa-eye");

    }

}

/* ==========================================
        OTP RESEND TIMER
========================================== */

document.addEventListener("DOMContentLoaded", function () {

    console.log("OTP JS Loaded");

    const resendBtn = document.getElementById("resendOtp");
    const timer = document.getElementById("timer");

    console.log(resendBtn);
    console.log(timer);

    if (!resendBtn || !timer) {
        console.log("Timer elements not found");
        return;
    }

    let seconds = 30;

    resendBtn.style.pointerEvents = "none";
    resendBtn.style.opacity = "0.5";

    timer.textContent = seconds;

    const countdown = setInterval(function () {

        console.log(seconds);

        timer.textContent = seconds;

        if (seconds <= 0) {

            clearInterval(countdown);

            resendBtn.textContent = "Resend OTP";

            resendBtn.style.pointerEvents = "auto";
            resendBtn.style.opacity = "1";

            return;
        }

        seconds--;

    }, 1000);

});