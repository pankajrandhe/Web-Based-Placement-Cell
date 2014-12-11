<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<html>
<body>
<%
String loginid1,password1;
int n=0;
loginid1=request.getParameter("loginid");
password1=request.getParameter("pass");
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
String qr="select * from stud_reg where password='"+password1+"'";
rs=st.executeQuery(qr);
while(rs.next())
{
	if(password1.equals(rs.getString("password"))&&loginid1.equals(rs.getString("loginid")))
		{
		out.println("welcome");
		String fname=rs.getString("fname");
		String mname=rs.getString("mname");
		String lname=rs.getString("lname");
		String mail=rs.getString("mail");
		String department=rs.getString("department");
		String discipline=rs.getString("discipline");
		long contact=rs.getLong("contact");
		double cgpa=rs.getDouble("cgpa");
		long id=rs.getLong("id");
		
		n++;
		
		rs.afterLast();
		HttpSession ss=request.getSession(true);
		ss.putValue("id",id);
		ss.putValue("fname",fname);
		ss.putValue("lname",lname);
		ss.putValue("mname",mname);
		ss.putValue("mail",mail);
		ss.putValue("department",department);
		ss.putValue("discipline",discipline);
		ss.putValue("contact",contact);
		ss.putValue("cgpa",cgpa);
		response.sendRedirect("http://localhost:8080/project/jsp/after_login.jsp");
		}
}
	
if(n==0)
out.println("authentication failed");
		
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