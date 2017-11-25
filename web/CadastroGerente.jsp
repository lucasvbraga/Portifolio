<%-- 
    Document   : CadastroGerente
    Created on : 11/11/2017, 11:53:34
    Author     : ra21601909
--%>


<%-- 
    Document   : ClienteGerente
    Created on : 11/11/2017, 10:57:34
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
        <%
            String nomeUsuario = "Gerente"; //(String) session.getAttribute("user");
            String dStr = "2"; //(String) session.getAttribute("datahoje");
            String saida = "" ; //(String) session.getAttribute("saidacadgerente");
            if (saida == null) {
                saida = "";
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
                        <a class="navbar-brand" href="principalGerente.jsp"><font color="#FFFFFF">|SOS|</font></a>
                    </div>
                    <div class="collapse navbar-collapse" id="myNavbar">
                        <ul class="nav navbar-nav">
                            <li class="active"><a href="principalGerente.jsp">Página Inicial</a></li>
                            <li ><a href="perfilGerente.jsp">Seu perfil </a></li>


                        </ul>
                        <ul class="nav navbar-nav navbar-right">
                            <li><h5><font color="#FFFFFF">Olá <%=nomeUsuario%> </font></h5></li>
                            <li><a href="LogoutCliente.jsp"><span class="glyphicon glyphicon-log-out"></span> Sair</a></li>
                        </ul>
                    </div>
                </div></nav>
            <br><div class="row">
                <div class="col-md-4 col-sm-">
                    <p>&emsp;&emsp;Bem vindo <%=nomeUsuario%>!<a href="principalCliente.jsp"><button class="w3-btn w3-white w3-border w3-border-red w3-tiny w3-round">SAIR</button></a><a href="principalCliente.jsp"><button class="w3-btn w3-white w3-border w3-border-black w3-tiny w3-round">VOLTAR</button></a></p>

                </div>

                <div class="col-md-5 col-sm-">
                    <h2>Cadastre outro</h2> <h1>Gerente</h1>
                </div>
                <div class="col-md-2 col-sm-">



                </div>
                <div class="col-md-1 col-sm-">

                </div>
            </div>
            <br><br><br>

            <center>
                <br><br>
                <form action="" name="f">
                    <div class="row">


                        <div class="col-md-6 col-sm-12">

                            <label for="nome" >Nome Completo:&nbsp;&emsp;&emsp;</label>
                            <input id="nome" type="text" name="nome"><br><br>
                            <label for="cpf" >CPF:&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;</label>
                            <input id="cpf" type="text" name="cpf"><br><br>


                            <label for="idade" >Data de Nascimento:</label>
                            <input id="data" type="date" max="<%=dStr%>" name="data">



                        </div>

                        <div class="col-md-6 col-sm-12">
                            <label for="nome">Email:&nbsp;&nbsp;</label>
                            <input id="email" type="text" name="email"><br><br>
                            <label for="sobnome">Senha:</label>
                            <input id="senha" type="password" name="senha"><br><br>
                            <label for="sobnome">Sexo</label>
                            <select class="w3-select" name="gender" size="1" style="width: 20%;">
                                <option value="f"> Feminino</option> 
                                <option value="m"> Masculino</option> 
                            </select><br><br>


                        </div>


                    </div>
                    <div><font style="color: coral"> <%=saida%></font></div>
                    <br><br><button onclick="CamposNulos()" class="w3-btn w3-blue-gray">Cadastre</button>
                    <button type="reset" class="w3-btn w3-gray ">Limpar</button>
                </form><br>



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

                    document.forms['f'].action = "InsereGerente";
                    document.forms['f'].submit();
                }
            }

        </script>

    </body>
</html>
