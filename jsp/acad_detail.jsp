<%@page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Training and Placements:GCOEA</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600" rel="stylesheet" type="text/css" />
<link href="../css/default.css" rel="stylesheet" type="text/css" media="all" />
<!--[if IE 6]>
<link href="default_ie6.css" rel="stylesheet" type="text/css" />
<![endif]-->
</head>
<body>
<div id="wrapper">
	<div id="header">
		<div id="logo">
			<a href="http://www.gcoea.ac.in"><img src="../images/logo.jpg"></a>
			<h1><a href="#">Training and Placements</a></h1>
			<p>Government College of Engineering, Amravati</p>
		</div>
	</div>
	<!-- end #header -->
	<div id="menu">
		<ul>
			<li class="current_page_item"><a href="../html/index.html">Home</a></li>	
			<li><a href="recruit.html">Why to Recruit</a>
			<ul>
				<li><a href="../html/ranking.html">Ranking</a></li>
				<li><a href="../html/alumni.html">Alumni</a></li>
			</ul>
			</li>
			<li><a href="academics.html">Academics</a>
			<ul>
				<li><a href="../html/it.html">IT</a></li>
				<li><a href="../html/cs.html">Computer</a></li>
				<li><a href="../html/civil.html">Civil</a></li>
				<li><a href="../html/elpo.html">Electrical</a></li>
				<li><a href="../html/instru.html">Instru</a></li>
				<li><a href="../html/mech.html">Mechanical</a></li>
				<li><a href="../html/exct.html">Extc</a></li>
			</ul>
			</li>
			<li><a href="princi.html">Prepare Yourself</a>
			<ul>
				<li><a href="recruit.html">Interviews</a></li>
				<li><a href="academics.html">Meet seniors</a></li>
				<li><a href="academics.html">Useful Links</a></li>
			</ul>
			</li>
			<li><a href="stat.html">Statistics</a></li>
			<li><a href="princi.html">FAQs</a>
			<li class="last"><a href="contact.html">Contact Us</a></li>
		</ul>
	</div>
	
	<div id="three-columns">
		<div class="content">
			<center><h1>Student Academic Details</h1></center>
			</br></br>
					<%
					
						String branch=request.getParameter("branch");
						String discipline=request.getParameter("discipline");
						Double cgpa=Double.parseDouble(request.getParameter("cgpa"));
						String url = "jdbc:mysql://localhost:3306/";
						String dbName = "project";
						String driver = "com.mysql.jdbc.Driver";
						String userName = "root"; 
						String password = "29pankaj";
						
					try
					{
					Connection con=null;
					Statement st=null;
					ResultSet rs=null;
					Class.forName(driver);
					con=DriverManager.getConnection(url+dbName,userName,password);
					st=con.createStatement();
					String qr="select * from stud_reg where department='"+branch+"'and discipline='"+discipline+"'and cgpa>="+cgpa;
					rs=st.executeQuery(qr);
					
					%>
					<table id="tstyle">
					<tr>
					<th>Name</th>
					<th>Mail</th>
					<th>Department</th>
					<th>CGPA</th>
					<th>Resume</th>
					</tr>
					<%
					while(rs.next())
					{int id=rs.getInt("id");
					%>
					<tr>
					<td><center><%=rs.getString("fname")%>&nbsp;<%=rs.getString("lname")%></center></td>
					<td><center><%=rs.getString("mail")%></center></td>
					<td><center><%=rs.getString("department")%></center></td>
					<td><center><%=rs.getDouble("CGPA")%></center></td>
					<td><center><a href="..\resumes\<%=id%>.pdf" target="_blank">View Resume</a></center></td>
					</tr>
					<%
					}
					%>
					</table>
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
			
		</div>
	</div>
	<div id="footer">
	<br><br>
	<center>&copy;2013 All Rights Reserved. Project by Abhilash, Abhinay & Pankaj.</center>
	</div>
		
</div>
</body>
</html>
