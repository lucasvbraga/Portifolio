/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.OneToOne;



/**
 *
 * @author Lucas
 */
@Entity
public class SolicitacaoAgendado {

    @Id
    @GeneratedValue
    private int id;
    
    @OneToOne
    private Agendado agendado;
    @Column
    private double valor;
    
    
    @Column
    private String nome_prestador;
    @Column
    private int id_prestador;

    public SolicitacaoAgendado(Agendado agendado, double valor, String nome_prestador, int id_prestador) {
        this.agendado = agendado;
        this.valor = valor;
        this.nome_prestador = nome_prestador;
        this.id_prestador = id_prestador;
    }

    
    public SolicitacaoAgendado() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Agendado getAgendado() {
        return agendado;
    }

    public void setAgendado(Agendado agendado) {
        this.agendado = agendado;
    }

    public double getValor() {
        return valor;
    }

    public void setValor(double valor) {
        this.valor = valor;
    }

    public String getNome_prestador() {
        return nome_prestador;
    }

    public void setNome_prestador(String nome_prestador) {
        this.nome_prestador = nome_prestador;
    }

    public int getId_prestador() {
        return id_prestador;
    }

    public void setId_prestador(int id_prestador) {
        this.id_prestador = id_prestador;
    }

    
    
    
}
