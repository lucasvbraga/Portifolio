/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Atendimento;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
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
public class AtualizaPrestadorEmEmergencial extends HttpServlet {

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
        RequestDispatcher rd = null;
        int status = 1;
        String str = request.getParameter("btescolha");
        int posicao = Integer.parseInt(str);
        List<SolicitacaoEmergencial> solem = (List) session.getAttribute("solicitacoes");
        HashMap<Integer, Prestador> prestadores = (HashMap) session.getAttribute("todosprestadores");

        List<Emergencial> emergencial;

        Prestador p = prestadores.get(solem.get(posicao).getId_prestador());
        //List<SolicitacaoAgendado> solem;
        String hql_a = "FROM  Emergencial ";
        hql_a += "WHERE codigo = :id ";
        SessionFactory sf = HibernateUtil.getSessionFactory();
        Session sn = sf.openSession();
        int codigo = solem.get(posicao).getEmergencial().getCodigo();
        double valor = solem.get(posicao).getValor();
        sn.beginTransaction();

        Query query_a;

        query_a = sn.createQuery(hql_a).setParameter("id", codigo);
        emergencial = query_a.list();

        try {
            //prestador.setPerfilp();
            for (Emergencial e : emergencial) {
                e.setPrestador(p);
                e.setValor(valor);
                e.setStatus(status);
                sn.update(e);

            }


            rd = request.getRequestDispatcher("AtendimentoFiltro.jsp");
            sn.getTransaction().commit();
        } catch (Exception ex) {
            sn.getTransaction().rollback();
            //System.out.println("ERROO h=" + h + "xxx= " + xx + " OOOOOOOO " + stresp.get(0) + " \n" + bancoep.get(5));
            System.err.println("ERRO" + ex);
            ex.printStackTrace();
            rd = request.getRequestDispatcher("AtendimentoFiltro.jsp");
        } finally {
            sn.close();
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
