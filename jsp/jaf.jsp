<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<html>
<body>
<%
int n=0;
String company_name,company_website,discplines,designation,jdesig1,contact_person,email,description,jperks1,place;
long fax,contact_no;
int vacancies;
double jsal1,jctc1,criteria;
company_name=request.getParameter("company_name");
company_website=request.getParameter("company_website");
discplines=request.getParameter("discplines");
designation=request.getParameter("designation");
description=request.getParameter("description");
jdesig1=request.getParameter("jdesig1");
contact_person=request.getParameter("contact_person");
email=request.getParameter("email");
fax=Long.parseLong(request.getParameter("fax"));
place=request.getParameter("place");
vacancies=Integer.parseInt(request.getParameter("vacancies"));
criteria=Double.parseDouble(request.getParameter("criteria"));
contact_no=Long.parseLong(request.getParameter("contact_no"));
jsal1=Double.parseDouble(request.getParameter("jsal1"));
jctc1=Double.parseDouble(request.getParameter("jctc1"));
jperks1=request.getParameter("jperks1");
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
String qr="insert into jaf values('"+company_name+"','"+company_website+"','"+discplines+"','"+designation+"','"+description+"','"+place+"',"+vacancies+",'"+jdesig1+"',"+jsal1+","+jctc1+",'"+jperks1+"','"+contact_person+"',"+contact_no+",'"+email+"',"+fax+",'n',"+criteria+")";
n=st.executeUpdate(qr);
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
int d=c.getErrorCode();
out.println(d);
%>
<h3>SQL exception occured</h3>
<%
}
%>
</body>
</html>