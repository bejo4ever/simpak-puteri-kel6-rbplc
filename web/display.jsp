a<%-- 
    Document   : kontrol
    Created on : Dec 8, 2012, 11:09:05 PM
    Author     : holyknight
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="business.Lokasi"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <html>
        <head>
            <link rel="stylesheet" type="text/css" href="includes/style2.css" />
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>::KONTROL::</title>
            <script type="text/JavaScript">
                function timedRefresh(timeoutPeriod) {
                    setTimeout("location.reload(true);",timeoutPeriod);
                }
            </script>
        </head>
        <body onload="JavaScript:timedRefresh(15000);">

            <div id ="header">
                <h1>Kondisi Area Parkir</h1> 
                <font color="black"><table cellpadding="4px"><td bgcolor=#00ff00>Tersedia</td><td bgcolor=#888800>Akan dipakai</td><td bgcolor=#aa0000>Terpakai</td></table></font>
            </div>

            <div id ="box_displaytable">
                <h1><table border="0" bgcolor="#ffffff" cellpadding="10px">
                        <tr>
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
                                        out.println("<tr><td></td></tr><tr>");
                                        for (int j = 1; j <= 20; j++) {
                                            if (list[i][j] != null) {
                                                if (list[i][j].equals("1")) {
                                                    out.println("<td bgcolor=#888800>");
                                                } else if (list[i][j].equals("2")) {
                                                    out.println("<td bgcolor=#aa0000>");
                                                }
                                            } else {
                                                out.println("<td bgcolor=#00ff00>");
                                            }
                                            out.println(j);
                                            out.println("</td>");
                                        }
                                        out.print("</tr>");
                                    }

                                } catch (Exception e) {
                                    out.print(e);
                                }
                            %>
                    </table></h1>  
            </div>
            <div id="box_displayplace">
                <img src="includes/gramedia.jpg" height=50px>
                <br><br><br>
                <img src=includes/matahari.jpg height=50px>
                <br><br><br>
                <img src=includes/matahari.jpg height=50px>
                <br><br><br>
                <img src=includes/mcd.jpg height=50px>            <img src=includes/kfc.jpg height=50px>
            </div>
        </body>
    </html>