<%-- 
    Document   : AdminDelete
    Created on : Feb 10, 2017, 9:49:14 PM
    Author     : SouvikPRAT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
 <%!
        Connection con=null;
        PreparedStatement ps=null;
        ResultSet rs=null;
        String disp,error;
        boolean flag;
        int id=0;
 %>
 <% 
         try{
         Class.forName("com.mysql.jdbc.Driver");
         con=DriverManager.getConnection("jdbc:mysql://localhost:3306/interview_java","root","");
         System.out.println("connected");
         ps=con.prepareStatement("select * from java_questions");
         rs=ps.executeQuery();
         id=Integer.parseInt(request.getParameter("ans"));
         ps=con.prepareStatement("delete from java_questions where id=("+id+")");
         int i=ps.executeUpdate();
         out.println("sucessfully deleted");
         if(i>0)
         {
             flag=true;
             disp="successfully deleted";
         }
         else
         {
             error="please try again";
         }
         }catch(Exception e)
                 {
                    out.println(e);e.printStackTrace();  
                 }
        %>
 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello Admin</h1>
        <%
            if(flag)
            {
                out.println("<h3>"+disp+"</h3>");
            }
            else
            {
                out.println("<h3>"+error+"</h3>");
            }
        %>
        <a href="dqus.html"><h1> Back.. </h1></a>
    </body>
</html>
