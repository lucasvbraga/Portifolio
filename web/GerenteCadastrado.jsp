<%-- 
    Document   : GerenteCadastrado
    Created on : 15/11/2017, 13:21:46
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
            String nome = (String) session.getAttribute("user_cadastrado");
            
            String  cpf =  (String) session.getAttribute("cpf_cadastrado");
            String  email =  (String)session.getAttribute("email_cadastrado");
            //String  sexo =  (String)sessao.getAttribute("sexo_prest");
            String  data =  (String)session.getAttribute("data_cadastrado");
           
                        
            

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
                            <li ><a href="perfilGerente.jsp">Página Inicial</a></li>



                        </ul>
                        <ul class="nav navbar-nav navbar-right">
                            <li><h5><font color="#FFFFFF">Olá <%=nome%> </font></h5></li>
                            <li><a href="LogoutCliente.jsp"><span class="glyphicon glyphicon-log-out"></span> Sair</a></li>
                        </ul>
                    </div>
                </div></nav>
            <br><br><br><center>


                <h2>GERENTE CADASTRADO COM SUCESSO</h2>
                <img src="./img/ok.png" class="w3-hover-opacity" alt="Norway" style="width:15%">
                <br><br><br>

                <table class="w3-table ">
                    <tr class="w3-teal">
                        <th>Nome</th>
                        <th>Email</th>
                        <th>CPF</th>
                        
                    </tr>
                    <tr>
                        <td><%=nome%></td>
                        <td><%=email%></td>
                        <td><%=cpf%></td>
                        
                    </tr>
                </table>
                <br><br><br><br><a href="principalGerente.jsp"><button class="w3-btn w3-teal"  >Início</button></a>
            </center>

        </div>




    </body>
</html>
