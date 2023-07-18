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
<html>
    <head>
        <title>Start Page</title>
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
        <script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>

    </head>
    <body>
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">

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
        
        
        <section id="page-header" style="background-image: url(img/banner/b19.jpg );">
            
           
            <h2>#readmore</h2>
            
            <p>Read all case studies about our products! </p>
          
           
        </section>
        
        <section id="blog">



            <div class="blog-box">
                <div class="blog-img">
                    <img src="img/blog/b1.jpg" alt="">
                </div>
                <div class="blog-details">
                    <h4> The Cotton-Jersey Zip-up Hoodies</h4>
                <p>Kickstarter man braid godard coloring book Racelette waistcoat selfies tr wolf chartreus hexagon irony godard </p>
                <a href="#"> CONTINUE READING </a>
                </div>
                <h1>13/01</h1>
            </div>

            <div class="blog-box">
                <div class="blog-img">
                    <img src="img/blog/b2.jpg" alt="">
                </div>
                <div class="blog-details">
                    <h4> The Cotton-Jersey Zip-up Hoodies</h4>
                <p>Kickstarter man braid godard coloring book Racelette waistcoat selfies tr wolf chartreus hexagon irony godard </p>
                <a href="#"> CONTINUE READING </a>
                </div>
                <h1>13/01</h1>
            </div>

            <div class="blog-box">
                <div class="blog-img">
                    <img src="img/blog/b3.jpg" alt="">
                </div>
                <div class="blog-details">
                    <h4> The Cotton-Jersey Zip-up Hoodies</h4>
                <p>Kickstarter man braid godard coloring book Racelette waistcoat selfies tr wolf chartreus hexagon irony godard </p>
                <a href="#"> CONTINUE READING </a>
                </div>
                <h1>13/01</h1>
            </div>

            <div class="blog-box">
                <div class="blog-img">
                    <img src="img/blog/b4.jpg" alt="">
                </div>
                <div class="blog-details">
                    <h4> The Cotton-Jersey Zip-up Hoodies</h4>
                <p>Kickstarter man braid godard coloring book Racelette waistcoat selfies tr wolf chartreus hexagon irony godard </p>
                <a href="#"> CONTINUE READING </a>
                </div>
                <h1>13/01</h1>
            </div>

            <div class="blog-box">
                <div class="blog-img">
                    <img src="img/blog/b5.jpg" alt="">
                </div>
                <div class="blog-details">
                    <h4> The Cotton-Jersey Zip-up Hoodies</h4>
                <p>Kickstarter man braid godard coloring book Racelette waistcoat selfies tr wolf chartreus hexagon irony godard </p>
                <a href="#"> CONTINUE READING </a>
                </div>
                <h1>13/01</h1>
            </div>

            <div class="blog-box">
                <div class="blog-img">
                    <img src="img/blog/b6.jpg" alt="">
                </div>
                <div class="blog-details">
                    <h4> The Cotton-Jersey Zip-up Hoodies</h4>
                <p>Kickstarter man braid godard coloring book Racelette waistcoat selfies tr wolf chartreus hexagon irony godard </p>
                <a href="#"> CONTINUE READING </a>
                </div>
                <h1>13/01</h1>
            </div>

        </section>


        
        
       <section id="pagination" class="section-p1">
        <a href="#">1</a>
        <a href="#">2</a>
        <a href="#">3</a>
        <a href="#"><i class="fa-solid fa-chevron-right"></i></a>

       </section>
        
        


        <section id="newsletter"  class="section-p1 section-m1" style="background-image: url(img/banner/b14.png );">

            <div class="newstext">

                <h4>Sign Up For newsletters</h4>
                <p>Get E-email updates about our latest shop and <span>special offers</span></p>

            </div>

            <div class="form">
                <input type="text" placeholder="Your email address">
                <button class="normal">Sign Up</button>

            </div>

        </section>


        <footer class="section-p1">
            <div class="col">
                <img class="logo" src="img/logo.png" alt="">
                <h4>Contact</h4>
                <p> <strong>Address:</strong> hadapsar east Pune Maharashtra  </p>
                <p> <strong>Phone:</strong> +91 2222 365/ (+91) 01 2345 6789 </p>
                <p> <strong>Hours:</strong> 10:00 - 18:00, Mon - sat </p>
                <div class="follow">
                    <h4>Follow Us</h4>
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
                <h4>About Us</h4>
                <a href="#">About Us</a>
                <a href="#">Delivery Informative</a>
                <a href="#">Privacy Policy</a>
                <a href="#">Terms & Conditions</a>
                <a href="#">Contact US</a>

            </div>

            <div class="col">
                <h4>My Account</h4>
                <a href="#">Sign In</a>
                <a href="#">View Cart</a>
                <a href="#">My Wishlist</a>
                <a href="#">Track My Order</a>
                <a href="#">Help</a>

            </div>

            <div class="col install">
                <h4> Install App</h4>
                <p> From App Store or Google Play </p>
                <div class="row">
                    <img src="img/pay/app.jpg" alt="">
                    <img src="img/pay/play.jpg" alt="">
                </div>
                <p> Secured Payment Gateways </p>
                <img src="img/pay/pay.png" alt="">
            </div>

            <div class="copyright">
                <p> 2023, Ecom Web by Shaikh </p>

            </div>

        </footer>

  
    
                             
        <script src="javascript/script.js"></script>
         <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
                integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
        crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
                integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
        crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js"
                integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
        crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
                integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
        crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js"
                integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
        crossorigin="anonymous"></script>


    </body>
</html>