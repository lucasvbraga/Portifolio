<%-- 
    Document   : RelatorioCliente
    Created on : 17/11/2017, 01:41:59
    Author     : Lucas
--%>

<%-- 
    Document   : RelatorioNormal
    Created on : 16/11/2017, 20:57:04
    Author     : Lucas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%-- 
    Document   : Relatorio
    Created on : 16/11/2017, 16:15:11
    Author     : Lucas
--%>

<%@page import="model.Especialidade"%>
<%@page import="java.util.List"%>
<%-- 
    Document   : RelCadPreTot
    Created on : 12/11/2017, 21:23:27
    Author     : SeNNio
--%>


<%@page import="controle.ControlaQualidade"%>
<%@page import="model.Prestador"%>
<%@page import="controle.ComboEspecialidade"%>
<%@page import="model.Cliente"%>
<%@page import="controle.InsereCliente"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"></link>

        <style>
            #chartdiv2 {
                width: 100%;
                height: 500px;
                font-size: 11px;
            }

            .amcharts-pie-slice {
                transform: scale(1);
                transform-origin: 50% 50%;
                transition-duration: 0.3s;
                transition: all .3s ease-out;
                -webkit-transition: all .3s ease-out;
                -moz-transition: all .3s ease-out;
                -o-transition: all .3s ease-out;
                cursor: pointer;
                box-shadow: 0 0 30px 0 #000;
            }

            .amcharts-pie-slice:hover {
                transform: scale(1.1);
                filter: url(#shadow);
            }							
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
            #chartdiv {
                width		: 100%;
                height		: 500px;
                font-size	: 11px;
            }		

        </style>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <%
            String nomeUsuario = (String) session.getAttribute("user");

            int qtde = (Integer) session.getAttribute("Relqtdecliente");
            int periodo = (Integer) session.getAttribute("Relperiodocliente");
            List<Double> estimada = (List) session.getAttribute("relestimadacliente");
            List<Integer> proximosperiodos = (List) session.getAttribute("relproximosperiodoscliente");
            String dStr = (String) session.getAttribute("datahoje");
            int total = (Integer) session.getAttribute("relqtdeclientetotais");
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
                    <p>&emsp;&emsp;Bem vindo <%=nomeUsuario%>!<a href="LogoutCliente.jsp"><button class="w3-btn w3-white w3-border w3-border-red w3-tiny w3-round">SAIR</button></a><a href="RelatorioGerente.jsp"><button class="w3-btn w3-white w3-border w3-border-black w3-tiny w3-round">VOLTAR</button></a></p>

                </div>

                <div class="col-md-5 col-sm-">
                    <h5>A partir de qual data deseja gerar o relatório?</h5>
                    <form action="GerarCadCliente"><input type="date" max="<%=dStr%>" name="data" style="width: 38%"> <button type="submit" class="w3-btn w3-blue-gray">Gerar</button> </form>

                    <% if (periodo < 0) {%>
                    <h3> informe um periodo válido</h3>
                    <%} else {%>
                </div>
                <div class="col-md-2 col-sm-">



                </div>
                <div class="col-md-1 col-sm-">

                </div>
            </div>
            <br><br><br>

            <center>
                <br>
                <div class="row">

                    <div class="col-md-1 col-sm-12">





                    </div>
                    <div class="col-md-10 col-sm-12">

                        <h5>O período de busca foi:<font style="color: burlywood"> <%=periodo%> </font>dias </h5><br>
                        <h3> A estimativa de  crescimento de Clientes é a seguinte:</h3><br>
                        <div id="chartdiv"></div>

                    </div>

                    <div class="col-md-1 col-sm-12">






                    </div>

                </div><br>
                <div class="row">

                    <div class="col-md-12 col-sm-12">

                        <h3> A quantidade total de  Clientes no período foi de    : <font style="color: burlywood"> <%= qtde%></font></h3><br>
                        <br><br>
                        <h3> A quantidade de Clientes totais no sistema é : <font style="color: burlywood"> <%= total%> </h3>
                    </div>

                </div>
                <br>

                <%}%>

            </center>
        </div>











        <script src="https://www.amcharts.com/lib/3/amcharts.js"></script>
        <script src="https://www.amcharts.com/lib/3/serial.js"></script>
        <script src="https://www.amcharts.com/lib/3/plugins/export/export.min.js"></script>
        <link rel="stylesheet" href="https://www.amcharts.com/lib/3/plugins/export/export.css" type="text/css" media="all" />
        <script src="https://www.amcharts.com/lib/3/themes/light.js"></script>

        <script>

            var chart = AmCharts.makeChart("chartdiv", {
                "type": "serial",
                "theme": "light",
                "dataProvider": [{
                        "country": "Em : " + <%= proximosperiodos.get(0).toString()%> + " dias",
                        "visits": <%= estimada.get(0).toString()%>
                    }, {
                        "country": "Em : " + <%= proximosperiodos.get(1).toString()%> + " dias",
                        "visits": <%= estimada.get(1).toString()%>
                    }, {
                        "country": "Em : " + <%= proximosperiodos.get(2).toString()%> + " dias",
                        "visits": <%= estimada.get(2).toString()%>
                    }, {
                        "country": "Em : " + <%= proximosperiodos.get(3).toString()%> + " dias",
                        "visits": <%= estimada.get(3).toString()%>
                    }, {
                        "country": "Em : " + <%= proximosperiodos.get(4).toString()%> + " dias",
                        "visits": <%= estimada.get(4).toString()%>
                    }, {
                        "country": "Em : " + <%= proximosperiodos.get(5).toString()%> + " dias",
                        "visits": <%= estimada.get(5).toString()%>
                    }],
                "valueAxes": [{
                        "gridColor": "#FFFFFF",
                        "gridAlpha": 0.2,
                        "dashLength": 0
                    }],
                "gridAboveGraphs": true,
                "startDuration": 1,
                "graphs": [{
                        "balloonText": "[[category]]: <b>[[value]]</b>",
                        "fillAlphas": 0.8,
                        "lineAlpha": 0.2,
                        "type": "column",
                        "valueField": "visits"
                    }],
                "chartCursor": {
                    "categoryBalloonEnabled": false,
                    "cursorAlpha": 0,
                    "zoomable": false
                },
                "categoryField": "country",
                "categoryAxis": {
                    "gridPosition": "start",
                    "gridAlpha": 0,
                    "tickPosition": "start",
                    "tickLength": 20
                },
                "export": {
                    "enabled": true
                }

            });
        </script>
        <script src="https://www.amcharts.com/lib/3/amcharts.js"></script>
        <script src="https://www.amcharts.com/lib/3/pie.js"></script>
        <script src="https://www.amcharts.com/lib/3/plugins/export/export.min.js"></script>
        <link rel="stylesheet" href="https://www.amcharts.com/lib/3/plugins/export/export.css" type="text/css" media="all" />
        <script src="https://www.amcharts.com/lib/3/themes/light.js"></script>


    </body>
</html>



