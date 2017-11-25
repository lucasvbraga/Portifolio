/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controle;

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
import model.HibernateUtil;
import model.Normal;
import model.Prestador;
import model.SolicitacaoNormal;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

/**
 *
 * @author Lucas
 */
public class deletaEspecialidade extends HttpServlet {

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
        
        String codigostr = request.getParameter("botao");
        int codigo = Integer.parseInt(codigostr);
        
        List<Especialidade> especialidades;
        String hql_e = "FROM  Especialidade ";
        hql_e += "WHERE id = :id ";
        
        String hql_p = "FROM  Prestador ";
        hql_p += "WHERE id = :id ";
        
        SessionFactory sf = HibernateUtil.getSessionFactory();
        Session sn = sf.openSession();
        RequestDispatcher rd;
        sn.beginTransaction();
        
        Query query_e;
        Query query_p;
        
        query_e = sn.createQuery(hql_e).setParameter("id", codigo);
        
        especialidades = query_e.list();
        List<Prestador> psize;
        List<Especialidade> eprestador;
        try {
            //prestador.setPerfilp();
            for (Especialidade e : especialidades) {
                psize = e.getPrest();
                for (int i = 0; i < psize.size(); i++) {
                    query_p = sn.createQuery(hql_p).setParameter("id", psize.get(i).getId());
                    prestador = query_p.list();
                    for (Prestador p : prestador) {
                        
                        eprestador = p.getEspecialidades();
                            for ( int t=0; t< eprestador.size(); t++){
                                if ( eprestador.get(t).getId() == codigo){
                                    eprestador.remove(t);
                                }
                            }
                        p.setEspecialidades(eprestador);
                    }
                }

                 e.setPrest(null);
                //status = n.getStatus();
                // n.setSolicitacao(null);
                //sn.update(n);
                sn.delete(e);
                
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
            
            rd = request.getRequestDispatcher("CarregaEspecialidade");
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
