<%-- 
    Document   : AdminWorks
    Created on : Feb 10, 2017, 7:23:04 PM
    Author     : SouvikPRAT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP AdminWorks Page</title>
    </head>
    <body>
        <%!
        Connection con=null;
        PreparedStatement ps=null;
        ResultSet rs=null;
        String question,answer,option1,option2,option3;
        String disp,error;
        boolean flag;
        static int id_count;
        %>
        <% 
         try{
         Class.forName("com.mysql.jdbc.Driver");
         con=DriverManager.getConnection("jdbc:mysql://localhost:3306/interview_java","root","");
         ps=con.prepareStatement("select * from java_questions");
         rs=ps.executeQuery();
                  question=request.getParameter("question");
                  option1=request.getParameter("option1");
                  option2=request.getParameter("option2");
                  option3=request.getParameter("option3");
                  answer=request.getParameter("answer");
         ps=con.prepareStatement("insert into java_questions (question,option1,option2,option3,answer) values(?,?,?,?,?)");
         ps.setString(1,question);
         ps.setString(2,option1);
         ps.setString(3,option2);
         ps.setString(4,option3);
         ps.setString(5,answer);
         int i=ps.executeUpdate();
         /*
         ps.setInt(1, id_count);
         ps=con.prepareStatement("select count(id) from java_questions");
         rs=ps.executeQuery();
         if(rs.next())
         {
             id_count=rs.getInt("id");
             out.println(id_count);
         }
         ps=con.prepareStatement("select count(id) from java_questions");
         rs=ps.executeQuery();
         id_count=rs.getInt("id");
         ps=con.prepareStatement("insert into java_questions (id) values(?)");
         ps.setInt(1,++id_count);
         i=ps.executeUpdate();
         */
         if(i>0)
         {
             flag=true;
             disp="successfully upadated";
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
        <div align="center"><a href="addques.html"><button name="b1"> Back.. </h1></button></a></div>
    </body>
</html>
