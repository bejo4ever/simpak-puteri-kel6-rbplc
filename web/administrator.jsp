<%-- 
    Document   : administrator
    Created on : Dec 8, 2012, 11:09:47 PM
    Author     : holyknight
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%
        HttpSession ses = request.getSession(true);
        String username = "";
        try {
            username = ses.getValue("username").toString();
        } catch (Exception e) {
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
        welcome <%= username%>!
        <h1>Hello World! Administrator</h1>
    </body>
</html>
