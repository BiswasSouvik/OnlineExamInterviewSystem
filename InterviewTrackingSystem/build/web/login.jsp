<%@page contentType="text/html" pageEncoding="UTF-8"import="java.sql.*"%>
<!DOCTYPE html>    
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login</title>
</head>
<body>
<%! String userdbName;
String userdbPwd;
%>
<%
Connection con= null;
PreparedStatement ps = null;
ResultSet rs = null;
String name = request.getParameter("name");
String password = request.getParameter("password");
if((!(name.equals(null) || name.equals("")) && !(password.equals(null) || password.equals(""))))
{
	try{
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/interview_java","root","");
		ps = con.prepareStatement("select * from admin where username=? and password=?");
		ps.setString(1, name);
		ps.setString(2, password);
		rs = ps.executeQuery();
		if(rs.next())
		{			
			userdbName = rs.getString("Username");
			userdbPwd = rs.getString("Password");
			if(name.equals(userdbName) && password.equals(userdbPwd))
				{
					session.setAttribute("name",userdbName);					
					response.sendRedirect("adminpage.html");				
				}						   
		}
		else
			response.sendRedirect("error.jsp");
		rs.close();
		ps.close();				
		}
	catch(SQLException sqe)
	{
		out.println(sqe);
	}	
}
else
{
	%>
	
		<center><p style="color:red">Error In Login</p></center>
		<% 
	getServletContext().getRequestDispatcher("/home.jsp").include(request, response);
}

%>
</body>
</html>