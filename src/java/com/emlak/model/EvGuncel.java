/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.emlak.model;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;

/**
 *
 * @author sony
 */
public class EvGuncel {
    
    private static Connection baglan;
    
     public static boolean evKaydet(int evid, String aptAdi, String mahalle, String sokak, String aciklama,
    String fiyat, String odaSayisi, String durum, String metrekare){
        baglan = Veritabani.getConnection();
        CallableStatement cs = null;
        
        try {
            cs = baglan.prepareCall("{call sp_ev_guncelle(?,?,?,?,?,?,?,?,?)}");
            cs.setInt(1, evid);
            cs.setString(2, aptAdi);
            cs.setString(3, mahalle);
            cs.setString(4, sokak);
            cs.setString(5, aciklama);
            cs.setString(6, odaSayisi);
            cs.setString(7, durum);
            cs.setString(8, metrekare);
            cs.setString(9, fiyat);
            cs.executeUpdate();
        } catch (SQLException e) {
            return false;
        }finally{
            try {
                cs.close();
                baglan.close();
            } catch (SQLException e) {
                return  false;
            }
        }
        
        return true;
    }
    
}
