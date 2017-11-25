/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToOne;



/**
 *
 * @author Lucas
 */
@Entity
public class SolicitacaoEmergencial {

    @Id
    @GeneratedValue
    private int id;
    
    @OneToOne
    private Emergencial emergencial;
    @Column
    private double valor;
    @Column
    private String nome_prestador;
    @Column
    private int id_prestador;

    public SolicitacaoEmergencial(Emergencial emergencial, double valor, String nome_prestador, int id_prestador) {
        this.emergencial = emergencial;
        this.valor = valor;
        this.nome_prestador = nome_prestador;
        this.id_prestador = id_prestador;
    }

    public SolicitacaoEmergencial() {
    }
    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Emergencial getEmergencial() {
        return emergencial;
    }

    public void setEmergencial(Emergencial emergencial) {
        this.emergencial = emergencial;
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
