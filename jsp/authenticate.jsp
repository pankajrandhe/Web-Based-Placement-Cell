<html>
<body bgcolor="blue">
<%
String unm=request.getParameter("unm");
String pass=request.getParameter("psw");
if(pass.equals("pratyushT"))
{
%>
Authentication Success!!!!!!!!!!
<%
}
else
{
%>
Authentication Failed!!!!!!!!!!
<%
}
%>
</body>
</html>