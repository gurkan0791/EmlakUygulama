/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.emlak.model;

import com.emlak.varlik.Kisi;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author sony
 */
public class AdminGiris {
    
    private static Connection baglan;
    private static PreparedStatement preStatement;
    private static ResultSet resultSet;
    
    public static Kisi getLogin(Kisi kisi){
        Kisi k  = null;
        try {
            baglan = Veritabani.getConnection();
            
            preStatement = baglan.prepareStatement("SELECT * FROM giris WHERE USERID = ? and PASSWORD= ?");
            preStatement.setString(1, kisi.getKullanaciAdi());
            preStatement.setString(2, kisi.getSifre());
            
            resultSet = preStatement.executeQuery();
            if (resultSet.next()) {
                k = new Kisi(resultSet.getInt("ID"),resultSet.getString("USERID"), resultSet.getString("PASSWORD"));
                return kisi;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        finally{
             try {
                preStatement.close();
                baglan.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
            
        }
        return null;
    }
}
