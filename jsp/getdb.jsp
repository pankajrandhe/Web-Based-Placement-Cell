<%@page import="java.sql.*"%>
<html>
<body bgcolor="green">
Product Information
<%
Connection con=null;
Statement st=null;
ResultSet rs=null;
try
{
Class.forName("com.mysql.jdbc.Driver");
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/pratyush","root","29pankaj");
st=con.createStatement();
rs=st.executeQuery("Select * from product");
%>
<table border="1">
<tr>
<th>ProdId</th>
<th>ProdName</th>
<th>ProdComp</th>
<th>ProdPrice</th>
</tr>
<%
while(rs.next())
{
%>
<tr>
<td><%=rs.getInt("pid")%></td>
<td><%=rs.getString("pnm")%></td>
<td><%=rs.getString("pcomp")%></td>
<td><%=rs.getDouble("pprice")%></td>
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
catch(Exception e)
{
%>
Class Not Found
<%
}
%>
</body>
</html>