<%-- 
    Document   : detalheSolicitacaoEmergencial
    Created on : 15/11/2017, 00:25:49
    Author     : Lucas
--%>

<%@page import="formatacao.Formatacoes"%>
<%-- 
    Document   : detalheSolicitacaoNormal
    Created on : 15/11/2017, 00:10:36
    Author     : Lucas
--%>

<%-- 
    Document   : detalheAgendado
    Created on : 26/10/2017, 03:28:18
    Author     : Lucas
--%>



<%@page import="controle.ControlaQualidade"%>
<%@page import="model.Normal"%>
<%@page import="model.Emergencial"%>
<%@page import="java.util.List"%>
<%@page import="model.Agendado"%>

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
            #perfil{
                text-align: justify;
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
            .modal {
                display: none; /* Hidden by default */
                position: fixed; /* Stay in place */
                z-index: 1; /* Sit on top */
                padding-top: 100px; /* Location of the box */
                left: 0;
                top: 0;
                width: 100%; /* Full width */
                height: 100%; /* Full height */
                overflow: auto; /* Enable scroll if needed */
                background-color: rgb(0,0,0); /* Fallback color */
                background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
            }

            /* Modal Content */
            .modal-content {
                background-color: #fefefe;
                margin: auto;
                padding: 20px;
                border: 1px solid #888;
                width: 80%;
            }

            /* The Close Button */
            .close {
                color: #aaaaaa;
                float: right;
                font-size: 28px;
                font-weight: bold;
            }

            .close:hover,
            .close:focus {
                color: #000;
                text-decoration: none;
                cursor: pointer;
            }

        </style>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

        <%
            String nome = (String) session.getAttribute("user");
            List<Emergencial> emergencial = (List) session.getAttribute("servico");
            String tipo = "Emergencial";
            String status = "";
            if (emergencial.get(0).getStatus() == 1) {
                status = "<font class=\"w3-teal\">Aguardando início</font>";
            } else if (emergencial.get(0).getStatus() == 2) {
                status = "<font class=\"w3-blue\">Em atendimento</font>";
            } else if (emergencial.get(0).getStatus() == 3) {
                status = "<font class=\"w3-orange\">Aguardando qualificação</font>";
            } else if (emergencial.get(0).getStatus() == 4) {
                status = "<font class=\"w3-red\">Finalizado</font>";
            }
            ControlaQualidade cq = new ControlaQualidade();
            Formatacoes fmat = new Formatacoes();

        %>



        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
                            <li ><a href="#">Página Inicial</a></li>
                            <li class="active"><a href="#">Seu perfil </a></li>


                        </ul>
                        <ul class="nav navbar-nav navbar-right">
                            <li><h5><font color="#FFFFFF">Olá <%=nome%> </font></h5></li>
                            <li><a href="LogoutCliente.jsp"><span class="glyphicon glyphicon-log-out"></span> Sair</a></li>
                        </ul>
                    </div>
                </div></nav><br><br><br>
            <h2><center>Segue detalhes do atendimento nº<%=emergencial.get(0).getCodigo()%></center></h2>
            <br><br><br><div class="row">

                <div class="col-md-12 col-sm-12">
                    <table class="w3-table ">
                        <tr class="w3-green">
                            <th>Código</th>
                            <th>tipo</th>
                            <th>endereço</th>
                            <th>Especialdiade</th>
                            <th>Descrição</th>
                            <th>Data solicitação</th>
                            <th>Situação</th>
                        </tr>
                        <tr>
                            <td><%=emergencial.get(0).getCodigo()%></td>
                            <td><%=tipo%></td>
                            <td><%=emergencial.get(0).getEndereco()%></td>
                            <td><%=emergencial.get(0).getEspecialidade()%></td>
                            <td><textarea cols=5 rows=5 readonly><%=emergencial.get(0).getDescricao()%></textarea></td>
                            <td><%=fmat.FormataData(emergencial.get(0).getData())%></td>
                            <td><%=status%></td>

                        </tr>
                    </table></div>
            </div><br><br><br>
            <center><button class="w3-btn w3-red" onclick="history.go(-1)">VOLTAR</button></center>

        </div>







    </body>
</html>
