<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<html>
<body>
<%
String fname,lname;
int id=Integer.parseInt(request.getParameter("id"));
Connection con=null;
Statement st=null;
ResultSet rs=null;
 
    String url = "jdbc:mysql://localhost:3306/";
    String dbName = "project";
    String driver = "com.mysql.jdbc.Driver";
    String userName = "root"; 
    String password = "29pankaj";
try
{
Class.forName(driver);
con=DriverManager.getConnection(url+dbName,userName,password);
st=con.createStatement();
rs=st.executeQuery("select * from stud_reg where id="+id);
%>
<table border="1">
<tr>
<th>First name</th>
<th>Last Name</th>
<th>Course </th>
</tr>
<%
while(rs.next())
{
%>
<tr>
<td><%=rs.getString("fname")%></td>
<td><%=rs.getString("lname")%></td>
<td><%=rs.getString("year")%></td>
</tr>
<%
}
%>
</table>
<%
rs.close();
st.close();
con.close();
}
catch(ClassNotFoundException e)
{
%>
<h3>Class not found exception</h3>
<%
}
catch(SQLException c)
{
int err=c.getErrorCode();
out.println(err);
%>
<h3>SQL exception occured</h3>
<%
}
%>
</body>
</html>