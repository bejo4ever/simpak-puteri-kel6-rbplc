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
            st.executeUpdate("INSERT INTO admin VALUES ('" + x.getUsername() + "','" + x.getAdmin() + "'))");
            if (x.getAdmin().equals("1")) {
                st.executeUpdate("INSERT INTO admin VALUES ('" + x.getUsername() + "','" + x.getAdmin() + "'))");
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
}
