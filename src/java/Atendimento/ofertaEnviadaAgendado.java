/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Atendimento;

import java.io.IOException;
import java.util.ArrayList;

import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Agendado;
import model.HibernateUtil;
import model.Prestador;
import model.SolicitacaoAgendado;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

/**
 *
 * @author Lucas
 */
public class ofertaEnviadaAgendado extends HttpServlet {

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

        SessionFactory sf = null;
        Session sn = null;
        
        SolicitacaoAgendado solag = new SolicitacaoAgendado();
        List<Agendado> agndo = (List) session.getAttribute("atendimento");
        List<Agendado> agendado = new ArrayList<>();
        List<Prestador> prst = (List) session.getAttribute("prestador");
        List<Prestador> prestador = new ArrayList<>();
        agendado.add(agndo.get(0));
        prestador.add(prst.get(0));
        String valorstr = request.getParameter("valor");
        //int valor = Integer.parseInt(valorstr);
        double valor = Double.parseDouble(valorstr);
        
        try {
            sf = HibernateUtil.getSessionFactory();
            sn = sf.openSession();
             

            solag.setAgendado(agendado.get(0));
            solag.setValor(valor);
            solag.setId_prestador(prestador.get(0).getId());
            solag.setNome_prestador(prestador.get(0).getNome());
            
            
            sn.beginTransaction();
            


            sn.save(solag);

            sn.getTransaction().commit();
            session.setAttribute("solicitacao",  solag);
            
            
        } catch (Exception e) {
            //sn.getTransaction().rollback();
            e.printStackTrace();
            System.out.print("ERRO AQUI! \n" + e);
            //RequestDispatcher rd = request.getRequestDispatcher("ErroAcesso.html");
            //rd.forward(request, response);

        }
            sn.close();
            RequestDispatcher rd = request.getRequestDispatcher("ofertaEnviada.jsp");
            rd.forward(request, response);
            //response.sendRedirect("ofertaEnviada.jsp"); 

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
