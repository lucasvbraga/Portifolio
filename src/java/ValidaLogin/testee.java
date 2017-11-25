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
import model.Cliente;
import model.Especialidade;
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
public class testee extends HttpServlet {

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
            /* TODO output your page here. You may use following sample code. */
            boolean resp = false;

            String email = (String) request.getParameter("email");
            String senha = (String) request.getParameter("senha");
            email = email.toLowerCase();
            senha = senha.toLowerCase();
            List<Cliente> cliente;
            List<Prestador> prestador;
            String sexo = "Feminino";
            String hql_e = "SELECT nome FROM  Especialidade   ORDER BY nome ASC";
            List<Especialidade> espec;
            String hql = "FROM  Cliente  ";
            hql += "WHERE email = :email AND senha = :senha";

            String hql_p = "FROM  Prestador  ";
            hql_p += "WHERE email = :email AND senha = :senha";

            List<Gerente> gerente;
            String hql_g = "FROM  Gerente  ";
            hql_g += "WHERE email = :email AND senha = :senha";
            SessionFactory sf = HibernateUtil.getSessionFactory();
            Session sn = sf.openSession();

            //session = sf.openSession();
            sn.beginTransaction();

            Query query;
            Query query_e;
            Query query_p;
            Query query_g;

            query = sn.createQuery(hql).setParameter("email", email).setParameter("senha", senha);
            query_e = sn.createQuery(hql_e);
            query_p = sn.createQuery(hql_p).setParameter("email", email).setParameter("senha", senha);
            query_g = sn.createQuery(hql_g).setParameter("email", email).setParameter("senha", senha);

            //session.save(cr);
            cliente = query.list();
            espec = query_e.list();
            prestador = query_p.list();
            gerente = query_g.list();
            //System.out.println(cliente);
            //session.getTransaction().commit();
            //sn.close();
            //sf.close();
            String nomeCliente = "teste";
            String cpfCliente = "teste";
            String emailCliente = "teste";
            String DataCliente = "teste";
            String nomePrestador = "teste";
            String cpfPrestador = "teste";
            String emailPrestador = "teste";
            String DataPrestador = "teste";
            String nomeGerente = "teste";
            List<Especialidade> especialidades = new ArrayList<>();
            int id = 0;
            String erro = "E-mail e/ou senha incorreta!";

            HttpSession session;
            session = request.getSession();

            //Especialidade(request, response);
            if (!cliente.isEmpty()) {
                for (Cliente c : cliente) {

                    nomeCliente = c.getNome();
                    cpfCliente = c.getCpf();
                    emailCliente = c.getEmail();
                    DataCliente = c.getData_nascimento();
                    id = c.getId();
                    session.setAttribute("clienteobj", c);
                }
                session.setAttribute("user", nomeCliente);
                session.setAttribute("cpf", cpfCliente);
                session.setAttribute("email", emailCliente);
                session.setAttribute("sexo", sexo);
                session.setAttribute("data", DataCliente);
                session.setAttribute("ATespecialidade", espec);
                session.setAttribute("cliente", cliente);
                session.setAttribute("id", id);
                erro = "";
                session.setAttribute("erroacesso", erro);
                RequestDispatcher rd = request.getRequestDispatcher("principalCliente.jsp");
                rd.forward(request, response);

            } else if (!prestador.isEmpty()) {
                for (Prestador p : prestador) {

                    nomePrestador = p.getNome();
                    cpfPrestador = p.getCpf();
                    emailPrestador = p.getEmail();
                    DataPrestador = p.getData_nascimento();
                    especialidades = p.getEspecialidades();
                    id = p.getId();
                    session.setAttribute("prestadorobj", p);
                    if (p.getAprovado() != 2) {
                        RequestDispatcher rd = request.getRequestDispatcher("AutorizacaoPrestador.jsp");
                        rd.forward(request, response);

                    }
                }

                session.setAttribute("user", nomePrestador);
                session.setAttribute("cpf", cpfPrestador);
                session.setAttribute("email", emailPrestador);
                session.setAttribute("sexo", sexo);
                session.setAttribute("data", DataPrestador);
                session.setAttribute("Pespecialidades", especialidades);
                session.setAttribute("prestador", prestador);
                session.setAttribute("idPrestdor", id);
                erro = "";
                session.setAttribute("erroacesso", erro);
                RequestDispatcher rd = request.getRequestDispatcher("principalPrestador.jsp");
                rd.forward(request, response);
            } else if (!gerente.isEmpty()) {
                for (Gerente g : gerente) {

                    nomeGerente = g.getNome();
                    session.setAttribute("gerente", g);
                }
                session.setAttribute("user", nomeGerente);

                erro = "";
                session.setAttribute("erroacesso", erro);
                RequestDispatcher rd = request.getRequestDispatcher("principalGerente.jsp");
                rd.forward(request, response);

            } else {
                //sn.getTransaction().commit();
                session.setAttribute("erroacesso", erro);
                RequestDispatcher rs = request.getRequestDispatcher("main.jsp");
                rs.forward(request, response);
            }
        }

        /*out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet testee</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet testee at " + onome + "</h1>");
            out.println("</body>");
            out.println("</html>"); */
        //}
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
