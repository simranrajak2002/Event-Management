<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
Connection conn=null;
PreparedStatement pst=null;
String Url="jdbc:mysql://localhost/office";
String UserName ="root";
String Password ="";
try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	conn = DriverManager.getConnection(Url,UserName,Password);
	String id = request.getParameter("id");
	String Status = "ACCEPTED";
	String Query = "UPDATE event SET status=? WHERE id=?";
	pst = conn.prepareStatement(Query);
	pst.setString(1,Status);
	pst.setInt(2,Integer.parseInt(id));
	pst.executeUpdate();
	out.println("Participation ACCEPTED Successfully");
	
}catch(Exception e){
	e.printStackTrace();
}
%>