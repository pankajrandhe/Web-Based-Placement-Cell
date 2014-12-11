package mybean;
import java.sql.*;
public class ProdInfo
{
int accno;
String nm,comp;
double price;
public void setId(int ano)
{
accno=ano;
retrieve();
}
private void retrieve()
{
try
{
Connection con=null;
Statement st=null;
ResultSet rs=null;
Class.forName("com.mysql.jdbc.Driver");
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/pratyush","root","29pankaj");
st=con.createStatement();
String qr="select * from product where pid="+accno;
rs=st.executeQuery(qr);
int n=0;
while(rs.next())
{
nm=rs.getString("pnm");
comp=rs.getString("pcomp");
price=rs.getDouble("pprice");
n++;
}
if(n==0)
{
nm="no record";
comp="no record";
price=0;
}
rs.close();
st.close();
con.close();
}
catch(ClassNotFoundException e)
{
nm="Exception";
comp="classException";
price=0;
}
catch(SQLException e1)
{
nm="sql";
comp="sql";
}
}
public String getName()
{
return(nm);
}
public String getComp()
{
return(comp);
}
public Double getPrice()
{
return(price);
}
}