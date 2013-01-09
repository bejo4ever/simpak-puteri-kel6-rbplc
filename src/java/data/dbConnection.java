/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package data;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 *
 * @author holyknight
 */
public class dbConnection {
    public static Connection con = null;
    public static Statement st = null;
    public static ResultSet rs = null;
    public static String url = "jdbc:mysql://localhost:3306/parkiran";
    public static String user = "root";
    public static String password = "";
}
