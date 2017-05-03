<%-- 
    Document   : cadastro-concluido
    Created on : 16/08/2015, 17:00:38
    Author     : joao
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sleep Tree</title>
    </head>
    <body>
        <h1>Cadastro concluído com sucesso!</h1>
               <%
            String userName = null;
            Cookie[] cookies = request.getCookies();
            if (cookies != null) {
                for (Cookie cookie : cookies) {
                    if (cookie.getName().equals("email"))
                        userName = cookie.getValue();
                }
            }
            if (userName == null)
                response.sendRedirect("index.jsp");
        %>
        
<!--        <h3>
            Hi
            <%=userName%>, Login successful.
        </h3>-->
        
        <form action="LogoutServlet" method="post">
            <input type="submit" value="Logout">
        </form>
    </body>
</html>
