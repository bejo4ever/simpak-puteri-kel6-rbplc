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
        <link rel="stylesheet" type="text/css" href="includes/style2.css" />
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
            <form action="location" method="post" name="masuk">
                <table cellspacing="5" border="0">
                    <tr>
                        <td align="right">Nomor Kendaraan</td>
                        <td><input type="text" name="nmr_kendaraan"></td>
                    </tr>
                    <tr>
                        <td align="right">Lantai</td>
                        <td>
                            <input type="radio" name="lantai" value="1">1
                            <input type="radio" name="lantai" value="2">2
                            <input type="radio" name="lantai" value="3">3
                            <input type="radio" name="lantai" value="4">4
                            <input type="radio" name="lantai" value="5">5
                            <input type="radio" name="lantai" value="6">6
                        </td>
                    </tr>
                    <tr>
                        <td align="right">Posisi</td>
                        <td>
                            <table border="1" bgcolor="#ffffff" cellpadding="10px">
                                <tr>
                                    <td><a href="javascript:posisi(1)">1</a></td>
                                    <td><a href="javascript:posisi(2)">2</a></td>
                                    <td><a href="javascript:posisi(3)">3</a></td>
                                    <td><a href="javascript:posisi(4)">4</a></td>
                                    <td><a href="javascript:posisi(5)">5</a></td>
                                    <td><a href="javascript:posisi(6)">6</a></td>
                                    <td><a href="javascript:posisi(7)">7</a></td>
                                    <td><a href="javascript:posisi(8)">8</a></td>
                                    <td><a href="javascript:posisi(9)">9</a></td>
                                    <td><a href="javascript:posisi(10)">10</a></td>
                                </tr>
                                <tr>
                                    <td><a href="javascript:posisi(11)">11</a></td>
                                    <td><a href="javascript:posisi(12)">12</a></td>
                                    <td><a href="javascript:posisi(13)">13</a></td>
                                    <td><a href="javascript:posisi(14)">14</a></td>
                                    <td><a href="javascript:posisi(15)">15</a></td>
                                    <td><a href="javascript:posisi(16)">16</a></td>
                                    <td><a href="javascript:posisi(17)">17</a></td>
                                    <td><a href="javascript:posisi(18)">18</a></td>
                                    <td><a href="javascript:posisi(19)">19</a></td>
                                    <td><a href="javascript:posisi(20)">20</a></td>
                                </tr>
                                <input type="text" readonly="readonly" name="posisi">
                            </table>                        
                        </td>
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