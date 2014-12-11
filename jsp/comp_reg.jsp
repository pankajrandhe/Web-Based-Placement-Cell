<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<html>
<body>
<%
String comp_name,ad1,ad2,city,country,curl,contact_person,designation,email,nature;
long pin,phone,cell,fax;
comp_name=request.getParameter("comp_name");
ad1=request.getParameter("ad1");
ad2=request.getParameter("ad2");
city=request.getParameter("city");
country=request.getParameter("country");
pin=Long.parseLong(request.getParameter("pin"));
curl=request.getParameter("curl");
contact_person=request.getParameter("contact_person");
designation=request.getParameter("designation");
email=request.getParameter("email");
phone=Long.parseLong(request.getParameter("phone"));
cell=Long.parseLong(request.getParameter("cell"));
fax=Long.parseLong(request.getParameter("fax"));
nature=request.getParameter("discipline");
Connection con=null;
Statement st=null;
 
    String url = "jdbc:mysql://localhost:3306/";
    String dbName = "project";
    String driver = "com.mysql.jdbc.Driver";
    String userName = "root"; 
    String password = "29pankaj";
%>
<h2>Welcome <%=comp_name%></h2>
<%
try
{
Class.forName(driver);
con=DriverManager.getConnection(url+dbName,userName,password);
st=con.createStatement();
String qr="insert into comp_reg values('"+comp_name+"','"+ad1+"','"+ad2+"','"+city+"','"+country+"',"+pin+",'"+curl+"','"+contact_person+"','"+designation+"','"+email+"',"+phone+","+cell+","+fax+",'"+nature+"')";
int n=st.executeUpdate(qr);
if(n>0)
%>
<h3>Your details are saved!</h3>
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