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
import model.Emergencial;
import model.HibernateUtil;
import model.Prestador;
import model.SolicitacaoEmergencial;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

/**
 *
 * @author Lucas
 */
public class deletaEmergencial extends HttpServlet {

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
        List<SolicitacaoEmergencial> solem;
        String codigostr = request.getParameter("botao");
        int codigo = Integer.parseInt(codigostr);
        //Agendado ag = new Agendado();

        List<Emergencial> emergencial;
        String hql_a = "FROM  Emergencial ";
        hql_a += "WHERE codigo = :id ";

        String hql_s = "FROM  SolicitacaoEmergencial ";
        hql_s += "WHERE emergencial_codigo = :id ";

        SessionFactory sf = HibernateUtil.getSessionFactory();
        Session sn = sf.openSession();
        RequestDispatcher rd;
        sn.beginTransaction();

        Query query_a;
        Query query_s;

        query_a = sn.createQuery(hql_a).setParameter("id", codigo);
        query_s = sn.createQuery(hql_s).setParameter("id", codigo);

        emergencial = query_a.list();
        solem = query_s.list();

        try {
            //prestador.setPerfilp();
            for (Emergencial n : emergencial) {
                for (SolicitacaoEmergencial s : solem) {

                    s.setEmergencial(null);
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
            ex.printStackTrace();
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
