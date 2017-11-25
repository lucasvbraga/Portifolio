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
public class Agendado extends Atendimento {
    @Column
    private int tipo;
    @Column
    private String descricao;
    @Column
    private String data_marcada;
    @Column
    private double valor;
    @Column
    private String especialidade;
    
    @OneToOne
    private SolicitacaoAgendado solicitacao;
    @Column
    private int status;
    @Column
    private String data;
    @Column
    private String hora_marcada;
    @Column
    private String periodico;
    @Column
    private String endereco;
    @Column
    private String latlong;

    public Agendado() {
    }

    public Agendado(int tipo, String descricao, String data_marcada, double valor, String especialidade, SolicitacaoAgendado solicitacao, int status, String data, String hora_marcada, String periodico, String endereco, String latlong, Prestador prestador, Cliente cliente, int id_cliente) {
        super(prestador, cliente, id_cliente);
        this.tipo = tipo;
        this.descricao = descricao;
        this.data_marcada = data_marcada;
        this.valor = valor;
        this.especialidade = especialidade;
        this.solicitacao = solicitacao;
        this.status = status;
        this.data = data;
        this.hora_marcada = hora_marcada;
        this.periodico = periodico;
        this.endereco = endereco;
        this.latlong = latlong;
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

    

    
    
    public int getTipo() {
        return tipo;
    }

    public void setTipo(int tipo) {
        this.tipo = tipo;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public String getData_marcada() {
        return data_marcada;
    }

    public void setData_marcada(String data_marcada) {
        this.data_marcada = data_marcada;
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

    public SolicitacaoAgendado getSolicitacao() {
        return solicitacao;
    }

    public void setSolicitacao(SolicitacaoAgendado solicitacao) {
        this.solicitacao = solicitacao;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getData() {
        return data;
    }

    public void setData(String data) {
        this.data = data;
    }

    public String getHora_marcada() {
        return hora_marcada;
    }

    public void setHora_marcada(String hora_marcada) {
        this.hora_marcada = hora_marcada;
    }

    public String getPeriodico() {
        return periodico;
    }

    public void setPeriodico(String periodico) {
        this.periodico = periodico;
    }

   
   

}
