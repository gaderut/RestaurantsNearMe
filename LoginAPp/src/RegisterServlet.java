

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import java.util.*;
/**
 * Servlet implementation class RegisterServlet
 */
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
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
		String username=request.getParameter("username");
		int zone=Integer.parseInt(request.getParameter("location"));
		String password=request.getParameter("password");
		StringBuffer address= new StringBuffer(request.getParameter("address"));
		String mobile=request.getParameter("mobile");

		
		try
		{
			PrintWriter out=response.getWriter();
			Class.forName("oracle.jdbc.OracleDriver");
			con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","ashwini");
			Statement st=con.createStatement();
			ps=con.prepareStatement("select zname from zone where zone_id=?");
			ps.setInt(1, zone);
			rs=ps.executeQuery();
			while(rs.next()){
	            String zn = rs.getString("zname");
	            System.out.println(zn);
	            int i=st.executeUpdate("insert into customer(cus_id,username,password,cus_zone,mobile) values(cus_detseq.nextval,'"+username+"','"+password+"','"+zn+"','"+mobile+"')");
	            int a=st.executeUpdate("insert into cus_address(cus_id,cus_adres) values(cus_addseq.nextval,'"+address+"')");
				System.out.println("Data is inserted successfully");
				//out.println("<html><body onload=\"alert('Thank you')\"></body></html>");
				out.println("alert('Thank You')");
			}
			
			response.sendRedirect("sign_up.jsp");
			
		}
		catch(Exception e1)
		{
			System.out.println("ERROR");
			e1.printStackTrace();
		}
	}

}
