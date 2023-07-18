<%-- 
    Document   : contact
    Created on : 15-May-2023, 7:13:03 PM
    Author     : shaikh
--%>

<%@page import="com.ecom.dao.CategoryDao"%>
<%@page import="com.ecom.entities.Category"%>
<%@page import="java.util.List"%>
<%@page import="com.ecom.entities.Product"%>
<%@page import="com.ecom.helper.FactoryProvider"%>
<%@page import="com.ecom.dao.ProductDao"%>
<%@page import="com.ecom.entities.User"%>
<%

    User user1 = (User) session.getAttribute("current-user");


%>
 <%                ProductDao dao = new ProductDao(FactoryProvider.getFactory()); 
                   CategoryDao cdao= new CategoryDao(FactoryProvider.getFactory());
                   List<Category> clist= cdao.getCategories();
                   List<Product> list = dao.getAllProducts();
                   String cat =request.getParameter("category");
                  
                    int c = 0;
                    
                    if (cat == null) {
                    dao.getAllProducts();
     }else {
      int cid = Integer.parseInt(cat.trim());
          list = dao.getAllProductsbyid(cid);
     
     }
                   
                %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Contact Page</title>
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
        
           <section id="header" class="d-flex">
            <div>
                <ul id="navbar" class="d-flex"> 
                    <!-- Logo -->
                    <div class="d-flex align-items-start justify-content-start" style="margin-right: 460px;">
                        <a href="#"><img src="img/nike.png" class="logo" style="width: 60px !important; height: 60px !important;" alt=""></a>
                    </div>
                    <!-- Navigation links -->
                    <div class="d-flex align-items-center justify-content-center ml-auto p-2">
                        <li><a  href="index.jsp">Home</a></li>
                        <!-- Dropdown menu for categories -->
                        <div class="dropdown">
                            <button class="btn btn-secondary  bg-white text-black " style="text-transform: none; color: #010706; font-size: 16px !important; font-weight: 600; border: 0;" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                                Categories
                            </button>
                            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                
                <%                                for (Category ca : clist) {
                        
                %>


                <a class="dropdown-item"style="font-weight: 700;" href="shop.jsp?category=<%= ca.getCategoryId() %>"><%= ca.getCategoryTitle() %></a>
                                 <%
                    }
                %>
                                
                            </div>
                        </div>
                        <li><a href="shop.jsp">Shop</a></li>
                        <li><a href="blog.jsp">Blog</a></li>
                        <li><a href="about.jsp">About</a></li>
                        <!-- Small button groups (default and split) -->
                        <li><a href="contact.jsp">Contact</a></li>
                        <!-- Dropdown menu for user options --> 
                        <div class="dropdown">
                           <button class="btn btn-secondary  bg-white text-black" style="border: 0;" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fa-sharp fa-solid fa-user"></i>
                            </button>
                            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                <!-- If user is not logged in -->
                                <% if (user1 == null) { %>
                                <a class="dropdown-item bg-white" style="font-size: 16px; font-weight: 700;" href="login.jsp">Login</a>
                                <a class="dropdown-item"style="font-size: 16px; font-weight: 700;" href="signup.jsp">Register</a>
                                <a class="dropdown-item"style="font-size: 16px; font-weight: 700;" href="blog.jsp">Blog</a>
                                <a class="dropdown-item"style="font-size: 16px; font-weight: 700;" href="about.jsp">About</a> 
                                <a class="dropdown-item"style="font-size: 16px; font-weight: 700;"href="contact.jsp">Contact</a>
                                <% } else {%>
                                <!-- If user is logged in -->
                                <a class="dropdown-item bg-white" style="font-size: 16px; font-weight: 700;" href="#">hello <%= user1.getUserName()%></a>
                                <a class="dropdown-item" style="font-size: 16px; font-weight: 700;" href="blog.jsp">Blog</a>
                                <a class="dropdown-item" style="font-size: 16px; font-weight: 700;" href="about.jsp">About</a>
                                <a class="dropdown-item" style="font-size: 16px; font-weight: 700;" href="contact.jsp">Contact</a>
                                <a class="dropdown-item" style="font-size: 16px; font-weight: 700;" href="LogoutServlet">Logout</a>
                                <% }%>
                            </div>
                        </div>
                       <li><a href="cart.jsp"><i class="fa-sharp fa-solid fa-bag-shopping"></i></a></li>
                    </div>
                </ul>
            </div>
        </section> 
        <section id="page-header" style="background-image: url(img/about/banner.png);">


            <h2>#lets's_talk</h2>

            <p>LEAVE A MESSAGE, We love to hear from you !</p>


        </section>

        <section id="contact-details" class="section-p1">
            <div class="details">
                <span>GET IN TOUCH</span>
                <h2> Visit one of our agency locations or contact us today</h2>
                <h3>Head Office</h3>
                <div class="">
                    <li>
                        <i class="fa-sharp fa-solid fa-location-dot"></i>
                        <p>60 Magarpatta Pune Maharashtra India</p> 
                    </li>

                    <li>
                        <i class="fa-solid fa-envelope"></i>
                        <p>contact@example.com</p> 
                    </li>

                    <li>
                        <i class="fa-solid fa-phone"></i>
                        <p>contact@example.com</p> 
                    </li>

                    <li>
                        <i class="fa-solid fa-clock"></i>
                        <p> Monday to Saturday: 9.00am to 16.pm</p> 
                    </li>
                </div>
            </div>

            <div class="map">
                <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d7566.
                        570918521497!2d73.92033441514002!3d18.515998003503032!2m3!1f0!2f0!3f0!3m2
                        !1i1024!2i768!4f13.1!3m3!1m2!1s0x3bc2c18d3fd3454d%3A0x38ae6b1008a0d0c4!2s
                        Magarpatta%2C%20Hadapsar%2C%20Pune%2C%20Maharashtra!5e0!3m2!1sen!2sin!4v1
                        682874577203!5m2!1sen!2sin" width="600" height="450" style="border:0;" 
                        allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-dow
                        grade"></iframe>

            </div>


        </section>

        <section id="newsletter" class="section-p1">

            <div class="newstext">

                <h4>SIGN UP FOR NEWSLETTERS</h4>
                <p>GET E-EMAIL UPDATES ABOUT OUR LATEST SHOP AND <span>SPECIAL OFFERS</span></p>

            </div>

            <div class="form">
                <input type="text" placeholder="Your Email Address">
                <button class="normal">Sign Up</button>

            </div>

        </section>

        <footer class="p-4">
            <div class="col">

                <h4>CONTACT</h4>
                <p> <strong>ADDRESS:</strong> hadapsar east Pune Maharashtra </p>
                <p> <strong>PHONE:</strong> +91 2222 365/ (+91) 01 2345 6789 </p>
                <p> <strong>HOURS:</strong> 10:00 - 18:00, Mon - sat </p>
                <div class="follow">
                    <h4>FOLLOW US</h4>
                    <div class="icon">
                        <i class="fab fa-facebook-f"></i>
                        <i class="fab fa-twitter"></i>
                        <i class="fab fa-instagram"></i>
                        <i class="fab fa-pinterest"></i>
                        <i class="fab fa-youtube"></i>

                    </div>

                </div>
            </div>

            <div class="col">
                <h4>ABOUT US</h4>
                <a href="#">About Us</a>
                <a href="#">Delivery Informative</a>
                <a href="#">Privacy Policy</a>
                <a href="#">Terms & Conditions</a>
                <a href="#">Contact US</a>

            </div>

            <div class="col">
                <h4>MY ACCOUNT</h4>
                <a href="#">Sign In</a>
                <a href="#">View Cart</a>
                <a href="#">My Wishlist</a>
                <a href="#">Track My Order</a>
                <a href="#">Help</a>

            </div>

            <div class="col install">
                <h4> INSTALL APP</h4>
                <p> From App Store or Google Play </p>
                <div class="row">
                    <img src="img/pay/app.jpg" alt="">
                    <img src="img/pay/play.jpg" alt="">
                </div>
                <p> Secured Payment Gateways </p>
                <img src="img/pay/pay.png" alt="">
            </div>

            <div class="copyright">


            </div>

        </footer>                    

                    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
                            integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
                    crossorigin="anonymous"></script>
                    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
                            integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
                    crossorigin="anonymous"></script>
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js"
                            integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
                    crossorigin="anonymous"></script>

    </body>
</html>
