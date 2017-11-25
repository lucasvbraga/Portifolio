<%-- 
    Document   : RelatorioGerente
    Created on : 16/11/2017, 16:16:07
    Author     : Lucas
--%>

<%-- 
    Document   : GerarRelatorio
    Created on : 11/11/2017, 12:19:25
    Author     : ra21601909
--%>


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
            String nomeUsuario = "Gerente"; //(String) session.getAttribute("user");
            String dStr = (String) session.getAttribute("datahoje");
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
                </div></nav>
            <br><div class="row">
                <div class="col-md-4 col-sm-">
                    <p>&emsp;&emsp;Bem vindo <%=nomeUsuario%>!<a href="LogoutCliente.jsp"><button class="w3-btn w3-white w3-border w3-border-red w3-tiny w3-round">SAIR</button></a><a href="principalGerente.jsp"><button class="w3-btn w3-white w3-border w3-border-black w3-tiny w3-round">VOLTAR</button></a></p>

                </div>

                <div class="col-md-5 col-sm-">
                    <center><h2>Selecione o Tipo de</h2> <h1>Relatório</h1><h2>que deseja gerar</h2> <br><br>
                        <h3>Preencha a data e depois selecione o tipo de relatório nos botões abaixo</h3>
                        <form action="" name="gerar">
                            <input id="data" type="date" max="<%=dStr%>" name="data"  style=" width: 38%">

                        </form></center>
                </div>
                <div class="col-md-2 col-sm-">



                </div>
                <div class="col-md-1 col-sm-">

                </div>
            </div>
            <br><br><br>

            <center>
                <br><br>
                <div class="row">

                    <div class="col-md-6 col-sm-12">

                        <button class="w3-button  w3-blue-gray w3-xxlarge" onclick="Prestador()" style="width:100%"><h3 style="color:silver">PRESTADOR</h3></button>
                    </div>
                    <div class="col-md-6 col-sm-12">
                        <button class="w3-button  w3-blue-gray w3-xxlarge" onclick="Cliente()" style="width:100%"><h3 style="color:silver">CLIENTE</h3></button>


                    </div>


                </div>
                <div class="row">

                    <div class="col-md-4 col-sm-12">
                        <button class="w3-button  w3-dark-grey w3-xxlarge" onclick="Normal()" style="width:100%"><h3 style="color:silver"> NORMAL </h3></button>

                    </div>

                    <div class="col-md-4 col-sm-12">


                        <button class="w3-button  w3-dark-grey w3-xxlarge" onclick="Emergencial()" style="width:100%"><h3 style="color:silver"> EMERGENCIAL </h3></button>


                    </div>

                    <div class="col-md-4 col-sm-12">


                        <button class="w3-button  w3-dark-grey w3-xxlarge"  onclick="Agendado()" style="width:100%"><h3 style="color:silver"> AGENDADO </h3></button>



                    </div>

                </div><br>



            </center>
        </div>

        <script>

            function Prestador() {

                var de = document.getElementById("data").value;
                if (de == "") {

                    alert("Favor, preencher a Data");
                } else {
                    document.forms['gerar'].action = "GerarCadPrestador";
                    document.forms['gerar'].submit();
                }



            }

            function Cliente() {

                var de = document.getElementById("data").value;
                if (de == "") {

                    alert("Favor, preencher a Data");
                } else {
                    document.forms['gerar'].action = "GerarCadCliente";
                    document.forms['gerar'].submit();

                }

            }

            function Agendado() {

                var de = document.getElementById("data").value;
                if (de == "") {

                    alert("Favor, preencher a Data");
                } else {
                    document.forms['gerar'].action = "GerarAgendado";
                    document.forms['gerar'].submit();

                }

            }

            function Normal() {
                var de = document.getElementById("data").value;
                if (de == "") {

                    alert("Favor, preencher a Data");
                } else {

                    document.forms['gerar'].action = "GerarNormal";
                    document.forms['gerar'].submit();
                }


            }

            function Emergencial() {

                var de = document.getElementById("data").value;
                if (de == "") {

                    alert("Favor, preencher a Data");
                } else {
                    document.forms['gerar'].action = "GerarEmergencial";
                    document.forms['gerar'].submit();

                }

            }


        </script>


    </body>
</html>
