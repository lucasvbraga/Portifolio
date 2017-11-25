<%-- 
    Document   : AtendimentoNormal
    Created on : 09/10/2017, 00:13:23
    Author     : Lucas
--%>

<%@page import="controle.ComboAgendado"%>
<%@page import="model.Especialidade"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>

<%@page import="org.hibernate.Session"%>

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
                height: 35%; background-size:cover; }
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
                width:60%;
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
                border: 2px solid black;
                border-radius: 4px;
                background-color: bisque;
                resize: none; }

            .button{background-color: #008CBA;}
            div.praias{font: italic bold 10px, serif; }
            img {
                border-radius: 50%;}


        </style>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <%  //HttpSession sessao;
            //sessao = request.getSession();
            String nomeUsuario = (String) session.getAttribute("user");
            List<Especialidade> espec = new ArrayList<Especialidade>();
            espec = (List) session.getAttribute("ATespecialidade");
            ComboAgendado comboaagendadao = new ComboAgendado();
            String dStr = (String) session.getAttribute("datahoje");
            List<String> ca = new ArrayList<String>();
            for (int index = 0; index < comboaagendadao.Horario().size(); index++) {
                ca.add(index, comboaagendadao.Horario().get(index));
            }
        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>


    </head>
    <body >
        <div class="jumbotron" >
            <nav class="navbar navbar-default navbar-fixed-top" style="background-color:#314034">
                <div class="container-fluid">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span> 
                        </button>
                        <a class="navbar-brand" href="principalCliente.jsp"><font color="#FFFFFF">|SOS|</font></a>
                    </div>
                    <div class="collapse navbar-collapse" id="myNavbar">
                        <ul class="nav navbar-nav">
                            <li class="active"><a href="principalCliente.jsp">Página Inicial</a></li>
                            <li ><a href="PerfilCliente.jsp">Seu perfil </a></li>


                        </ul>
                        <ul class="nav navbar-nav navbar-right">
                            <li><h5><font color="#FFFFFF">Olá <%=nomeUsuario%> </font></h5></li>
                            <li><a href="LogoutCliente.jsp"><span class="glyphicon glyphicon-log-out"></span> Sair</a></li>
                        </ul>
                    </div>
                </div></nav>


            <br><br><br><center><h2>Agendar atendimento</h2><h4>preencha as informações para solicitar o serviço.</h4><br><br>
                <div class="row">
                    <div class="col-md-3 col-sm-">
                        <button class="w3-btn w3-blue-gray" onclick="setLatLong()">Sua localização<br><span id="ok" class="glyphicon glyphicon-map-marker"></span></button>
                        <br><br><button id="submit" class="w3-btn w3-gray" type="submit" >Mostrar endereço</button>

                        <div id="map" style=" width:1px; height: 1px; visibility: hidden"></div>
                        <form action="" name="agendado">
                            <input id="latlng" name="latlong" type="hidden" value="">
                            <textarea cols=1 rows=1 style="width: 85%; height: 35%" id="saida" name="endereco" ></textarea>
                    </div>
                    <div class="col-md-3 col-sm-">
                        <label for="nome" >Selecione a especialidade necessária:</label><br><br>
                        <select class="form-control" style="width: 180px" name="especialidade"><font color= "#314034">
                            <%
                                for (int i = 0; i < espec.size(); i++) {
                                    out.print("<option value=" + espec.get(i) + "> " + espec.get(i) + "</option>");
                                }//:&nbsp;&emsp;&emsp;<h6><span class="glyphicon glyphicon-info-sign"></span>Quanto melhor a descrição, mais fácil encontrar um prestador.</h6>
%>
                        </select></font>                            
                        <br><br>
                        <label for="nome" >Selecione a data ideal para o atendimento:</label><br><br>
                        <input type="date" id="data" min="<%=dStr%>" name="data"><br><br>
                        <label for="nome" >Selecione o horáirio para o atendimento:</label><br>
                        <select class="form-control" size="1" style="width: 100px" name="horario"><font color= "#314034">
                            <%
                                for (int j = 0; j < ca.size(); j++) {
                                    out.print("<option value=" + ca.get(j) + "> " + ca.get(j) + "</option>");
                                }//:&nbsp;&emsp;&emsp;<h6><span class="glyphicon glyphicon-info-sign"></span>Quanto melhor a descrição, mais fácil encontrar um prestador.</h6>
                            %>
                        </select></font>
                        <br><br>
                        <label for="nome" >Gostaria de repetir este atendimento?</label><br>
                        <select class="form-control" size="1" style="width: 200px" name="repetir">
                            <option value="nao">NÃO</option>
                            <option value="Diario">TODO DIA</option>
                            <option value="Semanalmente">TODA SEMANA</option>
                            <option value="Mensal">TODO MÊS</option>
                        </select> 
                    </div>
                    <div class="col-md-1 col-sm-">

                    </div>
                    <div class="col-md-3 col-sm-">
                        <br><label for="des" >Descrição do serviço </label><br><br>
                        <textarea id="descricao" rows="5" name="descricao" ></textarea><br><br>
                    </div>
                    <div class="col-md-2 col-sm-">

                    </div>
                </div> <br><br>
                <button class="w3-btn w3-green" onclick="CamposNulos()" >Buscar</button> &ensp;&ensp;
                <button class="w3-btn w3-red" onClick="history.go(-1)" >Voltar</button></form></center>
            <br><br><br>


        </div>
        <script>
            function CamposNulos() {
                var de = document.getElementById("descricao").value;
                var dt = document.getElementById("data").value;
                var en = document.getElementById("saida").value;
                if (de == "" || dt == "" || en == "") {
                    alert("Favor, preencher todos os campos");

                } else {
                    alert("Busca iniciada com sucesso");

                    document.forms['agendado'].action = "buscaAgendado";
                    document.forms['agendado'].submit();
                }
            }

        </script>

        <script>
            var x = document.getElementById("latlng");
            function setLatLong() {

                if (navigator.geolocation) {
                    document.getElementById("ok").innerHTML = "<span class=\"glyphicon glyphicon-ok\"></span>"
                    navigator.geolocation.getCurrentPosition(showPosition, showError);
                } else {
                    x.innerHTML = "Geolocation is not supported by this browser.";
                }
            }

            function showPosition(position) {
                x.value = position.coords.latitude +
                        "," + position.coords.longitude;
            }

            function showError(error) {
                switch (error.code) {
                    case error.PERMISSION_DENIED:
                        x.innerHTML = "User denied the request for Geolocation."
                        break;
                    case error.POSITION_UNAVAILABLE:
                        x.innerHTML = "Location information is unavailable."
                        break;
                    case error.TIMEOUT:
                        x.innerHTML = "The request to get user location timed out."
                        break;
                    case error.UNKNOWN_ERROR:
                        x.innerHTML = "An unknown error occurred."
                        break;
                }


            }
            function initMap() {
                var map = new google.maps.Map(document.getElementById('map'), {
                    zoom: 8,
                    center: {lat: 40.731, lng: -73.997}
                });
                var geocoder = new google.maps.Geocoder;
                var infowindow = new google.maps.InfoWindow;

                document.getElementById('submit').addEventListener('click', function () {
                    geocodeLatLng(geocoder, map, infowindow);
                });
            }

            function geocodeLatLng(geocoder, map, infowindow) {
                var input = document.getElementById('latlng').value;
                var saida = document.getElementById('saida');
                var latlngStr = input.split(',', 2);
                var latlng = {lat: parseFloat(latlngStr[0]), lng: parseFloat(latlngStr[1])};
                geocoder.geocode({'location': latlng}, function (results, status) {
                    if (status === 'OK') {

                        saida.innerHTML = results[1].formatted_address;
                    } else {
                        window.alert('Favor, clique em Sua Localização para antes');
                    }
                });
            }
        </script>
        <script async defer
                src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAfTDmhL4Rkzcm60A17SSk2SWINMquoROM&callback=initMap">
        </script>
    </body>
</html>