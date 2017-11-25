/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Atendimento;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import static java.text.DateFormat.getDateInstance;
import java.util.Date;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Agendado;
import model.Cliente;
import model.Emergencial;
import model.HibernateUtil;
import model.SolicitacaoEmergencial;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

/**
 *
 * @author Lucas
 */
public class buscaEmergencia extends HttpServlet {

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

        /* TODO output your page here. You may use following sample code. */
        String desc = (String) request.getParameter("descricao");
        String especialidade = (String) request.getParameter("especialidade");
        String endereco = (String) request.getParameter("endereco");
        String latlong = (String) request.getParameter("latlong");

        SessionFactory sf = null;
        Session sn = null;

        Emergencial ae = new Emergencial();

        HttpSession session = request.getSession(true);
        session = request.getSession();

        List<Cliente> cl = (List) session.getAttribute("cliente");

        session.setAttribute("Desc_emergencial", desc);
        session.setAttribute("Esp_emergencial", especialidade);
        //session.setAttribute("idcliente", cl.getId());

        //int id = cl.getId();
        java.util.Date d = new Date();

        String dStr = getDateInstance(DateFormat.MEDIUM).format(d);
        int tipo = 4;

        try {
            sf = HibernateUtil.getSessionFactory();
            sn = sf.openSession();
            //an.setEspecialidade(especialidade);
            ae.setDescricao(desc);
            ae.setCliente(cl.get(0));
            ae.setId_cliente(cl.get(0).getId());
            ae.setEspecialidade(especialidade);
            //anz.setValor(00);
            ae.setTipo(tipo);
            ae.setData(dStr);
            ae.setStatus(0);
            ae.setLatlong(latlong);
            ae.setEndereco(endereco);

            System.out.print(dStr);

            //an.setId_cliente(c.get(0).getId());
            //anz.setEspecialidade(especialidade);
            //an.setId_cliente(id);
            sn.beginTransaction();

            //sn.save(p);
            //sn.save(an);
            sn.save(ae);

            sn.getTransaction().commit();
        } catch (Exception e) {
            //sn.getTransaction().rollback();
            //e.printStackTrace();
            System.out.print("ERRO AQUI!");
            RequestDispatcher rd = request.getRequestDispatcher("ErroAcesso.html");
            rd.forward(request, response);

        }
        sn.close();

        RequestDispatcher rd = request.getRequestDispatcher("AtendimentoFiltro.jsp");
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
