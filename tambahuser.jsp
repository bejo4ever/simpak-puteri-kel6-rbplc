<%-- 
    Document   : index
    Created on : Dec 6, 2012, 8:29:59 AM
    Author     : holyknight
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Tambah Anggota</h1>
        <form>
            <h2>Biodata</h2>
            <table>
                <tr>
                    <td>
                        Nama Anggota
                    </td>
                    <td>
                        <input type="text" name="nama" "maxlength="20">
                    </td>
                </tr>
                <tr>
                    <td>
                        Alamat
                    </td>
                    <td>
                        <input type="text" name="alamat" maxlength="20">
                    </td>
                </tr>
                <tr>
                    <td>
                        Telepon
                    </td>
                    <td>
                        <input type="text" name="telepon" "maxlength="20">
                    </td>
                </tr>
            </table>
            <h2>
                Username dan Password
            </h2>
            <table>
                <tr>
                    <td>
                        Username
                    </td>
                    <td>
                        <input type="text" name="username" maxlength="20">
                    </td>
                </tr>
                <tr>
                    <td>
                        Password
                    </td>
                    <td>
                        <input type="password" name="password" maxlength="20">
                    </td>
                </tr>
                <tr>
                    <td>
                        Admin
                    </td>
                    <td>
                        <input type="checkbox" name="admin" value="1">
                    </td>
                </tr>
            </table>
            <input type="reset"> <input type="submit">
        </form>
    </body>
    <%@include file="dbConnection.jsp" %>
    <%
        String nama = request.getParameter("nama");
        String alamat = request.getParameter("alamat");
        String telepon = request.getParameter("telepon");
        String username = request.getParameter("username");
        String pass = request.getParameter("password");
        String admin = request.getParameter("admin");
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(url, user, password);
            st = con.createStatement();
            st.executeUpdate("INSERT INTO user VALUES ('" + nama
                    + "','" + alamat + "','" + telepon + "','" + username + "',md5('" + pass + "'))");
            if (admin.equals("1")) {
                st.executeUpdate("INSERT INTO admin VALUES ('" + username +"','" + admin + "'))");
            }
            out.print("Pendaftaran username <b>" + username + " </b>berhasil!");
        } catch (Exception e) {
            out.println(e);
        }
    %>
</html>
