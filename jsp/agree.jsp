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
			long id=(Long)(ss.getValue("id"));
			String fname=String.valueOf(ss.getValue("fname"));
			String mname=String.valueOf(ss.getValue("mname"));
			String lname=String.valueOf(ss.getValue("lname"));
			String discipline=String.valueOf(ss.getValue("discipline"));
			String department=String.valueOf(ss.getValue("department"));
			double cgpa=(Double)(ss.getValue("cgpa"));
			long contact=(Long)(ss.getValue("contact"));
			String mail=String.valueOf(ss.getValue("mail"));
String qr="insert into stud_confirm values('"+fname+"','"+mname+"','"+lname+"','"+discipline+"','"+department+"',"+cgpa+",'"+mail+"',"+contact+",'"+c_name+"',"+id+")";
int n=st.executeUpdate(qr);
if(n>0)
%>
<h3>Your request is sent. You will be informed about the later procedure through your contact deatails.</h3>
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
int code=c.getErrorCode();
if(code==1062)
{
%>
<h1>You have already signed the JAF for this recruiter.</h1>

<%
}
else
{
%>
<h3>SQL exception occured</h3>
<%
}
}
%>
</body>
</html>