<%-- 
    Document   : MonitorarPrestador
    Created on : 11/11/2017, 11:20:12
    Author     : ra21601909
--%>

<%@page import="java.util.List"%>
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
            List<Prestador> prestadores = (List) session.getAttribute("paramonitoramento");
            String nomeUsuario = (String) session.getAttribute("user");
            //ComboEspecialidade ce = new ComboEspecialidade();
            //Combos esp = new Combos();
            //esp.Especialidade();<img src="./img/lupa.png" class="w3-hover-opacity"  style="width:25%">
            //Prestador p = (Prestador) session.getAttribute("prestadorobj");
            ControlaQualidade cq = new ControlaQualidade();
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
                    <h2>Monitorar</h2> <h1>Prestadores</h1>
                    <h5> Verifique as notas do prestador</h5>
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

                        <h5><span class="glyphicon glyphicon-bullhorn"></span>=Adverte &ensp;<span class="glyphicon glyphicon-alert"></span>=Suspende&ensp;<span class="glyphicon glyphicon-lock "></span>=Bloqueia</h5>
                        <table class="w3-table-all" id="myTable">
                            <thead>
                                <tr class="w3-dark-grey">

                                    <th>Nome</th>
                                    <th>CPF</th>                                    
                                    <th>Nota</th>                                    
                                    <th>Nota negativa?</th>                                    
                                    <th>Notas negativas seguidas</th>                                    
                                    <th>Nível</th>                                    
                                    <th>Advertencias</th>                                    
                                    <th>Suspensoes</th>                                    
                                    <th>Ação</th>
                                </tr>
                            </thead>
                            <%for (int i = 0; i < prestadores.size(); i++) {%>

                            <tr class="w3-hover-dark-grey"> 
                                <td> <%=prestadores.get(i).getNome()%> </td>
                                <td> <%=prestadores.get(i).getCpf()%></td>     
                                <td> <%= cq.NotaStr(prestadores.get(i))%></td>     
                                <td>Negativa desde:<font style="color: sienna"> <%= prestadores.get(i).getPerfilp().getDataNota()%></font></td>     
                                <td> <%=prestadores.get(i).getPerfilp().getQualidade().getQtdnegativa() %></td>     
                                <td> <%=cq.NivelStr(prestadores.get(i))%></td>     
                                <td> <%=prestadores.get(i).getAdvertencia()%></td>     
                                <td> <%=prestadores.get(i).getSuspensao()%></td>     

                                <% if (prestadores.get(i).getAdvertencia() < 3 && prestadores.get(i).getSuspensao() < 3) {%>
                            <form action="Adverte" ><td><button class="w3-button w3-round-xxlarge w3-red " name="botao" type="submit" value="<%=prestadores.get(i).getId()%>"><center><span class="glyphicon glyphicon-bullhorn"></span></center></button></td> </form>
                                            <% }
                                                if (prestadores.get(i).getSuspensao() < 3 && prestadores.get(i).getAdvertencia() == 3) {%>
                            <form action="Suspende" ><td><button class="w3-button w3-round-xxlarge w3-red " name="botao" type="submit" value="<%=prestadores.get(i).getId()%>"><center><span class="glyphicon glyphicon-alert "></span></center></button></td> </form>
                                            <% }
                                                if (prestadores.get(i).getSuspensao() >= 3) {%>
                            <form action="Bloqueia" ><td><button class="w3-button w3-round-xxlarge w3-red " name="botao" type="submit" value="<%=prestadores.get(i).getId()%>"><center><span class="glyphicon glyphicon-lock "></span></center></button></td> </form>
                                            <%}%>
                            </tr>
                            <%}%>



                        </table>



                    </div>

                    <div class="col-md-1 col-sm-12">






                    </div>

                </div><br>



            </center>
        </div>



    </body>
</html>

