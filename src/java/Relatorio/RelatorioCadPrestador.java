/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Relatorio;

import formatacao.Formatacoes;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;
import model.Especialidade;
import model.Prestador;

/**
 *
 * @author Lucas
 */
public class RelatorioCadPrestador {

    Formatacoes fmat = new Formatacoes();

    public int QuantidadeTotal(List<Prestador> prestadores, String data_digitada) {
        Date data = null;
        data_digitada = fmat.FormataData(data_digitada);

        SimpleDateFormat formato = new SimpleDateFormat("dd/MM/yyyy");
        try {
            data = formato.parse(data_digitada);
            //JOptionPane.showMessageDialog(null, "Deu\n" + formato.format(data));
        } catch (ParseException ex) {
            //Logger.getLogger(BancoTeste.class.getName()).log(Level.SEVERE, null, ex);
        }

        String data_banco;
        Date databanco = null;
        int qtde = 0;

        Calendar cal = Calendar.getInstance();
        cal.setTime(data);

        for (Prestador p : prestadores) {
            data_banco = fmat.FormataData(p.getData_nascimento());
            try {
                databanco = formato.parse(data_banco);
                //JOptionPane.showMessageDialog(null, "Deu\n" + formato.format(databanco));
            } catch (ParseException ex) {
                //JOptionPane.showMessageDialog(null, "ERRO" + ex);
                Logger.getLogger(RelatorioCadPrestador.class.getName()).log(Level.SEVERE, null, ex);
            }
            Calendar calbanco = Calendar.getInstance();
            calbanco.setTime(databanco);

            if (cal.before(calbanco)) {

                qtde++;
                //JOptionPane.showMessageDialog(null, "A data " + formato.format(data) + "\nDeu\n" + formato.format(databanco));
            } else {
            }

        }

        data.setTime(cal.getTimeInMillis());
        Date hoje = new Date(System.currentTimeMillis());
        float periodo = ((hoje.getTime() - data.getTime()) / 1000 / 60 / 60 / 24);
        String datahoje = formato.format(hoje);

        return qtde;
    }

    public int Periodo(String data_digitada) {
        Date data = null;
        data_digitada = fmat.FormataData(data_digitada);

        SimpleDateFormat formato = new SimpleDateFormat("dd/MM/yyyy");
        try {
            data = formato.parse(data_digitada);
            //JOptionPane.showMessageDialog(null, "Deu\n" + formato.format(data));
        } catch (ParseException ex) {
            //Logger.getLogger(BancoTeste.class.getName()).log(Level.SEVERE, null, ex);
        }
        Calendar cal = Calendar.getInstance();
        cal.setTime(data);

        data.setTime(cal.getTimeInMillis());
        Date hoje = new Date(System.currentTimeMillis());

        float periodoflt = ((hoje.getTime() - data.getTime()) / 1000 / 60 / 60 / 24);

        String datahoje = formato.format(hoje);

        int periodo = (int) periodoflt;

        return periodo;
    }

    public List<Double> QuantidadeEstimada(int qtde, int periodo) {

        List<Double> estimados = new ArrayList<>();

        int i = 0;
        double estimado = 0;

        while (i <= 5) {

            estimado += (1.2 * qtde);

            estimados.add(i, estimado);
            i++;
        }

        return estimados;
    }

    public List<Integer> ProximoPeriodo(int periodo) {

        List<Integer> proximos = new ArrayList<>();
        int i = 0;

        while (i <= 5) {

            periodo += periodo;

            proximos.add(i, periodo);
            i++;
        }

        return proximos;

    }

    public List<Integer> QuantidadeEspecialidade(List<Especialidade> especialidades) {
        List<Integer> quantidade = new ArrayList<>();
        int qtde;
        int i = 0;
        for (Especialidade e : especialidades) {

            qtde = e.getPrest().size();
            quantidade.add(i, qtde);
            i++;
                        
        }

        return quantidade;
    }
}
