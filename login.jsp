<%-- 
    Document   : login
    Created on : 29 Sep 12, 13:18:52
    Author     : Fenty
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<%@ page language="java" import="java.sql.*" %>

<HEAD>
  <TITLE>Login Member</TITLE>
</HEAD>

<%
            String user = request.getParameter("txtusername");
            String pass = request.getParameter("txtpassword");

            Connection con = null;
            Statement st = null;
            ResultSet rs = null;
            String url = "jdbc:mysql://localhost:3306/membershipta";
            String username = "root";
            String password = "";
            try {
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection(url, username, password);
                st = con.createStatement();
                rs = st.executeQuery("SELECT nama,password FROM memberlab where nama='" + user + "' and password='" + pass + "'");
                if (rs.next()) {
                    out.println("Selamat datang, " + rs.getString(1) + "user ID : " + rs.getString(2));
                    out.println("Login Berhasil");
                    HttpSession ses = request.getSession(true);
                    ses.putValue("ses_uname", user);
                    ses.setMaxInactiveInterval(5);
%>

<hr>
<a href=FormTAConnectDB.jsp>Home</a> <<<--->>> <a href=notif.jsp>Notification</a><<<--->>> <a href=Logout.jsp>Log Out</a>
<hr>
<%
                } else {
                    out.println("Login Salah");
%>
<pre>
<form action=login.jsp>
Username : 	<input type=text name=txtusername>
Password :	<input type=password name=txtpassword>


<input type=submit value="Login">

<a href=FormTA.jsp> Member</a>

</form>

</pre>
<%
                }
            } catch (Exception e) {
                out.println(e);
            }

%>
