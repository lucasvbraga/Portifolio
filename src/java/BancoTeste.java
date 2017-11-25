/*
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
import model.Atendimento;
import model.Cliente;
import model.Especialidade;
import model.HibernateUtil;
import model.Prestador;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

public class BancoTeste {

    public static void main(String[] args) {

        List<Prestador> prestadores;
        String hql = "From Prestador ";
        SessionFactory sf = HibernateUtil.getSessionFactory();
        Session sn = sf.openSession();
        Formatacoes fmat = new Formatacoes();
        sn.beginTransaction();
        Query query;
        String data_digitada = "12/10/2017";

        Date data = null;
        SimpleDateFormat formato = new SimpleDateFormat("dd/MM/yyyy");
        try {
            data = formato.parse(data_digitada);
            JOptionPane.showMessageDialog(null, "Deu\n" + formato.format(data));
        } catch (ParseException ex) {
            Logger.getLogger(BancoTeste.class.getName()).log(Level.SEVERE, null, ex);
        }

        query = sn.createQuery(hql);

        prestadores = query.list();
        String data_banco;
        Date databanco = null;
        int qtde = 0;
//List<Integer> qtdeprestadores = new ArrayList<>();
            Calendar cal = Calendar.getInstance();
            cal.setTime(data);
        for (Prestador p : prestadores) {
            data_banco = fmat.FormataData(p.getData_nascimento());
            try {
                databanco = formato.parse(data_banco);
                //JOptionPane.showMessageDialog(null, "Deu\n" + formato.format(databanco));
            } catch (ParseException ex) {
                JOptionPane.showMessageDialog(null, "ERRO" + ex);
                Logger.getLogger(BancoTeste.class.getName()).log(Level.SEVERE, null, ex);
            }
            Calendar calbanco = Calendar.getInstance();
            calbanco.setTime(databanco);
            int dia;

            if (cal.after(calbanco)) {

                qtde++;
                JOptionPane.showMessageDialog(null, "A data " + formato.format(data) + "\nDeu\n" + formato.format(databanco));
            } else {
            }

        }

        data.setTime(cal.getTimeInMillis());
        
        Date hoje = new Date(System.currentTimeMillis());
        

        JOptionPane.showMessageDialog(null, "TOTAL" + qtde);
        JOptionPane.showMessageDialog(null, "Periodo" + (hoje.getTime() - data.getTime()) / 1000 / 60 / 60 / 24);
        JOptionPane.showMessageDialog(null, "Hoje é " + formato.format(hoje));
        
        sn.close();

    }
}
*/