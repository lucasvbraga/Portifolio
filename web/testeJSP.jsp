<%-- 
    Document   : testeJSP
    Created on : 23/10/2017, 01:32:12
    Author     : Lucas
--%>

<%@page import="java.util.List"%>
<%@page import="model.Prestador"%>
<%@page import="controle.ControlaQualidade"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP TESTE</title>
        <% 
        
        StringBuffer str = (StringBuffer) request.getRequestURL();
        List<Prestador> prestador = (List) session.getAttribute("prestador");
        String strI = (String) request.getRequestURI();
        String addr = request.getPathInfo();
        String adrname = request.getAuthType();
        ControlaQualidade cq = new ControlaQualidade();
        %>
    </head>
    <body>
    <center><h1>Hello World!</h1><br><br><br><br><br><br><br>
        <h1><%= cq.NivelStr(prestador.get(0)) %></h1><br><br><br><br>
        <h1><%= addr %></h1><br><br><br><br>
        <h1><%= adrname %></h1><br><br><br><br>
        <h1><%= session.getMaxInactiveInterval()%></h1></center><br><br><br><br>
    </body>
</html>
