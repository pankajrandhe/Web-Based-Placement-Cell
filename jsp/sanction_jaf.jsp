<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<html>
<body>
<%
Connection con=null;
Statement st=null;
	String c_name=request.getParameter("c_name");
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
					HttpSession ss=request.getSession(true);
					String cname=String.valueOf(ss.getValue("cname"));
String qr="update jaf set sanction='y' where comp_name='"+cname+"'";
int n=st.executeUpdate(qr);
if(n>0)
%>
<h3>JAF sanctioned!</h3>
<%
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
%>
<h3>SQL exception occured</h3>
<%
}
%>
</body>
</html>