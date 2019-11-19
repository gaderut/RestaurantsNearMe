
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.sql.*;
import java.util.ArrayList;

/**
 * Servlet implementation class OrderServlet
 */
public class OrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	Connection con = null;
	PreparedStatement ps = null;
	ResultSet rs;
	Statement st;

	public OrderServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out=response.getWriter();
		// TODO Auto-generated method stub
		//String u1 = request.getParameter("username");
		//System.out.println(u1);
		int i;
		HttpSession h=request.getSession();
		String u1=h.getAttribute("username").toString();
		h.setAttribute("username", u1);
		System.out.println(u1);
		String r5 = h.getAttribute("r").toString();
		h.setAttribute("r5", r5);
		System.out.println(r5);
		String zon = h.getAttribute("zon").toString();
		System.out.println(zon);
		String item2[] = request.getParameterValues("item");
		int item[]=new int[item2.length];// = request.getParameter("item");
		
		System.out.println("items=");
		for(int j=0;j<item2.length;j++)
			{
			System.out.println(item2[j]);
			item[j]=Integer.parseInt(item2[j]);
			
			}
	
		i=0;
		
		String quantity[] = request.getParameterValues("quantity");
		//int quant[]=new int[quantity.length];
		/*for(int b=1;b<=quantity.length;b++)
		{
			
			System.out.println(quantity[b-1]);
			quant[b-1]=Integer.parseInt(quantity[b-1]);
		}*/
		/*while(i<=item.length)
		{
			quantity[item[i]]=request.getParameter();
		}*/
		//System.out.println(item);
		String cust_zn = request.getParameter("zones");
		System.out.println(cust_zn);
		String mob = request.getParameter("mobile");
		System.out.println(mob);

		if (cust_zn.equals(zon)) {
			try {
				
				Class.forName("oracle.jdbc.OracleDriver");
				con = DriverManager.getConnection(
						"jdbc:oracle:thin:@localhost:1521:XE", "system",
						"ashwini");
			} catch (Exception e) {
				System.out.println(e);
			}
			int k=0;
			int bill=0;
			try {
				
				ps = con.prepareStatement("select cus_id from customer where username=?");
				ps.setString(1, u1);
				rs = ps.executeQuery();
				while (rs.next()) {
					String cus_id = rs.getString("cus_id");
					System.out.println(cus_id);
					Statement st=con.createStatement();
					
					int x=1;
					while(x<=item.length)
					{
					ps = con.prepareStatement("select menu_item,unit_price from menu where menu_id=? and res_id=?");
					ps.setInt(1, item[k]);
					ps.setString(2, r5);
					
					rs = ps.executeQuery();
					while (rs.next()) {
						String menu_item = rs.getString("menu_item");
						System.out.println(menu_item);
						String unit_price = rs.getString("unit_price");
						int up=Integer.parseInt(unit_price);
						System.out.println(up);
						int q=Integer.parseInt(quantity[item[k]-1]);
						System.out.println(q);
						bill=bill+(up*q);
						
					}
					k++;
					x++;
				}
					ps = con.prepareStatement("select emp_id,emp_name,emp_ph from (select emp_id,emp_name,emp_ph from emp_del where res_id=? order by dbms_random.value)where rownum=1");
					ps.setString(1, r5);
					rs = ps.executeQuery();
					while (rs.next()) {
						int emp_id = rs.getInt("emp_id");
						System.out.println(emp_id);
						String emp_name = rs.getString("emp_name");
						System.out.println(emp_name);
						h.setAttribute("emp_name", emp_name);
						String emp_ph = rs.getString("emp_ph");
						System.out.println(emp_ph);
						h.setAttribute("emp_ph", emp_ph);
					int a = st.executeUpdate("insert into order_bill(order_id,cus_id,res_id,tot_price,cus_zone,mobile,order_date,emp_id) values(bill_seq2.nextval,'"+ cus_id+"','"+ r5+ "',"+bill+",'"+ cust_zn+ "','" + mob + "',SYSDATE,'"+emp_id+"')");
					System.out.println("Data is inserted successfully");
					
					System.out.println(bill);
					h.setAttribute("bill", bill);
					}
					ps = con.prepareStatement("select max(order_id) as max_ord from order_bill");
					st=con.createStatement();
						
					rs = ps.executeQuery();
					while (rs.next()) {
						int order = rs.getInt("max_ord");
						
						
						h.setAttribute("order_id",order);
						System.out.println(order);
						ps = con.prepareStatement("select order_date from order_bill where order_id=?");
						ps.setInt(1,order);
						rs = ps.executeQuery();
						while (rs.next()) {
							String order_date=rs.getString("order_date");
							h.setAttribute("order_date",order_date);
							System.out.println(order_date);
						}
						}
					
						ps = con.prepareStatement("select res_name from restaurant where res_id=?");
						ps.setString(1,r5);
					rs = ps.executeQuery();
					while (rs.next()) {
						String res_name = rs.getString("res_name");
						h.setAttribute("res_name",res_name);
						System.out.println(res_name);
						}
					
					
					response.sendRedirect("bill.jsp");
				}
				
			} catch (Exception e1) {
				System.out.println(e1);
			}
		} else {
			out.println("<html><body onload=\"alert('Address entered is out of scope')\"></body></html>");

		}

		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		/*PrintWriter out=response.getWriter();
		// TODO Auto-generated method stub
		//String u1 = request.getParameter("username");
		//System.out.println(u1);
		int i;
		HttpSession h=request.getSession();
		String u1=h.getAttribute("username").toString();
		System.out.println(u1);
		String r5 = h.getAttribute("r").toString();
		System.out.println(r5);
		String zon = h.getAttribute("zon").toString();
		System.out.println(zon);
		String items = request.getParameter("item");
		String item[] = request.getParameterValues("item");
		if(item!=null)
		{
			for(i=0;i<item.length;i++)
			{
			out.println(item[i]);
			}
		}
		System.out.println(item);
		String quantity=request.getParameter("quantity");
		System.out.println(quantity);
		String cust_zn = request.getParameter("zones");
		System.out.println(cust_zn);
		String mob = request.getParameter("mobile");
		System.out.println(mob);

		if (cust_zn.equals(zon)) {
			try {
				
				Class.forName("oracle.jdbc.OracleDriver");
				con = DriverManager.getConnection(
						"jdbc:oracle:thin:@localhost:1521:XE", "system",
						"ashwini");
			} catch (Exception e) {
				System.out.println(e);
			}
			try {
				
				ps = con.prepareStatement("select cus_id from customer where username=?");
				ps.setString(1, u1);
				rs = ps.executeQuery();
				while (rs.next()) {
					String cus_id = rs.getString("cus_id");
					ps = con.prepareStatement("select menu_item,unit_price from menu where menu_id=? and res_id=?");
					ps.setString(1, items);
					
					ps.setString(2, r5);
					rs = ps.executeQuery();
					while (rs.next()) {
						String menu_item = rs.getString("menu_item");
						System.out.println(menu_item);
						String unit_price = rs.getString("unit_price");
						System.out.println(unit_price);
						System.out.println(quantity);
						
						int j = st
								.executeUpdate("insert into order_bill(order_id,cus_id,res_id,tot_price,cus_zone,mobile) values(bill_seq.nextval,'"+ cus_id+"','"+ r5+ "','111','"+ cust_zn+ "','" + mob + "')");
						System.out.println("Data is inserted successfully");

					}
				}
			} catch (Exception e1) {
				System.out.println(e1);
			}
		} else {
			out.println("<html><body onload=\"alert('Address entered is out of scope')\"></body></html>");

		}*/

	}

}
