/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controle;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Lucas
 */
public class preparaAcessoCliente extends HttpServlet {
HttpServletRequest request;
HttpServletResponse response;
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
            
        }
    }
    public void montaAcesso() {
            PrintWriter out;
    try {
            out = response.getWriter();
            String email = (String) request.getAttribute("email");
            String senha = (String) request.getAttribute("senha");
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head><link rel=\"stylesheet\" href=\"https://www.w3schools.com/w3css/4/w3.css\">");
            out.println("<title>Dadod em análise</title>");
            out.println(" <style>\n"
                    + "            body{\n"
                    + "                background-image: url(./img/planodefundo.jpg);\n"
                    + "\n"
                    + "            }\n"
                    + "            .jumbotron {\n"
                    + "\n"
                    + "                background-color: #FFFFFF;\n"
                    + "                height: 50%; background-size:cover; }</style");
            out.println("</head>");
            out.println("<body><br><br><br><br>");
            out.println("<div class=\"jumbotron\" >");
            out.println("<center><h2>Obrigado pelo cadastro: </h2></center>");
            out.println("<center><h3>vamos analisa-lo e logo teremos uma desejo.</h3></center>");
            out.println("<center><a href=\"index.html\"><button  class=\"w3-btn w3-red\">Voltar</button></a></center>");
            out.println("<br><br><br><br><br></div>");
            out.println("</body>");
            out.println("</html>");
        
    } catch (IOException ex) {
        Logger.getLogger(preparaAcessoCliente.class.getName()).log(Level.SEVERE, null, ex);
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
