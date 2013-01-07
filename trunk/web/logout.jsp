<%@page import="business.User"%>
<%@include file="/includes/header.html" %>

<%
    HttpSession ses = request.getSession(true);
    ses.invalidate();
%>

<link rel="stylesheet" type="text/css" href="includes/style.css" />
<%--<h1>Login</h1>--%>
<div id="box">
    Good bye! Have a nice rest!
</div> 
<%@include file="/includes/footer.jsp" %>