<%-- 
    Document   : CadastroPrestador
    Created on : 19/10/2017, 01:45:22
    Author     : Lucas
--%>

<%@page import="model.Especialidade"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
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
        <%
            List<Especialidade> espec = new ArrayList<Especialidade>();
            espec = (List) session.getAttribute("comboespecialidade");
            String dStr = (String) session.getAttribute("datahoje");
            String saida = (String) session.getAttribute("saidacadprestador");
            if (saida == null) {
                saida = "";
            }
        %>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
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
                            <li class="active"><a href="main.jsp">Cadastro</a></li>

                        </ul>
                        <ul class="nav navbar-nav navbar-right">
                            <li><a href="main.jsp"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
                        </ul>
                    </div>
                </div>
            </nav>
            <center>
                <br><br><h1>Prestador, seja bem-vindo</h1><br><br>
                <h3>Por favor, preencha o cadastro!</h3><br><br>
                <form action="" name="f" method="POST">
                    <div class="row">
                        <div class="col-md-4 col-sm-12">
                            <label for="nome" >Nome Completo:&nbsp;&emsp;&emsp;</label>
                            <input id="nome" type="text" name="nome"><br><br>
                            <label for="cpf" >CPF:&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;</label>
                            <input id="cpf" type="text" name="cpf"><br><br>
                            <label for="rg" >RG:&emsp;&nbsp;&nbsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;</label>
                            <input id="rg" type="text" name="rg" size="7"><br><br>
                            <label for="uf" >Orgão  Expedição:&emsp;&emsp;</label>
                            <input id="org" type="text" name="uf" size="2"><br><br>
                            <label for="idade" >Data de Nascimento:&nbsp;</label>
                            <input id="data" type="date" max="<%=dStr %>" name="data"><br><br>


                        </div>
                        <div class="col-md-4 col-sm-12">
                            <label for="nome">Email:&nbsp;&nbsp;&emsp;&emsp;&emsp;&nbsp;</label>
                            <input id="email" type="text" name="email"><br><br>
                            <label id="senha" for="sobnome">Senha:&emsp;&emsp;&emsp;&emsp;</label>
                            <input type="password" name="senha"><br><br>
                            <label id="cel" for="nome" >Celular&nbsp;&nbsp;&emsp;&emsp;&emsp;&nbsp;</label>
                            <input type="text" placeholder="DD-999999999" name="celular"><br><br>

                            <label for="sobnome">Sexo</label>
                            <select class="w3-select" name="gender" size="1" style="width: 50%;">
                                <option value="f"> Feminino</option> 
                                <option value="m"> Masculino</option> 
                            </select><br><br>
                            <label for="sobnome">&emsp;Nome do Pai:</label>
                            <input id="pai" type="text" name="nmpai"><br><br>
                            <label for="sobnome">&emsp;Nome da Mãe:</label>
                            <input id="mae" type="text" name="nmmae"><br><br>
                        </div>
                        <div class="col-md-4 col-sm-12">

                            <h4>Selecione suas especialidades:</h4><br>
                            <h6>(segure Ctrl para escolher mais de uma)</h6>
                            <center><select id="espec" class="w3-select" name="especialidade" size="10" MULTIPLE><font color= "#314034">
                                    <%
                                        for (int i = 0; i < espec.size(); i++) {
                                            out.print("<option value=" + espec.get(i) + "> " + espec.get(i) + "</option>");
                                        }//:&nbsp;&emsp;&emsp;<h6><span class="glyphicon glyphicon-info-sign"></span>Quanto melhor a descrição, mais fácil encontrar um prestador.</h6>
                                    %>
                                </select></font></center> 


                        </div>

                    </div>
                    <div><font style="color: coral"> <%=saida%></font></div>
                    <br><br><button onclick="CamposNulos()" class="w3-btn w3-green">Cadastre</button>
                    <button type="reset" class="w3-btn w3-blue">Limpar</button>
                </form><br>
                <button onclick="history.go(-1)" class="w3-btn w3-red">Voltar</button>
            </center>
        </div>
                    
                    <script>
                        function CamposNulos() {
                var de = document.getElementById("cel").value;
                var dt = document.getElementById("espec").value;
                var en1 = document.getElementById("pai").value;
                var en2 = document.getElementById("mae").value;
                var en3 = document.getElementById("email").value;
                var en4 = document.getElementById("rg").value;
                var en5 = document.getElementById("data").value;
                var en6 = document.getElementById("org").value;
                var en7 = document.getElementById("nome").value;
                var en8 = document.getElementById("cpf").value;
                if (de == "" || dt == "" || en1 == ""  || en2 == ""  || en3 == ""  || en4 == ""  || en5 == ""  || en6 == ""  || en7 == ""  || en8 == "" ) {
                    alert("Favor, preencher todos os campos");

                } else {
                    //alert("Busca iniciada com sucesso");

                    document.forms['f'].action = "InserePrestador";
                    document.forms['f'].submit();
                }
            }

                    </script>
    </body>
</html>

