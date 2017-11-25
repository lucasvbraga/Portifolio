/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controle;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import static java.text.DateFormat.getDateInstance;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Cliente;
import model.Gerente;
import model.HibernateUtil;
import model.Prestador;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

/**
 *
 * @author Lucas
 */
public class CarregaUsuarios extends HttpServlet {

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
        String hql_p = "FROM  Prestador";
        String hql_c = "FROM  Cliente";
        String hql_g = "FROM  Gerente";
        List<Prestador> plist;
        List<Cliente> clist;
        List<Gerente> glist;

        RequestDispatcher rd;

        SessionFactory sf = HibernateUtil.getSessionFactory();
        Session sn = sf.openSession();
        sn.beginTransaction();
        java.util.Date d = new Date();
        //String dStr = getDateInstance().format(d);
        Date data = new Date(System.currentTimeMillis());  
SimpleDateFormat formatarDate = new SimpleDateFormat("yyyy-MM-dd");
        Query query_p;
        Query query_c;
        Query query_g;
        String saida = "";
        query_p = sn.createQuery(hql_p);
        query_c = sn.createQuery(hql_c);
        query_g = sn.createQuery(hql_g);

        plist = query_p.list();
        clist = query_c.list();
        glist = query_g.list();
        sn.getTransaction().commit();
        sn.close();

        HttpSession session = request.getSession();
        HashMap<Integer, Prestador> prestadores = new HashMap<Integer, Prestador>();
        HashMap<Integer, Cliente> clientes = new HashMap<Integer, Cliente>();
        for (Prestador p : plist) {
            prestadores.put(p.getId(), p);
            //Aluno x;
            //x = alunos.get(12345);
            //print(x.getnome)
        }
        for (Cliente c : clist) {
            clientes.put(c.getId(), c);

        }
        session.setAttribute("saidacadcliente", saida);
        session.setAttribute("todosprestadores", prestadores);
        session.setAttribute("todosclientes", clientes);
        session.setAttribute("datahoje", formatarDate.format(data));
        session.setAttribute("todosgerentes", glist);
        session.setAttribute("listatodosclientes", clist);
        session.setAttribute("listatodosprestadores", plist);

        rd = request.getRequestDispatcher("index.jsp");
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
