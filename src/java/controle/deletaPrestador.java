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
import model.Atendimento;
import model.Especialidade;
import model.HibernateUtil;
import model.PerfilPrestador;
import model.Prestador;
import model.SolicitacaoAgendado;
import model.SolicitacaoEmergencial;
import model.SolicitacaoNormal;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

/**
 *
 * @author Lucas
 */
public class deletaPrestador extends HttpServlet {

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
        List<PerfilPrestador> perfil;
        List<Atendimento> atendimento;
        List<SolicitacaoAgendado> solag;
        List<SolicitacaoNormal> solnm;
        List<SolicitacaoEmergencial> solem;

        String codigostr = request.getParameter("botao");
        int codigo = Integer.parseInt(codigostr);

        List<Especialidade> especialidades;
        String hql_e = "FROM  Especialidade ";
        hql_e += "WHERE id = :id ";
        String hql_a = "FROM  Atendimento ";
        hql_a += "WHERE prestador_id = :id ";

        String hql_p = "FROM  Prestador ";
        hql_p += "WHERE id = :id ";

        String hql_pf = "FROM  PerfilPrestador ";
        hql_pf += "WHERE prestador_id = :id ";

        String hql_sa = "FROM  SolicitacaoAgendado ";
        hql_sa += "WHERE agendado_codigo = :id ";

        String hql_sn = "FROM  SolicitacaoNormal ";
        hql_sn += "WHERE normal_codigo = :id ";

        String hql_se = "FROM  SolicitacaoEmergencial ";
        hql_se += "WHERE emergencial_codigo = :id ";

        SessionFactory sf = HibernateUtil.getSessionFactory();
        Session sn = sf.openSession();
        RequestDispatcher rd;
        sn.beginTransaction();

        Query query_e;
        Query query_p;
        Query query_a;
        Query query_pf;
        Query query_sa;
        Query query_sn;
        Query query_se;
        query_p = sn.createQuery(hql_p).setParameter("id", codigo);
        query_pf = sn.createQuery(hql_pf).setParameter("id", codigo);
        query_a = sn.createQuery(hql_a).setParameter("id", codigo);
        prestador = query_p.list();
        atendimento = query_a.list();
        perfil = query_pf.list();

        List<Prestador> pespecialidade;
        List<Especialidade> esize;

        try {
            //prestador.setPerfilp();
            for (Prestador p : prestador) {
                esize = p.getEspecialidades();
                for (int i = 0; i < esize.size(); i++) {
                    query_e = sn.createQuery(hql_e).setParameter("id", esize.get(i).getId());
                    especialidades = query_e.list();
                    for (Especialidade e : especialidades) {

                        pespecialidade = e.getPrest();
                        for (int t = 0; t < pespecialidade.size(); t++) {
                            if (pespecialidade.get(t).getId() == codigo) {
                                pespecialidade.remove(t);
                            }
                        }
                        e.setPrest(pespecialidade);
                    }
                }
                for (Atendimento a : atendimento) {

                    query_sa = sn.createQuery(hql_sa).setParameter("id", a.getCodigo());
                    query_sn = sn.createQuery(hql_sn).setParameter("id", a.getCodigo());
                    query_se = sn.createQuery(hql_se).setParameter("id", a.getCodigo());
                    solem = query_se.list();
                    solag = query_sa.list();
                    solnm = query_sn.list();
                    if (!solag.isEmpty()) {
                        for (SolicitacaoAgendado ag : solag){
                            ag.setAgendado(null);
                            ag.setNome_prestador("Prestador excluido");
                        }
                    }
                    if (!solnm.isEmpty()) {
                        for (SolicitacaoNormal an : solnm){
                            an.setNormal(null);
                            an.setNome_prestador("Prestador excluido");
                        }
                    }
                    if (!solem.isEmpty()) {
                        for (SolicitacaoEmergencial ae : solem){
                            ae.setEmergencial(null);
                            ae.setNome_prestador("Prestador excluido");
                        }
                    }
                    a.setPrestador(null);
                    

                }
                for (PerfilPrestador pf : perfil) {

                    pf.setPrestador(null);
                }
                p.setPerfilp(null);
                p.setEspecialidades(null);
                //status = n.getStatus();
                // n.setSolicitacao(null);
                //sn.update(n);
                sn.delete(p);

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

            rd = request.getRequestDispatcher("CarregaPrestador");
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
