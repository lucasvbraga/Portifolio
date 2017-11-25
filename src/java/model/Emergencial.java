/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.OneToOne;

/**
 *
 * @author Lucas
 */
@Entity
public class Emergencial extends Atendimento {
    
    @Column
    private int tipo;
    @Column
    private String data;
    @Column    
    private double valor;
    @Column
    private String especialidade;
    
    @OneToOne
    private SolicitacaoEmergencial solicitacao;
    @Column
    private int status;
    @Column
    private String descricao;
    @Column
    private String endereco;
    @Column
    private String latlong;

    public Emergencial(int tipo, String data, double valor, String especialidade, SolicitacaoEmergencial solicitacao, int status, String descricao, String endereco, String latlong, Prestador prestador, Cliente cliente, int id_cliente) {
        super(prestador, cliente, id_cliente);
        this.tipo = tipo;
        this.data = data;
        this.valor = valor;
        this.especialidade = especialidade;
        this.solicitacao = solicitacao;
        this.status = status;
        this.descricao = descricao;
        this.endereco = endereco;
        this.latlong = latlong;
    }

    
    
    public SolicitacaoEmergencial getSolicitacao() {
        return solicitacao;
    }

    public void setSolicitacao(SolicitacaoEmergencial solicitacao) {
        this.solicitacao = solicitacao;
    }

    public String getEndereco() {
        return endereco;
    }

    public void setEndereco(String endereco) {
        this.endereco = endereco;
    }

    public String getLatlong() {
        return latlong;
    }

    public void setLatlong(String latlong) {
        this.latlong = latlong;
    }

    
    
    
    

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    

    

    

    
    
    
    
    
    public int getTipo() {
        return tipo;
    }

    public void setTipo(int tipo) {
        this.tipo = tipo;
    }

    public String getData() {
        return data;
    }

    public void setData(String data) {
        this.data = data;
    }

    

    public double getValor() {
        return valor;
    }

    public void setValor(double valor) {
        this.valor = valor;
    }

    public String getEspecialidade() {
        return especialidade;
    }

    public void setEspecialidade(String especialidade) {
        this.especialidade = especialidade;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    

    public Emergencial() {
    }
;

}
