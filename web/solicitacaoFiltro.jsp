<%-- 
    Document   : teste
    Created on : 05/10/2017, 22:19:49
    Author     : Lucas
--%>


<%@page import="model.Especialidade"%>
<%@page import="model.Emergencial"%>
<%@page import="model.Agendado"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="model.Normal"%>
<%@page import="controle.ComboEspecialidade"%>
<%@page import="model.Cliente"%>
<%@page import="controle.InsereCliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"></link>

        <style>
            body{
                background-image: url(./img/planodefundo.jpg);

            }
            .jumbotron {

                background-color: #FFFFFF;
                height: 50%; background-size:cover; }
            #fonthp { color: #FFFFFF;}
            input[type=text] {
                width:25%;
                padding: 6px 10px;
                border: 2px solid black;
                border-radius: 4px;
            }
            input[type=password] {
                width:25%;
                padding: 6px 10px;
                border: 2px solid black;
                border-radius: 4px;
            }
            input[type=date] {
                width:25%;
                padding: 6px 10px;
                border: 2px solid black;
                border-radius: 4px;
            }
            input[type=radio] {

                padding: 6px 10px;
                border: 25px solid black;
                border-radius: 4px;
            }
            label {

                text-align: center;

            }


            textarea {
                width: 100%;
                height: 150px;
                padding: 12px 20px;
                box-sizing: border-box;
                border: 2px solid #ccc;
                border-radius: 4px;
                background-color: #f8f8f8;
                resize: none; }

            .button{background-color: #008CBA;}
            div.praias{font: italic bold 10px, serif; }
            img {
                border-radius: 50%;}


        </style>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <%  //HttpSession sessao;
            //sessao = request.getSession();
            //String nomeUsuario = (String) sessao.getAttribute("user");
            String nomeUsuario = (String) session.getAttribute("user");

            //String especialidade = (String) session.getAttribute("Esp_emergencial");
            //ComboEspecialidade ce = new ComboEspecialidade();
            //Combos esp = new Combos();
            //esp.Especialidade();
            
            List<Normal> normal = new ArrayList<Normal>();
            List<Agendado> agendado = new ArrayList<Agendado>();
            List<Emergencial> emergencial = new ArrayList<Emergencial>();

            normal = (List) session.getAttribute("SOLnormal");
            agendado = (List) session.getAttribute("SOLagendado");
            emergencial = (List) session.getAttribute("SOLemergencial");
           
            List<Especialidade> especialidades = new ArrayList<Especialidade>();
            especialidades = (List) session.getAttribute("Pespecialidades");

        %>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script>


        </script>

    </head>
    <body>
        <div class="jumbotron" >
            <nav class="navbar navbar-default navbar-fixed-top" style="background-color:#314034">
                <div class="container-fluid">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span> 
                        </button>
                        <a class="navbar-brand" href="#"><font color="#FFFFFF">|SOS|</font></a>
                    </div>
                    <div class="collapse navbar-collapse" id="myNavbar">
                        <ul class="nav navbar-nav">
                            <li class="active"><a href="#">Página Inicial</a></li>
                            <li ><a href="#">Seu perfil </a></li>


                        </ul>
                        <ul class="nav navbar-nav navbar-right">
                            <li><h5><font color="#FFFFFF">Olá <%=nomeUsuario%> </font></h5></li>
                            <li><a href="LogoutCliente.jsp"><span class="glyphicon glyphicon-log-out"></span> Sair</a></li>
                        </ul>
                    </div>
                </div></nav>
            <br><br><br><div class="row">
                <div class="col-md-4 col-sm-">
                    <p>&emsp;&emsp;Bem vindo <%=nomeUsuario%>!</p>
                </div>
                <div class="col-md-1 col-sm-">

                </div>
                <div class="col-md-5 col-sm-">
                    <h2>Ofertas em aberto:</h2>
                </div>
                <div class="col-md-2 col-sm-">

                </div>
            </div>
            <br>

            <center><div class="row">
                    <div class="col-md-4 col-sm-">
                        <a href="PerfilPrestador.jsp"><button class="w3-button w3-green w3-block">Seu Perfil</button></a>    
                        <a href="ServicosAntigos"><button class="w3-button w3-green w3-block" type="submit">Seus serviços antigos</button></a>  
                        <a href="ServicosARealizar"><button class="w3-button w3-green w3-block" type="submit">Serviços para realizar</button></a>    
                        <a href="LogoutCliente.jsp"><button class="w3-button w3-red w3-block">Sair</button> </a>   
                    </div>

                    <div class="col-md-6 col-sm-12">
                        <form action="solicitacao"><center><select  name="filtroespe" id="f" ><font style="color: #314034;">

                                <%
                                    for (int i = 0; i < especialidades.size(); i++) {
                                        out.print("<option value" + especialidades.get(i).getNome() + "> " + especialidades.get(i).getNome() + "</option>");
                                    }//:&nbsp;&emsp;&emsp;<h6><span class="glyphicon glyphicon-info-sign"></span>Quanto melhor a descrição, mais fácil encontrar um prestador.</h6>
                                %>
                                </font></select>
                                <button class="w3-button w3-blue w3-tiny" type="submit">Filtrar</button></form>
                        </center> 
                        <table class="w3-table-all" id="saida">
                            <thead>
                                <tr class="w3-green">
                                    <th>Código</th>
                                    <th>Tipo</th>
                                    <th>Descrição</th>
                                    <th>Data</th>
                                    <th>Ver mais</th>
                                </tr>
                            </thead>
                            <%
                                for (int k = 0; k < emergencial.size(); k++) {
                                    out.print("<tr class=\"w3-hover-green\"> <form action=\"enviaOferta\" >");
                                    out.print("<td>" + emergencial.get(k).getCodigo() + "</td>");
                                    out.print("<td><font style=\"color: coral\"> Emergencial</font></td>");
                                    out.print("<td><textarea cols=4 class=\"w3-hover-green\" rows=3 readonly>" + emergencial.get(k).getDescricao() + "</textarea></td>");
                                    out.print("<td>" + emergencial.get(k).getData() + "</td>");
                                    out.print("<td><button class=\"w3-button w3-round-xxlarge w3-green\"  name=\"botao\" type=\"submit\" value=\"" + emergencial.get(k).getCodigo() + "\">" + "+" + "</button></td>");
                                    out.print("</form></tr>");
                                }
                                for (int i = 0; i < normal.size(); i++) {
                                    
                                    out.print("<tr class=\"w3-hover-green\"> <form action=\"enviaOferta\" >");
                                    out.print("<td>" + normal.get(i).getCodigo() + "</td>");
                                    out.print("<td> Normal </td>");
                                    out.print("<td><textarea cols=4 class=\"w3-hover-green\" rows=3 readonly>" + normal.get(i).getDescricao() + "</textarea></td>");
                                    out.print("<td>" + normal.get(i).getData() + "</td>");
                                    out.print("<td><button class=\"w3-button w3-round-xxlarge w3-green\"  name=\"botao\" type=\"submit\" value=\"" + normal.get(i).getCodigo() + "\">" + "+" + "</button></td>");
                                    out.print("</form></tr>");
                                }  
                                
                           
                                for (int j = 0; j < agendado.size(); j++) {
                                    out.print("<tr class=\"w3-hover-green\"><form action=\"enviaOferta\" >");
                                    out.print("<td>" + agendado.get(j).getCodigo() + "</td>");
                                    out.print("<td><font style=\"color: #4CAF50\"> Agendado</font> </td>");
                                    out.print("<td><textarea cols=4 class=\"w3-hover-green\" rows=3 readonly>" + agendado.get(j).getDescricao() + "</textarea></td>");
                                    out.print("<td>" + agendado.get(j).getData() + "</td>");
                                    out.print("<td><button class=\"w3-button w3-round-xxlarge w3-green\" name=\"botao\" type=\"submit\" value=\"" + agendado.get(j).getCodigo() + "\">" + "+" + "</button></td>");
                                    out.print("</form></tr>");
                                }
                                
                                  
                                
                                    
                                    

                            %>

                            
                        </table>

                        <div class="col-md-2 col-sm-6">

                        </div>

                    </div>
            </center>
        </div>
    </body>
</html>
