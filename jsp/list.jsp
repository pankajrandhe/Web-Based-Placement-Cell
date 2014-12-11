
<%@page import="java.sql.*"%>
<html>
<head>
<link href="../css/default.css" rel="stylesheet" type="text/css" media="all" />
</head>
<body>
<div id="wrapper">
	<div id="header">
		<div id="logo">
			<a href="http://www.gcoea.ac.in"><img src="../images/logo.jpg"></a>
			<h1><a href="#"><b>Training and Placements</b></a></h1>
			<p>Government College of Engineering, Amravati</p>
		</div>
	</div>
	<!-- end #header -->
	<div id="menu">
		<ul>
			<li class="current_page_item"><a href="#">Home</a></li>
			<li><a href="#">Why to Recruit</a></li>
			<li><a href="#">Guidance</a></li>
			<li><a href="#">Academics</a></li>
			<li><a href="#">Principals Desk</a></li>
			<li><a href="#">FAQs</a></li>
			<li class="last"><a href="#">Contact Us</a></li>
		</ul>
	</div>
	
	<div id="three-columns">
		<div class="content">
			    <%
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

		</div>
	</div>
	<div id="footer">
	<br><br>
	<center>&copy;All Rights Reserved. Project by Abhilash, Abhinay & Pankaj.</center>
	</div>
		
</div>
</body>
</html>