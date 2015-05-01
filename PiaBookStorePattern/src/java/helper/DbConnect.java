/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package helper;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Duy Buffet
 */
public class DbConnect {
    private static DbConnect instance = new DbConnect();
    private Connection conn = null;
    public static final String DB_URL = "jdbc:mysql://localhost:3306/bookstore";
    public static final String USER = "root";
    public static final String PASSWORD = "";
    public static final String DB_CLASS = "com.mysql.jdbc.Driver";

    private DbConnect() {
        try {
            Class.forName(DB_CLASS);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DbConnect.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    private Connection createConnection() {        
        try {
            if (conn == null || conn.isClosed()) {
                conn = DriverManager.getConnection(DB_URL, USER, PASSWORD);
                System.out.println("Create conn");
            }            
        } catch (SQLException ex) {
            Logger.getLogger(DbConnect.class.getName()).log(Level.SEVERE, null, ex);
        }
        return conn;
    }
    
    public static Connection getConnection() {
        return instance.createConnection();
    }   
}
