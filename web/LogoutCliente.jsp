<%-- 
    Document   : LogoutCliente
    Created on : 06/10/2017, 04:32:38
    Author     : Lucas
--%>

<%@page import="org.hibernate.SessionFactory"%>
<%@page import="model.HibernateUtil"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% //HttpSession sessao;
            //sessao = request.getSession();
            //SessionFactory sf = HibernateUtil.getSessionFactory();
            //Session = sf.openSession();
             
            //sn.close();
            //sf.close();
            session.invalidate();
            session = null;
            response.sendRedirect("main.jsp");

        %>
    </body>
</html>
