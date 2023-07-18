<%

    String message = (String) session.getAttribute("msg");
    if (message != null) {

%>



<div class="alert alert-danger" role="alert">
    <%= message%>
   <a href="signup.jsp" class="alert-link">click here </a> to create account
</div>


<%
        session.removeAttribute("msg");
    }


%>

