<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<html>
<body>
<%
String fname,mname,lname,mail,department,discipline,loginid,password1;
int year,id;
long contact;
double cgpa;
cgpa=Double.parseDouble(request.getParameter("cgpa"));
fname=request.getParameter("fname");
mname=request.getParameter("mname");
lname=request.getParameter("lname");
mail=request.getParameter("mail");
department=request.getParameter("department");
discipline=request.getParameter("discipline");
year=Integer.parseInt(request.getParameter("year"));
contact=Long.parseLong(request.getParameter("contact"));
loginid=request.getParameter("loginid");
password1=request.getParameter("password");
id=Integer.parseInt(request.getParameter("id"));
Connection con=null;
Statement st=null;
 
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
String qr="insert into stud_reg values('"+fname+"','"+mname+"','"+lname+"','"+mail+"','"+department+"','"+discipline+"',"+year+","+contact+",'"+loginid+"','"+password1+"',"+id+","+cgpa+")";
int n=st.executeUpdate(qr);
if(n>0)
%>
<h3>Your details are saved!</h3>
<p><a href="http://localhost:8080/project/html/student_login.html"<h3>Please Login</h3>
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