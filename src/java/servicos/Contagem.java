/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servicos;

import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpSession;
import model.Agendado;
import model.Emergencial;
import model.HibernateUtil;
import model.Normal;
import model.Prestador;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

/**
 *
 * @author Lucas
 */
public class Contagem {

    public int Realizados(Prestador prestador) {

        int qtde;

        int id = prestador.getId();

        List<Agendado> agendado;
        String hql_a = "FROM  Agendado ";
        hql_a += "WHERE prestador_id = :id AND status >= 4";

        List<Emergencial> emergencial;
        String hql_e = "FROM  Emergencial ";
        hql_e += "WHERE prestador_id = :id AND status >= 4";

        List<Normal> normal;
        String hql_n = "FROM  Normal  ";
        hql_n += "WHERE prestador_id = :id AND status >= 4";

        SessionFactory sf = HibernateUtil.getSessionFactory();
        Session sn = sf.openSession();

        sn.beginTransaction();

        Query query_a;
        Query query_n;
        Query query_e;

        query_n = sn.createQuery(hql_n).setParameter("id", id);
        query_e = sn.createQuery(hql_e).setParameter("id", id);
        query_a = sn.createQuery(hql_a).setParameter("id", id);

        agendado = query_a.list();
        normal = query_n.list();
        emergencial = query_e.list();
        sn.getTransaction().commit();
        sn.close();
        qtde = agendado.size() + normal.size() + emergencial.size();

        return qtde;
    }

    public int Abertos(Prestador prestador) {
        int qtde;
        int id = prestador.getId();

        List<Agendado> agendado;
        String hql_a = "FROM  Agendado ";
        hql_a += "WHERE prestador_id = :id AND status < 4";

        List<Emergencial> emergencial;
        String hql_e = "FROM  Emergencial ";
        hql_e += "WHERE prestador_id = :id AND status < 4";

        List<Normal> normal;
        String hql_n = "FROM  Normal  ";
        hql_n += "WHERE prestador_id = :id AND status < 4";

        SessionFactory sf = HibernateUtil.getSessionFactory();
        Session sn = sf.openSession();

        sn.beginTransaction();

        Query query_a;
        Query query_n;
        Query query_e;

        query_n = sn.createQuery(hql_n).setParameter("id", id);
        query_e = sn.createQuery(hql_e).setParameter("id", id);
        query_a = sn.createQuery(hql_a).setParameter("id", id);

        agendado = query_a.list();
        normal = query_n.list();
        emergencial = query_e.list();
        sn.getTransaction().commit();
        sn.close();
        qtde = agendado.size() + normal.size() + emergencial.size();
        return qtde;
    }
    public int Analise (){
    List<Prestador> prestador;

            SessionFactory sf = HibernateUtil.getSessionFactory();
            Session sn = sf.openSession();
            String hql = "FROM Prestador Where aprovado = 0";
            sn.beginTransaction();

            Query query;

            query = sn.createQuery(hql);

            prestador = query.list();
            
            return prestador.size();
    
    }

}
