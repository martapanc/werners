package wpb.util;

import java.util.*;

import javax.mail.*;
import javax.mail.internet.*;

import com.google.gson.*;

public class SendMailTLS {

	static String username = "wpb.reservations@gmail.com";
	static String password = "NpoS&45af";

	public static void sendReservationEmail(Map<String, Object> pMap) {

		String toEmail = pMap.get("email").toString();
		String fn = pMap.get("firstname").toString();
		String ln = pMap.get("lastname").toString();
		String tel = pMap.get("telephone").toString();
		String date = pMap.get("date").toString();
		String time = pMap.get("time").toString();
		String guests = pMap.get("guests").toString();
		String comment = pMap.get("comment").toString();
		Date today = new Date();
		String subject = "WPB - Your reservation";
		String body = "<html>Dear " + fn + " " + ln + "," + "<br><br> Please find the details of your reservation:"
				+ "<br><br><strong>First name: </strong>" + fn
				+ "<br><strong>Last name:</strong> " + ln + "<br><strong>Telephone:</strong> " + tel
				+ "<br><strong>Date:</strong> " + date + "<br><strong>Time:</strong> " + time
				+ "<br><strong>Number of guests:</strong> " + guests + "<br><strong>Comment:</strong> " + comment
				+ "<br><br>Order date: " + today
				+ "<br><br>Thank you very much from Werner's Panini&Burgers.<br>We're looking forward to seeing you!</html>";
		sendEmail(toEmail, subject, body);
	}
	
	public static void sendTakeawayEmail(Map<String, Object> pMap) {

		String toEmail = pMap.get("email").toString();
		String fn = pMap.get("firstname").toString();
		String ln = pMap.get("lastname").toString();
		String tel = pMap.get("telephone").toString();
		String address = pMap.get("address").toString();
		String comment = pMap.get("comment").toString();
		Date today = new Date();
		JsonParser parser = new JsonParser();
		JsonArray cart = parser.parse( (String) pMap.get("cart")).getAsJsonArray();
		double total = 0;
		String subject = "WPB - Your Takeaway Order";
		String body = "<html>Dear " + fn + " " + ln + "," + "<br><br> Please find the details of your Takeaway Order:"
				+ "<br><br><strong>First name: </strong>" + fn
				+ "<br><strong>Last name:</strong> " + ln + "<br><strong>Telephone:</strong> " + tel
				+ "<br><strong>Delivery Address:</strong> " + address + "<br><strong>Comment:</strong> " + comment
				+ "<br><strong>Your order cart: </strong><br><br>"
				+ "<table border='1' cellpadding='5'><tr><th>Item</th><th>Quantity</th><th>Cost</th></tr>";
		for (int i=0; i<cart.size(); i++) {
			JsonObject o = cart.get(i).getAsJsonObject();
			total += o.get("totPrice").getAsDouble();
			body += "<tr><td>" + o.get("name").getAsString() + "</td><td>" + o.get("qnt").getAsString() + "</td><td>&euro;" 
					+ String.format("%.2f", o.get("totPrice").getAsDouble()) + "</td></tr>";
		}
		body += "<tr><td></td><td><strong>Total:</strong></td><td>&euro;" + String.format("%.2f", total) + "</td></tr>";
		body += "</table><br><br>Order date: " + today
				+ "<br><br>Thank you very much from Werner's Panini&Burgers.<br>We're looking forward to seeing you!</html>";
		sendEmail(toEmail, subject, body);
	}
	
	public static void sendRecoveryEmail(Map<String, Object> pMap) {
		String toEmail = pMap.get("email").toString();
		String fn = pMap.get("fullname").toString();
		String pass = pMap.get("pw").toString();
		
		Date today = new Date();
		String subject = "WPB - Password Recovery";
		String body = "<html>Dear " + fn + "," + "<br><br> You can now login with the following temporary password: <br><br><strong>" 
				+ pass + "</strong>"
				+ "<br><br>As soon as you have logged in, do not forget to change it in your Profile."
				+ "<br><br>Thank you very much from Werner's Panini&Burgers.<br>We're looking forward to seeing you!"
				+ "<br><br>Date: " + today + "</html>";
		sendEmail(toEmail, subject, body);
	}

	public static void sendEmail(String dest, String subject, String body) {

		Properties props = new Properties();
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "587");

		Session session = Session.getInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username, password);
			}
		});

		try {
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress("wpb.reservations@gmail.com"));
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(dest));
			message.setSubject(subject);
			message.setContent(body, "text/html");

			Transport.send(message);
			System.out.println("Email sent to " + dest);

		} catch (MessagingException e) {
			throw new RuntimeException(e);
		}
	}
}