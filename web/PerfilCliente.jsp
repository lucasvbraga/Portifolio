<%-- 
    Document   : PerfilCliente
    Created on : 06/10/2017, 03:44:48
    Author     : Lucas
--%>

<%@page import="model.Cliente"%>
<%@page import="formatacao.Formatacoes"%>
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


        </style>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

        <%
            String nome = (String) session.getAttribute("user");
            String cpf = (String) session.getAttribute("cpf");
            //boolean sexo = (boolean) sessao.getAttribute("sexo");
            String dt = (String) session.getAttribute("data");
            String email = (String) session.getAttribute("email");
            Cliente c = (Cliente) session.getAttribute("clienteobj");

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
                        <a class="navbar-brand" href="principalCliente.jsp"><font color="#FFFFFF">|SOS|</font></a>
                    </div>
                    <div class="collapse navbar-collapse" id="myNavbar">
                        <ul class="nav navbar-nav">
                            <li ><a href="principalCliente.jsp">Página Inicial</a></li>
                            <li class="active"><a href="PerfilCliente.jsp">Seu perfil </a></li>


                        </ul>
                        <ul class="nav navbar-nav navbar-right">
                            <li><h5><font color="#FFFFFF">Olá <%=nome%> </font></h5></li>
                            <li><a href="LogoutCliente.jsp"><span class="glyphicon glyphicon-log-out"></span> Sair</a></li>
                        </ul>
                    </div>
                </div></nav>
            <br><br><br><div class="row">
                <div class="col-md-1 col-sm-1">

                </div>
                <center><div class="col-md-4 col-sm-11">
                        <img src="./img/perfilcliente.jpg" class="w3-circle" style="width:92%">
                    </div>
                </center><div class="col-md-4 col-sm-12"><br><br>
                    <h2 id="perfil"><%=nome%></h2>
                    <h3 id="perfil">CPF:   <%=cpf%></h3>
                    <h3 id="perfil">Email:  <%=email%></h3>
                    <h3 id="perfil">Data de Nascimento:<%=fmat.FormataData(dt)%></h3><br><br>
                    <form action="" name="altera">Senha:<input type="password" id="alterar" onclick="Alterar()" value="<%=c.getSenha()%>" name="senha"><div id="bt"></div></form><br><br>
                    <button  class="w3-btn w3-green" onclick="history.go(-1)" >Voltar</button>
                    <a href="Atendimento.jsp"><button class="w3-button w3-teal ">Meus atendimentos</button></a> 
                </div>
                <div class="col-md-3 col-sm-12">

                </div>

            </div>

        </div>


        <script>

            function Alterar() {

                var a = document.getElementById("alterar");
                var bt = document.getElementById("bt");
                a.value = "";
                a.type = "text"
                bt.innerHTML = "<br><button onclick=\"Envia()\" class=\"w3-btn w3-amber \" value=\"<%=c.getId()%>\" name=\"botao\">Alterar</button><button onclick=\"Cancela()\" class=\"w3-btn w3-deep-orange \">Cancelar</button>";

            }
            function Envia() {
                var a = document.getElementById("alterar");
                var bt = document.getElementById("bt");
                if (a.value == "" || a.value == null) {

                    alert("Favor informe uma nova senha");

                } else {
                    
                    document.forms['altera'].action = "AlteraCliente";
                    document.forms['altera'].submit();


                }
                function Cancela() {
                    var a = document.getElementById("alterar");
                    var bt = document.getElementById("bt");
                    a.value = <%= c.getSenha()%>;
                    bt.innerHTML = "";


                }
                



            }


        </script>

    </body>
</html>
