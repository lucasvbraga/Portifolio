<%-- 
    Document   : AtendimentoFiltro
    Created on : 26/10/2017, 04:23:17
    Author     : Lucas
--%>

<%-- 
    Document   : teste
    Created on : 05/10/2017, 22:19:49
    Author     : Lucas
--%>


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
                background-image: url(./img/pfundo.jpg);

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

            normal = (List) session.getAttribute("normal");
            agendado = (List) session.getAttribute("agendado");
            emergencial = (List) session.getAttribute("emergencial");

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
                        <a class="navbar-brand" href="principalCliente.jsp"><font color="#FFFFFF">|SOS|</font></a>
                    </div>
                    <div class="collapse navbar-collapse" id="myNavbar">
                        <ul class="nav navbar-nav">
                            <li class="active"><a href="principalCliente.jsp">Página Inicial</a></li>
                            <li ><a href="PerfilCliente.jsp">Seu perfil </a></li>


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
                    <h2>Meus atendimentos:</h2>
                </div>
                <div class="col-md-2 col-sm-">

                </div>
            </div>
            <br>

            <center><div class="row">
                    <div class="col-md-4 col-sm-">
                        <a href="PerfilCliente.jsp"><button class="w3-button w3-teal w3-block">Meu Perfil</button></a>    
                        <button class="w3-button w3-gray w3-block">Meus atendimentos</button>    
                        <a href="LogoutCliente.jsp"><button class="w3-button w3-red w3-block">Sair</button> </a>   
                    </div>

                    <div class="col-md-6 col-sm-12">
                        <center> <h4>Escolha o tipo de Atendimento!</h4>
                            <form action="MeusAtendimentos"><select  name="filtro" id="f" ><font style="color: #314034;">

                                <option value="normal" >Normal</option>
                                <option value="agendado" >Agendado</option>
                                <option value="emergencial" >Emergência</option>
                                </font></select>
                                <button class="w3-button w3-xlarge w3-circle w3-sand" type="submit"><span class="glyphicon glyphicon-search"></span></button></button></form>
                        </center> 
                        <table class="w3-table-all" id="saida">
                            <thead>
                                <tr class="w3-teal">
                                    <th>Código</th>
                                    <th>Tipo</th>
                                    <th>Descrição</th>
                                    <th>Status</th>
                                    <th>Ver mais</th>
                                </tr>
                            </thead>

                        </table>

                        <div class="col-md-2 col-sm-6">

                        </div>

                    </div>
            </center>
        </div>
    </body>
</html>

