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
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Agendado;
import model.Atendimento;
import model.Cliente;
import model.Especialidade;
import model.HibernateUtil;
import model.PerfilCliente;
import model.SolicitacaoAgendado;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

/**
 *
 * @author Lucas
 */
public class buscaAgendado extends HttpServlet {

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

        /* TODO output your page here. You may use following sample code.*/
        String desc = (String) request.getParameter("descricao");
        String data = (String) request.getParameter("data");
        String especialidade = (String) request.getParameter("especialidade");
        String horario = (String) request.getParameter("horario");
        String repetir = (String) request.getParameter("repetir");
        String endereco = (String) request.getParameter("endereco");
        String latlong = (String) request.getParameter("latlong");

        SessionFactory sf = null;
        Session sn = null;

        //Atendimento an = new Agendado();
        Agendado anz = new Agendado();

        HttpSession session;
        session = request.getSession();
        List<Cliente> c = (List) session.getAttribute("cliente");
        session.setAttribute("Desc_agendado", desc);
        session.setAttribute("Esp_agendado", especialidade);
        session.setAttribute("dataMarcada", data);
        //session.setAttribute("idcliente",c.get(0).getId());

        java.util.Date d = new Date();

        String dStr = getDateInstance(DateFormat.MEDIUM).format(d);
        int tipo = 6;

        try {
            sf = HibernateUtil.getSessionFactory();
            sn = sf.openSession();
            //an.setEspecialidade(especialidade);
            anz.setDescricao(desc);
            anz.setCliente(c.get(0));
            anz.setId_cliente(c.get(0).getId());
            anz.setData_marcada(data);
            anz.setEspecialidade(especialidade);
            //anz.setValor(00);
            anz.setTipo(tipo);
            anz.setData(dStr);
            anz.setStatus(0);
            anz.setHora_marcada(horario);
            anz.setPeriodico(repetir);
            anz.setLatlong(latlong);
            anz.setEndereco(endereco);

            System.out.print(dStr);

            //an.setId_cliente(c.get(0).getId());
            //anz.setEspecialidade(especialidade);
            //an.setId_cliente(id);
            sn.beginTransaction();

            //sn.save(p);
            //sn.save(an);
            sn.save(anz);

            sn.getTransaction().commit();
        } catch (Exception e) {
            //sn.getTransaction().rollback();
            //e.printStackTrace();
            System.out.print("ERRO AQUI!");
            RequestDispatcher rd = request.getRequestDispatcher("ErroAcesso.html");
            rd.forward(request, response);

        } finally {
            sn.close();
        }
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
