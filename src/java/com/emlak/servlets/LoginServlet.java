/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.emlak.servlets;

import com.emlak.model.AdminGiris;
import com.emlak.varlik.Kisi;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author sony
 */
public class LoginServlet extends HttpServlet {

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
        RequestDispatcher rdisp = null;
        //request.getRequestDispatcher("/jsp/adminPanel/evEkle.jsp");
        String ad = request.getParameter("kAdi");
        String sifre = request.getParameter("sifre");
        String mesaj = null;
        
        if("".equals(ad)&&"".equals(sifre)){
			mesaj = "Kullanıcı Adı ve Şifre Boş Geçilmez !";
			request.setAttribute("mesaj", mesaj);
		RequestDispatcher rdisp1 = request.getRequestDispatcher("/jsp/adminPanel/adminPanel.jsp");
			rdisp1.forward(request, response);
		}
		else if ("".equals(ad)) {
			mesaj = "Kullanıcı Adı !";
			request.setAttribute("mesaj", mesaj);
RequestDispatcher rdisp1 = request.getRequestDispatcher("/jsp/adminPanel/adminPanel.jsp");
			rdisp1.forward(request, response);
		}
		else if ("".equals(sifre)) {
			mesaj = "Şifre Boş Geçilmez !";
			request.setAttribute("mesaj", mesaj);
			RequestDispatcher rdisp1 = request.getRequestDispatcher("/jsp/adminPanel/adminPanel.jsp");
			rdisp1.forward(request, response);
		}
        Kisi k = new Kisi(0, ad, sifre);
        k = AdminGiris.getLogin(k);
        if (k!=null) {
         request.getSession().setAttribute("ad", k.getKullanaciAdi());
            String yol = "/jsp/adminPanel/evEkle.jsp";
			rdisp = request.getRequestDispatcher(yol);
			mesaj = "Giriş Başarılı!";
			request.setAttribute("mesaj", mesaj);
			rdisp.forward(request, response);
		}else{
		String yol = "/jsp/adminPanel/adminPanel.jsp";
		rdisp = request.getRequestDispatcher(yol);
		mesaj = "Giriş bAŞARISIZ!";
		request.setAttribute("mesaj", mesaj);
		rdisp.forward(request, response);
		}
        System.out.println("Ad :"+k.getKullanaciAdi());
        System.out.println("Sifre :"+k.getSifre());
       // rdisp.forward(request, response);
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
