<%-- 
    Document   : cookie-user
    Created on : 31/08/2015, 08:44:39
    Author     : joao
--%>

<%@page import="java.util.List"%>
<%@page import="com.sprhib.model.Usuario"%>
<%@page import="com.sprhib.dao.UsuarioDAOImpl"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    
<%
            String userName = null;
            String usuario = null;
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
                            }
                        }
                }
            }
            if (userName == null)
                response.sendRedirect("index.jsp");
%>
<p style="color: green">Bem vindo, <%=usuario%>.</p>
        
        
</html>
