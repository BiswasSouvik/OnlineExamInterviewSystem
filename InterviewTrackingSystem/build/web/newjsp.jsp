<%-- 
    Document   : newjsp
    Created on : Feb 10, 2017, 2:04:26 AM
    Author     : SouvikPRAT
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%!
        Connection con=null;
        PreparedStatement ps=null;
        ResultSet rs=null;
        RequestDispatcher rd=null;
        String question,answer,user_answer,option1,option2;
        int id=0,count=0,ques_count=1;
        int question(int ques_count)
        {
          return ques_count++;  
        }
        %>
         <% 
         try{
         Class.forName("com.mysql.jdbc.Driver");
         con=DriverManager.getConnection("jdbc:mysql://localhost:3306/interview_java","root","");
         System.out.println("connected");
         ps=con.prepareStatement("select * from java_questions");
         rs=ps.executeQuery();
         count=question(ques_count);
                  if(rs.absolute(2)){
                  id=rs.getInt("id");
                  question=rs.getString("question");
                  option1=rs.getString("option1");
                  option2=rs.getString("option2");
                  }
         }catch(Exception e)
                 {
                    out.println(e);  
                 }
        %>
        <div align="center"><h2><%=question%></h2></div><br>
             <form name="form1">
                 1: <%=option1%><input type="radio" name="option" value="<%=option1%>">
                 2: <%=option2%><input type="radio" name="option" value="<%=option2%>"><br>
                 <input type="submit" action="ValidateCheck.jsp" value="submit">
                 <% 
                    user_answer=request.getParameter("option");
                   // application.setAttribute("key",user_answer);
                   // rd=request.getRequestDispatcher("/ValidateCheck.jsp");
                   //rd.forward(request,response);
                 %>
             </form>
             <div> <input type="button"  align="left" value="Prev."> <input type="button"  align="right" value="Next"></div>
    </body>
</html>
