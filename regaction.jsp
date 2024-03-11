<%@page import="pack.TrippleDes"%>
<%@page import="java.util.Random"%>
<%@page import="pack.DbConnector"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%
	String name = request.getParameter("name");
	String usr = request.getParameter("user");
	String pass = request.getParameter("pass");
	String mail = request.getParameter("email");
	String d = request.getParameter("dob");
	String l = request.getParameter("loc");
	String s = request.getParameter("sex");
	String imei = request.getParameter("imei");
	
	Connection con = DbConnector.getConnection();
	
	Random r=new Random();
	String pattern="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz123456789";
	
	String accesskey=usr+imei+pass;
	
	String enckey="";
	
	for(int i=0;i<24;i++)
	{
		enckey=enckey+pattern.charAt(r.nextInt(60));
	}
	
	TrippleDes td= new TrippleDes(enckey);
    String target=accesskey;
    String encrypted=td.encrypt(target);
    
    Cookie c = new Cookie("accesskey",encrypted);
    
	try
	{
		Statement st = con.createStatement();
		int i = st.executeUpdate("insert into regpage values('" + name
				+ "','" + usr + "','" + pass + "','" + mail + "','" + d
				+ "','" + l + "','" + s + "','"+accesskey+"','"+enckey+"')");
		
		if (i != 0) {
			c.setMaxAge(30 * 24 * 60 * 60);// for 30 days
			response.addCookie(c);
			response.sendRedirect("userlog.jsp?msg=Register success");

		} else {
			response.sendRedirect("registration.jsp?msgr=Register fails");
		}
	}
	catch(Exception e)
	{
		e.printStackTrace();
		response.sendRedirect("registration.jsp?msgr=user all ready registred");
	}
%>