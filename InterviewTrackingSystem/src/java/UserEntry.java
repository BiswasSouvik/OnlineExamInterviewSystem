/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import pk.GenerateID;

/**
 *
 * @author SouvikPRAT
 */
public class UserEntry extends HttpServlet {
        Connection con=null;
        PreparedStatement ps1=null,ps2=null;
        ResultSet rs=null;
        RequestDispatcher rd=null;
        String question,answer,user_answer,option1,option2;
        int id=0,count=0,ques_count=1;
        String firstname,lastname,name,emailid,phone;
        int i=0,j=0;
        PrintWriter out;
        GenerateID gd=null;
       
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
       try{
            out=response.getWriter(); 
            System.out.println("hello");
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/interview_java","root","");
            firstname=request.getParameter("firstname");
            lastname=request.getParameter("lastname");
            emailid=request.getParameter("emailid");
            phone=request.getParameter("mobile");
            name=firstname+" "+lastname;
            gd=new GenerateID();
            id=gd.generateID(name);
            System.out.println("hello");
            ps1=con.prepareStatement("insert into user values(?,?,?,?)"); 
            ps1.setInt(1,id);
            ps1.setString(2,name);
            ps1.setString(3,phone);
            ps1.setString(4,emailid);
            i=ps1.executeUpdate();
            System.out.println(i);
            //ps2=con.prepareStatement("insert into result (name) values('"+name+"')");
            ps2=con.prepareStatement("insert into result (name) values(?)");
            ps2.setString(1,name);
            j=ps2.executeUpdate();
            System.out.println(j);
                request.setAttribute("key",name);
                RequestDispatcher rd=request.getRequestDispatcher("Exam.html");
                rd.forward(request, response);
          // response.sendRedirect("Exam.html");
         /* RequestDispatcher rd=request.getRequestDispatcher("Exam.jsp");
            rd.forward(request, response);
         */
            
            }catch(Exception e){out.println(e);}
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
