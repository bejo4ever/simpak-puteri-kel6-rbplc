<%@include file="/includes/header.html" %>
    <h1>Thanks for joining our email list</h1>

    <p>Here is the information that you entered:</p>

    <%@ page import="business.User" %>
    <% User user = (User) request.getAttribute("user"); %>
    <table cellspacing="5" cellpadding="5" border="1">
        <tr>
            <td align="right">First name:</td>
            <td><%= user.getFirstName() %></td>
        </tr>
        <tr>
            <td align="right">Alamat:</td>
            <td><%= user.getAlamat() %></td>
        </tr>
        <tr>
            <td align="right">Telepon:</td>
            <td><%= user.getTelepon() %></td>
        </tr>
    </table>

    <p>To enter another email address, click on the Back <br>
    button in your browser or the Return button shown <br>
    below.</p>

    <form action="join_email_list.jsp" method="post">
        <input type="submit" value="Return">
    </form>
    <%@include file="/includes/footer.jsp" %>