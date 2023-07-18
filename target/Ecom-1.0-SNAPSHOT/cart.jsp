<!DOCTYPE html>

<%-- 
    Document   : cart
    Created on : 12-May-2023, 7:38:30 PM
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

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cart Page</title>
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
        <script src="https://code.jquery.com/jquery-3.7.0.min.js"
        integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" 
        crossorigin="anonymous"></script>
        
        
        <script src="javascript/script.js"></script>

    </head>
    <body>
         <script src="https://code.jquery.com/jquery-3.7.0.min.js" 
        integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" 
        crossorigin="anonymous"></script>

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
                            
                            

                                              
                            

        <section id="cart" class="section-p1 ">
            <div class="cartog">
                
            </div>
            <div class="car">
                
            </div>
<!--            <table width="100%">
                <thead>
                    <tr>
                        <td>Remove</td>
                        <td>Image</td>
                        <td>Product</td>
                        <td>Price</td>
                        <td>Quantity</td>
                        <td>Subtotal</td>
                    </tr>
                </thead>

                <tbody>
                    <tr>
                        <td> <a href="#"> <i class="fa-solid fa-trash-can" style="font-size: 25px; color: red;"></i> </a>
                        </td>
                        <td> <img src="img/products/f1.jpg" alt=""></td>
                        <td>Cartton Astrount T-Shirts</td>
                        <td>$118</td>
                        <td><input type="number" value="1"></td>
                        <td>$118</td>
                    </tr>

                   
                </tbody> 
            </table>-->

        </section>
                            
<!--                            <div class="toast" id="toast">Item has been removed </div>-->

        <section id="cart-add" class="section-p1">
            <div id="coupon">
                <h3>Apply Coupon</h3>
                <div>
                    <input type="text" placeholder="Enter Your Coupon">
                    <button class="normal">Apply</button>
                </div>
            </div>

            <div id="subtotal" class="subtotal">
<!--                <h3>Cart Totals</h3>
                <table>
                    <tr>
                        <td>Cart Subtotal</td>
                        <td>$ 335</td>
                    </tr>

                    <tr>
                        <td>Shipping</td>
                        <td>Free</td>
                    </tr>

                    <tr>
                        <td><strong>Total</strong></td>
                        <td><strong>$ 335</strong></td>
                    </tr>
                </table>-->
                <button class="normal checkout ">Proceed to checkout</button>

            </div>

        </section>                    
<div class="toast" id="toast"   ">Item Removed </div>
        <section id="newsletter" class="section-p1 section-m1" style="background-image: url(img/banner/b14.png );">

            <div class="newstext">

                <h4>Sign Up For newsletters</h4>
                <p>Get E-email updates about our latest shop and <span>special offers</span></p>

            </div>

            <div class="form">
                <input type="text" placeholder="Your email address">
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
        
        
                            
                            <script>
                                
                                
                                
                                function add_to_cart (pid, pname, price){
    
    
    
    
    let cart = localStorage.getItem("cart");
    
    
    
    
    if(cart == null){
        
        // no cart yet
        let products=[];
        
        let product =  {productId: pid, productName: pname, productQuantity: 1, productPrice: price  };
        products.push(product);
        localStorage.setItem("cart", JSON.stringify(products));
        console.log("add123for the first time");
        
        
    } 
    
    
    
    
    else{
        
        // cart is aleready present
        let pcart = JSON.parse(cart);
        
        let oldProduct = pcart.find((item) => item.productId == pid );
        
        if(oldProduct){
            
            // We Have to icrease the quntity
            oldProduct.productQuantity = oldProduct.productQuantity +1;
            
            
            
            
            
//            pcart.map((item) =>{
//                
//                 if(item.productId ==  oldProduct.productId){
//                     item.productQuantity = oldProduct.productQuantity;
//                 }
//            });
            
            
            
            
            
            
            
            // We have used for each insted of map 
            
             pcart.forEach((item) => {
        if (item.productId == oldProduct.productId) {
          item.productQuantity = oldProduct.productQuantity;
        }
      });
            
            
            
            
            
            
            
            localStorage.setItem("cart", JSON.stringify(pcart));
            console.log("Quantity is increased")
            
        } 
        
        
        
        
        
        else{
            
            // We have to add the quantity
              let product =  {productId: pid, productName: pname, productQuantity: 1, productPrice: price  };
            pcart .push(product)
            localStorage.setItem("cart", JSON.stringify(pcart));
            console.log("product is added");
            
            
        }
        
        updateCart();
        
    }
}




function updateCart() {
  let cartString = localStorage.getItem("cart");
  let cart = JSON.parse(cartString);

  if (cart === null || cart.length === 0) {
    console.log("Cart is Empty!");
    $(".cartog").html("<h3>Cart does not have any items</h3>");
  } else {
    console.log(cart);
      $(".cartog").html("<h3>Cart does not have any items</h3>");
    let table = `
      <table width="100%">
        <thead>
          <tr>
            <td>Remove</td>
            <td>Image</td>
            <td>Product</td>
            <td>Price</td>
            <td>Quantity</td>
            <td>Subtotal</td>
          </tr>
        </thead>
      `;
            
            
                    
        cart.map((item) => {
    table +=
        `
        <tr>
            <td> <a href="#"><i class="fa-solid fa-trash-can" style="font-size: 25px; color: red;"></i></a></td>
            <td><img src="img/products/f1.jpg" alt=""></td>
            <td>${item.productName}</td>
            <td>${item.productPrice}</td>
            <td>${item.productQuantity}</td>
            <td>${item.productQuantity * item.productPrice}</td>
        </tr>
        `;
});
            
            

    table += "</table>";

    $(".cartog").html(table);
  }
}

$(document).ready(function() {
  updateCart();
});

                                
                                
                                
                            </script>
                                
        <script src="javascript/script.js"></script>
                            
                            
        <script src="https://code.jquery.com/jquery-3.7.0.min.js" 
        integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" 
        crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
                integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
        crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js"
                integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
        crossorigin="anonymous"></script>
    </body>
</html>