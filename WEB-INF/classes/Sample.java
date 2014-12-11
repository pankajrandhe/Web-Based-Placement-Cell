import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
public class Sample extends HttpServlet
{
public void doGet(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException
{
res.setContentType("text/html");
PrintWriter out=res.getWriter();
out.println("<h1>Welcome to Servlets</h1>");
out.close();
}
}
