<%-- 
    Document   : keluar
    Created on : Dec 8, 2012, 11:08:48 PM
    Author     : holyknight
--%>

<%@page import="business.Lokasi"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
        <title>JSP Page</title>
    </head>
    <body>
        <sub><p align="right">welcome <%= username%>!</p></sub>

        <div id ="header">
            <h1>Hello World! Masuk</h1>
            <p><i>
                    <%
                        out.print(message);
                    %>
                </i></p>
        </div>

        <div id ="formstyle">
            <form action="location" method="post">
                <table cellspacing="5" border="0">
                    <tr>
                        <td align="right">Nomor Kendaraan</td>
                        <td><input type="text" name="nmr_kendaraan"></td>
                    </tr>
                    <tr>
                        <td align="right">Lantai</td>
                        <td><select name="lantai">
                                <option  value = "pilih" >pilih</option>
                                <%
                                    for (int i = 1; i <= 6; i++) {
                                %>
                                <option  value = "<% out.print(i);%>" > <% out.print(i);%> </option>
                                <%                                }
                                %>
                            </select></td>
                    </tr>
                    <tr>
                        <td align="right">Posisi</td>
                        <td><select name="posisi">
                                <option  value = "pilih" >pilih</option>
                                <%
                                    for (int i = 1; i <= 20; i++) {
                                %>
                                <option  value = "<% out.print(i);%>" > <% out.print(i);%> </option>
                                <%                                }
                                %>
                            </select></td>
                    </tr>
                    <tr>
                        <td><input name ="action" type="hidden" value="masuk"></td>
                        <td><br><input type="submit" value="Submit"></td>
                    </tr>
                </table>
            </form>
        </div>
    </body>
</html>