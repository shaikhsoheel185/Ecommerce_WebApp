<%-- 
    Document   : sproduct
    Created on : 22-May-2023, 4:02:08 PM
    Author     : shaikh
--%>
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
        <title>Single product Page</title>
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


                                <a class="dropdown-item"style="font-weight: 700;" href="shop.jsp?category=<%= ca.getCategoryId()%>"><%= ca.getCategoryTitle()%></a>
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
                            
                                <%
                                    String pn = request.getParameter("pname");
                                    String pp = request.getParameter("pphoto");
                                    String pr = request.getParameter("pprice");

                                %>
                                <section id="prodetails" class="section-p1">
                                    <div class="single-pro-image">
                                        <img src="img/product/<%=pp%>" width="100%" class="MainImg" alt="">


                                    </div>

                                    <div class="single-pro-details">

                                        <h6>Home / T-shirt</h6>
                                        <h4><%=pn%> </h4>
                                        <h2>&#8377; <%=pr%></h2>

                                        <select>
                                            <option>Select Size</option>
                                            <option>XL</option>
                                            <option>XXL</option>
                                            <option>Small</option>
                                            <option>Large</option>

                                            <input type="number" value="1">
                                            <button class="normal">Add To Cart</button>
                                            <h4>Product Details</h4>


                                            <span>

                                                Powerful, strong, durable – every athlete and their clothes. With innovative sportswear designed to bring optimum comfort and support, Nike brings to you the best you’ll ever get. Shop for Nike sports shoes , clothing and accessories now with AJIO!

                                                Choose from a variety of styles
                                                NIKE footwear: Providing sustainable innovations and solutions to athlete everywhere, Nike brings to you the best of sports shoes for men and women alike. +

                                                Shop these supportive, comfortable and long-lasting shoes with the comfort of online shopping from your home.

                                                Nike clothes: Have your pick from an exciting collection of Nike clothing to make work out as trendy as possible. Shop from AJIO and get Nike tank tops , t-shirts , track pants , Sports bras for women , and caps for men . Pair them up with stylish hoodies for women and hoodies for men.

                                                Nike accessories: an athlete’s gear needs the right carrier for optimum protection. Now buy Nike backpacks , duffle bags and more, at affordable prices, only at AJIO.

                                                AJIO – the only fashion stopover you need
                                                When it comes to sportswear, online shopping for men was always easy. But with AJIO, rest assured that you will have an amazing experience of online shopping for women as well. Get the newest collection of sports bras , leggings , shorts , tank tops and more from Nike, exclusively at AJIO. Available in fresh prints, bright colours and breathable fabrics, these pieces will ensure you have a comfortable workout. Avail new discounts, offers and new deals for Nike sportswear now at AJIO.


                                            </span>

                                        </select>
                                    </div>

                                </section>

                                <section id="product1" class="section-p1">

                                    <h2> New Arrivals </h2>

                                    <p> This Festive Season New Modern Design </p>

                                    <div class="Pro-container">





                                        <%                                for (Product p : list) {
                                                if (c == 4) {
                                                    break;
                                                }
                                                c++;
                                        %>



                                        <div class="pro">

                                              <a href="sproduct.jsp?pname=<%= p.getpName() %>&pprice=<%= p.getpPrice() %>&pphoto=<%= p.getpPhoto() %>"><img src="img/product/<%= p.getpPhoto() %>" alt=""></a>

                                            <div class="des">

                                                <span  > <%=p.getpName()%></span>

                                                <h5> <%=p.getpName()%> </h5>

                                                <div class="star"> 

                                                    <i class=" fas fa-star">  </i>
                                                    <i class=" fas fa-star">  </i>
                                                    <i class=" fas fa-star">  </i>
                                                    <i class=" fas fa-star">  </i>
                                                    <i class=" fas fa-star">  </i>

                                                </div>

                                                <h4> &#8377; <%=p.getpPrice()%></h4>
                                            </div>




                                            <a href="#" onclick="addcart(<%= p.getpId()%>, '<%= p.getpName()%>', <%= p.getpPrice()%>)">
                                                <i class="fas fa-shopping-cart cart"></i>
                                            </a>


                                        </div>

                                        <%
                                            }
                                        %>

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

    </body>
</html>
