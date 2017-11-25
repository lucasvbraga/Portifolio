/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controle;

import ValidaLogin.ValidaCPF;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Cliente;
import model.Gerente;
import model.HibernateUtil;
import model.PerfilCliente;
import model.Prestador;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

/**
 *
 * @author Lucas
 */
public class InsereGerente extends HttpServlet {

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
            session = request.getSession();
        boolean sexo = false;
            String cpf = request.getParameter("cpf");
            String nome = request.getParameter("nome");
            String data_nascimento = request.getParameter("data");
            String email = request.getParameter("email");
            String senha = request.getParameter("senha");
            String sexostr = request.getParameter("gender");
            
           if ( sexostr.equalsIgnoreCase("f")) {
            sexo = true;
        }
            String hql = "FROM  Gerente ";

        List<Gerente> gerentes;
        ValidaCPF valida = new ValidaCPF();
        
        SessionFactory sf = HibernateUtil.getSessionFactory();
        Session sn = sf.openSession();
        RequestDispatcher rd;
        sn.beginTransaction();

        Query query;
        String saida = "";

        query = sn.createQuery(hql);

        gerentes = query.list();

        if (sexostr.equalsIgnoreCase("f")) {
            sexo = true;
        }
        for (Gerente gr : gerentes) {

            if (gr.getEmail().equalsIgnoreCase(email)) {

                saida = "Email ja existente no sistema";
                if (!valida.isCPF(cpf)) {
                    saida = saida + "| CPF INVÁLIDO!";
                }
                session.setAttribute("saidacadgerente", saida);
                rd = request.getRequestDispatcher("CadastroGerente.jsp");
                rd.forward(request, response);
            }

        }
        if (!valida.isCPF(cpf)) {
            saida = saida + "CPF INVÁLIDO!";

            session.setAttribute("saidacadgerente", saida);
            rd = request.getRequestDispatcher("CadastroGerente.jsp");
            rd.forward(request, response);
        }
        session.setAttribute("saidacadprestador", saida);

           

            Gerente g;
            PerfilCliente p;
            
            g = new Gerente();
            
            g.setNome(nome);
            g.setCpf(cpf);
            g.setData_nascimento(data_nascimento);
            g.setEmail(email.toLowerCase());
            g.setSenha(senha);
            g.setSexo(sexo);
            
            
            

            try {
                

               // sn.beginTransaction();

                
                sn.save(g);

                sn.getTransaction().commit();
            } catch (Exception e) {
                sn.getTransaction().rollback();
                System.err.println("ERRO!\n" + e);
                e.printStackTrace();
            } finally {
                sn.close();
                
            }
           
            

            session.setAttribute("user_cadastrado", nome);
            session.setAttribute("cpf_cadastrado", cpf);
            session.setAttribute("email_cadastrado", email);
            session.setAttribute("sexo_cadastrado", sexo);
            session.setAttribute("data_cadastrado", data_nascimento);

            rd = request.getRequestDispatcher("GerenteCadastrado.jsp");
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
