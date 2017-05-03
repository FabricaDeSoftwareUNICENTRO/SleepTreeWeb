/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sprhib.controller;

import com.sprhib.dao.UsuarioDAOImpl;
import com.sprhib.model.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * ESTE SERVELET NAO PRECISA MAIS SER USADO!
 * @author Fedacz
 */
@WebServlet(name = "ControllerLogin", urlPatterns = {"/ControllerLogin"})
public class ControllerLogin extends HttpServlet {

    @Override
    public void init() throws ServletException {
        Usuario u1 = new Usuario();
        getServletContext().setAttribute("usuario", u1);
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String logar = request.getParameter("logar");
        if (logar != null) {
            Usuario u1 = (Usuario) getServletContext().getAttribute("usuario");
            String email = request.getParameter("email");
            if (email != null) {
                u1.setEmail(email);
            }
            response.setContentType("text/html");
            response.sendRedirect("admin.jsp");
//            RequestDispatcher dispatcher = request.getRequestDispatcher("cadastro-concluido.jsp");
//        dispatcher.forward(request, response);
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
