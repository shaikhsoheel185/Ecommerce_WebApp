<!DOCTYPE html>


<%@page import="com.ecom.entities.Category"%>
<%@page import="com.ecom.dao.CategoryDao"%>
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
                   List<Product> slist = dao.getAllProducts();
                   String cat =request.getParameter("category");
                  
                    int c = 0;
                    int s =0;
                    if (cat == null) {
                    dao.getAllProducts();
     }else {
      int cid = Integer.parseInt(cat.trim());
          list = dao.getAllProductsbyid(cid);
     
     }
     int sshid=10;
     slist = dao.getAllProductsbyid(sshid);
                   
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
        
        
         <script src="https://code.jquery.com/jquery-3.7.0.min.js" 
        integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" 
        crossorigin="anonymous"></script>
        
        
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"
              integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm"
              crossorigin="anonymous" />
       
        <script src="https://code.jquery.com/jquery-3.7.0.min.js"
        integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" 
        crossorigin="anonymous"></script>
        
        
        <script src="javascript/script.js"></script>

    </head>
    <body>
       
          
         <div class="toast" id="toast">Item Added To Cart </div>
        
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

 



        <section id="hero" style="background-image: url(img/unisex-white-sneakers.jpg );">

            <h4>Trade-in-offer</h4>
            <h2>Super value deals</h2>
            <h1>NIKE</h>
                <p>Save more coupon & up to 20 % off! </p>
                <button >Shop Now</button>

        </section>






        <section id="product1" class="section-p1">

            <h2> Featured Products </h2>
            

            <p> Summer Collection New Modern Design </p>

            <div class="Pro-container">

               



                <%                                for (Product p : list) {
                        if (c == 12) {
                            break;
                        }
                        c++;
                %>



                <div class="pro">
                    
<!--                    <img src="img/product/<%= p.getpPhoto()%>" alt="">-->
<!--                    <a href="sproduct.jsp?pname=<%= p.getpName() %> pprice=<%= p.getpPrice() %>, pphoto=<%= p.getpPhoto() %>"> <img src="img/product/<%= p.getpPhoto()%>" alt=""></a>-->
                 <a href="sproduct.jsp?pname=<%= p.getpName() %>&pprice=<%= p.getpPrice() %>&pphoto=<%= p.getpPhoto() %>"><img src="img/product/<%= p.getpPhoto() %>" alt=""></a>

                    <div class="des">

                        <span  > <%=p.getpName()%></span>

                        <h5> <%=p.getpDesc()%> </h5>

                        <div class="star"> 

                            <i class=" fas fa-star">  </i>
                            <i class=" fas fa-star">  </i>
                            <i class=" fas fa-star">  </i>
                            <i class=" fas fa-star">  </i>
                            <i class=" fas fa-star">  </i>

                        </div>

                        <h4> &#8377; <%=p.getpPrice()%></h4>
                    </div>




                    <a href="#" onclick="add_to_cart(<%= p.getpId()%> , '<%= p.getpName()%>' , '<%= p.getpPrice()%>' , '<%= p.getpPhoto()%>' )">
                        <i class="fas fa-shopping-cart cart"></i>
                    </a>


                </div>

                <%
                    }
                %>

            </div>
        </section>
               

        <section id="banner" class="section-p1">

            <h4> Repair Services </h4>
            <h2>Up to <span> 60% off </span> All t-Shirts & Accessoriees</h2>
            <button href="shop.jsp" class="normal">Explore More</button>



        </section>


        <section id="product1" class="section-p1">

            <h2> New Arrivals </h2>

            <p> This Festive Season New Modern Design </p>

            <div class="Pro-container">





                <%                                for (Product p : slist) {
                
                        if (s == 16) {
                            break;
                        }
                        s++;
                %>



                <div class="pro">

<!--                    <img src="img/product/<%= p.getpPhoto()%>" alt="">-->
                      <a href="sproduct.jsp?pname=<%= p.getpName() %>&pprice=<%= p.getpPrice() %>&pphoto=<%= p.getpPhoto() %>"><img src="img/product/<%= p.getpPhoto() %>" alt=""></a>


                    <div class="des">

                        <span  > <%=p.getpName()%></span>

                        <h5> <%= p.getpDesc()%> </h5>

                        <div class="star"> 

                            <i class=" fas fa-star">  </i>
                            <i class=" fas fa-star">  </i>
                            <i class=" fas fa-star">  </i>
                            <i class=" fas fa-star">  </i>
                            <i class=" fas fa-star">  </i>

                        </div>

                        <h4> &#8377; <%=p.getpPrice()%></h4>
                    </div>




                    <a href="#" onclick="add_to_cart(<%= p.getpId()%>, '<%= p.getpName()%>', <%= p.getpPrice()%> , '<%= p.getpPhoto()%>')">
                        <i class="fas fa-shopping-cart cart"></i>
                    </a>


                </div>

                <%
                    }
                %>

            </div>
        </section>



        <section id="sm-banner" class="section-p1">

            <div class="banner-box"
                 style="background-image: url(img/banner/white-canvas-sneakers-women-s-shoes-apparel-shoot.jpg );">

                <h4>crazy deals</h4>
                <h2>buy 1 get 1 free</h2>
                <span> The best classic dress is sale on care festive season</span>
                <button class="white"> Learn More </button>

            </div>



            <div class="banner-box banner-box2"
                 style="background-image: url(img/banner/african-american-man-white-tshirt.jpg );">

                <h4>Spring/Summer</h4>
                <h2>upcoming season</h2>
                <span> The best classic dress is sale on care festive season</span>
                <button class="white"> Collection </button>

            </div>


        </section>
                
                <section id="hero" style="background-image: url(img/369.jpg );">


                </section>
                
                <section id="about-app" class="section-p1">
                    <h1>Download Our <a href="#">App</a></h1>
                    <div class="video">
                        <video autoplay muted loop src="img/about/1.mp4"></video>
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
                
        
                   
        <script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
                integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
        crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js"
                integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
        crossorigin="anonymous"></script>

    </body>
</html>