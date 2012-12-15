<%-- 
    Document   : administrator
    Created on : Dec 8, 2012, 11:09:47 PM
    Author     : holyknight
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%
        String ses = (String) request.getAttribute("ses");
        //String ses = request.getParameter("ses");
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
        <h1>Hello World! Administrator</h1>
    </body>
</html>
