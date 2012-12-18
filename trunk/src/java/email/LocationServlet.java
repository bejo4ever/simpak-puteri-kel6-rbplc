package email;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

import business.Lokasi;
import business.ModifyDB;

public class LocationServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
        // get parameters from the request        request.setAttribute("ses", username);
        String lantai = request.getParameter("lantai");
        String posisi = request.getParameter("posisi");
        String nmr_kendaraan = request.getParameter("nmr_kendaraan");
        String action = request.getParameter("action");
        //String ses = request.getParameter("ses");


        // get a relative file name
        //ServletContext context;
        //String path;

        // use regular Java classes
        Lokasi lokasi = new Lokasi(lantai, posisi, nmr_kendaraan);

        //validate the parameters
        String message = "";
        String url = "";

        //actions
        if (action.equals("masuk")) {
            if (lantai.equals("pilih")
                    || posisi.equals("pilih")
                    || nmr_kendaraan.length() == 0) {
                message = "Mohon isi semua data.";
            } else {
                Boolean checkAvailable = ModifyDB.checkAvailable(lokasi);
                if (checkAvailable == true) {
                    ModifyDB.addLokasi(lokasi);
                    message = "success";

                } else {
                    message = "lokasi tidak tersedia";
                }
            }
            url = "/masuk.jsp";
        }



        // store the User object in the request object
        request.setAttribute("lokasi", lokasi);
        request.setAttribute("message", message);

        // forward request and response objects to JSP page
        RequestDispatcher dispatcher =
                getServletContext().getRequestDispatcher(url);
        dispatcher.forward(request, response);
    }
}
