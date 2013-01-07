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
            String scan = (String) request.getAttribute("scan");
            //request.setAttribute("action", "masuk");

            //null values
            if (lokasi == null) {
                lokasi = new Lokasi();
                //lokasi.setLantai("1");
            }
            if (message == null) {
                message = "";
            }
            if (scan == null){
                scan = "1";
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
            <title>::KONTROL::</title>
        </head>
        <body>
            <sub><p align="right">welcome <%= username%>!</p></sub>

            <div id ="header">
                <h1>Hello World! Kontrol</h1>
            </div>

            <div id ="box_masuk">
                <h1>Mode: Kontrol</h1>
                <br><br><br><br><br>
                <input type="text" name="cekLantai">
                <table border="1" bgcolor="#ffffff" cellpadding="10px">
                    <tr>
                        <%
                        for (int i=0;i<10;i++){
                            if(scan)
                            out.print("<td><a href='javascript:posisi(" +i +")'>"+i+"</a></td>");
                        }
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
                                %>
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
                </table>  
            </div>
        </body>
    </html>