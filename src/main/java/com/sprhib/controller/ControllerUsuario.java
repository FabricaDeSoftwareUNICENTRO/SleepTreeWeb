/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sprhib.controller;

import com.sprhib.dao.DAO;
import com.sprhib.dao.UsuarioDAOImpl;
import com.sprhib.model.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

/**
 *
 * @author joao
 */
@WebServlet(name = "ControllerUsuario", urlPatterns = {"/ControllerUsuario"})
public class ControllerUsuario extends HttpServlet {
//    UsuarioDAOImpl userDao = null;

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
        
       
        String set = request.getParameter("set");
        if (set != null) {
           
            // salvar a parada no banco
            
//            String nome = request.getParameter("nome");
//            String email = request.getParameter("email");
//            String senha = request.getParameter("senha");         
//            String profissao = request.getParameter("profissao"); 
            UsuarioDAOImpl userDao = new UsuarioDAOImpl();
            Usuario user = new Usuario(request.getParameter("nome"), request.getParameter("senha"), request.getParameter("email"), request.getParameter("profissao"));
//            if(userDao == null){
//                userDao = new UsuarioDAOImpl();
//            }
            userDao.addUsuario(user);
            

    response.setContentType("text/html");
    response.sendRedirect("cadastro-concluido.jsp");
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
