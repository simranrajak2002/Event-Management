<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="UTF-8"%>
	<%@page import="java.sql.*" %>
	<%@page import ="java.util.Random" %>
	

	
<%
Connection conn=null;
PreparedStatement pst=null;
ResultSet rs=null;
String Url="jdbc:mysql://localhost/office";
String UserName ="root";
String Password ="";

try{

	Class.forName("com.mysql.cj.jdbc.Driver");
	conn = DriverManager.getConnection(Url,UserName,Password);
	int randomNumber = new Random().nextInt(1000);
	String EvenName = request.getParameter("event_name");
	String Location = request.getParameter("location");
	String Participants = request.getParameter("participants");
	String Duration = request.getParameter("duration");
	String Payment = request.getParameter("payment");
	String EventType = request.getParameter("event_type");
	String Holder = request.getParameter("holder");
	String Status ="Application In Progress";

		String Query="insert into event(event_name,event_location,number_of_participants,holder_name, duration, payment_type,event_type,status,request_no)values(?,?,?,?,?,?,?,?,?)";
		pst = conn.prepareStatement(Query);
		pst.setString(1,EvenName);
		pst.setString(2,Location);
		pst.setString(3,Participants );
		pst.setString(4,Holder );
		pst.setString(5,Duration );
		pst.setString(6,Payment );
		pst.setString(7,EventType);
		pst.setString(8,Status);
		pst.setInt(9,randomNumber);
		pst.executeUpdate();
		out.println("Participation Added Successfully");
		out.println("\nYour Request ID is "+randomNumber+" Remember for the future Reference");
	

}catch(Exception e){
	e.printStackTrace();
}






%>