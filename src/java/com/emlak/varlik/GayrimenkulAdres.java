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
public class GayrimenkulAdres {
    
    private int evID;
    private String aptAdi;
    private String mahalle;
    private String sokak;
    private String aciklama;
    /**
     * @return the evID
     */
    public int getEvID() {
        return evID;
    }

    /**
     * @param evID the evID to set
     */
    public void setEvID(int evID) {
        this.evID = evID;
    }

    /**
     * @return the aptAdi
     */
    public String getAptAdi() {
        return aptAdi;
    }

    /**
     * @param aptAdi the aptAdi to set
     */
    public void setAptAdi(String aptAdi) {
        this.aptAdi = aptAdi;
    }

    /**
     * @return the mahalle
     */
    public String getMahalle() {
        return mahalle;
    }

    /**
     * @param mahalle the mahalle to set
     */
    public void setMahalle(String mahalle) {
        this.mahalle = mahalle;
    }

    /**
     * @return the sokak
     */
    public String getSokok() {
        return sokak;
    }

    /**
     * @param sokok the sokak to set
     */
    public void setSokok(String sokok) {
        this.sokak = sokok;
    }

    /**
     * @return the aciklama
     */
    public String getAciklama() {
        return aciklama;
    }

    /**
     * @param aciklama the aciklama to set
     */
    public void setAciklama(String aciklama) {
        this.aciklama = aciklama;
    }
}
