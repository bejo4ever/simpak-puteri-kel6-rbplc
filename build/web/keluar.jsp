<%-- 
    Document   : keluar
    Created on : Dec 8, 2012, 11:08:48 PM
    Author     : holyknight
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%
        String ses = (String) request.getAttribute("ses");
                
        
        if (ses == null) {
            RequestDispatcher dispatcher =
                    getServletContext().getRequestDispatcher("/login.jsp");
            request.setAttribute("message", "anda belum login");
            dispatcher.forward(request, response);

        }

    %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        welcome <%= ses%>!
        <h1>Hello World! Keluar</h1>
    </body>
</html>
