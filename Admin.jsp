<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Portal</title>
</head>
<body>
<h2> Event Information</h2>

<table>
    <thead>
        <tr>
            <th>Event Name</th>
            <th>Location</th>
            <th>Number of Participants</th>
            <th>Event Holder Name</th>
            <th>Duration</th>
            <th>Payment Type</th>
            <th>Event Type</th>
            <th>Accept</th>
            <th>Deny</th>
            
        </tr>
    </thead>
    <tbody>
       <% 
            Connection conn=null;
		    PreparedStatement pst=null;
		    ResultSet rs = null;
			String Url="jdbc:mysql://localhost/office";
			String UserName ="root";
			String Password ="";
			String id = request.getParameter("id");
			String Query="select *from event";
			try{
				Class.forName("com.mysql.cj.jdbc.Driver");
				conn = DriverManager.getConnection(Url,UserName,Password);
				pst = conn.prepareStatement(Query);
				rs =pst.executeQuery();
				while(rs.next()){
					%>
					 <tr>
					 	<td><%=rs.getString("event_name") %></td>
					 	<td><%=rs.getString("event_location") %></td>
					 	<td><%=rs.getString("number_of_participants") %></td>
					 	<td><%=rs.getString("holder_name") %></td>
					 	<td><%=rs.getString("duration") %></td>
					 	<td><%=rs.getString("payment_type") %></td>
					 	<td><%=rs.getString("event_type") %></td>
					 	<td><th><a href="Permission.jsp?id=<%=rs.getString("id")%>"><button>ACCEPT</button></a></th></td>
					 	<td><th><a href="permission1.jsp?id=<%=rs.getString("id")%>"><button>DENY</button></a></th></td>
					 </tr>
					<%
				}
			}catch(Exception e){
				e.printStackTrace();
			}
		%>
    </tbody>
</table>
</body>
</html>