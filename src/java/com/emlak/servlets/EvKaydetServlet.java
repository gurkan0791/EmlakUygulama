/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.emlak.servlets;

import com.emlak.model.EvKaydet;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author sony
 */
@WebServlet(name = "EvKaydetServlet", urlPatterns = {"/EvKaydetServlet"})
public class EvKaydetServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
      //  PrintWriter out = response.getWriter();
        try {
            /* TODO output your page here. You may use following sample code. */
            
            //out.println( request.getParameter("enlem"));
            System.out.println(request.getParameter("enlem"));
             System.out.println(request.getParameter("boylam"));
            float enlem = Float.parseFloat(request.getParameter("enlem"));
            float boylam = Float.parseFloat(request.getParameter("boylam"));
            String aptAdi = request.getParameter("aptadi");
            String mahalle = request.getParameter("mahalle");
            String sokak = request.getParameter("sokak");
            String aciklama = request.getParameter("aciklama");
            String fiyat = request.getParameter("fiyat");
            String odaSayisi = request.getParameter("odasayisi");
            String durum = request.getParameter("durumu");
            String metrekare = request.getParameter("metrekare"); 
            
         boolean sonuc =   EvKaydet.evKaydet(enlem, boylam, aptAdi, mahalle, sokak, aciklama, fiyat, odaSayisi, durum, metrekare);
             System.out.println(sonuc);
             
        } finally {
           // out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
