/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Atendimento;

import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Agendado;
import model.HibernateUtil;
import model.Prestador;
import model.SolicitacaoAgendado;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

/**
 *
 * @author Lucas
 */
public class deletaAgendado extends HttpServlet {

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
        
        List<Prestador> prestador;
        List<SolicitacaoAgendado> solag;
        String codigostr = request.getParameter("botao");
        int codigo = Integer.parseInt(codigostr);
        //Agendado ag = new Agendado();

        List<Agendado> agendado;
        String hql_a = "FROM  Agendado ";
        hql_a += "WHERE codigo = :id ";

        String hql_s = "FROM  SolicitacaoAgendado ";
        hql_s += "WHERE agendado_codigo = :id ";

        SessionFactory sf = HibernateUtil.getSessionFactory();
        Session sn = sf.openSession();
        RequestDispatcher rd;
        sn.beginTransaction();

        Query query_a;
        Query query_s;

        query_a = sn.createQuery(hql_a).setParameter("id", codigo);
        query_s = sn.createQuery(hql_s).setParameter("id", codigo);

        agendado = query_a.list();
        solag = query_s.list();

        try {
            //prestador.setPerfilp();
            for (Agendado n : agendado) {
                for (SolicitacaoAgendado s : solag) {

                    s.setAgendado(null);
                    sn.update(s);
                }
                //status = n.getStatus();
               // n.setSolicitacao(null);
                //sn.update(n);
                sn.delete(n);

            }
            //sn.update(prestador);

            sn.getTransaction().commit();
        } catch (Exception ex) {
            sn.getTransaction().rollback();
            System.out.println("ERROO " + ex);
            rd = request.getRequestDispatcher("principalCliente.jsp");
            rd.forward(request, response);
        } finally {

            sn.close();

            rd = request.getRequestDispatcher("AtendimentoFiltro.jsp");
            rd.forward(request, response);

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
