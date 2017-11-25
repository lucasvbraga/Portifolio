/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controle;

import java.text.DateFormat;
import static java.text.DateFormat.getDateInstance;
import java.text.DecimalFormat;
import java.util.Date;
import model.Especialidade;
import model.HibernateUtil;
import model.PerfilPrestador;
import model.Prestador;
import model.Qualidade;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

/**
 *
 * @author Lucas
 */
public class ControlaQualidade {

//    ControlaQualidade cq = new ControlaQualidade();
    public void nivel(Prestador prestador, double xp) {
        SessionFactory sf;
        Session sn;
        int nivel = prestador.getPerfilp().getQualidade().getNivel();
        double progresso = prestador.getPerfilp().getQualidade().getXp() + xp;
        Qualidade qualidade;
        PerfilPrestador perfilP;
        double sobra;
        //double novoProgresso = cq.Progresso(progresso);
        if (progresso >= 200) {
            nivel++;
            sobra = progresso - 200;
            progresso = sobra;
        }
        sf = HibernateUtil.getSessionFactory();
        sn = sf.openSession();
        try {
            sn.beginTransaction();
            //prestador.setPerfilp();
            perfilP = prestador.getPerfilp();//new PerfilPrestador();
            qualidade = prestador.getPerfilp().getQualidade();
            qualidade.setNivel(nivel);
            qualidade.setXp(progresso);

            perfilP.setPrestador(prestador);
            perfilP.setQualidade(qualidade);
            prestador.setPerfilp(perfilP);

            sn.update(perfilP);
            sn.update(qualidade);
            //sn.update(prestador);

            sn.getTransaction().commit();
        } catch (Exception ex) {
            sn.getTransaction().rollback();
            //System.out.println("ERROO h=" + h + "xxx= " + xx + " OOOOOOOO " + stresp.get(0) + " \n" + bancoep.get(5));
            ex.printStackTrace();
        } finally {
            sn.close();
        }

    }

    public String NivelStr(Prestador p) {

        int nivel = p.getPerfilp().getQualidade().getNivel();
        double progresso = p.getPerfilp().getQualidade().getXp();
        double porcentagem;
        porcentagem = (progresso * 100) / 200;
        //DecimalFormat df = new DecimalFormat("0.#");
        //String ptstr = df.format(porcentagem);
        //double pt = Double.parseDouble(ptstr);
        int pt = (int) porcentagem;
        System.out.println("\n\n\n\n\n  " + porcentagem + "\n\n\n\n\n  " + pt);
        String str = "<div class=\"w3-light-green\">\n"
                + "  <center>Nível: " + nivel + "</center> "
                + "<div class=\"w3-container w3-lime w3-center\" style=\"width:" + pt + "%\">" + pt + "%<h5></div>\n"
                + "</div>";

        return str;
    }

    public void Nota(Prestador prestador, double nota) {
        double notaantiga = prestador.getPerfilp().getQualidade().getNota();
        double novanota = (nota + notaantiga) / 2;
        Qualidade qualidade;
        PerfilPrestador perfilP = null;
        SessionFactory sf;
        Session snn;
        java.util.Date d = new Date();
        int neg = prestador.getPerfilp().getQualidade().getQtdnegativa();
        String dStr;

        sf = HibernateUtil.getSessionFactory();
        snn = sf.openSession();
        try {
            snn.beginTransaction();
            
            //prestador.setPerfilp();
            perfilP = prestador.getPerfilp();//new PerfilPrestador();
            qualidade = prestador.getPerfilp().getQualidade();
            qualidade.setNota(novanota);
            if (nota >= 2.5) {
                qualidade.setQtdnegativa(0);
            } else {
                neg++;
                qualidade.setQtdnegativa(neg);
                            
            }

            perfilP.setPrestador(prestador);
            perfilP.setQualidade(qualidade);
            //prestador.setPerfilp(perfilP);

            if (notaantiga >= 2.5) {

                dStr = getDateInstance(DateFormat.MEDIUM).format(d);

            } else {
                dStr = perfilP.getDataNota();
            }
            if (novanota < 2.5) {

                perfilP.setDataNota(dStr);

            } else if (novanota >= 2.5) {
                dStr = "Nota Positiva";
                perfilP.setDataNota(dStr);
            }
            
            snn.update(perfilP);
            snn.update(qualidade);
            //snn.update(prestador);

            snn.getTransaction().commit();
        } catch (Exception ex) {
            snn.getTransaction().rollback();
            //System.out.println("ERROO h=" + h + "xxx= " + xx + " OOOOOOOO " + stresp.get(0) + " \n" + bancoep.get(5));
            ex.printStackTrace();
        } finally {
            snn.close();
        }
    }

    public String NotaStr(Prestador prestador) {

        double nota = prestador.getPerfilp().getQualidade().getNota();
        DecimalFormat df = new DecimalFormat("0.##");
        String notastr = df.format(nota);

        String str = "SEM NOTA";

        if (nota >= 2.5) {
            str = "<font color=\"blue\">" + notastr + "</font>";

        } else {
            str = "<font color=\"red\"> " + notastr + "</font>";
        }

        return str;
    }

}
