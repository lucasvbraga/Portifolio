<%-- 
    Document   : alteraespecialidade
    Created on : 21/11/2017, 13:19:05
    Author     : Lucas
--%>
<%-- 
    Document   : PerfilPrestador
    Created on : 07/10/2017, 00:13:52
    Author     : Lucas
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="model.Especialidade"%>
<%@page import="java.util.List"%>
<%@page import="formatacao.Formatacoes"%>
<%@page import="controle.ControlaQualidade"%>
<%@page import="model.Prestador"%>
<%-- 
    Document   : PerfilCliente
    Created on : 06/10/2017, 03:44:48
    Author     : Lucas
--%>

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
            String nome = (String) session.getAttribute("user");
            Prestador p = (Prestador) session.getAttribute("prestadorobj");
            ControlaQualidade cq = new ControlaQualidade();
            Formatacoes fmat = new Formatacoes();
            List<Especialidade> espec = new ArrayList<Especialidade>();
            espec = (List) session.getAttribute("especialidaderesumida");

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
                </div>
            </nav><br><br><br><br>
            <br><center><div class="row">
                    <div class="col-md-1 col-sm-1">

                    </div>
                    <div class="col-md-10 col-sm-12">

                        <h2>Selecione as novas especialidades:</h2>    
                        <h6>Segufre Ctrl para selecionar mais de uma</h6>
                        <form action="AdicionaEspecialidadePrestador"><select class="w3-select" name="especialidade" size="10" style="width: 30%" MULTIPLE><font color= "#314034">
                                <%
                                    for (int i = 0; i < espec.size(); i++) {
                                        out.print("<option value=" + espec.get(i).getNome() + "> " + espec.get(i).getNome() + "</option>");
                                    }//:&nbsp;&emsp;&emsp;<h6><span class="glyphicon glyphicon-info-sign"></span>Quanto melhor a descrição, mais fácil encontrar um prestador.</h6>
%>
                            </select><br><br>
                            <button name="id" value="<%= p.getId()%>" type="submit" class="w3-btn w3-blue">Adicionar</button></form>
                            <br><br><button onclick=" history.back(-1)" class="w3-btn w3-red">Voltar</button>
                    </div> 
                    <div class="col-md-1 col-sm-12">

                    </div>
                </div></center>








        </div>

    </body>
</html>