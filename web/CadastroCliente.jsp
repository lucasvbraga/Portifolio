<%-- 
    Document   : CadastroCliente
    Created on : 21/11/2017, 16:08:03
    Author     : Lucas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>Cadastre-se</title>
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
        <%
            String dStr = (String) session.getAttribute("datahoje");
            String saida = (String) session.getAttribute("saidacadcliente");
            if (saida == null) {
                saida = "";
            }
        %>
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
                        <a class="navbar-brand" href="main.jsp"><font color="#FFFFFF">|SOS|</font></a>
                    </div>
                    <div class="collapse navbar-collapse" id="myNavbar">
                        <ul class="nav navbar-nav">
                            <li class="active"><a href="CadastroCliente.jsp">Cadastro</a></li>

                        </ul>
                        <ul class="nav navbar-nav navbar-right">
                            <li><a href="main.jsp"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
                        </ul>
                    </div>
                </div>
            </nav>
            <center>
                <br><br><h1>Cliente, seja bem-vindo</h1><br><br>
                <h3>Por favor, preencha o cadastro!</h3><br><br>
                <form action="" name="cliente">
                    <div class="row">
                        <div class="col-md-6 col-sm-12">
                            <label for="nome" >Nome Completo:&nbsp;&emsp;&emsp;</label>
                            <input id="nome" type="text" name="nome"><br><br>
                            <label  for="cpf" >CPF:&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;</label>
                            <input id="cpf" type="text"  name="cpf"><br><br>
                            <label for="idade" >Data de Nascimento:</label>
                            <input id="data" type="date" name="data" max="<%=dStr%>">

                        </div>
                        <div class="col-md-6 col-sm-12">
                            <label for="nome">Email:&nbsp;&nbsp;</label>
                            <input id="email" type="text" name="email"><br><br>
                            <label for="sobnome">&emsp;Senha:</label>
                            <input id="senha" type="password" name="senha"><br><br>
                            <label for="sobnome">Sexo</label>
                            <select class="w3-select" name="gender" size="1" style="width: 20%;">
                                <option value="f"> Feminino</option> 
                                <option value="m"> Masculino</option> 
                            </select><br><br>


                        </div>

                    </div>
                            <div><font style="color: coral"> <%=saida%></font></div>
                            <br><br><button onclick="CamposNulos()" class="w3-btn w3-green">Cadastre</button>
                    <button type="reset" class="w3-btn w3-blue">Limpar</button>
                </form><br>
                <button onclick="history.go(-1)"  class="w3-btn w3-red">Voltar</button>
            </center>
        </div>
                    <script>
                        function CamposNulos() {
                var de = document.getElementById("nome").value;
                var dt = document.getElementById("data").value;
                var en = document.getElementById("senha").value;
                var em = document.getElementById("email").value;
                var cp = document.getElementById("cpf").value;
                if (de == "" || dt == "" || en == "" || em == "" || cp == "") {
                    alert("Favor, preencher todos os campos");

                } else {
                    //alert("Busca iniciada com sucesso");

                    document.forms['cliente'].action = "InsereCliente";
                    document.forms['cliente'].submit();
                }
            }
                        
                    </script>
    </body>
</html>

