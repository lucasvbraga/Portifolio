<%-- 
    Document   : index
    Created on : 07/10/2017, 13:38:19
    Author     : Lucas
--%>




<%@page import="controle.preparaAcessoCliente"%>
<%@page import="ValidaLogin.validaLogin"%>

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
        <title>SOS|Search Of Service</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> </link>

        <style> .jumbotron {
                background-image: url(./img/planodefundo.jpg);
                height: 625px; background-size:cover; }
            #fonthp { color: #FFFFFF;}
            input[type=text] {
                border: 2px ;	
                border-radius: 4px;
                width:25%;
                padding: 6px 10px;
            }
            input[type=password] {
                border: 2px ;	
                border-radius: 4px;
                width:25%;
                padding: 6px 10px;
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

            String erro = (String) session.getAttribute("erroacesso");
            if (erro == null) {
                erro = "";
            }

        %>
    </head>

    <body style="background-color:#FFFFFF">



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
                            <li class="active"><a href="#">Início</a></li>
                            <li><a href="#">O que é?</a></li>
                            <li><a href="#">Sou prestador</a></li> 
                            <li><a href="#">Fale conosco</a></li> 
                        </ul>
                        <ul class="nav navbar-nav navbar-right">
                            <li><a href="#"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
                        </ul>
                    </div>
                </div>
            </nav>
            <center><div class="row">
                    <div class="col-md-6 col-sm-12"><h3 id="fonthp"><br><br><br><br>Cadastre-se<br><br>
                            <a href="carregaCombo.jsp"><button class="w3-button w3-teal">Sou prestador!</button><br><br></a>
                            <a href="CadastroCliente.jsp"><button class="w3-button w3-teal"  >Quero um serviço!</button></a>
                        </h3></div>
                    <div class="col-md-6 col-sm-12"><h3 id="fonthp"><br><br><br>Entre:</h3><br>
                        <form action="testee" method="post"><h6 id="fonthp"><span class="glyphicon glyphicon-user"></span>  E-mail:</h6>
                            <input type="text" name="email" >

                            <h6 id="fonthp"><span class="glyphicon glyphicon-eye-open"></span>  Senha:</h6>
                            <input  type="password" name="senha"><br>

                            <h6><font style="color: tomato"><%=erro%>  </font></h6><br>
                            <button type="submit" class="w3-btn w3-green">Entrar</button>&ensp;

                    </div>      
                </div></center>

        </div>
    </center>

























</div>














<script language="javascript" src="./js/script.js"></script>

</body>

</html>

