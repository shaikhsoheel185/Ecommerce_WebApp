






function add_to_cart (pid, pname, price, image){
    
    
    
    
    let cart = localStorage.getItem("cart");
    
    
    
    
    if(cart == null){
        
        // no cart yet
        let products=[];
        
        let product =  {
            
            productId: pid,
            productName: pname,
            productQuantity: 1,
            productPrice: price,
            productImage: image
            
        };
        
        products.push(product);
        localStorage.setItem("cart", JSON.stringify(products));
        
        console.log("addes for the first time --- javaScript file");
        showToast()
        
        
    } 
    
    
    
    
    else{
        
        // cart is aleready present
        let pcart = JSON.parse(cart);
        
        let oldProduct = pcart.find((item) => item.productId == pid);
        
        if(oldProduct){
            
            // We Have to icrease the quntity
            oldProduct.productQuantity = oldProduct.productQuantity +1;
            
            
                                                                           
                  
            // We have used for each insted of map 
            
             pcart.forEach((item) => {
        if (item.productId == oldProduct.productId) {
          item.productQuantity = oldProduct.productQuantity;
        }
      });
            
            
            
            
            
            
            
            localStorage.setItem("cart", JSON.stringify(pcart));
            console.log(" Quantity is increased  ----- java Script File ");
            showToast()
              
            
        } 
        
        
        
        
        
        else{
            
            // We have to add the quantity
              let product =  {productId: pid, productName: pname, productQuantity: 1, productPrice: price, productImage: image  };
            pcart .push(product);
            localStorage.setItem("cart", JSON.stringify(pcart));
            
            console.log(" product is added ---- javaScript file ");
            showToast()
            
            
            
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

let totalPrice = 0;

cart.map((item) => {
    table += `
        <tr>
            <td><a href="#" onclick='delete_item(${item.productId})'><i class="fa-solid fa-trash-can" style="font-size: 25px; color: red;"></i></a></td>
            <td><img src="img/product/${item.productImage}"></td>
            <td>${item.productName}</td>
            <td>${item.productPrice}</td>
            <td>${item.productQuantity}</td>
            <td>${item.productQuantity * item.productPrice}</td>
        </tr>
    `;
    totalPrice += item.productPrice * item.productQuantity;
});

table += '</table>';

$(".cartog").html(table);

let subtotal = `
    <h3>Cart Totals</h3>
    <table>
        <tr>
            <td>Cart Subtotal</td>
            <td>&#8377; ${totalPrice}</td>
        </tr>
        <tr>
            <td>Shipping</td>
            <td>Free</td>
        </tr>
        <tr>
            <td><strong>Total</strong></td>
            <td><strong> &#8377; ${totalPrice}</strong></td>
        </tr>
    </table>
         <button class="normal checkout">Proceed to checkout</button>
`;

$(".subtotal").html(subtotal);


    }
  
  
 }



// delete item

function delete_item(pid){
    
    let cart = JSON.parse(localStorage.getItem('cart'));
    
    let newcart  = cart.filter((item)=> item.productId != pid)
    
    localStorage.setItem('cart', JSON.stringify(newcart));
    
    updateCart();
     showToast()
    
}




$(document).ready(function() {
  updateCart();
});






function showToast() {
  const toast = document.getElementById("toast");
  toast.classList.add("show", "fade-in");

  setTimeout(() => {
    toast.classList.remove("fade-in");
    toast.classList.add("fade-out");

    setTimeout(() => {
      toast.classList.remove("show", "fade-out");
    }, 300);
  }, 2000);
}
