

<%@page import="java.util.List"%>
<%@page import="com.ecom.entities.Category"%>
<%@page import="com.ecom.helper.FactoryProvider"%>
<%@page import="com.ecom.dao.CategoryDao"%>
<%--<%@page import="com.ecom.entities.User"%>
<% 
    
    User user2 = (User) session.getAttribute("current-user");
    if(user2 == null) {
       session.setAttribute("msg", " Log in first !");
       response.sendRedirect("login.jsp");
    }
    
    
    else if (user2.getUserName().equals("admin") && user2.getUserPassword().equals("admin"))  {
     
    response.sendRedirect("admin.jsp");
      
    
    } 
    else {
    
    
    session.setAttribute("msg", "Do not access this page !");
    response.sendRedirect("login.jsp");
    }


%>--%>
<%@page import="java.util.List"%>
<%@page import="com.ecom.entities.Product"%>
<%@page import="com.ecom.helper.FactoryProvider"%>
<%@page import="com.ecom.dao.ProductDao"%>
<%@page import="com.ecom.entities.User"%>
<%

    User user1 = (User) session.getAttribute("current-user");


%>
 

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    
    
    <head>
        
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       <!-- Bootstrap CSS -->
        <!-- this is link -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css"
              integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

        <link rel="stylesheet" href="css/all.css">
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"
              integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta2/css/all.min.css" />
        <link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.2.0/mdb.min.css" rel="stylesheet" />

        
        
    </head>
    <body>
  
              
                             <%
                                 CategoryDao cdao=new CategoryDao(FactoryProvider.getFactory());
                                 List<Category> list=cdao.getCategories();

                                 %>
                             
   
                                 <section class="section-p1">
                                     <div class="container mt-30">
            
            <%@include file="components/msg_1.jsp" %>
            
            <div class="container mt-3">
                
                 <!-- first col -->
            <div class="row mt-3">




                <div class="col-md-4">


                    <div class="card " >





                        <div class="card-body text-center">

                            <h5 class="text-uppercase text-muted" style="font-size: 50px;  font-weight: 600">Users</h5>
                            <h1> ----- </h1>


                        </div>


                    </div>


                </div>





                <div class="col-md-4">


                    <div class="card text-center">


                        <div class="card-body">


                            <h5 class="text-uppercase text-muted" style="font-size: 48px;  font-weight: 600">No: Of-Cat</h5>
                            <h1> ----- </h1>
                            <h1> <%= list.size() %></h1>

                        </div>


                    </div>

                </div>







<!--                <div class="col-md-4">


                    <div class="card text-center">


                        <div class="card-body">


                            <h5 class="text-uppercase text-muted">Users</h5>
                            <h1> -----</h1>


                        </div>


                    </div>

                </div>-->


            </div>










            <!-- second col -->

            <div class="row mt-3">

                <div class="col-md-6">

                    <div class="card " data-toggle="modal" data-target="#addcat">


                        <div class="card-body text-center">

                            <h5 class="text-uppercase text-muted" style="font-size: 50px;  font-weight: 600" >Category</h5>
                            <h1> ----- </h1>

                     
                             <p class="mt-3"> click here to add cat</p>

                        </div>


                    </div>


                </div>




                <div class="col-md-6">
                    
                     <div class="card " data-toggle="modal" data-target="#addpro">

                    <div class="card ">


                        <div class="card-body text-center">
                            
                            
                            <h5 class="text-uppercase text-muted"  style="font-size: 50px;  font-weight: 600">Product</h5>

                            <h1> ----- </h1>
                            <p class="mt-3"> click here to add product</p>


                        </div>


                    </div>


                </div>

            </div>
                
                
            </div>

           


        </div>
        
        
        
        
        
        
        
        
        
        <!-- category modal -->        




        <!-- Modal -->
        <div class="modal fade" id="addcat" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel"> Fill Category Detail</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">

                        <form action="ProductOperationServlet" method="post">
                            <input type="hidden" name="operation" value="addcategory">
                            <div class="form-group">
                                <label for="exampleInputEmail1">Category title</label>
                                <input type="text" class="form-control" id="exampleInputEmail1"  name="catTitle" aria-describedby="emailHelp" placeholder="Enter CatTitle" required>

                            </div>
                            <div class="form-group">
                                <label for="exampleInputPassword1">Category description</label>
                                <input type="text" class="form-control"  name="catDesc"  id="exampleInputPassword1" placeholder="Enter Description" required>
                            </div>


                            <div class="container ">
                                <button type="submit" class="btn btn-primary">Submit</button>
                            </div>                       

                        </form>



                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>

                    </div>
                </div>
            </div>
        </div>


        <!-- category modal end -->  
        
        
        
        
        
        
        
        
        
        
         <!-- product modal -->        
        
        
        

         <!-- Modal -->
         <div class="modal fade" id="addpro" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
             <div class="modal-dialog modal-lg" role="document">
                 <div class="modal-content">
                     <div class="modal-header">
                         <h5 class="modal-title" id="exampleModalLabel"> Fill Category Detail</h5>
                         <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                             <span aria-hidden="true">&times;</span>
                         </button>
                     </div>
                     <div class="modal-body">

                         <form  action="ProductOperationServlet" method="post" enctype="multipart/form-data">
                             <input type="hidden" name="operation" value="addproduct">
                            
                             
                             <!-- product title -->  
                             <div class="form-group">
                                 <label for="exampleInputEmail1"> Product title</label>
                                 <input type="text" class="form-control" id="exampleInputEmail1"  name="pName" aria-describedby="emailHelp" placeholder="Enter CatTitle">

                             </div>
                             
                             
                             
                             <!-- product description -->  
                             <div class="form-group">
                                 <label for="exampleInputPassword1">Product description</label>                        
                                 <textarea type="text" class="form-control"  name="pDesc"  id="exampleInputPassword1" placeholder="Enter Description" ></textarea>
                             </div>
                             
                             
                             <!-- product price -->  
                             <div class="form-group">
                                 <label for="exampleInputEmail1"> Product price</label>
                                 <input type="number" class="form-control" id="exampleInputEmail1"  name="pPrice" aria-describedby="emailHelp" placeholder="Enter price">

                             </div>
                             
                             
                             <!-- product discount -->  
                              <div class="form-group">
                                 <label for="exampleInputEmail1"> Product Discount</label>
                                 <input type="number" class="form-control" id="exampleInputEmail1"  name="pDiscount" aria-describedby="emailHelp" placeholder="Enter Discount">

                             </div>
                             
                             
                             <!-- product quantity -->  
                             <div class="form-group">
                                 <label for="exampleInputEmail1"> Product Quantity</label>
                                 <input type="number" class="form-control" id="exampleInputEmail1"  name="pQuantity" aria-describedby="emailHelp" placeholder="Enter Quantity">

                             </div>
                             
                       
                             
                             <div class="form-group">
                                 <select name="catId" class="form-control">
                                     
                                     <%
                                         for(Category c:list){
                                         %>
                                     
                                         <option value="<%= c.getCategoryId()%>" >  <%=c.getCategoryTitle()%>   </option>
                                          
                                     
                                         <%
                                             }
                                             %>
                           
                                 </select>

                             </div>
                             
                             <!-- product pic -->  
                             <div class="form-group">
                                 <label for="pPic"> Select pic of product</label>
                                 <input type="file" class="form-control" id="pPic"  name="pPic" aria-describedby="emailHelp" placeholder="Enter Quantity">

                             </div>


                             <div class="container ">
                                 <button type="submit" class="btn btn-primary">Submit</button>
                             </div>                       

                         </form>



                     </div>
                     <div class="modal-footer">
                         <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>

                     </div>
                 </div>
             </div>
         </div>
        
        
        <!-- product modal end -->  
        
       
                
        
        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
                integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
        crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
                integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
        crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js"
                integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
        crossorigin="anonymous"></script> 
        
        
        
    
        
        
        
        
        
        
        
        
        
        
                                     
                                 </section>
        
        </body>
</html>
