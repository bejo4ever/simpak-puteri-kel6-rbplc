package email;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

import business.User;
import business.ModifyDB;
//import data.UserIO;

public class AddUserServlet extends HttpServlet {

    /*public static boolean isNumeric(String str) {
     try {
     int d = Integer.parseInt(str);
     } catch (NumberFormatException nfe) {
     return false;
     }
     return true;
     }
     }*/
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
        // get parameters from the request
        String firstName = request.getParameter("firstName");
        String alamat = request.getParameter("alamat");
        String telepon = request.getParameter("telepon");
        String username = request.getParameter("username");
        String pass = request.getParameter("pass");
        String admin = request.getParameter("admin");

        // get a relative file name
        ServletContext context;
        //ServletContext context = getServletContext();
        String path;
        //String path = context.getRealPath("/WEB-INF/EmailList.txt");

        // use regular Java classes
        User user = new User(firstName, alamat, telepon, username, pass, admin);

        //validate the parameters
        String message = "";
        String url = "";
        if (firstName.length() == 0
                || alamat.length() == 0
                || telepon.length() == 0
                || username.length() == 0
                || pass.length() == 0
                || admin.length() == 0) {
            message = "Peliiis fill out all three text boxes.";
            url = "/tambah_user.jsp";
        } else {
            message = "";
            ModifyDB.addUser(user);
            url = "/display_email_entry.jsp";
        }
        //UserIO.addRecord(user, path);

        // store the User object in the request object
        request.setAttribute("user", user);
        request.setAttribute("message", message);

        // forward request and response objects to JSP page
        //String url = "/display_email_entry.jsp";
        //url = "/display_email_entry.jsp";
        RequestDispatcher dispatcher =
                getServletContext().getRequestDispatcher(url);
        dispatcher.forward(request, response);
    }
}
