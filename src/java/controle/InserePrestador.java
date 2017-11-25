/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controle;

import ValidaLogin.ValidaCPF;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import static java.text.DateFormat.getDateInstance;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;
import model.Cliente;
import model.Especialidade;
import model.HibernateUtil;
import model.PerfilPrestador;
import model.Prestador;
import model.Qualidade;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

/**
 *
 * @author Lucas
 */
public class InserePrestador extends HttpServlet {

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

        boolean sexo = false;
        String cpf = request.getParameter("cpf");
        String nome = request.getParameter("nome");
        String data_nascimento = request.getParameter("data");
        String email = request.getParameter("email");
        String senha = request.getParameter("senha");
        String nmae = request.getParameter("nmmae");
        String npai = request.getParameter("nmpai");
        String rg_s = request.getParameter("rg");
        String uf = request.getParameter("uf");
        String celular = request.getParameter("celular");
        String[] especialidades = request.getParameterValues("especialidade");
        int rg = Integer.parseInt(rg_s);
        String sexostr = request.getParameter("gender");
        HttpSession session;
        session = request.getSession(true);
        if (sexostr.equalsIgnoreCase("f")) {
            sexo = true;
        }
        //else if (sexostr.equalsIgnoreCase("m"))     {            sexo = false;        }
        String hql = "FROM  Prestador ";

        List<Prestador> prestadores;
        ValidaCPF valida = new ValidaCPF();

        SessionFactory sf = HibernateUtil.getSessionFactory();
        Session sn = sf.openSession();
        RequestDispatcher rd;
        sn.beginTransaction();

        Query query;
        String saida = "";

        query = sn.createQuery(hql);

        prestadores = query.list();

        if (sexostr.equalsIgnoreCase("f")) {
            sexo = true;
        }
        for (Prestador pr : prestadores) {

            if (pr.getEmail().equalsIgnoreCase(email)) {

                saida = "Email ja existente no sistema";
                if (!valida.isCPF(cpf)) {
                    saida = saida + "| CPF INVÁLIDO!";
                }
                session.setAttribute("saidacadprestador", saida);
                rd = request.getRequestDispatcher("CadastroPrestador.jsp");
                rd.forward(request, response);
            }

        }
        if (!valida.isCPF(cpf)) {
            saida = saida + "CPF INVÁLIDO!";

            session.setAttribute("saidacadprestador", saida);
            rd = request.getRequestDispatcher("CadastroPrestador.jsp");
            rd.forward(request, response);
        }
        session.setAttribute("saidacadprestador", saida);
        String comp = "a";
        List<String> stresp = new ArrayList<String>(Arrays.asList(especialidades));

        ArrayList<Especialidade> ep = new ArrayList<>();

        List<Especialidade> bancoep = new ArrayList<Especialidade>();
        String hql_e = "FROM  Especialidade";
        java.util.Date d = new Date();

        String dStr = getDateInstance(DateFormat.MEDIUM).format(d);

        //sn.beginTransaction();
        Query query_e;

        query_e = sn.createQuery(hql_e);

        bancoep = query_e.list();

        //bancoep = (List) session.getAttribute("comboespecialidade");
        Prestador p = new Prestador();
        Qualidade qualidade = new Qualidade();
        PerfilPrestador perfilP = new PerfilPrestador();

        p.setNome(nome);
        p.setCpf(cpf);
        p.setData_nascimento(data_nascimento);
        p.setEmail(email.toLowerCase());
        p.setSenha(senha);
        p.setSexo(sexo);
        p.setAprovado(0);//0- EM ANÀLISE 1-APROVADO 2- REPROVADO 
        p.setBloqueado(false);
        p.setNome_mae(nmae);
        p.setNome_pai(npai);
        p.setRg(rg);
        p.setUf_rg(uf);
        p.setCelular(celular);
        p.setData(dStr);
        p.setSuspensao(0);
        p.setAdvertencia(0);
        
//        p.getPerfilp().setPrestador(p);
        // p.getPerfilp().setQualidade();
        //p.setPerfilp(perfilp);
        int h = 0;
        int xx = 0;
        String str = "off";
        //p.setEspecialidades(e);
        try {

            for (String e : stresp) {

                for (Especialidade espec : bancoep) {
                    if (e.equals(espec.getNome())) {

                        ep.add(espec);
                        h++;
                    }
                }
            }

            p.setEspecialidades(ep);
            //perfilP = new PerfilPrestador(p, qualidade);
            //qualidade = new Qualidade(0, 0, 0, perfilP);
            qualidade.setNota(2.5);
            qualidade.setNivel(0);
            qualidade.setXp(0);
            qualidade.setQtdnegativa(0);
            
            perfilP.setPrestador(p);
            perfilP.setDataNota("NOTA POSITIVA");
            perfilP.setQualidade(qualidade);
            qualidade.setPrestador(perfilP);
            p.setPerfilp(perfilP);
            sn.save(perfilP);
            sn.save(qualidade);
            sn.save(p);

            sn.getTransaction().commit();
        } catch (Exception ex) {
            sn.getTransaction().rollback();
            System.out.println("ERROO h=" + h + "xxx= " + xx + " OOOOOOOO " + stresp.get(0) + " \n" + bancoep.get(5));
            ex.printStackTrace();
        } finally {
            sn.close();

        }

        session.setAttribute("user", nome);
        session.setAttribute("prestadorobj", p);

        rd = request.getRequestDispatcher("AutorizacaoPrestador.jsp");
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
