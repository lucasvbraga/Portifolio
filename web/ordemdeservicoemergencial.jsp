<%-- 
    Document   : ordemdeservicoemergencial
    Created on : 17/11/2017, 12:18:24
    Author     : Lucas
--%>
<%-- 
    Document   : ordemdeserviconormal
    Created on : 17/11/2017, 12:16:45
    Author     : Lucas
--%>

<%-- 
    Document   : ordemdeserviço
    Created on : 17/11/2017, 11:54:33
    Author     : Lucas
--%>

<%@page import="model.Normal"%>
<%@page import="model.Emergencial"%>
<%@page import="model.Agendado"%>
<%@page import="java.util.List"%>

<%@page import="controle.ControlaQualidade"%>
<%@page import="model.Prestador"%>
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
            * {
                box-sizing: border-box;
            }

            .columns {
                float: left;
                width: 33.3%;
                padding: 8px;
            }

            .price {
                list-style-type: none;
                border: 1px solid #eee;
                margin: 0;
                padding: 0;
                -webkit-transition: 0.3s;
                transition: 0.3s;
            }

            .price:hover {
                box-shadow: 0 8px 12px 0 rgba(0,0,0,0.2)
            }

            .price .header {
                background-color: #111;
                color: white;
                font-size: 25px;
            }

            .price li {
                border-bottom: 1px solid #eee;
                padding: 20px;
                text-align: center;
            }

            .price .grey {
                background-color: #eee;
                font-size: 20px;
            }

            .button {
                background-color: #4CAF50;
                border: none;
                color: white;
                padding: 10px 25px;
                text-align: center;
                text-decoration: none;
                font-size: 18px;
            }

            @media only screen and (max-width: 600px) {
                .columns {
                    width: 100%;
                }
            }

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
            }


        </style>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <%  //HttpSession sessao;
            //sessao = request.getSession();
            //String nomeUsuario = (String) sessao.getAttribute("user");
            String nomeUsuario = (String) session.getAttribute("user");
            List<Emergencial> emergencial = (List) session.getAttribute("atendimento");
            //ComboEspecialidade ce = new ComboEspecialidade();
            //Combos esp = new Combos();
            //esp.Especialidade();<img src="./img/lupa.png" class="w3-hover-opacity"  style="width:25%">
            //Prestador p = (Prestador) session.getAttribute("prestadorobj");
            //ControlaQualidade cq = new ControlaQualidade();
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
                            <li class="active"><a href="#">Página Inicial</a></li>
                            <li ><a href="#">Seu perfil </a></li>


                        </ul>
                        <ul class="nav navbar-nav navbar-right">
                            <li><h5><font color="#FFFFFF">Olá <%=nomeUsuario%> </font></h5></li>
                            <li><a href="LogoutCliente.jsp"><span class="glyphicon glyphicon-log-out"></span> Sair</a></li>
                        </ul>
                    </div>
                </div></nav><br>
            <div class="row">
                <div class="col-md-1 col-sm-"></div>
                <div class="col-md-10 col-sm-">
                    <center><div class="columns" style="width: 100%;color: #4CAF50">
                            <ul class="price">
                                <li class="header">Ordem de Serviço</li>

                                <li class="grey"><%=emergencial.get(0).getValor()%></li>
                                <li>Prestador: <%=emergencial.get(0).getPrestador().getNome()%></li>
                                <li>Especialidade: <%= emergencial.get(0).getEspecialidade()%></li>
                                <li>Descrição: <%=emergencial.get(0).getDescricao()%></li>

                            </ul>
                        </div>
                </div>
            </div>
            <div class="col-md-1 col-sm-"></div>

            <div class="row">
                <div class="col-md-1 col-sm-"></div>
                <div class="col-md-10 col-sm-">
                    <% if (emergencial.get(0).getStatus() >= 4) {%>

                    <div class="columns" style="width: 100%;color: #4CAF50">
                        <ul class="price">
                            <li class="header w3-blue-gray">Ordem de Pagamento</li>

                            <li class="grey">Pagar: R$<%=emergencial.get(0).getValor()%></li>
                            <li>ao Prestador: <%=emergencial.get(0).getPrestador().getNome()%></li>

                        </ul>
                    </div>
                    <%}%>
                </div>
                <div class="col-md-1 col-sm-"></div>
            </div>


        </center>

    </div>
</body>
</html>
