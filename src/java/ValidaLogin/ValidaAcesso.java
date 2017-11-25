/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ValidaLogin;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Agendado;
import model.Cliente;
import model.Especialidade;
import model.HibernateUtil;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

/**
 *
 * @author Lucas
 */
public class ValidaAcesso extends HttpServlet {

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

            String email = (String) request.getParameter("email");
            String senha = (String) request.getParameter("senha");
            List<Cliente> validacao;
            String sexo = "Feminino";
            String hql_e = "SELECT nome FROM  Especialidade ";
            ArrayList<Especialidade> esp;
            String hql = "FROM  Cliente  ";
            hql += "WHERE email = :email AND senha = :senha";

            SessionFactory sf = HibernateUtil.getSessionFactory();
            Session sn = sf.openSession();

            //session = sf.openSession();
            sn.beginTransaction();

            Query query;
            //Query query_e;
            //query.setParameter("email", email);
            //query.setParameter("senha", senha);
            query = sn.createQuery(hql).setParameter("email", email).setParameter("senha", senha);
            //query_e = sn.createQuery(hql_e);

            //session.save(cr);
            validacao = query.list();
            //esp = query_e.list();
            //System.out.println(validacao);
            //session.getTransaction().commit();
            sn.close();
            sf.close();
            String nomeCliente = "teste";
            String cpfCliente = "teste";
            String emailCliente = "teste";
            String DataCliente = "teste";

            HttpSession session;
            session = request.getSession();

            //Especialidade(request, response);
            if (!validacao.isEmpty()) {
                for (Cliente c : validacao) {

                    out.println("<!DOCTYPE html>");
                    out.println("<html>");
                    out.println("<head>");
                    out.println("<title>Servlet testee</title>");
                    out.println("</head>");
                    out.println("<body>");
                    out.println("<h1>Nome " + c.getNome() + "</h1>");
                    out.println("<h1>email " + c.getEmail() + "</h1>");
                    out.println("<h1>Data " + c.getData_nascimento() + "</h1>");
                    out.println("<h1>Tamanho " + validacao.size() + "</h1>");
                    out.println("</body>");
                    out.println("</html>");
                    nomeCliente = c.getNome();
                    cpfCliente = c.getCpf();
                    emailCliente = c.getEmail();
                    DataCliente = c.getData_nascimento();
                }
                session.setAttribute("user", nomeCliente);
                session.setAttribute("cpf", cpfCliente);
                session.setAttribute("email", emailCliente);
                session.setAttribute("sexo", sexo);
                session.setAttribute("data", DataCliente);
                //session.setAttribute("especialidade", esp);

                RequestDispatcher rd = request.getRequestDispatcher("principalCliente.jsp");
                rd.forward(request, response);

            } else {
                //   onome = "SEM ACESSO";
                out.println("<!DOCTYPE html>");
                out.println("<html>");
                out.println("<head>");
                out.println("<title>Servlet testee</title>");
                out.println("</head>");
                out.println("<body>");
                out.println("<h1>Sem acesso</h1>");
                out.println("</body>");
                out.println("</html>");
                RequestDispatcher rs = request.getRequestDispatcher("ErroAcesso.html");
                rs.forward(request, response);
            }
            

            /* TODO output your page here. You may use following sample code. */
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
