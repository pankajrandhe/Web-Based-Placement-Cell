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
			<li><a href="#">Prepare Yourself</a>
			<ul>
				<li><a href="recruit.html">Interviews</a></li>
				<li><a href="academics.html">Meet seniors</a></li>
				<li><a href="academics.html">Useful Links</a></li>
			</ul>
			</li>
			<li><a href="stat.html">Staticstics</a></li>
			<li><a href="princi.html">FAQs</a>
			<li class="last"><a href="contact.html">Contact Us</a></li>
		</ul>
	</div>
	<div id="three-columns">
		<div class="content">
			<h1><center>Job Anouncement Form</center></h1></br>
			<%
					
						String comp_name=request.getParameter("comp_name");
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
					String qr="select * from jaf where comp_name='"+comp_name+"'";
					rs=st.executeQuery(qr);
			<table id="tstyle">
			<tr>
			<th colspan="4"><center>Company Details</center></th>
			</tr>
			<tr>
			<td>Company Name</td>
			<td colspan="3"><%=rs.getString("comp_name")%></td>
			</tr>
			<tr>
			<td>Company Website</td>
			<td colspan="3"><%=rs.getString("comp_website")%></td>
			</tr>
			<tr>
			<th colspan="4"><center>Job Details</center></th>
			</tr>
			<tr>
			<td>Eligible Disciplines</td>
			<td colspan="3"><%=rs.getString("disciplines")%></td></td>
			</tr>
			<tr>
			<td>Job Designation</td>
			<td colspan="3"><%=rs.getString("designation")%></td></td>
			</tr>
			<tr>
			<td>Job Description</td>
			<td colspan="3"><%=rs.getString("description")%></td></td>
			</tr>
			<tr>
			<td>Place of Posting</td>
			<td colspan="3"><%=rs.getString("place")%></td></td>
			</tr>
			<tr>
			<td>No of Vacancies</td>
			<td colspan="3"><%=rs.getInt("vacancies")%></td></td>
			</tr>
			<tr>
			<th colspan="4"><center>Remuneration Details</center></th>
			</tr>
			<td colspan="4">1. Performance based bonus should be declared independently and not as part of Gross/CTC.</td>
			</tr>
			<tr>
			<td colspan="4">2. Any amount to be disbursed later than the end of first 12 months should not be a part of Gross/CTC but can be mentioned separately.</td>
			</tr>
			<tr>
			<th>Job Designation</th>
			<th>Gross Salary</th>
			<th>CTC</th>
			<th>Perks</th>
			</tr>
			<tr>
			<td><%=rs.getString("jdesig1")%></td></td>
			<td><%=rs.getDouble("jsal1")%></td></td>
			<td><%=rs.getDouble("jctc1")%></td></td>
			<td><%=rs.getDouble("jperks1")%></td>/td>
			</tr>
			
			<tr>
			<th colspan="4"><center>Contact Details</center></th>
			
			</tr>
			<tr>
			<tr>
			<td>Contact Person</td>
			<td colspan="3"><%=rs.getString("contact_person")%></td></td>
			</tr>
			<tr>
			<td>Contact No</td>
			<td colspan="3"><%=rs.getString("conatct_no")%></td></td>
			</tr>
			<tr>
			<td>E mail</td>
			<td colspan="3"><%=rs.getLong("email")%></td></td>
			</tr>
			<tr>
			<td>Fax</td>
			<td colspan="3"><%=rs.getString("fax")%></td></td>
			</tr>
			<tr>
			<td colspan="4">We hereby also state that :</br>
				1. The Salary split-up that will be offered has been clearly indicated.</br>
				2. Remuneration once declared will not be decreased once the offer has been made.</br>
				3. After declaring a final list of recruits we will not de-list any candidates.</br>
			</td>
			</tr>
			</table>
		</div>
	</div>
	<div id="footer">
	<br><br>
	<center>&copy;2013 All Rights Reserved. Project by Abhilash, Abhinay & Pankaj.</center>
	</div>
		
</div>
</body>
</html>
