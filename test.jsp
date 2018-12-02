<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%
String id = request.getParameter("userId");
String driverName = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String dbName = "inventory";
String userId = "root";
String password = "root";

try {
Class.forName(driverName);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}

Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<h2 align="center"><font><strong>Retrieve data from database in jsp</strong></font></h2>
<table align="center" cellpadding="5" cellspacing="5" border="1">
<tr>

</tr>
<tr background="#A52A2A">
<td><b>itemid</b></td>
<td><b>price</b></td>
</tr>
--tr put
<%
try{ 
connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/inventory?autoReconnect=true&useSSL=false","root","root");
out.println("conn successful");
statement=connection.createStatement();
String sql ="SELECT * FROM supplier";

resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr bgcolor="#DEB887">

<td><%=resultSet.getString("itemid") %></td>
<td><%=resultSet.getString("suppliername") %></td>
<td><%=resultSet.getString("contact") %></td>


</tr>

<% 
}

} catch (Exception e) {
e.printStackTrace();
}
%>
</table>