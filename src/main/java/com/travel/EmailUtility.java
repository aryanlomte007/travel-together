package com.travel;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class EmailUtility {

    // Sender Gmail Address
    private static final String EMAIL = "aryanlomte007@gmail.com";

    // Gmail App Password (16-character App Password)
    private static final String PASSWORD = "cghjrfnbhpxjocea";

    public static boolean sendOTP(String toEmail, String otp) {

        boolean sent = false;

        Properties properties = new Properties();

        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");
        properties.put("mail.smtp.host", "smtp.gmail.com");
        properties.put("mail.smtp.port", "587");

        Session session = Session.getInstance(properties,

                new Authenticator() {

                    @Override
                    protected PasswordAuthentication getPasswordAuthentication() {

                        return new PasswordAuthentication(EMAIL, PASSWORD);

                    }

                });

        try {

            Message message = new MimeMessage(session);

            message.setFrom(new InternetAddress(EMAIL, "Travel Together"));

            message.setRecipients(
                    Message.RecipientType.TO,
                    InternetAddress.parse(toEmail)
            );

            message.setSubject("Travel Together - Email Verification OTP");

            String mailBody =
                    "Hello,\n\n"
                  + "Welcome to Travel Together!\n\n"
                  + "Your One-Time Password (OTP) is:\n\n"
                  + "        " + otp + "\n\n"
                  + "This OTP is valid for 5 minutes.\n"
                  + "Please do not share it with anyone.\n\n"
                  + "If you did not request this verification, you can safely ignore this email.\n\n"
                  + "Regards,\n"
                  + "Travel Together Team";

            message.setText(mailBody);

            Transport.send(message);

            sent = true;

        } catch (Exception e) {

            e.printStackTrace();

        }

        return sent;

    }

}