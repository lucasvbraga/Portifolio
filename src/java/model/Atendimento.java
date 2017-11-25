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
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;

/**
 *
 * @author Lucas
 */
@Entity
@Inheritance(strategy = InheritanceType.JOINED )
public abstract class  Atendimento {
    
    @Id
    @GeneratedValue
    private int codigo;
    
    
    @ManyToOne 
    private Prestador prestador;
    
    @ManyToOne
    private Cliente cliente;
    
    @Column
    private int id_cliente;
   
    
    

    public Atendimento(Prestador prestador, Cliente cliente, int id_cliente ) {
        this.prestador = prestador;
        this.cliente = cliente;
        this.id_cliente = id_cliente;
        
    }

    
    public int getCodigo() {
        return codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    public Prestador getPrestador() {
        return prestador;
    }

    public void setPrestador(Prestador prestador) {
        this.prestador = prestador;
    }

    public Cliente getCliente() {
        return cliente;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }

    public int getId_cliente() {
        return id_cliente;
    }

    public void setId_cliente(int id_cliente) {
        this.id_cliente = id_cliente;
    }

    

    
    
    
    
    public Atendimento(){};
    
    
    
    
    
    
   
    
}
