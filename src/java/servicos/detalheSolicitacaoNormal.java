/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servicos;

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
import model.Emergencial;
import model.HibernateUtil;
import model.Normal;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

/**
 *
 * @author Lucas
 */
public class detalheSolicitacaoNormal extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {

            HttpSession session;
            session = request.getSession(true);

            String strcodigo = (String) request.getParameter("botao");
            int codigo = Integer.parseInt(strcodigo);
            //int id = 19;
            Agendado ag = new Agendado();

            List<Agendado> agendado = null;

            String hql_a = "FROM  Agendado ";
            hql_a += "WHERE codigo = :cd ";

            List<Emergencial> emergencial = null;

            String hql_e = "FROM  Emergencial ";
            hql_e += "WHERE codigo = :cd ";

            List<Normal> normal = null;

            String hql_n = "FROM  Normal  ";
            hql_n += "WHERE codigo = :cd ";

            SessionFactory sf = HibernateUtil.getSessionFactory();
            Session sn = sf.openSession();

            //session = sf.openSession();
            sn.beginTransaction();

            Query query_a;
            Query query_n;
            Query query_e;
            query_n = sn.createQuery(hql_n).setParameter("cd", codigo);
            query_e = sn.createQuery(hql_e).setParameter("cd", codigo);
            query_a = sn.createQuery(hql_a).setParameter("cd", codigo);

            agendado = query_a.list();
            normal = query_n.list();
            emergencial = query_e.list();
            //sn.getTransaction().commit();
            sn.close();
            if (!agendado.isEmpty()) {

                session.setAttribute("servico", agendado);

                RequestDispatcher rd = request.getRequestDispatcher("detalheSolicitacaoAgendado.jsp");
                rd.forward(request, response);

            } else if (!normal.isEmpty()) {

                session.setAttribute("servico", normal);
                RequestDispatcher rd = request.getRequestDispatcher("detalheSolicitacaoNormal.jsp");
                rd.forward(request, response);

            } else if (!emergencial.isEmpty()) {

                session.setAttribute("servico", emergencial);

                RequestDispatcher rd = request.getRequestDispatcher("detalheSolicitacaoEmergencial.jsp");
                rd.forward(request, response);
            } else {

                out.println("<!DOCTYPE html>");
                out.println("<html>");
                out.println("<head>");
                out.println("<title>Servlet enviaOferta</title>");
                out.println("</head>");
                out.println("<body>");
                out.println("<h1>Nenhum array está preenchido ou deu merda!</h1>");
                out.println("</body>");
                out.println("</html>");
            }

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
