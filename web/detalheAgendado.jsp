<%-- 
    Document   : detalheAgendado
    Created on : 26/10/2017, 03:28:18
    Author     : Lucas
--%>



<%@page import="formatacao.Formatacoes"%>
<%@page import="controle.ControlaQualidade"%>
<%@page import="java.util.List"%>
<%@page import="model.Agendado"%>

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
            .modal {
                display: none; /* Hidden by default */
                position: fixed; /* Stay in place */
                z-index: 1; /* Sit on top */
                padding-top: 100px; /* Location of the box */
                left: 0;
                top: 0;
                width: 100%; /* Full width */
                height: 100%; /* Full height */
                overflow: auto; /* Enable scroll if needed */
                background-color: rgb(0,0,0); /* Fallback color */
                background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
            }

            /* Modal Content */
            .modal-content {
                background-color: #fefefe;
                margin: auto;
                padding: 20px;
                border: 1px solid #888;
                width: 80%;
            }

            /* The Close Button */
            .close {
                color: #aaaaaa;
                float: right;
                font-size: 28px;
                font-weight: bold;
            }

            .close:hover,
            .close:focus {
                color: #000;
                text-decoration: none;
                cursor: pointer;
            }

        </style>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

        <%
            String nome = (String) session.getAttribute("user");
            List<Agendado> agendado = (List) session.getAttribute("atendimento");
            String tipo = "Agendado";
            String status = "";
            if (agendado.get(0).getStatus() == 0) {
                status = "<font class=\"w3-yellow\"> Aguardando escolha do prestador</font>";
            } else if (agendado.get(0).getStatus() == 1) {
                status = "<font class=\"w3-teal\">Aguardando início</font>";
            } else if (agendado.get(0).getStatus() == 2) {
                status = "<font class=\"w3-blue\">Em atendimento</font>";
            } else if (agendado.get(0).getStatus() == 3) {
                status = "<font class=\"w3-orange\">Aguardando qualificação</font>";
            } else if (agendado.get(0).getStatus() == 4) {
                status = "<font class=\"w3-red\">Finalizado</font>";
            }
            ControlaQualidade cq = new ControlaQualidade();
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
                        <a class="navbar-brand" href="#"><font color="#FFFFFF">|SOS|</font></a>
                    </div>
                    <div class="collapse navbar-collapse" id="myNavbar">
                        <ul class="nav navbar-nav">
                            <li ><a href="#">Página Inicial</a></li>
                            <li class="active"><a href="#">Seu perfil </a></li>


                        </ul>
                        <ul class="nav navbar-nav navbar-right">
                            <li><h5><font color="#FFFFFF">Olá <%=nome%> </font></h5></li>
                            <li><a href="LogoutCliente.jsp"><span class="glyphicon glyphicon-log-out"></span> Sair</a></li>
                        </ul>
                    </div>
                </div></nav><br><br><br>
            <h2><center>Segue detalhes do atendimento nº<%=agendado.get(0).getCodigo()%></center></h2>
            <br><br><br><div class="row">
                
                <div class="col-md-12 col-sm-12">
                    <table class="w3-table ">
                        <tr class="w3-teal">
                            <th>Código</th>
                            <th>tipo</th>
                            <th>Especialidade</th>
                            <th>Descrição</th>
                            <th>Data solicitação</th>
                            <th>Situação</th>
                            <th>Data Marcada</th>
                            <th>Horário</th>
                            <th>Repetir</th>
                                <% if (agendado.get(0).getStatus() > 0) {%> 
                            <th>Seu Prestador</th>
                            <th>Valor</th>
                            
                            <%}%>
                                <% if (agendado.get(0).getStatus() == 0) {%> 
                            <th>Deletar</th>

                            <%}%>

                        </tr>
                        <tr>
                            <td><%=agendado.get(0).getCodigo()%></td>
                            <td><%=tipo%></td>
                            <td><%=agendado.get(0).getEspecialidade() %></td>
                            <td><textarea cols=5 rows=5 readonly><%=agendado.get(0).getDescricao()%></textarea></td>
                            <td><%= agendado.get(0).getData() %></td>
                            <td><%=status%></td>
                            <td><%=fmat.FormataData(agendado.get(0).getData_marcada())  %></td>
                            <td><%=agendado.get(0).getHora_marcada() %></td>
                            <td><%=agendado.get(0).getPeriodico() %></td>
                            <% if (agendado.get(0).getStatus() > 0) {%> 
                            <td><%=agendado.get(0).getPrestador().getNome()%>
                                <button id="myBtn" class="w3-btn w3-white w3-border w3-round"><span class="glyphicon glyphicon-info-sign"></span></button>
                            <td><form action="" name="altera"><input type="text" id="alterar" onclick="Alterar()" value="<%=agendado.get(0).getValor() %>" name="senha"><div id="bt"></div></form></td><br><br>

                                <!-- The Modal -->
                                <div id="myModal" class="modal">

                                    <!-- Modal content -->
                                    <div class="modal-content">
                                        <span class="close">&times;</span>
                                        <div class="w3-card-4" >
                                                <header class="w3-container w3-light-grey">
                                                    <h3  ><%= agendado.get(0).getPrestador().getNome()%></h3>
                                                </header>
                                                <div >
                                                    <% if (agendado.get(0).getPrestador().isSexo()) {%>
                                                    <img src="./img/perfilclientefem.jpg" class="w3-circle" style="width:60px">
                                                    <% } else {%>
                                                    <img src="./img/perfilcliente.jpg" class="w3-circle" style="width:60px">
                                                    <%}%>
                                                    <hr>

                                                    <p><%= cq.NivelStr(agendado.get(0).getPrestador())%> </p>
                                                    <h4><%= "Nota:" + cq.NotaStr(agendado.get(0).getPrestador())%></h4>
                                                    <h4><%= "Celular   " + agendado.get(0).getPrestador().getCelular() %></h4>
                                                    <h4><%= "Email:   " + agendado.get(0).getPrestador().getEmail()%></h4>
                                                    
                                                </div>
                                        </div>
                                    </div>

                                </div>
                            </td>
                            <%}%>
                            <% if (agendado.get(0).getStatus() == 0 ) {%> 
                            
                            <td><form action="deletaAgendado"><button class="" value="<%=agendado.get(0).getCodigo()%>" name="botao"><span class="glyphicon glyphicon-trash"></span></button></form></td>

                            <%}%>
                        </tr>
                    </table></div>
                </div><br><br><br>
            <center><div class="row">
                    <div class="col-md-4 col-sm-12">
                        <% if (agendado.get(0).getStatus() == 0) {%>
                        <button class="w3-button  w3-blue-gray w3-medium" onclick="os()" style="width:100%"><h5 style="color:black">GERAR ORDEM DE SERVIÇO</h5></button></a>
                        <%} else if (agendado.get(0).getStatus() >= 1) {%>
                        <a href="ordemdeservicoagendado.jsp"><button class="w3-button  w3-blue-gray w3-medium" type="submit" style="width:100%"><h5 style="color:black">GERAR ORDEM DE SERVIÇO</h5></button></a>
                        <%}%> 
                    </div>
                    <div class="col-md-4 col-sm-12">
                        <% if (agendado.get(0).getStatus() == 0) {%>
                        <form action="StatusAtendimentoAgendado"><button class="w3-button  w3-amber w3-round w3-small" type="submit" name="botao" value="<%=agendado.get(0).getCodigo()%>" style="width:100%"><h5 style="color:black">SELECIONAR PRESTADOR</h5></button></form> 
                        <% } else if (agendado.get(0).getStatus() == 1) {%>
                        <form action="StatusAtendimentoAgendado"><button class="w3-button  w3-teal w3-medium" type="submit" name="botao" value="<%=agendado.get(0).getCodigo()%>" style="width:100%"><h5 style="color:black">INICIAR ATENDIMENTO</h5></button></form> 
                        <%} else if (agendado.get(0).getStatus() == 2) {%>
                        <form action="StatusAtendimentoAgendado"><button class="w3-button  w3-blue w3-medium" type="submit" name="botao" value="<%=agendado.get(0).getCodigo()%>" style="width:100%"><h5 style="color:black">FINALIZAR ATENDIMENTO</h5></button></form>
                        <%} else if (agendado.get(0).getStatus() == 3) {%>
                        <form action="StatusAtendimentoAgendado"><label for="valor">De 0 a 5,qual sua nota pelo atendimento?</label>
                            <input type="hidden" value="<%=agendado.get(0).getPrestador().getId() %>" name="idp">
                            <input type="number" size="5" max="5" min="0" name="nota">                    
                            <button class="w3-button  w3-deep-orange w3-medium" name="botao" value="<%=agendado.get(0).getCodigo()%>"type="submit" style="width:100%"><h5 style="color:black">QUALIFICAR ATENDIMENTO</h5></button></form>
                            <% } else if (agendado.get(0).getStatus() == 4) {%>

                        <button class="w3-button  w3-white w3-border-black w3-medium"   style="width:100%"><h5 style="color:black">ATENDIMENTO FINALIZADO</h5></button></form>
                        <% }%>
                        <br><br>

                    </div>
                    <div class="col-md-4 col-sm-12">
                        <button class="w3-button  w3-red w3-medium" onClick="history.go(-1)" style="width:100%" ><h5 style="color:black">VOLTAR</h5></button>
                    </div></div></center>
        </div>






        <script>
            function os(){
                
                alert("Para gerar ordem de serviço é necessário escolher o prestador");
                
            }
// Get the modal
            var modal = document.getElementById('myModal');

// Get the button that opens the modal
            var btn = document.getElementById("myBtn");

// Get the <span> element that closes the modal
            var span = document.getElementsByClassName("close")[0];

// When the user clicks the button, open the modal 
            btn.onclick = function () {
                modal.style.display = "block";
            }

// When the user clicks on <span> (x), close the modal
            span.onclick = function () {
                modal.style.display = "none";
            }

// When the user clicks anywhere outside of the modal, close it
            window.onclick = function (event) {
                if (event.target == modal) {
                    modal.style.display = "none";
                }
            }
        </script>
         <script>

            function Alterar() {

                var a = document.getElementById("alterar");
                var bt = document.getElementById("bt");
                a.value = "";
                a.type = "text"
                bt.innerHTML = "<br><button onclick=\"Envia()\" class=\"w3-btn w3-amber \" value=\"<%=agendado.get(0).getCodigo()%>\" name=\"botao\">Alterar</button><button onclick=\"Cancela()\" class=\"w3-btn w3-deep-orange \">Cancelar</button>";

            }
            function Envia() {
                var a = document.getElementById("alterar");
                var bt = document.getElementById("bt");
                if (a.value == "" || a.value == null) {

                    alert("Favor informe uma nova senha");

                } else {
                    
                    document.forms['altera'].action = "AlteraValorAgendado";
                    document.forms['altera'].submit();


                }
                function Cancela() {
                    var a = document.getElementById("alterar");
                    var bt = document.getElementById("bt");
                    a.value = <%=agendado.get(0).getValor() %>;
                    bt.innerHTML = "";


                }
                



            }


        </script>
    </body>
</html>
