/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Relatorio;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
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
public class GerarEmergencial extends HttpServlet {

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
         List<Emergencial> emergencial;
        RelatorioAtendimentoEmergencial rel = new RelatorioAtendimentoEmergencial();
        
        String data = request.getParameter("data");
        int qtde;
        int periodo;
        List<Double> estimada;
        List<Integer> proximosperiodos;
        List<Integer> qtdeEspecialdades;
        List<Especialidade> especialidades;
        SessionFactory sf = HibernateUtil.getSessionFactory();
        Session sn = sf.openSession();
        String hql = "FROM Emergencial ";
        String hql_e = "FROM  Especialidade   ORDER BY nome ASC";
        sn.beginTransaction();

        Query query;
        Query query_e;

        query_e = sn.createQuery(hql_e);

        query = sn.createQuery(hql);

        especialidades = query_e.list();
        emergencial = query.list();
        
        HttpSession session = request.getSession(true);
        
        qtde = rel.QuantidadeTotal(emergencial, data);
        periodo = rel.Periodo(data);
        estimada = rel.QuantidadeEstimada(qtde, periodo);
        proximosperiodos = rel.ProximoPeriodo(periodo);
        qtdeEspecialdades  = rel.QuantidadeEspecialidade(especialidades, emergencial);
        
        //String str= (String) qtde;
       sn.close();
        session.setAttribute("Relqtdeemergencial", qtde);
        session.setAttribute("Relperiodoemergencial",  periodo);
        session.setAttribute("relestimadaemergencial", (List) estimada);
        session.setAttribute("relproximosperiodosemergencial", (List) proximosperiodos);
        session.setAttribute("relqtdeespecemergencial", (List) qtdeEspecialdades);
        session.setAttribute("relqtdeespecialidadeemergencial", (List) especialidades);
        session.setAttribute("relqtdeemergencialtotais", emergencial.size());
        RequestDispatcher rd = request.getRequestDispatcher("RelatorioEmergencial.jsp");
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
