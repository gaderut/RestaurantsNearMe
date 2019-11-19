

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class ZoneServlet
 */
//@webservlet(/ZoneServlet);
public class ZoneServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ZoneServlet() {
        super();
        
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	doPost(request,response);
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		try
		{
			Class.forName("oracle.jdbc.OracleDriver");
			con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","ashwini");
			System.out.println(con);
			response.setContentType("text/html");
			
			//RequestDispatcher rd=request.getRequestDispatcher("home.jsp");
			//rd.include(request,response);
		}
		catch(Exception e1)
		{
			System.out.println("ERROR");
			e1.printStackTrace();
		}
		try
		{
			HttpSession h=request.getSession();
			//String username=h.getAttribute("usename").toString();
			System.out.println(h.getAttribute("username"));
			boolean flag=false;
			//String username= request.getParameter("username");
			//request.setAttribute("username", username);
				//System.out.println(username);
		String zon=request.getParameter("zones");
		h.setAttribute("zon", zon);
		PrintWriter out=response.getWriter();
		ps=con.prepareStatement("select * from zone where zname=?");
		ps.setString(1,zon);
		rs=ps.executeQuery();
		while(rs.next())
		{	
		int z=rs.getInt("zone_id");
		ps=con.prepareStatement("select res_id,res_name,res_add from restaurant where zone_id=?");
		ps.setInt(1, z);
		rs=ps.executeQuery();
		out.println("<html><head>");
		out.println("<link rel='stylesheet' href='<WebContent/css/style.css>'");
		out.println("<link rel='stylesheet' href='<WebContent/css/font-awesome.css>'");
		out.println("<link rel='stylesheet' href='<WebContent/css/layout.css>'");
		out.println("</head><body>");
		out.println("<div id='content'>");
		out.println("<div class='bg1 p84'>");
        out.println("<div class='container'>");
        out.println("<div class='row'>");
        out.println("<div class='grid_12'><div class='container_div'><form  method='post' action='rest.jsp'><table bgcolor='#f45472' style='width: 100%' border=1>");
        out.println("<tr style='height:50px'><th><font color='white' size='5px'>Restaurant name</font></th>");
        out.println("<th><font color='white' size='5px'>Restaurant adress</font></th>");
        out.println("<th><font color='white' size='5px'>Select one</font></th></tr>");
        while(rs.next()){
            String res_name = rs.getString("res_name");
            String res_add = rs.getString("res_add");
            int r=rs.getInt("res_id");
            out.println("<tr style='height:50px'><td><font color='white'size='5px'>"+ res_name + "</font></td>");
            out.println("<td><font color='white' size='5px'>" + res_add + "</td>");
            out.println("<td> <input type=\"radio\" name=\"food\" value=\""+r+"\"></td>");
            
        }
        //out.println("<td colspan='3' align='center'><input type='submit' value='Submit' /></td>");
        out.println("</tr></table>");
        out.println("<table align='center'><tr><td height='100' colspan='3' align='center'><input type='submit' value='Know More' style='height:50px;width:100px' /></td></tr></table></form></div></div></div></div></div></div><div></body></html>");
		}
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
				
		
	}

}
