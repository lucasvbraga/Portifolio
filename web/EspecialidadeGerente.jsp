<%-- 
    Document   : EspecialidadeGerente
    Created on : 11/11/2017, 12:12:16
    Author     : ra21601909
--%>

<%@page import="model.Especialidade"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%-- 
    Document   : GerenteGerente
    Created on : 11/11/2017, 12:08:10
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
            //String nomeUsuario = (String) sessao.getAttribute("user");
            String nomeUsuario = (String) session.getAttribute("user");
            List<Especialidade> espec;
            espec = (List) session.getAttribute("especialidades");
            //ComboEspecialidade ce = new ComboEspecialidade();
            //Combos esp = new Combos();saidacadespec
            String palavra;
            List<Prestador> prestadores ;
            String saida = (String) session.getAttribute("saidacadespec");
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
                        <a class="navbar-brand" href="#"><font color="#FFFFFF">|SOS|</font></a>
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
                    <h2>Todos os</h2> <h1>Gerentes</h1>
                    <form name="inserir" action="">

                        <input type="text" name="nome" id="especialidade" placeholder="Nova especialidade...">
                        <button  type="submit" onclick="insere()"  class="w3-btn w3-xxxsmall w3-blue-gray">Cadastre uma nova especialidade</button></form>
                        <br><div><%=saida%></div>
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
                        <input type="text" id="myInput" onkeyup="myFunction()" placeholder="Search for NAME.." title="Type in a name">
                        <br><br>
                        <table class="w3-table-all" id="myTable">
                            <thead>
                                <tr class="w3-dark-grey">

                                    <th>Nome</th>
                                    <th>Quantidade de prestadores</th>
                                    <th>Excluir</th>
                                </tr>
                            </thead>
                            <%for ( Especialidade e : espec) {
                                prestadores = e.getPrest() ;

                            %>

                            <tr class="w3-hover-dark-grey"> <form action="deletaEspecialidade" >
                                <td> <%=e.getNome()%> </td>
                                                                     
                                <center><td> <%=prestadores.size()%> </td></center>
                                

                                <td><button class="w3-button w3-round-xxlarge w3-red " name="botao" type="submit" value="<%=e.getId()%>"><center><span class="glyphicon glyphicon-trash "></span></center></button></td> 
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

            function insere() {
                var e = document.getElementById("especialidade").value;
                    if ( e == ""){
                        
                        alert("Favor, nao deixe o campo em branco");
                        
                    }else{
                var c = confirm("Deseja cadastrar: " + document.getElementById("especialidade").value);
                    if (c  == true) {
                    document.forms['inserir'].action = "InsereEspecialidade";
                    document.forms['Inserir'].submit();

                }
            }

            }
            function myFunction() {
                var input, filter, table, tr, td, i;
                input = document.getElementById("myInput");
                filter = input.value.toUpperCase();
                table = document.getElementById("myTable");
                tr = table.getElementsByTagName("tr");
                for (i = 0; i < tr.length; i++) {
                    td = tr[i].getElementsByTagName("td")[0];
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



