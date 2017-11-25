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
import model.Agendado;
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
public class GerarAgendado extends HttpServlet {

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
       List<Agendado> agendado;
        RelatorioAtendimentoAgendado rel = new RelatorioAtendimentoAgendado();
        
        String data = request.getParameter("data");
        int qtde;
        int periodo;
        List<Double> estimada;
        List<Integer> proximosperiodos;
        List<Integer> qtdeEspecialdades;
        List<Especialidade> especialidades;
        SessionFactory sf = HibernateUtil.getSessionFactory();
        Session sn = sf.openSession();
        String hql = "FROM Agendado ";
        String hql_e = "FROM  Especialidade   ORDER BY nome ASC";
        sn.beginTransaction();

        Query query;
        Query query_e;

        query_e = sn.createQuery(hql_e);

        query = sn.createQuery(hql);

        especialidades = query_e.list();
        agendado = query.list();
        
        HttpSession session = request.getSession(true);
        
        qtde = rel.QuantidadeTotal(agendado, data);
        periodo = rel.Periodo(data);
        estimada = rel.QuantidadeEstimada(qtde, periodo);
        proximosperiodos = rel.ProximoPeriodo(periodo);
        qtdeEspecialdades  = rel.QuantidadeEspecialidade(especialidades, agendado);
        
        //String str= (String) qtde;
       sn.close();
        session.setAttribute("Relqtdeagendado", qtde);
        session.setAttribute("Relperiodoagendado",  periodo);
        session.setAttribute("relestimadaagendado", (List) estimada);
        session.setAttribute("relproximosperiodosagendado", (List) proximosperiodos);
        session.setAttribute("relqtdeespecagendado", (List) qtdeEspecialdades);
        session.setAttribute("relqtdeespecialidadeagendado", (List) especialidades);
        session.setAttribute("relqtdeagendadototais", agendado.size());
        RequestDispatcher rd = request.getRequestDispatcher("RelatorioAgendado.jsp");
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
