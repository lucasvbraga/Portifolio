/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controle;

import ValidaLogin.ValidaCPF;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Especialidade;
import model.Gerente;
import model.HibernateUtil;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

/**
 *
 * @author Lucas
 */
public class InsereEspecialidade extends HttpServlet {

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
         
            String nomestr = request.getParameter("nome");
            String nome = nomestr.toLowerCase();
            HttpSession session;
            session = request.getSession();
           
            
String hql = "FROM  Especialidade ";

        List<Especialidade> especialidades;
        
        SessionFactory sf = HibernateUtil.getSessionFactory();
        Session sn = sf.openSession();
        RequestDispatcher rd;
        sn.beginTransaction();

        Query query;
        String saida = "";

        query = sn.createQuery(hql);

        especialidades = query.list();

       
        for (Especialidade gr : especialidades) {

            if (gr.getNome().equalsIgnoreCase(nome)) {

                saida = "Especialidade ja existente no sistema";
                
                session.setAttribute("saidacadespec", saida);
                rd = request.getRequestDispatcher("EspecialidadeGerente.jsp");
                rd.forward(request, response);
            }

        }
        
        session.setAttribute("saidacadespec", saida);
            
            
            
            

            try {
                sf = HibernateUtil.getSessionFactory();
                sn = sf.openSession();

                sn.beginTransaction();
                Especialidade e = new Especialidade(nome);
                
                sn.save(e);

                sn.getTransaction().commit();
            } catch (Exception e) {
                sn.getTransaction().rollback();
                System.err.println("ERRO!\n" + e);
                e.printStackTrace();
            } finally {
                sn.close();
                
            }
            
            
                  
           

             rd = request.getRequestDispatcher("CarregaEspecialidade");
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
