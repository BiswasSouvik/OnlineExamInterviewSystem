<%-- 
    Document   : ValidateCheck
    Created on : Feb 8, 2017, 11:43:57 PM
    Author     : SouvikPRAT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
        <%!
        ResultSet rs=null;
        Connection con=null;
        PreparedStatement ps=null;
        RequestDispatcher rd=null;
        String user_answer=null,answer=null;
        int count=0,valid_answer=0;
        static int ans_count=1;
        static int answer(int ans_count)
        {
          return ans_count++;  
        }
        %>  
        <%
         try{
         Object o=application.getAttribute("key");
         user_answer=(String)o;   
         Class.forName("com.mysql.jdbc.Driver");
         con=DriverManager.getConnection("jdbc:mysql://localhost:3306/interview_java","root","");
         ps=con.prepareStatement("select answer from java_questions");
         rs=ps.executeQuery();
         count=answer(ans_count);  
         if(rs.absolute(count))
         {
             answer=rs.getString(answer);
             
         }
         if(user_answer.equalsIgnoreCase(answer))
         {
            valid_answer++;
         }
         application.setAttribute("key",valid_answer);
         rd=request.getRequestDispatcher("/Direction.jsp");
         rd.forward(request,response);
         } catch(Exception e)
                 {
                     e.printStackTrace();
                 }
         
      %>