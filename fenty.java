<%-- 
    Document   : kontrol
    Created on : Dec 8, 2012, 11:09:05 PM
    Author     : holyknight
--%>

<%@page import="business.Lokasi"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <html>
        <%
            //String ses = (String) request.getAttribute("ses");
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
            Lokasi lokasi = (Lokasi) request.getAttribute("lokasi");
            String message = (String) request.getAttribute("message");
            //request.setAttribute("action", "masuk");

            //null values
            if (lokasi == null) {
                lokasi = new Lokasi();
            }
            if (message == null) {
                message = "";
            }
        %>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>Mode: Kontrol</title>
        </head>
        <body>
            <sub><p align="right">welcome <%= username%>!</p></sub>

            <div id ="header">
                <h1>Welcome! Mode: Kontrol</h1>
            </div>

            <div id ="formstyle">
                <table>
                    <%
                    for(int i=0;i<20;i++){
                        out.println("<tr><form action=location>");
                        out.print("<td>nmr_kendaraan</td> ");                        
                        out.print("<td>posisiRencana</td> ");                        
                        out.print("<td>posisiRealisasi</td> ");                        
                        out.print("<td><input type=submit></td> ");                        
                        out.println("</form></tr>");
                    }
                    %>
                </table>
            </div>
        </body>
    </html>