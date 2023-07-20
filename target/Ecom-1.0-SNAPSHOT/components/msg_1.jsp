<%

    String message = (String) session.getAttribute("msg");
    if (message != null) {

%>



<div class="alert alert-success" role="alert">
    <%= message%>
</div>


<%
        session.removeAttribute("msg");
    }


%>

