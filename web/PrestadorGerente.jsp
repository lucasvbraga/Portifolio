<%-- 
    Document   : ClienteGerente
    Created on : 11/11/2017, 10:57:34
    Author     : ra21601909
--%>

<%@page import="servicos.Contagem"%>
<%@page import="java.util.List"%>
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
            //List<Prestador> prestador //(String) sessao.getAttribute("user");
            String nomeUsuario =(String) session.getAttribute("user");
            //ComboEspecialidade ce = new ComboEspecialidade();
            //Combos esp = new Combos();
            //esp.Especialidade();<img src="./img/lupa.png" class="w3-hover-opacity"  style="width:25%">
            //Prestador p = (Prestador) session.getAttribute("prestadorobj");
            //ControlaQualidade cq = new ControlaQualidade();
            Contagem conta = new Contagem();
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
                    <h2>O que você deseja</h2> <h1>Gerenciar</h1><h2>no Prestador?</h2> 
                </div>
                <div class="col-md-2 col-sm-">

                    

                </div>
                <div class="col-md-1 col-sm-">

                </div>
            </div>
            <br><br><br>

            <center>
                <br><br><br><br><br><br><br><br><br>
                <div class="row">

                    <div class="col-md-4 col-sm-12">


                        <a href="CarregaAnalise"><button class="w3-button  w3-dark-grey w3-xxlarge" type="submit" style="width:100%"><h3 style="color:silver">ANALISAR<span class="w3-badge w3-margin-left w3-deep-orange" ><%= conta.Analise()%></span></h3></button></a>   


                    </div>
                    <div class="col-md-4 col-sm-12">


                        <a href="CarregaPrestador"><button class="w3-button  w3-dark-grey w3-xxlarge" type="submit" style="width:100%"><h3 style="color:silver">PESQUISAR </h3></button></a>


                    </div>

                    <div class="col-md-4 col-sm-12">


                        <a href="CarregaMonitorar"><button class="w3-button  w3-dark-grey w3-xxlarge" type="submit" style="width:100%"><h3 style="color:silver">MONITORAR</h3></button></a>   
                  


                    </div>
                    
                </div><br>
                
                

            </center>
        </div>
                    
                    
                    
    </body>
</html>
