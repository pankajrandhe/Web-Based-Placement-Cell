import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
public class Register extends HttpServlet
{
	public void doPost(HttpServletRequest request,HttpServletResponse response)throws IOException,ServletException
		{
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		String fnm,lnm,id,course;
		fnm=request.getParameter("fnm");
		lnm=request.getParameter("lnm");
		id=request.getParameter("id");
		course=request.getParameter("course");
		out.println("<h1>Thank You "+fnm+"</h1><br>");
		out.println("<h1>Your details successfully registered.</h1>");
		out.close();
		}
}
