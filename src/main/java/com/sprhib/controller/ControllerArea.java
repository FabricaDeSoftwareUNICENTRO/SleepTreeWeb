/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sprhib.controller;

import com.sprhib.dao.AreaDAOImpl;
import com.sprhib.dao.UsuarioDAOImpl;
import com.sprhib.model.Area;
import com.sprhib.model.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author juliano
 */
@WebServlet(name = "ControllerArea", urlPatterns = {"/ControllerArea"})
public class ControllerArea extends HttpServlet {

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
        String setArea = request.getParameter("setArea");
        if (setArea != null) {
            String safra = request.getParameter("safra");
            String descricao = request.getParameter("descricao");
            String localidade = request.getParameter("localidade");
            String cultura = request.getParameter("cultura");
            
            // PEGANDO USUARIO ATUAL DE UM 
            String userName = null;
            String usuario = null;
            Usuario userLogado = null;
            Cookie[] cookies = request.getCookies();
            if (cookies != null) {
                for (Cookie cookie : cookies) {
                    if (cookie.getName().equals("email"))
                        userName = cookie.getValue();
                        UsuarioDAOImpl userDAO = new UsuarioDAOImpl();
                        List<Usuario> usuarios = userDAO.getUsuarios();
                        for(Usuario user : usuarios){
                            if(user.getEmail().equals(userName)){
                                usuario = user.getNome();
                                userLogado = user;
                            }
                        }
                }
            }
            if (userName == null){
                response.sendRedirect("index.jsp");
            }
            
            
            
            AreaDAOImpl areaDAO = new AreaDAOImpl();
            Area area = new Area(safra, descricao, localidade, cultura, userLogado);
            areaDAO.addArea(area);
            
            response.setContentType("text/html");
            response.sendRedirect("adicionar-area.jsp");
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
