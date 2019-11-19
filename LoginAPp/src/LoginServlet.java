import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.Statement;
import java.sql.Connection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LoginServlet
 */
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	Connection con;
	PreparedStatement ps;
    
    public LoginServlet() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		try
		{
			Class.forName("oracle.jdbc.OracleDriver");
			con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","ashwini");
			System.out.println(con);
			response.setContentType("text/html");
		}
		catch(Exception e1)
		{
			System.out.println("ERROR");
			e1.printStackTrace();
		}
		try
		{
			//PrintWriter out=response.getWriter();
			//out.println("hello");
			String username=request.getParameter("username");
			String password=request.getParameter("password");
			boolean flag=false;
			ps= con.prepareStatement("select username,password from customer where username=? and password=?");
			ps.setString(1, username);
			ps.setString(2, password);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{	
				if(rs.getString("username").equals(username) && rs.getString("password").equals(password))
				{
					flag=true;
				}
			}
			if(flag==true)
			{
				System.out.println("Welcome");
				HttpSession h=request.getSession();
				h.setAttribute("username", username);
				response.sendRedirect("home.jsp");
				RequestDispatcher rd=request.getRequestDispatcher("home.jsp");
				rd.include(request,response);
			}
			
			else
			{
				response.sendRedirect("index.jsp");
			}
			
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
			
		}
		
							}
		
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
