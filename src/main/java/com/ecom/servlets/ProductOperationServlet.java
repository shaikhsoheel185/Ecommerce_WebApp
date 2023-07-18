/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.ecom.servlets;

import com.ecom.dao.CategoryDao;
import com.ecom.dao.ProductDao;
import com.ecom.entities.Category;
import com.ecom.entities.Product;
import com.ecom.helper.FactoryProvider;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;

import java.io.IOException;
import java.io.InputStream;

import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author shaikh
 */
@MultipartConfig
@WebServlet(name = "ProductOperationServlet", urlPatterns = {"/ProductOperationServlet"})
public class ProductOperationServlet extends HttpServlet {

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
            
            try {
                
               
               
               String op = request.getParameter("operation");
               if(op.trim().equals("addcategory"))
               {
                    // add cat
                   String title = request.getParameter("catTitle");
                   String desc = request.getParameter("catDesc");
                    
                   Category category= new Category();
                   
                   category.setCategoryTitle(title);
                   category.setCategoryDescription(desc);
                   
                   CategoryDao categoryDao = new CategoryDao(FactoryProvider.getFactory());
                   int catid = categoryDao.saveCategory(category);
                   //out.println("save"+catid);
                   
                   HttpSession httpsession = request.getSession();
                   httpsession.setAttribute("msg", "Category added Succesfully");
                   response.sendRedirect("admin.jsp");
                   
                   
               } else if(op.trim().equals("addproduct")){ 
                   
                   // add pro
                   
                   
                  String pname  = request.getParameter("pName");
                  String pdesc  = request.getParameter("pDesc");
                  int pprice    = Integer.parseInt(request.getParameter("pPrice"));
                  int pdiscount = Integer.parseInt(request.getParameter("pDiscount"));
                  int pquantity = Integer.parseInt(request.getParameter("pQuantity"));
                  int catid     = Integer.parseInt(request.getParameter("catId")); 
                  
                  Part part = request.getPart("pPic");
                  
                  Product p = new Product();
                  
                  p.setpName(pname);
                  p.setpDesc(pdesc);
                  p.setpPrice(pprice);
                  p.setpDiscount(pdiscount);
                  p.setpQuuantity(pquantity);
                  
                  p.setpPhoto(part.getSubmittedFileName());
                  
                  CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
                  
                  Category category  = cdao.getCategoryByID(catid);
                  
                  p.setCategory(category);
                  
                  
                  ProductDao pdao = new ProductDao(FactoryProvider.getFactory());
                  
                  pdao.saveProduct(p);
                  String path = request.getRealPath("img" + File.separator + "product"+File.separator+part.getSubmittedFileName());
                  System.out.println(path);
                  
                  // Saving photo
                   try {
                  
                  
                       InputStream is;
                      try ( // pic upload find out the path to upload photo
                              FileOutputStream fos = new FileOutputStream(path)) {
                          is = part.getInputStream();
                          byte[] data = new byte[is.available()];
                          is.read(data);
                          fos.write(data);
                      }
                   is.close();
                    
                   } catch (IOException e) {
                   }
                  
                  
                  
                  
                  HttpSession httpsession = request.getSession();
                  httpsession.setAttribute("msg", "Product is added Succesfully");
                  response.sendRedirect("admin.jsp");
                  
                  
                   
                   
               } 
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
            } catch (Exception e) {
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
