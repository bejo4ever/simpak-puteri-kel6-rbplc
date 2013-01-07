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
        <script>
            function posisi(i){
                document.masuk.posisi.value=i;
            }
        </script>
        <link rel="stylesheet" type="text/css" href="includes/style.css" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>::MASUK::</title>
    </head>
    <body>
        <button onclick="location.href='logout.jsp'">Logout</button>
        <sub><p align="right">welcome <%= username%>!  </p></sub>

        <div id ="header">

            <p><i>
                    <%
                        out.print(message);
                    %>
                </i></p>
        </div>

        <div id="box_masuk">
            <h1>Mode: Masuk</h1>
            <br><br><br><br><br>
            <form action="location" method="post" name="keluar">
                <table>
                    <tr>
                        <td>
                            nomor kendaraan:
                        </td>
                        <td>
                            <input type="text" name="nmr_kendaraan">
                        </td>
                        <td><input name ="action" type="hidden" value="keluar"></td>
                        <td><input type="submit"></td>
                    </tr>
                </table>
            </form>
        </div>
    </body>
</html>