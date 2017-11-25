<%-- 
    Document   : teste
    Created on : 05/10/2017, 22:19:49
    Author     : Lucas
--%>


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
           String nomeUsuario = (String)session.getAttribute("user");
           //ComboEspecialidade ce = new ComboEspecialidade();
           //Combos esp = new Combos();
           //esp.Especialidade();

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
                </div></nav>
            <br><br><br><div class="row">
                <div class="col-md-4 col-sm-">
                    <p>&emsp;&emsp;Bem vindo <%=nomeUsuario%>!</p>
                </div>
                <div class="col-md-1 col-sm-">

                </div>
                <div class="col-md-5 col-sm-">
                    <h2>Selecione o tipo de</h2> <h1>Atendimento</h1> <h2>que precisa</h2>
                </div>
                <div class="col-md-2 col-sm-">

                </div>
            </div>
            <br><br><br>

            <center><div class="row">
                    <div class="col-md-4 col-sm-">
                        <a href="PerfilCliente.jsp"><button class="w3-button w3-teal w3-block">Meu Perfil</button></a>    
                        <a href="AtendimentoFiltro.jsp"><button class="w3-button w3-teal w3-block" type="submit">Meus atendimentos</button></a>   
                        <a href="LogoutCliente.jsp"><button class="w3-button w3-red w3-block">Sair</button> </a>   
                    </div>

                    <div class="col-md-2 col-sm-6">
                        <a href="AtendimentoAgendado.jsp" ><img src="./img/agendado.png" class="w3-hover-opacity" alt="Norway" style="width:50%">
                            <h3>Agendar um atendimento</h3></a>
                    </div>
                    <div class="col-md-2 col-sm-6">
                        <a href="AtendimentoNormal.jsp"><img src="./img/normal.png" class="w3-hover-opacity" alt="Norway" style="width:50%">
                            <h3>Um atendimento normal</h3></a>
                    </div>
                    <div class="col-md-2 col-sm-6">
                        <a href="AtendimentoEmergencial.jsp" ><img src="./img/emergencial.jpg" class="w3-hover-opacity" alt="Norway" style="width:50%">
                            <h3>Preciso de uma emergencia</h3></a>
                    </div>
                    <div class="col-md-2 col-sm-6">

                    </div>

                </div>
            </center>
        </div>
    </body>
</html>
