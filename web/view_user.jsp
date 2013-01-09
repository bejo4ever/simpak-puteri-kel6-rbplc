<%-- 
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
            <title>::VIEW USER::</title>
            <script type="text/JavaScript">
                function timedRefresh(timeoutPeriod) {
                    setTimeout("location.reload(true);",timeoutPeriod);
                }
            </script>
        </head>
        <body onload="JavaScript:timedRefresh(15000);">

            <div id ="boxview">
                <table border="1" cellpadding="10px">
                        <tr>
                            <td>Nama</td>
                            <td>Alamat</td>
                            <td>Telepon</td>
                            <td>Username</td>
                        </tr>
                            <%
                                Connection con = null;
                                Statement st = null;
                                ResultSet rs = null;
                                String url = "jdbc:mysql://localhost:3306/parkiran";
                                String user = "root";
                                String password = "rahasia";
                                try {
                                    Class.forName("com.mysql.jdbc.Driver");
                                    con = DriverManager.getConnection(url, user, password);
                                    st = con.createStatement();
                                    rs = st.executeQuery("SELECT *FROM user");
                                    while (rs.next()) {
                                        out.println("<tr>");
                                        out.print("<td>"+rs.getString(1)+"</td>");
                                        out.print("<td>"+rs.getString(2)+"</td>");
                                        out.print("<td>"+rs.getString(3)+"</td>");
                                        out.print("<td>"+rs.getString(4)+"</td>");
                                        out.println("</tr>");
                                    }
                                } catch (Exception e) {
                                    out.print(e);
                                }
                            %>
                    </table>
            </div>
        </body>
    </html>