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
public class Qualidade {
    
    @Id
    @GeneratedValue
    private int id;
    @Column
    private double nota;
    @Column
    private int nivel;
    @Column
    private double xp;
    @Column
    private int qtdnegativa;
    
    @OneToOne
    private PerfilPrestador prestador;

    public Qualidade(double nota, int nivel, double xp, int qtdnegativa, PerfilPrestador prestador) {
        this.nota = nota;
        this.nivel = nivel;
        this.xp = xp;
        this.qtdnegativa = qtdnegativa;
        this.prestador = prestador;
    }

    

    public Qualidade() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getQtdnegativa() {
        return qtdnegativa;
    }

    public void setQtdnegativa(int qtdnegativa) {
        this.qtdnegativa = qtdnegativa;
    }

    
    
    public double getNota() {
        return nota;
    }

    public void setNota(double nota) {
        this.nota = nota;
    }

    public int getNivel() {
        return nivel;
    }

    public void setNivel(int nivel) {
        this.nivel = nivel;
    }

    public double getXp() {
        return xp;
    }

    public void setXp(double xp) {
        this.xp = xp;
    }

    public PerfilPrestador getPrestador() {
        return prestador;
    }

    public void setPrestador(PerfilPrestador prestador) {
        this.prestador = prestador;
    }
    
    
}
