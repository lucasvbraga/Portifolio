/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controle;

import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Atendimento;
import model.Cliente;
import model.Especialidade;
import model.HibernateUtil;
import model.PerfilCliente;
import model.Prestador;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

/**
 *
 * @author Lucas
 */
public class deletaCliente extends HttpServlet {

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
        List<PerfilCliente> perfil;
        List<Cliente> cliente;
        List<Atendimento> atendimento;
        String codigostr = request.getParameter("botao");
        int codigo = Integer.parseInt(codigostr);
        
        String hql = "FROM  Cliente ";
        hql += "WHERE id = :id ";
        String hql_p = "FROM  PerfilCliente ";
        hql_p += "WHERE cliente_id = :id ";
        
        String hql_a = "FROM Atendimento WHERE cliente_id = :id";
        
        SessionFactory sf = HibernateUtil.getSessionFactory();
        Session sn = sf.openSession();
        RequestDispatcher rd;
        sn.beginTransaction();
        
        Query query;
        Query query_a;
        Query query_p;
        
        
        query = sn.createQuery(hql).setParameter("id", codigo);
        query_a = sn.createQuery(hql_a).setParameter("id", codigo);
        query_p = sn.createQuery(hql_p).setParameter("id", codigo);
        
        cliente = query.list();
        atendimento = query_a.list();
        perfil = query_p.list();
                
        try {
            //prestador.setPerfilp();
           for (Cliente c : cliente){
               for (Atendimento a : atendimento){
                   a.setCliente(null);
               }  
               for (PerfilCliente p : perfil){
               
                   p.setCliente(null);
               }
               c.setAtendimento(null);
                //status = n.getStatus();
                // n.setSolicitacao(null);
                //sn.update(n);
                sn.delete(c);
                
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
            
            rd = request.getRequestDispatcher("CarregaClientes");
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
