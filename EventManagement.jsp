<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Event Management Portal</title>
</head>
<body>
	 <h2>Event Allotment Request Form</h2>
    <form action="postData.jsp" method="post">
        <label for="event_name">Event Name:</label><br>
        <input type="text" id="event_name" name="event_name"><br>
        
        <label for="location">Location:</label><br>
        <input type="text" id="location" name="location"><br>
        
        <label for="participants">Number of Participants:</label><br>
        <input type="number" id="participants" name="participants"><br>
        
        <label for="event_holder">Event Holder Name:</label><br>
        <input type="text" id="event_holder" name="holder"><br>
        
        <label for="duration">Duration:</label><br>
        <input type="text" id="duration" name="duration"><br>

       <label for="payment">Payment Type:</label><br>
        <select id="payment" name="payment">
            <option value="UPI">UPI</option>
            <option value="DEBIT CARD">DEBIT CARD</option>
            <option value="CREDIT CARD">CREDIT CARD</option>
            <option value="other">Other</option>
        </select><br>
        
        <label for="event_type">Event Type:</label><br>
        <select id="event_type" name="event_type">
            <option value="conference">Conference</option>
            <option value="seminar">Seminar</option>
            <option value="workshop">Workshop</option>
            <option value="concert">Concert</option>
            <option value="exhibition">Exhibition</option>
            <option value="other">Other</option>
        </select><br>
        
        <button type="submit">Request Allotment</button>
      <a href="GetData.jsp">Check Your Status Here</a>
    </form>
</body>
</html>