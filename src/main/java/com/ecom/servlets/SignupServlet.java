/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.ecom.servlets;

import com.ecom.entities.User;
import com.ecom.helper.FactoryProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author shaikh
 */
@WebServlet(name = "SignupServlet", urlPatterns = {"/SignupServlet"})
public class SignupServlet extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            
            
            
            try {
                
                 String uname = request.getParameter("name");
                 String uemail = request.getParameter("email");
                 String upass = request.getParameter("pass");
                 String uphone = request.getParameter("phone");
                 String uaddress = request.getParameter("address");
                 
                 if(uname.isEmpty()) {
                     
                    out.println("name is blank");
                    return;
                 }
                 
                 
                 
                 
                 
                 // Creating user object to store data
                  
                User user = new User(uname, uemail, upass, uphone, "default.png", uaddress);
                 
                try (Session hibernatesession = FactoryProvider.getFactory().openSession()) {
                    Transaction tx = hibernatesession.beginTransaction();
                    
                   int useId =(int) hibernatesession.save(user);
                    
                    
               
                    
                    tx.commit();
                    hibernatesession.close();
                    
                    HttpSession httpSession =request.getSession();
                    
                    httpSession.setAttribute("msg", "your accout has been created");
                    
                    response.sendRedirect("signup.jsp");
                    
                    
                }
                
                
                
                
                
               
                
                
                
                
                
                
            } catch (HibernateException e) {
                e.printStackTrace();
            }
        }
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
