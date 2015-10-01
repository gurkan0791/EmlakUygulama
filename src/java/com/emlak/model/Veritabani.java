/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.emlak.model;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class Veritabani {
    
    private static Connection connect;
    public static Connection getConnection() {
        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connect = DriverManager.getConnection("jdbc:mysql://localhost/emlakuygulama", "root", null);
            System.out.println("Bağlantı Başarılı");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch(SQLException e){}
        return connect;
    }
    
}


