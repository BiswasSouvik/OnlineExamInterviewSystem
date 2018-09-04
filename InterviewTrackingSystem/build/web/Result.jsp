<%-- 
    Document   : Result
    Created on : Feb 8, 2017, 9:42:45 PM
    Author     : SouvikPRAT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*,java.util.*"%>

         <%!
        Connection con=null;
        PreparedStatement ps1=null,ps2=null;
        ResultSet rs1=null,rs2=null;
        Enumeration e1=null,e2=null;
        String user_name,name;
        %>

        <%
            try{
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/interview_java","root","");
            ps1=con.prepareStatement("select * from user");
            ps2=con.prepareStatement("select * from result");
            rs1=ps1.executeQuery();
            rs2=ps2.executeQuery();
                while(rs1.next())
                {
                    user_name=rs1.getString("name");
                }
            ps2=con.prepareStatement("insert into result(name) values(?)");
            ps2.setString(1,user_name);
            int i=ps2.executeUpdate();
            }catch(Exception e){e.printStackTrace();}
        %>
