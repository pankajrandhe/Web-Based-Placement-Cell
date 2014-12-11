import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.util.*;
public class BulletinBoard extends HttpServlet
{
	String filepath;
		public void init(ServletConfig config)throws ServletException
		{
		super.init(config);
		filepath=config.getInitParameter("FilePath");
			if(filepath==null)
			{
			filepath="/";
			}
		}
	public void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException
		{
		 response.setContentType("text/html");
		 PrintWriter out=response.getWriter();
		
		  FileInputStream fileTopics=null;
		
		 try
			{
			fileTopics=new FileInputStream(filepath+"topics.properties");
			Properties propTopics=new Properties();
			propTopics.load(fileTopics);
			Enumeration enumTopics=propTopics.propertyNames();
			
			out.println("<html>");
			out.println("<head>");
			out.println("<title>Servlet Bulletin Board</title>");
			out.println("</head>");
			out.println("<body>");
			out.println("<h2>Servlet Bulletin Board</h2>");
			out.println("<br><form method='POST'>");
			out.println("Select Bulletin Board Topic");
			out.println("<select name='topics'>\">");
			String topic;
			
			while(enumTopics.hasMoreElements())
			{	
				topic=(String)enumTopics.nextElement();
				if(propTopics.getProperty(topic).equals(request.getParameter("curTopic")))
				{
					out.println("<option selected>"+propTopics.getProperty(topic)+"</option>");
				}
				else
				{
				out.println("<option>"+propTopics.getProperty(topic)+"</option>");
				}
			}
			//out.println("<option>"+propTopics.getProperty(topic)+"<option>");
			out.println("</select><br><br><br>");
			out.println("<input type='submit' name='view' value='view bulletins'> ");
			out.println("<input type='submit' name='post' value='post bulletins'> ");
			out.println("</form>");
			out.println("</body></html>");
			}
			
			catch(Exception e)
			{
			sendErrorToClient(out,e);
			}
			finally
			{
				try
				{
				fileTopics.close();
				}
				catch(Exception e)
				{}
				try
				{
				out.close();
				}
				catch(Exception e)
				{}
			}
		}
		
		public void doPost(HttpServletRequest request,HttpServletResponse response) 
		{
			String currentTopic="";
			PrintWriter out=null;
			currentTopic=request.getParameter("TOPICS");
			String file=filepath+currentTopic+".txt";
			String servletPath=request.getServletPath();
			response.setContentType("text/html");
		
			try
			{
				out=response.getWriter();
				out.println("<HTML>");
				out.println("<head><title>"+currentTopic+"Bulletin Board"+"</title></head>");
				out.println("</body>");
				
				if(request.getParameter("VIEW")!=null)
				{
				showBulletins(out,currentTopic,file);
				}
				else if(request.getParameter("POST")!=null)
				{
				postBulletin(out,currentTopic);
				}
				else
				{
				saveBulletin(out,currentTopic,file,request);
				}
				
				//out.println("<br><br><a href=\""+servletPath+"?curTopic="+java.net.URLEncoder.encode(currentTopic)+"\">Return to main page</a>");
				out.println("</body></html>");
			}
			catch(Exception e)
			{
				sendErrorToClient(out,e);
			}
		}
		
		private void showBulletins(PrintWriter out,String currentTopic, String file)
		{
			FileReader fr=null;
			BufferedReader br=null;
			
			try
			{
				File fileTopic=new File(file);
				if(fileTopic.exists())
				{
					fr=new FileReader(file);
					br=new BufferedReader(fr);
					out.println("<h2>"+currentTopic+"Bulletin Board</h2>");
					out.println("<h3>View Bulletins</h3>");
					
					String line=br.readLine();
					while(line!=null)
					{
						out.println(line+"<br>\n");
						line=br.readLine();
					}
			
				}
				else
				{
					out.println("This topic currently contains no"+ "bulletins.");
				}
			}
			catch(Exception e)
			{
			 sendErrorToClient(out,e);
			}
			finally
			{
				try
				{
				br.close();
				}
				catch(Exception e){}
				try
				{
				fr.close();
				}
				catch(Exception e)
				{}
			}
			
		}
		private void postBulletin(PrintWriter out, String currentTopic)
		{
				out.println("<h2>"+currentTopic+"Bulletin Board</h2>");
				out.println("<h3>Post Bulletin</h3><br>");
				out.println("<form method='post'>");
				out.println("<p>textarea name=\"BULLETIN\" "+"cols=\"65\" rows=\"3\"></textarea>");
				out.println("<br><br><br><input type=\"submit\" "+"name=\" store\" value=\"store bulletin\"><br>");
				out.println("<input type=\"hidden \""+"name=\"topics\" value=\""+currentTopic+"\">");
				out.println("</form>");
			}

			private void saveBulletin(PrintWriter out,String currentTopic, String file, HttpServletRequest request)
			{
				FileWriter fw= null;
				PrintWriter pw= null;

			try
			{
				 fw=new FileWriter(file,true);
				 pw=new PrintWriter(fw);
				 pw.println("---------------------------------------------------");
				 pw.println(request.getParameter("BULLETIN"));
				 out.println("<h2>Bulletin Saved!</h2>");
			}
			 catch(Exception e)
			{
				sendErrorToClient(out,e);
			}
			 finally
			{
			 try
			 {
				pw.flush();
				pw.close();
			 }
			 catch(Exception e){}
			 try
			 {
			 fw.close();
			 }
			 catch(Exception e){}
			}
		}
	 
		 private void sendErrorToClient(PrintWriter out,Exception e)
		{
			StringWriter stringError= new StringWriter();
			PrintWriter printError=new PrintWriter(stringError);
			e.printStackTrace(printError);
			String stackTrace=stringError.toString();
			
			out.println("<html><title>Error</title></body>");
			out.println("<h1>Servlet Error</h1><h4>Error</h4>"+e+"<h4>Stack Trace</h4>"+stackTrace+"</body></html>");
			
			System.out.println("Servlet Error: "+stackTrace);
		}
}
	
 
	
		