<%-- 
    Document   : AdminValidation
    Created on : Feb 9, 2017, 11:00:15 AM
    Author     : SouvikPRAT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*,java.util.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Admin Validation Page</title>
    </head>
     <%!
        Connection con=null;
        PreparedStatement ps=null;
        Enumeration e=null;
        ResultSet rs=null;
        RequestDispatcher rd=null;
        String username="souvik",password="souvik123",tablename,tablepassword;
        int i=0;
        boolean flag=false;
      %>
      <%
            try{
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/interview_java","root","");
		/*	String username=request.getParameter("Username");
			String password=request.getParameter("Password");
		*/
            ps=con.prepareStatement("select username,password from admin where username=? and password=?");
            ps.setString(1,username);
            ps.setString(2,password);
            rs=ps.executeQuery();
            /*e=request.getParameterNames();
            while(e.hasMoreElements())
            {
                username=(String)e.nextElement();
                password=(String)e.nextElement();
            }
            username=request.getParameter("Username");
            password=request.getParameter("Password");*/
            while(rs.next())
            {
               // tablename=rs.getString("username");
                //tablepassword=rs.getString("password");
                tablename=rs.getString("username");
                tablepassword=rs.getString("password");
            }
            

            
            }catch(Exception e){e.printStackTrace();}
        %>
    <body>
        <%
            System.out.println("<h1>"+tablename+"</h2>");
            System.out.println("<h1>"+tablepassword+"</h1>");
            if(username.equals(tablename) && password.equals(tablepassword))
        {
            flag=true;
            out.println("<h1>Hello "+tablename+"... welcome,to continue please <a href='adminpage.html'>click here</a>...</h1>");
        }
          else
        {
            
           out.println("<h1>Sorry please try again.. <a href='index.html'>click</a></h1>");
        }
        %>
    </body>
</html>
