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
        String denda = "Rp 5000";
        //String ses = request.getParameter("ses");


        // get a relative file name
        //ServletContext context;
        //String path;

        // use regular Java classes
        Lokasi lokasi = new Lokasi(lantai, posisi, nmr_kendaraan);

        //validate the parameters
        String message = "";
        String url = "";
        String[] scan = new String[20];

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
            
        } else if (action.equals("kontrol")) {
            Boolean cek0 = ModifyDB.checkAvailable(lokasi);
            Boolean cek1 = ModifyDB.checkAvailable2(lokasi);
            if(cek0 == true){
                ModifyDB.addLokasi1(lokasi);
                ModifyDB.addDenda(lokasi);
                ModifyDB.deleteLokasi(nmr_kendaraan);
            }else if(cek1 == false){
                ModifyDB.addLokasi2(lokasi);
            }else message = "data ditempati";
            url = "/kontrol.jsp";
            
        } else if (action.equals("keluar")) {
            ModifyDB.deleteLokasi(nmr_kendaraan);
            url = "/keluar.jsp";
            message = "hapus berhasil!";

        } else if (action.equals("keluar2")) {
            Boolean checkDenda = ModifyDB.checkDenda(nmr_kendaraan);
            if (checkDenda == false) {
                message = "data ditemukan";
                denda = "Rp 10000";
            } else {
                message = "bebas denda";
            }
            url = "/keluar.jsp";
        }


        request.setAttribute("denda", denda);
        // store the User object in the request object
        request.setAttribute("lokasi", lokasi);
        request.setAttribute("message", message);
        //request.setAttribute("scan", scan);

        // forward request and response objects to JSP page
        RequestDispatcher dispatcher =
                getServletContext().getRequestDispatcher(url);
        dispatcher.forward(request, response);
    }
}
