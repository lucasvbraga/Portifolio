<%-- 
    Document   : teste
    Created on : 05/10/2017, 22:19:49
    Author     : Lucas
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
            }


        </style>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <%  //HttpSession sessao;
            //sessao = request.getSession();
            //String nomeUsuario = (String) sessao.getAttribute("user");
            String nomeUsuario = (String) session.getAttribute("user");
            //ComboEspecialidade ce = new ComboEspecialidade();
            //Combos esp = new Combos();
            //esp.Especialidade();<img src="./img/lupa.png" class="w3-hover-opacity"  style="width:25%">
            Prestador p = (Prestador) session.getAttribute("prestadorobj");
            ControlaQualidade cq = new ControlaQualidade();
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
                    <p>&emsp;&emsp;Bem vindo <%=nomeUsuario%>!<a href="principalCliente.jsp"><button class="w3-btn w3-white w3-border w3-border-red w3-tiny w3-round">SAIR</button></a></p>

                </div>
                
                <div class="col-md-5 col-sm-">
                    <h2>Selecione uma das</h2> <h1>Opções</h1> <h2>que precisa</h2>
                </div>
                <div class="col-md-2 col-sm-">

                    <center>
                        <div class="w3-card-4" ><form action="AtualizaPrestadorEmAgendado">
                                <header class="w3-container w3-light-grey">
                                    <h3>Sua qualificação:</h3>
                                </header>
                                <div >
                                    <% if (p.isSexo()) {%>
                                    <img src="./img/perfilclientefem.jpg" class="w3-circle" style="width:60px">
                                    <% } else {%>
                                    <img src="./img/perfilcliente.jpg" class="w3-circle" style="width:60px">
                                    <%}%>
                                    <hr>

                                    <p><%= cq.NivelStr(p)%> </p>
                                    <h4><%= "Nota:" + cq.NotaStr(p)%></h4>


                                </div>
                                <a href="perfilPrestador.jsp"><button class="w3-button w3-block w3-dark-grey" type="submit" name="btescolha" >Detalhes</button></a>
                        </div>
                    </center>

                </div>
                <div class="col-md-1 col-sm-">

                </div>
            </div>
            <br><br><br>

            <center>
                <div class="row">
                    <div class="col-md-12 col-sm-12">

                        
                        <a href="solicitacao.jsp" ><button class="w3-button  w3-teal " style="width:100%"><h3 style="color:black">BUSCAR SERVIÇO</h3></button></a>   
                    </div>
                </div>
                <div class="row">

                    <div class="col-md-6 col-sm-12">


                        <form action="perfil"><a href="PerfilPrestador.jsp"><button class="w3-button  w3-green w3-xxlarge" type="submit" style="width:100%"><h3 style="color:black">SEU PERFIL</h3></button></a></form>   


                    </div>

                    <div class="col-md-6 col-sm-12">


                        <a href="ServicosFiltro.jsp"><button class="w3-button  w3-green w3-xxlarge" type="submit" style="width:100%"><h3 style="color:black">SEUS SERVIÇOS ANTIGOS</h3></button></a>


                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6 col-sm-12">

                        <a href="solicitacao.jsp"> <button class="w3-button  w3-light-green w3-xxlarge" type="submit" style="width:100%"><h3 style="color:black">PAGAMENTOS</h3></button></form>  </a> 

                    </div>
                    <div class="col-md-6 col-sm-12">
                        <form action="servicosAbertos"><button class="w3-button  w3-light-green w3-xxlarge" type="submit" style="width:100%"><h3 style="color:black">SERVIÇOS PARA REALIZAR</h3></button></form>   
                    </div>
                </div>

            </center>
        </div>
    </body>
</html>
