<%-- 
    Document   : ResultDisplay
    Created on : Feb 9, 2017, 10:44:01 AM
    Author     : SouvikPRAT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Result Display Page</title>
    </head>
     <%!
        ResultSet rs=null;
        Connection con=null;
        PreparedStatement ps=null;
        String user_name;
        int marks=0;
        static int count=1;
     %>  
     <%          
         try{
         Class.forName("com.mysql.jdbc.Driver");
         con=DriverManager.getConnection("jdbc:mysql://localhost:3306/interview_java","root","");
         ps=con.prepareStatement("select *  from result");
         rs=ps.executeQuery();
                /*  while(rs.next()){
                  user_name=rs.getString("name");
                  marks=rs.getInt("marks");
                  }    */
                while(rs.last()){
                  user_name=rs.getString("name");
                  marks=rs.getInt("marks");
                  count++;
                  break;
                  }
         }catch(Exception e)
                 {
                     e.printStackTrace();
                 }
        %>
    <body background="back.jpg">
        <div align="center"><h1> Thank You... " <%=user_name%> " and your marks is: <%=marks%> </h1></div>
        <div align="center"><a href="index.html"><button name="b1">Back</button></a></div>
    </body>
</html>
