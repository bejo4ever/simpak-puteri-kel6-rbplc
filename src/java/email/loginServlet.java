package email;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

import business.User;
import business.ModifyDB;

public class loginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
        // get parameters from the request
        String username = request.getParameter("username");
        String pass = request.getParameter("pass");
        String mode = request.getParameter("mode");

        // get a relative file name
        ServletContext context;
        String path;

        // use regular Java classes
        User user = new User(username, pass, mode);
        Boolean admin = ModifyDB.checkAdmin(user);
        Boolean check = ModifyDB.checkUser(user);

        //validate the parameters
        String message = "";
        String url = "";
        if (username.length() == 0
                || pass.length() == 0) {
            message = "Peliiis fill out all text boxes.";
            url = "/login.jsp";
        } else {
            message = "";
            if (check == true) {
                if (admin == false) {
                    if (mode.equals("masuk")) {
                        url = "/masuk.jsp";
                    } else if (mode.equals("kontrol")) {
                        url = "/kontrol.jsp";
                    } else if (mode.equals("keluar")) {
                        url = "/keluar.jsp";
                    }
                } else {
                    url = "/administrator.jsp";
                }
            } else {
                message = "password salah";
                url = "/login.jsp";
            }

            context = getServletContext();
            path = context.getRealPath("/WEB-INF/EmailList.txt");
        }

        // store the User object in the request object
        request.setAttribute("user", user);
        request.setAttribute("message", message);

        // forward request and response objects to JSP page
        RequestDispatcher dispatcher =
                getServletContext().getRequestDispatcher(url);
        dispatcher.forward(request, response);

    }
}
