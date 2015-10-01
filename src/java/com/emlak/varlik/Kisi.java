/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.emlak.varlik;

/**
 *
 * @author sony
 */
public class Kisi {
    
    private int ID;
    private String kullanaciAdi;
    private String sifre;

    /**
     * @return the ID
     */
    public Kisi(int ID, String kullaniciAdi, String sifre){
        this.ID = ID;
        this.kullanaciAdi = kullaniciAdi;
        this.sifre = sifre;
    }
    
    public int getID() {
        return ID;
    }

    /**
     * @param ID the ID to set
     */
    public void setID(int ID) {
        this.ID = ID;
    }

    /**
     * @return the kullanaciAdi
     */
    public String getKullanaciAdi() {
        return kullanaciAdi;
    }

    /**
     * @param kullanaciAdi the kullanaciAdi to set
     */
    public void setKullanaciAdi(String kullanaciAdi) {
        this.kullanaciAdi = kullanaciAdi;
    }

    /**
     * @return the sifre
     */
    public String getSifre() {
        return sifre;
    }

    /**
     * @param sifre the sifre to set
     */
    public void setSifre(String sifre) {
        this.sifre = sifre;
    }
    
    
}
