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

<h1>Login</h1>
<p><i><%= message%></i></p>
<form action="login" method="post">
    <table cellspacing="5" border="0">
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
            <td align="right">Mode:</td>
            <td><input type="text" name="pass"
                       value="<%= user.getPass()%>"></td>
        </tr>
        <tr>
            <td></td>
            <td><br><input type="submit" value="Submit"></td>
        </tr>
    </table>
</form>
<%@include file="/includes/footer.jsp" %>