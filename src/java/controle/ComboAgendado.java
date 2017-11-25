/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controle;

import java.util.ArrayList;
import java.util.List;
import javax.swing.JOptionPane;

/**
 *
 * @author ra21601909
 */
public class ComboAgendado {

    

    public List<String> Horario() {

        List<String> horarios = new ArrayList<>();
        String concat = ":00";
        int index = 0;
        for (int i = 00; i <= 23; i++) {
            if (i < 10) {

                concat = "0" + i + concat;
            } else {
                concat = i + concat;
            }
            horarios.add(index, concat);
            index++;
            concat = ":00";
        }
        
        return horarios;
    }

}
