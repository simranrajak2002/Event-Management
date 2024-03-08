<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User Data</title>
</head>
<body>
    <h1>User Data</h1>
    <form method="post">
        Enter Request ID: <input type="text" name="userId">
        <input type="submit" value="Search">
    </form>

    <% 
        String userId = request.getParameter("userId");
        if(userId != null && !userId.isEmpty()) {
            Connection connection = null;
            PreparedStatement statement = null;
            ResultSet resultSet = null;
            try {
                Class.forName("com.mysql.jdbc.Driver");
                String url = "jdbc:mysql://localhost:3306/office";
                String username = "root";
                String password = "";
                connection = DriverManager.getConnection(url, username, password);
                String query = "SELECT * FROM event WHERE request_no=?";
                statement = connection.prepareStatement(query);
                statement.setString(1, userId);
                resultSet = statement.executeQuery();

                if(resultSet.next()) {
    %>
                    <h2>User Details</h2>
                    <p>REQUEST ID: <%= resultSet.getString("request_no") %></p>
                    <p>Event Name: <%= resultSet.getString("event_name") %></p>
                    <p>Location: <%= resultSet.getString("event_location") %></p>
                    <p>No. of Partcipants: <%= resultSet.getString("number_of_participants") %></p>
                    <p>Event Holder Name: <%= resultSet.getString("holder_name") %></p>
                    <p>Duration: <%= resultSet.getString("duration") %></p>
                    <p>Payment Type: <%= resultSet.getString("payment_type") %></p>
                    <p>Event Type: <%= resultSet.getString("event_type") %></p>
                     <p>Application Status: <%= resultSet.getString("status") %></p>
    <%
                } else {
    %>
                    <p>No user found with ID <%= userId %></p>
    <%
                }
            } catch (ClassNotFoundException | SQLException e) {
                e.printStackTrace();
            } finally {
                try {
                    if(resultSet != null) resultSet.close();
                    if(statement != null) statement.close();
                    if(connection != null) connection.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    %>
</body>
</html>