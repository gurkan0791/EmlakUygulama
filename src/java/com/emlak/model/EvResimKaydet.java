/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.emlak.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author sony
 */
public class EvResimKaydet {
    static Connection  baglan;
    static PreparedStatement prstm;
    public static boolean resimKaydet(int id, String url){
        
        String sql = "INSERT INTO evresim(ID,EVID,resim) VALUES (?,?,?) ";
        try {
            baglan = Veritabani.getConnection();
            prstm= baglan.prepareStatement(sql);
            prstm.setInt(1, 0);
            prstm.setInt(2, id);
            prstm.setString(3, url);
            prstm.executeUpdate();
        } catch (SQLException e) {
            return false;
        }
        finally{
            try {
                prstm.close();
                baglan.close();
            } catch (SQLException e) {
            }
        }
        
    
        return true;
    } 
    
}
