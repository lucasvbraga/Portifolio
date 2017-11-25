<%-- 
    Document   : teste
    Created on : 05/10/2017, 22:19:49
    Author     : Lucas
--%>


<%@page import="java.util.HashMap"%>
<%@page import="model.SolicitacaoAgendado"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Agendado"%>
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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

        <style>
            body{
                ;             background-image: url(./img/pfundo.jpg);

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
            .card {
                box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
                max-width: 300px;
                margin: auto;
                text-align: center;
            }

            .title {
                color: grey;
                font-size: 18px;
            }

            button {
                border: none;
                outline: 0;
                display: inline-block;
                padding: 8px;
                color: white;
                background-color: #000;
                text-align: center;
                cursor: pointer;
                width: 100%;
                font-size: 18px;
            }

            a {
                text-decoration: none;
                font-size: 22px;
                color: black;
            }

            button:hover, a:hover {
                opacity: 0.7;
            }


        </style>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <%
            List<Agendado> agendado = (List) session.getAttribute("SelecionaPrestadorAgendado");
            List<SolicitacaoAgendado> solag = (List) session.getAttribute("solicitacoes");
            HashMap<Integer, Prestador> prestadores = (HashMap) session.getAttribute("todosprestadores");
            //int codigo = agendado.get(0).getCodigo();
            ControlaQualidade cq = new ControlaQualidade();

            String nomeUsuario = (String) session.getAttribute("user");
            Prestador p;
            String saida = "";
            if (solag.isEmpty()){
            saida = "Por enquanto nenhum prestador enviou uma oferta, volte mais tarde!";
            
            }

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
                            <li><h5><font color="#FFFFFF">Olá  <%=nomeUsuario%></font></h5></li>
                            <li><a href="LogoutCliente.jsp"><span class="glyphicon glyphicon-log-out"></span> Sair</a></li>
                        </ul>
                    </div>
                </div></nav>
            <br><br>
            <br>
            <center><h3> Por favor <%=nomeUsuario%> escolha seu prestador </h3>
                <button class="w3-small  w3-red" style="width: 55px" onClick="history.go(-1)" >Voltar</button>
                <br>
                <div class="row">
                    <% for (int i = 0; i < solag.size(); i++) {
                            p = prestadores.get(solag.get(i).getId_prestador());
                    %>
                    <div class="col-md-3 col-sm-">


                        <div class="w3-card-4" ><form action="AtualizaPrestadorEmAgendado">
                                <header class="w3-container w3-light-grey">
                                    <h3  ><%= solag.get(i).getNome_prestador()%></h3>
                                </header>
                                    <div >
                                    <% if (p.isSexo()) {%>
                                    <img src="./img/perfilclientefem.jpg" class="w3-circle" style="width:60px">
                                    <% } else {%>
                                    <img src="./img/perfilcliente.jpg" class="w3-circle" style="width:60px">
                                    <%}%>
                                    <hr>
                                    <h4>Valor do serviço = <%= solag.get(i).getValor()%></h4><br>
                                    <p><%= cq.NivelStr(p)%> </p>
                                    <h4><%= "Nota:" + cq.NotaStr(p)%></h4>
                                </div>
                                    <button class="w3-button w3-block w3-dark-grey" type="submit" name="btescolha" value="<%= i %>">Escolher</button></form>
                        </div>
                    </div>
                    <%}%>
                </div>
                    <div><font style="color: tomato"> <%=saida%></font></div>
            </center>   



        </div>
                
                
               
    </body>
    
    
</html>
