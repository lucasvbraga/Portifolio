/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package formatacao;

import javax.swing.JOptionPane;
import model.Prestador;

/**
 *
 * @author ra21601909
 */
public class Formatacoes {

    public String FormataData(String data) {

        data.replaceAll("-", "/");
        String[] s = data.split("-");
        String novaData = s[2] + "/" + s[1] + "/" + s[0];

        return novaData;
    }

    public String FormataAprovacao(Prestador p) {
        String saida = "";
        if (p.getAprovado() == 0) {
            saida = "<h4> <font style= \"color : green\"> EM ANÁlISE</font></h4>";
        } if (p.getAprovado() == 1) {
            
            saida = "<h4> <font style= \"color : red\"> REPROVADO</font></h4>";

        }  if (p.getAprovado() == 2) {

            saida = "<h4> <font style= \"color : blue\"> APROVADO</font></h4>";
        }
        return saida;
    }
    public String FormataBloqueio(Prestador p){
    String saida="";
    
    if(!p.isBloqueado()){
    
        saida = "<h4> <font style= \"color : blue\"> LIBERADO</font></h4>";
    }if (p.isBloqueado()){
        saida = "<h4> <font style= \"color : red\"> BLOQUEADO</font></h4>";
    }
    
    return saida;
    }

}
