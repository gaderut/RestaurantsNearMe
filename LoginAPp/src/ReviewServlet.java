

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ReviewServlet
 */
public class ReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
    public ReviewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String c1= request.getAttribute("c").toString();
		System.out.println(c1);
		
		String r2= request.getAttribute("r1").toString();
		System.out.println(r2);
		int rating=Integer.parseInt(request.getParameter("rate"));
		String comment=request.getParameter("comment");
		try
		{
			Class.forName("oracle.jdbc.OracleDriver");
			con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","ashwini");
			Statement st=con.createStatement();
			//PrintWriter out=response.getWriter();
			int i=st.executeUpdate("insert into review(rev_id,res_id,rating,cus_id,coment,rev_time) values(rev_seq.nextval,'"+r2+"',"+rating+",'"+c1+"','"+comment+"',SYSDATE)");
			System.out.println("Data is inserted successfully");
			response.sendRedirect("review.jsp");
			//out.println("<html><body onload=\"alert('Thank you')\"></body></html>");
		}
		
		
	
	catch(Exception e1)
	{
		System.out.println("ERROR");
		e1.printStackTrace();
	}
	}

}
