/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controle;

import ValidaLogin.ValidaCPF;
import formatacao.Formatacoes;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import static java.text.DateFormat.getDateInstance;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Cliente;
import model.HibernateUtil;
import model.PerfilCliente;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

/**
 *
 * @author Lucas
 */
public class InsereCliente extends HttpServlet {

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
            boolean sexo = false;
            HttpSession session;
            session = request.getSession();

            String cpf = request.getParameter("cpf");
            String nome = request.getParameter("nome");
            String data_nascimento = request.getParameter("data");
            String email = request.getParameter("email");
            String senha = request.getParameter("senha");
            String sexostr = request.getParameter("gender");
            java.util.Date d = new Date();

            String dStr = getDateInstance(DateFormat.MEDIUM).format(d);
            String hql = "FROM  Cliente ";

            List<Cliente> clientes;
            ValidaCPF valida = new ValidaCPF();
            SessionFactory sf = HibernateUtil.getSessionFactory();
            Session sn = sf.openSession();
            RequestDispatcher rd;
            sn.beginTransaction();

            String saida = "";
            Formatacoes fmat = new Formatacoes();
            SimpleDateFormat formato = new SimpleDateFormat("dd/MM/yyyy");
            Calendar ca = Calendar.getInstance();
            SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy");
            java.sql.Date data = null;
            try {
                data = new java.sql.Date(format.parse(fmat.FormataData(data_nascimento)).getTime());
            } catch (ParseException ex) {
                //Logger.getLogger(InsereCliente.class.getName()).log(Level.SEVERE, null, ex);
            }
            Calendar calinformada = Calendar.getInstance();
            calinformada.setTime(data);
            Calendar calhoje = Calendar.getInstance();
            calhoje.setTime(d);
            //cal.setTime(data);
            //data.setTime(cal.getTimeInMillis());
            //Date hoje = new Date(System.currentTimeMillis());
            //data.setTime();
            Query query;
            query = sn.createQuery(hql);

            clientes = query.list();

            if (sexostr.equalsIgnoreCase("f")) {
                sexo = true;
            }
            for (Cliente cl : clientes) {

                if (cl.getEmail().equalsIgnoreCase(email)) {

                    saida = "Email ja existente no sistema";
                    if (!valida.isCPF(cpf)) {
                        saida = saida + "| CPF INVÁLIDO!";
                    }
                    if (calhoje.before(calinformada)) {
                        saida = saida + "|DATA DE NASCIMENTO INVÁLIDA";
                    }
                    session.setAttribute("saidacadcliente", saida);
                    rd = request.getRequestDispatcher("CadastroCliente.jsp");
                    rd.forward(request, response);
                }

            }
            if (!valida.isCPF(cpf)) {
                saida = saida + "CPF INVÁLIDO!";

                session.setAttribute("saidacadcliente", saida);
                rd = request.getRequestDispatcher("CadastroCliente.jsp");
                rd.forward(request, response);
            }
            if (calhoje.before(calinformada)) {
                saida = "DATA DE NASCIMENTO INVÁLIDA";
                session.setAttribute("saidacadcliente", saida);
                rd = request.getRequestDispatcher("CadastroCliente.jsp");
                rd.forward(request, response);
            }

            Cliente c;
            PerfilCliente p;

            c = new Cliente();
            session.setAttribute("saidacadcliente", saida);
            c.setNome(nome);
            c.setCpf(cpf);
            c.setData_nascimento(data_nascimento);
            c.setEmail(email.toLowerCase());
            c.setSenha(senha);
            c.setSexo(sexo);
            c.setData(dStr);
            p = new PerfilCliente(c, nome, cpf);

            try {

                //sn.beginTransaction();
                sn.save(p);
                sn.save(c);

                sn.getTransaction().commit();
            } catch (Exception e) {
                sn.getTransaction().rollback();
                System.err.println("ERRO!\n" + e);
                e.printStackTrace();
            } finally {
                sn.close();

            }

            session.setAttribute("user", nome);
            session.setAttribute("cpf", cpf);
            session.setAttribute("email", email);
            session.setAttribute("sexo", sexo);
            session.setAttribute("data", data_nascimento);

            rd = request.getRequestDispatcher("testee?email=" + email + "&senha=" + senha);
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
