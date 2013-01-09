<%-- 
    Document   : administrator
    Created on : Dec 8, 2012, 11:09:47 PM
    Author     : holyknight
--%>


<%@page import="business.User"%>
<%@include file="/includes/header.html" %>

<%
    //get attributes from the request
    User user = (User) request.getAttribute("user");
    String message = (String) request.getAttribute("message");
    //null values
    if (user == null) {
        user = new User();
    }
    if (message == null) {
        message = "";
    }

%>
<link rel="stylesheet" type="text/css" href="includes/style.css" />
<h1>Daftar karyawan</h1>
<h2>Biodata</h2>
<p><i><%= message%></i></p>
<div>
    <form action="addUser" method="post">
        <table cellspacing="5" border="0">
            <tr>
                <td align="right">Nama:</td>
                <td><input type="text" name="firstName" 
                           value="<%= user.getFirstName()%>"></td>
            </tr>
            <tr>
                <td align="right">Alamat:</td>
                <td><input type="text" name="alamat"
                           value="<%= user.getAlamat()%>"></td>
            </tr>
            <tr>
                <td align="right">Telepon:</td>
                <td><input type="text" name="telepon"
                           value="<%= user.getTelepon()%>"></td>
            </tr>
        </table>
        <h2>Username & Password</h2>
        <table>
            <tr>
                <td align="right">Username:</td>
                <td><input type="text" name="username"
                           value="<%= user.getUsername()%>"></td>
            </tr>
            <tr>
                <td align="right">Password:</td>
                <td><input type="password" name="pass"
                           value="<%= user.getPass()%>"></td>
            </tr>
            <tr>
                <td align="right">Admin:</td>
                <td><input type="text" name="admin"
                           value="<%= user.getAdmin()%>" ></td>
            </tr>
            <tr>
                <td></td>
                <td><br><input type="submit" value="Submit"></td>
            <br>
            <br>
            </tr>
        </table>
    </form>
    <button onclick="location.href='view_user.jsp'">Lihat User Terdaftar</button>
</div>
<%@include file="/includes/footer.jsp" %>