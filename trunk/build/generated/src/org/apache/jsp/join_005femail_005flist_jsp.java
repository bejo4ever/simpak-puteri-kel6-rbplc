package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import business.User;
import java.util.*;

public final class join_005femail_005flist_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<String>(2);
    _jspx_dependants.add("/includes/header.html");
    _jspx_dependants.add("/includes/footer.jsp");
  }

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write('\n');
      out.write('\n');
      out.write("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\"\n");
      out.write("   \"http://www.w3.org/TR/html4/loose.dtd\">\n");
      out.write("\n");
      out.write("<html>\n");
      out.write("<head>\n");
      out.write("    <title>Murach's Java Servlets and JSP</title>\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write('\n');
      out.write('\n');

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


      out.write("\n");
      out.write("\n");
      out.write("<h1>Daftar karyawan</h1>\n");
      out.write("<h2>Biodata</h2>\n");
      out.write("<p><i>");
      out.print( message);
      out.write("</i></p>\n");
      out.write("<form action=\"addToEmailList\" method=\"post\">\n");
      out.write("    <table cellspacing=\"5\" border=\"0\">\n");
      out.write("        <tr>\n");
      out.write("            <td align=\"right\">Nama:</td>\n");
      out.write("            <td><input type=\"text\" name=\"firstName\" \n");
      out.write("                       value=\"");
      out.print( user.getFirstName());
      out.write("\"></td>\n");
      out.write("        </tr>\n");
      out.write("        <tr>\n");
      out.write("            <td align=\"right\">Alamat:</td>\n");
      out.write("            <td><input type=\"text\" name=\"lastName\"\n");
      out.write("                       value=\"");
      out.print( user.getLastName());
      out.write("\"></td>\n");
      out.write("        </tr>\n");
      out.write("        <tr>\n");
      out.write("            <td align=\"right\">Telepon:</td>\n");
      out.write("            <td><input type=\"text\" name=\"emailAddress\"\n");
      out.write("                       value=\"");
      out.print( user.getEmailAddress());
      out.write("\"></td>\n");
      out.write("        </tr>\n");
      out.write("    </table>\n");
      out.write("    <h2>Username & Password</h2>\n");
      out.write("    <table>\n");
      out.write("        <tr>\n");
      out.write("            <td align=\"right\">Username:</td>\n");
      out.write("            <td><input type=\"text\" name=\"emailAddress\"\n");
      out.write("                       value=\"");
      out.print( user.getEmailAddress());
      out.write("\"></td>\n");
      out.write("        </tr>\n");
      out.write("        <tr>\n");
      out.write("            <td align=\"right\">Password:</td>\n");
      out.write("            <td><input type=\"password\" name=\"emailAddress\"\n");
      out.write("                       value=\"");
      out.print( user.getEmailAddress());
      out.write("\"></td>\n");
      out.write("        </tr>\n");
      out.write("        <tr>\n");
      out.write("            <td align=\"right\">Admin:</td>\n");
      out.write("            <td><input type=\"checkbox\" name=\"emailAddress\"\n");
      out.write("                       value=\"");
      out.print( user.getEmailAddress());
      out.write("\"></td>\n");
      out.write("        </tr>\n");
      out.write("        <tr>\n");
      out.write("            <td></td>\n");
      out.write("            <td><br><input type=\"submit\" value=\"Submit\"></td>\n");
      out.write("        </tr>\n");
      out.write("    </table>\n");
      out.write("</form>\n");
      out.write('\n');

    // initialize the current year that's used in the copyright notice
    GregorianCalendar currentDate = new GregorianCalendar();
    int currentYear = currentDate.get(Calendar.YEAR);

      out.write("\n");
      out.write("\n");
      out.write("<p><small>\n");
      out.write("&copy; Copyright ");
      out.print( currentYear );
      out.write(" Mike Murach &amp; Associates, Inc. \n");
      out.write("All rights reserved\n");
      out.write("</small></p>\n");
      out.write("</body>\n");
      out.write("</html>");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
