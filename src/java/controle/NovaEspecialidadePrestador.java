/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controle;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Especialidade;
import model.HibernateUtil;
import model.Prestador;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

/**
 *
 * @author Lucas
 */
public class NovaEspecialidadePrestador extends HttpServlet {

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
        session = request.getSession();
        List<Especialidade> especialidades;
        List<Especialidade> especialidadesprestador = null;
        //List<Especialidade> especialidadesresumidas;
        String hql_e = "FROM  Especialidade   ORDER BY nome ASC";
        SessionFactory sf = HibernateUtil.getSessionFactory();
        Session sn = sf.openSession();
        
        String codigostr = request.getParameter("botao");
        int codigo = Integer.parseInt(codigostr);
        
        List<Prestador> prestador;
        String hql_p = "FROM  Prestador ";
        hql_p += "WHERE id = :id ";


        sn.beginTransaction();



        Query query_e;
        Query query_p;
        
        
        query_e = sn.createQuery(hql_e);
        query_p = sn.createQuery(hql_p).setParameter("id", codigo);
        
        especialidades = query_e.list();
        prestador = query_p.list();
        
        List<Especialidade> resumida = especialidades;
        for (Prestador p : prestador){
        
            especialidadesprestador = p.getEspecialidades();
        }

        for (Especialidade e : especialidadesprestador) {

            resumida.remove(e);

        }

        session.setAttribute("especialidaderesumida", resumida);
        RequestDispatcher rd;
        rd = request.getRequestDispatcher("alteraespecialidade.jsp");
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
