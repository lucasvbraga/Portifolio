<%-- 
    Document   : PesquisarPrestador
    Created on : 11/11/2017, 11:25:18
    Author     : ra21601909
--%>

<%@page import="formatacao.Formatacoes"%>
<%@page import="java.util.List"%>
<%-- 
    Document   : MonitorarPrestador
    Created on : 11/11/2017, 11:20:12
    Author     : ra21601909
--%>

<%-- 
    Document   : AnalisarPrestador
    Created on : 11/11/2017, 11:06:23
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
            List<Prestador> prestadores = (List) session.getAttribute("listatodosprestadores");
            String nomeUsuario = (String) session.getAttribute("user");

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
                    <p>&emsp;&emsp;Bem vindo <%=nomeUsuario%>!<a href="LogoutCliente.jsp"><button class="w3-btn w3-white w3-border w3-border-red w3-tiny w3-round">SAIR</button></a><button onclick="history.go(-1)" class="w3-btn w3-white w3-border w3-border-black w3-tiny w3-round">VOLTAR</button></p>

                </div>

                <div class="col-md-5 col-sm-">
                    <h2>Analise de</h2> <h1>Prestadores</h1>
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

                    <div class="col-md-1 col-sm-12">





                    </div>
                    <div class="col-md-10 col-sm-12">
                        <input type="text" id="myInput" onkeyup="myFunction()" placeholder="Search for CPF.." title="Type in a name">
                        <br><br>
                        <table class="w3-table-all" id="myTable">
                            <thead>
                                <tr class="w3-dark-grey">

                                    <th>Nome</th>
                                    <th>CPF</th>                                    
                                    <th>Cadastro</th>                                    
                                    <th>Status</th>                                    
                                    <th>Excluir</th>
                                </tr>
                            </thead>
                            <%for (int i = 0; i < prestadores.size(); i++) {%>

                            <tr class="w3-hover-dark-grey"> <form action="deletaPrestador" >
                                <td> <%=prestadores.get(i).getNome()%> </td>
                                <td> <%=prestadores.get(i).getCpf()%></td>     
                                <td> <%= fmat.FormataAprovacao(prestadores.get(i))%></td>     
                                <td> <%= fmat.FormataBloqueio(prestadores.get(i))%></td>     

                                <td><button class="w3-button w3-round-xxlarge w3-red " name="botao" type="submit" value="<%=prestadores.get(i).getId()%>"><center><span class="glyphicon glyphicon-trash "></span></center></button></td> 
                            </form></tr>
                            <%}%>



                        </table>


                    </div>

                    <div class="col-md-1 col-sm-12">






                    </div>

                </div><br>



            </center>
        </div>

        <script>
            function myFunction() {
                var input, filter, table, tr, td, i;
                input = document.getElementById("myInput");
                filter = input.value.toUpperCase();
                table = document.getElementById("myTable");
                tr = table.getElementsByTagName("tr");
                for (i = 0; i < tr.length; i++) {
                    td = tr[i].getElementsByTagName("td")[1];
                    if (td) {
                        if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
                            tr[i].style.display = "";
                        } else {
                            tr[i].style.display = "none";
                        }
                    }
                }
            }
        </script>

    </body>
</html>


