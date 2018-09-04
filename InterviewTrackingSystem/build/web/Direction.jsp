<%-- 
    Document   : Direction
    Created on : Feb 8, 2017, 8:30:07 PM
    Author     : SouvikPRAT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>

      <%!
        ResultSet rs=null;
        Connection con=null,con1=null;
        PreparedStatement ps1=null,ps2=null;
        RequestDispatcher rd=null;
        int count=0,id_count=0,counter=0;
      %>  
      <%
          try{
         Class.forName("com.mysql.jdbc.Driver");
         con=DriverManager.getConnection("jdbc:mysql://localhost:3306/interview_java","root","");
         ps1=con.prepareStatement("select * from result");
         Object o=application.getAttribute("key");
         count=(int)o;
         rs=ps1.executeQuery("insert into result (marks) values (?)");
         ps1.setInt(1,count);
         int i=ps1.executeUpdate();
         ps2=con.prepareStatement("select count(id) from java_questions");
         rs=ps2.executeQuery();
         /*if(rs.next())
         {
            out.println(rs.getInt("id"));
         }*/
        id_count=rs.getInt("id");
        if(counter<id_count){
            counter++;
            rd=request.getRequestDispatcher("/Exam.jsp");
            rd.forward(request, response);
         }
         else
         {
         rd=request.getRequestDispatcher("/Result.jsp");
         rd.forward(request, response);
         }
         }
                 catch(Exception e)
                 {
                     out.println(e);
                 }
         
      %>
