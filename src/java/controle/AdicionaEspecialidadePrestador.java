/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controle;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
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
import model.Prestador;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

/**
 *
 * @author Lucas
 */
public class AdicionaEspecialidadePrestador extends HttpServlet {

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

        String[] especialidades = request.getParameterValues("especialidade");
        String codigostr = request.getParameter("id");
        int codigo = Integer.parseInt(codigostr);

        HttpSession session;
        session = request.getSession(true);

        //else if (sexostr.equalsIgnoreCase("m"))     {            sexo = false;        }
        SessionFactory sf = null;
        Session sn = null;
        sf = HibernateUtil.getSessionFactory();
        sn = sf.openSession();
        List<Especialidade> bancoep = new ArrayList<Especialidade>();
        List<Especialidade> especialidadesantigas = new ArrayList<Especialidade>();
        String hql_e = "FROM  Especialidade";

        List<Prestador> prestador;
        String hql_p = "FROM  Prestador ";
        hql_p += "WHERE id = :id ";

        List<String> stresp = new ArrayList<String>(Arrays.asList(especialidades));

        ArrayList<Especialidade> ep = new ArrayList<>();
        sn.beginTransaction();
        int h = 0;
        Query query_e;
        Query query_p;
        RequestDispatcher rd;
        query_e = sn.createQuery(hql_e);
        query_p = sn.createQuery(hql_p).setParameter("id", codigo);

        bancoep = query_e.list();
        prestador = query_p.list();
        especialidadesantigas = prestador.get(0).getEspecialidades();

        try {
            for (String e : stresp) {

                for (Especialidade espec : bancoep) {
                    if (e.equals(espec.getNome())) {

                        especialidadesantigas.add(espec);
                        h++;
                    }
                }
            }
            for (Prestador p : prestador) {
                p.setEspecialidades(especialidadesantigas);
                sn.update(p);
            }
            sn.getTransaction().commit();
        } catch (Exception ex) {
            sn.getTransaction().rollback();
            System.out.println("ERROO " + ex);
            ex.printStackTrace();
            rd = request.getRequestDispatcher("principalPrestador.jsp");
            rd.forward(request, response);
        } finally {

            sn.close();

        rd = request.getRequestDispatcher("NovaEspecialidade?botao=" + codigo);
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
