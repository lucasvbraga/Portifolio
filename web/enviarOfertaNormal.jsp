<%-- 
    Document   : enviarOfertaNormal
    Created on : 26/10/2017, 02:54:43
    Author     : Lucas
--%>

<%@page import="model.Normal"%>
<%@page import="model.Emergencial"%>
<%@page import="java.util.List"%>
<%@page import="model.Prestador"%>
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
            List<Normal> normal = (List) session.getAttribute("atendimento");
            

            String nome = (String) session.getAttribute("user");
            String tipo = "Normal";


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
                            <li ><a href="#">Página Inicial</a></li>



                        </ul>
                        <ul class="nav navbar-nav navbar-right">
                            <li><h5><font color="#FFFFFF">Olá <%=nome%> </font></h5></li>
                            <li><a href="LogoutCliente.jsp"><span class="glyphicon glyphicon-log-out"></span> Sair</a></li>
                        </ul>
                    </div>
                </div></nav>
            <br><br><br><center>


                <h2> <%=nome%>, </h2><br>
                <h4>Segue as informações do atendimento</h4><br>
                <h6>preencha o valor e envie a oferta caso tenha capacidade para soluciona-la</h6><br>
                <div class="row">
                    <div class="col-md-2 col-sm-12"></div>
                    <div class="col-md-8 col-sm-12">
                        <table class="w3-table ">
                            <tr class="w3-teal">
                                <th>Código</th>
                                <th>tipo</th>
                                <th>Descrição</th>
                                <th>Endereço</th>
                                <th>Data solicitação</th>
                            </tr>
                            <tr>
                                <td><%=normal.get(0).getCodigo()%></td>
                                <td><%=tipo%></td>
                                <td><textarea cols=5 rows=5 readonly><%=normal.get(0).getDescricao()%></textarea></td>
                                <td><%=normal.get(0).getEndereco() %></td>
                                <td><%=normal.get(0).getData()%></td>
                            </tr>
                        </table></div>
                            <div class="col-md-2 col-sm-12"></div></div><br><br>
                <div class="row">
                    <form action="" name="f">
                        <div class="col-md-2 col-sm-12"></div>
                        <div class="col-md-2 col-sm-12">
                            <h4>Informe ao lado o valor que cobrará pelo serviço</h4>

                        </div>
                        <div class="col-md-3 col-sm-6">
                            <label for="valor">Valor do serviço</label>
                            <input id="valor" type="text" name="valor"><br><br>
                        </div>
                        <div class="col-md-3 col-sm-6">
                            <button onclick="CamposNulos()" class="w3-button  w3-teal">ENVIAR OFERTA</button>
                        </div>
                        <div class="col-md-2 col-sm-12">

                        </div>



                    </form> </div>
                <br><br><button class="w3-btn w3-red" onClick="history.go(-1)" >Voltar</button></a>
            </center>

        </div>


<script>
            function CamposNulos() {
                var de = document.getElementById("valor").value;
                if (de == "") {
                    alert("Favor, preencher todos os campos");

                } else {
//alert("Busca iniciada com sucesso");

                    document.forms['f'].action = "ofertaEnviadaNormal";
                    document.forms['f'].submit();
                }
            }
        </script>

    </body>
</html>
