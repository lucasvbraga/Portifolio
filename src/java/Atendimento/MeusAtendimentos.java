/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Atendimento;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Agendado;
import model.Cliente;
import model.Emergencial;
import model.Especialidade;
import model.HibernateUtil;
import model.Normal;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

/**
 *
 * @author Lucas
 */
public class MeusAtendimentos extends HttpServlet {

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

        HttpSession session;
        session = request.getSession(true);

        
        String tipostr = request.getParameter("filtro");
        int id = (int) session.getAttribute("id");
        //int id = 19;
        Agendado ag = new Agendado();

        List<Agendado> agendado;
        String hql_a = "FROM  Agendado ";
        hql_a += "WHERE id_cliente = :id AND tipo = :tipo";

        List<Emergencial> emergencial;
        String hql_e = "FROM  Emergencial ";
        hql_e += "WHERE id_cliente = :id AND tipo = :tipo";

        List<Normal> normal;
        String hql_n = "FROM  Normal  ";
        hql_n += "WHERE id_cliente = :id AND tipo = :tipo";

        SessionFactory sf = HibernateUtil.getSessionFactory();
        Session sn = sf.openSession();

        int tp = 8;
        if (tipostr.equalsIgnoreCase("Agendado")){
            tp=6;
        }
        else if (tipostr.equalsIgnoreCase("Normal")){
            tp=2;
        }
        else if (tipostr.equalsIgnoreCase("Emergencial")){
            tp=4;
        }
        sn.beginTransaction();

        Query query_a;
        Query query_n;
        Query query_e;
        
        query_n = sn.createQuery(hql_n).setParameter("id", id).setParameter("tipo", tp);
        query_e = sn.createQuery(hql_e).setParameter("id", id).setParameter("tipo", tp);
        query_a = sn.createQuery(hql_a).setParameter("id", id).setParameter("tipo", tp);

        agendado = query_a.list();
        normal = query_n.list();
        emergencial = query_e.list();
        sn.getTransaction().commit();
        sn.close();
        session.setAttribute("emergencial", emergencial);
        session.setAttribute("normal", normal);
        session.setAttribute("agendado", agendado);

        RequestDispatcher rd = request.getRequestDispatcher("Atendimento.jsp");
        rd.forward(request, response);

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
