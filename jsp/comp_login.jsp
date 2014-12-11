<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<html>
<body>
<%
String loginid1,password1;
int n=0;
loginid1=request.getParameter("login");
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
String qr="select COMP_NAME,conatct_person,designation from comp_reg where conatct_person='"+loginid1+"'";
rs=st.executeQuery(qr);
while(rs.next())
{
	if(password1.equals(rs.getString("designation"))&&loginid1.equals(rs.getString("conatct_person")))
		{
		out.println("welcome");
		n++;
		String cnm=rs.getString("COMP_NAME");
		rs.afterLast();
		HttpSession ss=request.getSession(true);
		ss.putValue("cname",cnm);
		response.sendRedirect("http://localhost:8080/project/jsp/after_comp_login.jsp");
		
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