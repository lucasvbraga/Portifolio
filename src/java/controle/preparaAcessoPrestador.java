/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controle;

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
import model.HibernateUtil;
import model.Prestador;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

/**
 *
 * @author Lucas
 */
public class preparaAcessoPrestador extends HttpServlet {

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
            List<Prestador> prestador;
            String sexo = "Feminino";

            String hql = "FROM  Prestador  ";
            hql += "WHERE email = :email AND senha = :senha";

            SessionFactory sf = HibernateUtil.getSessionFactory();
            Session sn = sf.openSession();

            sn.beginTransaction();

            Query query_p;

            query_p = sn.createQuery(hql).setParameter("email", email).setParameter("senha", senha);

            prestador = query_p.list();

            String nomePrestador = "teste";
            String cpfPrestador = "teste";
            String emailPrestador = "teste";
            String DataPrestador = "teste";
            List<Especialidade> especialidades = new ArrayList<>();
            int id = 0;

            HttpSession session;
            session = request.getSession();

            if (!prestador.isEmpty()) {
                for (Prestador p : prestador) {

                    out.println("<!DOCTYPE html>");
                    out.println("<html>");
                    out.println("<head>");
                    out.println("<title>Servlet testee</title>");
                    out.println("</head>");
                    out.println("<body>");
                    out.println("<h1>Nome " + p.getNome() + "</h1>");
                    out.println("<h1>email " + p.getEmail() + "</h1>");
                    out.println("<h1>Data " + p.getData_nascimento() + "</h1>");
                    out.println("<h1>Tamanho " + prestador.size() + "</h1>");
                    out.println("</body>");
                    out.println("</html>");
                    nomePrestador = p.getNome();
                    cpfPrestador = p.getCpf();
                    emailPrestador = p.getEmail();
                    DataPrestador = p.getData_nascimento();
                    especialidades = p.getEspecialidades();
                    id = p.getId();
                }
                session.setAttribute("user", nomePrestador);
                session.setAttribute("cpf", cpfPrestador);
                session.setAttribute("email", emailPrestador);
                session.setAttribute("sexo", sexo);
                session.setAttribute("data", DataPrestador);
                session.setAttribute("especialidades", (List) especialidades);
                session.setAttribute("prestador", prestador);
                session.setAttribute("idPrestdor", id);
                sn.getTransaction().commit();
                sn.close();
                RequestDispatcher rd = request.getRequestDispatcher("principalPrestador.jsp");
                rd.forward(request, response);

            } else {
                RequestDispatcher rs = request.getRequestDispatcher("ErroAcesso.html");
                rs.forward(request, response);
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
