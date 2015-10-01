/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.emlak.model;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author sony
 */
public class EvKaydet {
    private static Connection baglan;
    
    public static boolean evKaydet(float enlem, float boylam, String aptAdi, String mahalle, String sokak, String aciklama,
    String fiyat, String odaSayisi, String durum, String metrekare){
        baglan = Veritabani.getConnection();
        CallableStatement cs = null;
        
        try {
            cs = baglan.prepareCall("{call sp_ev_kaydet(?,?,?,?,?,?,?,?,?,?)}");
            cs.setFloat(1, enlem);
            cs.setFloat(2, boylam);
            cs.setString(3, aptAdi);
            cs.setString(4, mahalle);
            cs.setString(5, sokak);
            cs.setString(6, aciklama);
            cs.setString(7, fiyat);
            cs.setString(8, odaSayisi);
            cs.setString(9, durum);
            cs.setString(10, metrekare);
            cs.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }finally{
            try {
                cs.close();
                baglan.close();
            } catch (SQLException e) {
                e.printStackTrace();
                return  false;
            }
        }
        
        return true;
    }
}
