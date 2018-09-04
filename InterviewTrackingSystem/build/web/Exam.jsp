<%-- 
    Document   : Exam1
    Created on : Feb 7, 2017, 11:10:36 PM
    Author     : SouvikPRAT
--%>
<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP User Page</title>
    </head>
    <body>
        <%!
        Connection con=null;
        PreparedStatement ps=null;
        ResultSet rs=null;
        RequestDispatcher rd=null;
        String question,answer,user_answer,option1,option2,option3;
        int id=0,ques_count=0;
        static int count=0;
        int question(int ques_count)
        {
          return ques_count++;  
        }
        %>


        <% 
         try{
         count++;
         System.out.println("i am here");
         Class.forName("com.mysql.jdbc.Driver");
         con=DriverManager.getConnection("jdbc:mysql://localhost:3306/interview_java","root","");
         System.out.println("connected");
         response.setIntHeader("Refresh",2);
         ps=con.prepareStatement("select question,option1,option2,option3 from java_questions where id=("+count+")");
         rs=ps.executeQuery();
         System.out.println("hello");
                  if(rs.next())
                  {
                  question=rs.getString("question");
                  option1=rs.getString("option1");
                  option2=rs.getString("option2");
                  option3=rs.getString("option3");
                  //count++;
                  }
         }catch(Exception e)
                 {
                  e.printStackTrace();                  
                 }
        %>
             <div><%=count%></div>
             <div align="center"><h2><%=question%></h2></div><br>
             <form name="form1">
                 1: <%=option1%><input type="radio" name="option" value="<%=option1%>">
                 2: <%=option2%><input type="radio" name="option" value="<%=option2%>"><br>
                 3: <%=option3%><input type="radio" name="option" value="<%=option3%>"><br>
                 <input type="submit" action="ValidateCheck.jsp" value="submit">
                 <% 
                    user_answer=request.getParameter("option");
                    /*application.setAttribute("key",user_answer);
                    rd=request.getRequestDispatcher("/ValidateCheck.jsp");
                    rd.forward(request,response);*/
                 %>
             </form>
             <div> <input type="button"  align="left" value="Prev."> <input type="button"  align="right" value="Next"></div>
    </body>
</html>

