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
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author joao
 */
public class LoginServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private String userID=  "X";
    private String password = "Y";
    private boolean loginCerto = false;
    
    // precisa pegar email e senha no banco e inserir nas variaveis acima.

        @Override
    public void init() throws ServletException {
        Usuario u1 = new Usuario();
        getServletContext().setAttribute("usuario", u1);
    }
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Usa sistema do fedacz pra dar o bem vindo.
        String logar = request.getParameter("logar");
        if (logar != null) {
            Usuario u1 = (Usuario) getServletContext().getAttribute("usuario");
            String mail = request.getParameter("email");
            if (mail != null) {
                u1.setEmail(mail);
            }
        }
        //-----------------------------------------------------------------------------
        // get request parameters for userID and password
        String email = request.getParameter("email");
        String senha = request.getParameter("senha");
        
        // achar o email no banco, depois confere se a senha esta certa
        UsuarioDAOImpl userDAO = new UsuarioDAOImpl();
        List<Usuario> users = userDAO.getUsuarios();
        for (Usuario user : users) {
            if(user.getEmail().equals(email)){
                // usuario existe
                userID= user.getEmail();
                if(user.getSenha().equals(senha)){
                    // senha certa
                    password=user.getSenha();
                    loginCerto=true;
                }
            }
        }
        

        if (userID.equals(email) && password.equals(senha) && loginCerto==true) {
            Cookie cookie = new Cookie("email", email);
            // setting cookie to expiry in 60 mins
            cookie.setMaxAge(60 * 60);
            response.addCookie(cookie);
            response.sendRedirect("admin.jsp");
        } else {
            RequestDispatcher rd = getServletContext().getRequestDispatcher("/index.jsp");
            PrintWriter out = response.getWriter();
            out.println("<p>Email ou Usuário inválido!</p>");
            rd.include(request, response);
        }
                response.setContentType("text/html;charset=UTF-8");

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
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
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
