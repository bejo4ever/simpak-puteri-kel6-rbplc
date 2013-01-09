/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package business;

import java.sql.DriverManager;

/**
 *
 * @author holyknight
 */
public class ModifyDB extends data.dbConnection {

    public static void addUser(User x) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(url, user, password);
            st = con.createStatement();
            st.executeUpdate("INSERT INTO user VALUES ('" + x.getFirstName()
                    + "','" + x.getAlamat() + "','" + x.getTelepon() + "','" + x.getUsername() + "',md5('" + x.getPass() + "'))");
            //st.executeUpdate("INSERT INTO admin VALUES ('" + x.getUsername() + "','" + x.getAdmin() + "'))");
            if (x.getAdmin().equals("1")) {
                st.executeUpdate("INSERT INTO admin VALUES ('" + x.getUsername() + "','" + x.getAdmin() + "')");
            }
        } catch (Exception e) {
        }
    }

    public static boolean checkAdmin(User x) {
        boolean y = false;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(url, user, password);
            st = con.createStatement();
            rs = st.executeQuery("SELECT * FROM admin WHERE user = '" + x.getUsername() + "'");
            if (rs.next()) {
                y = true;
            } else {
                y = false;
            }
        } catch (Exception e) {
        }
        return y;
    }

    public static boolean checkUser(User x) {
        boolean y = false;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(url, user, password);
            st = con.createStatement();
            rs = st.executeQuery("SELECT * FROM user WHERE username = '" + x.getUsername()
                    + "' AND password = md5('" + x.getPass() + "')");
            if (rs.next()) {
                y = true;
            } else {
                y = false;
            }
        } catch (Exception e) {
        }
        return y;
    }

    //============================================LOKASI========================
    public static boolean checkAvailable(Lokasi x) {
        boolean y = false;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(url, user, password);
            st = con.createStatement();
            rs = st.executeQuery("SELECT * FROM lokasi WHERE lantai = '" + x.getLantai()
                    + "' AND posisi = '" + x.getPosisi() + "'");
            if (rs.next()) {
                y = false;
            } else {
                y = true;
            }
        } catch (Exception e) {
        }
        return y;
    }
    
    public static boolean checkAvailable2(Lokasi x) {
        boolean y = false;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(url, user, password);
            st = con.createStatement();
            rs = st.executeQuery("SELECT * FROM lokasi WHERE lantai = '" + x.getLantai()
                    + "' AND posisi = '" + x.getPosisi()  + "' AND status_lokasi = '1'");
            if (rs.next()) {
                y = false;
            } else {
                y = true;
            }
        } catch (Exception e) {
        }
        return y;
    }

    public static void addLokasi(Lokasi x) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(url, user, password);
            st = con.createStatement();
            st.executeUpdate("INSERT INTO lokasi VALUES ('" + x.getLantai()
                    + "','" + x.getPosisi() + "','" + x.getNmr_kendaraan() + "','1')");
        } catch (Exception e) {
        }
    }

    public static void addLokasi1(Lokasi x) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(url, user, password);
            st = con.createStatement();
            st.executeUpdate("INSERT INTO lokasi VALUES ('" + x.getLantai()
                    + "','" + x.getPosisi() + "','" + x.getNmr_kendaraan() + "','2')");
        } catch (Exception e) {
        }
    }
    
    public static void addLokasi2(Lokasi x) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(url, user, password);
            st = con.createStatement();
            st.executeUpdate("INSERT INTO lokasi VALUES ('" + x.getLantai()
                    + "','" + x.getPosisi() + "','" + x.getNmr_kendaraan() + "','2')");
        } catch (Exception e) {
        }
    }

    public static String[] checkStatus(String x) {
        String[] scan = new String[20];
        try {

            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(url, user, password);
            st = con.createStatement();
            rs = st.executeQuery("SELECT posisi FROM lokasi WHERE lantai = '" + x + "'");
            int i = 0;
            while (rs.next()) {
                scan[i] = rs.getString(url);
            }
        } catch (Exception e) {
        }
        return scan;
    }

    public static void deleteLokasi(String x) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(url, user, password);
            st = con.createStatement();
            st.executeUpdate("DELETE FROM `lokasi` WHERE nmr_kendaraan='" + x + "'");
            st.executeUpdate("DELETE FROM `denda` WHERE nmr_kendaraan='" + x + "'");
        } catch (Exception e) {
        }
    }

        public static void addDenda(Lokasi x) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(url, user, password);
            st = con.createStatement();
            st.executeUpdate("INSERT INTO denda VALUES ('" +x.getNmr_kendaraan() + "','2')");
        } catch (Exception e) {
        }
    }
    
    public static boolean checkDenda(String x) {
        boolean y = false;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(url, user, password);
            st = con.createStatement();
            rs = st.executeQuery("SELECT * FROM denda WHERE nmr_kendaraan='" + x + "'");
            if (rs.next()) {
                y = false;
            } else {
                y = true;
            }
        } catch (Exception e) {
        }
        return y;
    }
}
