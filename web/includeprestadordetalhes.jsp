<%@page contentType="text/html" pageEncoding="UTF-8"%>

<h4><%= "CPF   " + prestadores.get(j).getCpf()%></h4>
<h4><%= "RG   " + prestadores.get(j).getRg()%></h4>
<h4><%= "UF   " + prestadores.get(j).getUf_rg()%></h4>
<h4><%= "Nome Pai   " + prestadores.get(j).getNome_pai()%></h4>
<h4><%= "Nome Mãe   " + prestadores.get(j).getNome_mae()%></h4>
<h4><%= "Celular   " + prestadores.get(j).getCelular()%></h4>
<h4><%= "Email:   " + prestadores.get(j).getEmail()%></h4>
<h4><%= "Data de Nascimento   " + prestadores.get(j).getData_nascimento()%></h4>

