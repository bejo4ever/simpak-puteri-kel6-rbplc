<%-- 
    Document   : kontrol
    Created on : Dec 8, 2012, 11:08:48 PM
    Author     : holyknight
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
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
        String denda = (String) request.getAttribute("denda");

        //null values
        if (lokasi == null) {
            lokasi = new Lokasi();
        }
        if (message == null) {
            message = "";
        }
        if (denda == null) {
            denda = "";
        }
    %>
    <head>
        <script>
            function posisi(i){
                document.kontrol.posisi.value=i;
                document.kontrol.posisi.value=i;
            }
        </script>
        <link rel="stylesheet" type="text/css" href="includes/style.css" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>::KONTROL::</title>
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
            <h1>Mode: Kontrol</h1>
            <br><br><br><br><br>
            <table border="0">
                <tr>
                <form action="location" method="post" name="keluar2">
                    <%
                        Connection con = null;
                        Statement st = null;
                        ResultSet rs = null;
                        String url = "jdbc:mysql://localhost:3306/parkiran";
                        String user = "root";
                        String password = "rahasia";
                        String[][] list = new String[25][25];
                        try {
                            Class.forName("com.mysql.jdbc.Driver");
                            con = DriverManager.getConnection(url, user, password);
                            st = con.createStatement();
                            rs = st.executeQuery("SELECT lantai, posisi, status_lokasi FROM lokasi");
                            while (rs.next()) {
                                list[rs.getInt(1)][rs.getInt(2)] = rs.getString(3);
                                //out.println("lt"+rs.getInt(1)+"pos"+rs.getInt(2)+"stat"+rs.getString(3)+"<br>");

                                //out.println("status"+rs.getInt(1)+"posisi"+rs.getInt(2)+"adalah"+list[rs.getInt(1)][rs.getInt(2)]);
                            }
                            out.println("<table border=1 cellpadding=10px>");
                            for (int i = 1; i <= 6; i++) {
                                out.println("<tr>");
                                out.println("<td><input type='radio' name='lantai' value='" + i + "'>" + i + "</td>");
                                for (int j = 1; j <= 20; j++) {
                                    if (list[i][j] != null) {
                                        if (list[i][j].equals("1")) {
                                            out.println("<td bgcolor=#aaaa00>");
                                        } else if (list[i][j].equals("2")) {
                                            out.println("<td bgcolor=#ff0000>");
                                        }
                                    } else {
                                        out.println("<td bgcolor=#00ff00>");
                                    }
                                    out.println("<a href=javascript:posisi(" + j + ")>" + j + "</a>");
                                    out.println("</td>");
                                }
                                out.print("</tr>");
                            }

                        } catch (Exception e) {
                            out.print(e);
                        }
                    %>
            </table>
            <table>
                <tr>
                    <td>
                        posisi:
                    </td>
                    <td>
                        <input type="text" name="posisi">
                    </td>
                </tr>
                <tr>
                    <td>
                        nomer kendaraan
                    </td>
                    <td>
                        <input type="text" name="nmr_kendaraan">
                    </td>
                    <td><input name ="action" type="hidden" value="kontrol"></td>
                </tr>
                <td><input type="submit"></td>
            </table>
        </form>
    </div>
</body>
</html>