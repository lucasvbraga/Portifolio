/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import javax.annotation.Generated;
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
public class PerfilPrestador {
    
    @Id
    @GeneratedValue
    private int id;
    @OneToOne
    private Prestador prestador;
    
    @Column
    private String dataNota;
    
    @OneToOne
    private Qualidade qualidade;

   
    public PerfilPrestador() {
        
    }

    public PerfilPrestador(int id, Prestador prestador, String dataNota, Qualidade qualidade) {
        this.id = id;
        this.prestador = prestador;
        this.dataNota = dataNota;
        this.qualidade = qualidade;
    }
    

    public String getDataNota() {
        return dataNota;
    }

    public void setDataNota(String dataNota) {
        this.dataNota = dataNota;
    }

    
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Prestador getPrestador() {
        return prestador;
    }

    public void setPrestador(Prestador prestador) {
        this.prestador = prestador;
    }

    public Qualidade getQualidade() {
        return qualidade;
    }

    public void setQualidade(Qualidade qualidade) {
        this.qualidade = qualidade;
    }
    
}
