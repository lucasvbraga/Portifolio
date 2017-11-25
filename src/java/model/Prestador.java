/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.ArrayList;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

/**
 *
 * @author Lucas
 */
@Entity
public class Prestador {

    @Id
    @GeneratedValue
    private int id;
    @Column
    private String cpf;
    @Column
    private String nome;
    @Column
    private int rg;
    @Column
    private String uf_rg;
    @Column
    private String email;
    @Column
    private String senha;
    @Column
    private int aprovado;
    @Column
    private boolean bloqueado;
    @Column
    private boolean sexo; // true=feminino
    @Column
    private String nome_pai;
    @Column
    private String nome_mae;
    @Column
    private String data_nascimento;
    @Column
    private String celular;
    @Column
    private String data;
    
    @Column
    private int advertencia;
    @Column
    private int suspensao;
    
    


    @ManyToMany
    private List<Especialidade> especialidades;

    @OneToMany(mappedBy = "prestador", cascade = CascadeType.ALL)
    private List<Atendimento> atendimento;
    
    @OneToOne
    private PerfilPrestador perfilp;

    public Prestador(String cpf, String nome, int rg, String uf_rg, String email, String senha, int aprovado, boolean bloqueado, boolean sexo, String nome_pai, String nome_mae, String data_nascimento, String celular, String data, int advertencia, int suspencao, List<Especialidade> especialidades, List<Atendimento> atendimento, PerfilPrestador perfilp) {
        this.cpf = cpf;
        this.nome = nome;
        this.rg = rg;
        this.uf_rg = uf_rg;
        this.email = email;
        this.senha = senha;
        this.aprovado = aprovado;
        this.bloqueado = bloqueado;
        this.sexo = sexo;
        this.nome_pai = nome_pai;
        this.nome_mae = nome_mae;
        this.data_nascimento = data_nascimento;
        this.celular = celular;
        this.data = data;
        this.advertencia = advertencia;
        this.suspensao = suspencao;
        this.especialidades = especialidades;
        this.atendimento = atendimento;
        this.perfilp = perfilp;
    }

   

    
    

    
    public Prestador() {
    }

    public int getAdvertencia() {
        return advertencia;
    }

    public void setAdvertencia(int advertencia) {
        this.advertencia = advertencia;
    }

    public int getSuspensao() {
        return suspensao;
    }

    public void setSuspensao(int suspensao) {
        this.suspensao = suspensao;
    }

    public String getData() {
        return data;
    }

    public void setData(String data) {
        this.data = data;
    }
    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCpf() {
        return cpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public int getRg() {
        return rg;
    }

    public void setRg(int rg) {
        this.rg = rg;
    }

    public String getUf_rg() {
        return uf_rg;
    }

    public void setUf_rg(String uf_rg) {
        this.uf_rg = uf_rg;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }

    public int getAprovado() {
        return aprovado;
    }

    public void setAprovado(int aprovado) {
        this.aprovado = aprovado;
    }

    public boolean isBloqueado() {
        return bloqueado;
    }

    public void setBloqueado(boolean bloqueado) {
        this.bloqueado = bloqueado;
    }

    public boolean isSexo() {
        return sexo;
    }

    public void setSexo(boolean sexo) {
        this.sexo = sexo;
    }

    public String getNome_pai() {
        return nome_pai;
    }

    public void setNome_pai(String nome_pai) {
        this.nome_pai = nome_pai;
    }

    public String getNome_mae() {
        return nome_mae;
    }

    public void setNome_mae(String nome_mae) {
        this.nome_mae = nome_mae;
    }

    public String getData_nascimento() {
        return data_nascimento;
    }

    public void setData_nascimento(String data_nascimento) {
        this.data_nascimento = data_nascimento;
    }

    public String getCelular() {
        return celular;
    }

    public void setCelular(String celular) {
        this.celular = celular;
    }

   

    public List<Especialidade> getEspecialidades() {
        return especialidades;
    }

    public void setEspecialidades(List<Especialidade> especialidades) {
        this.especialidades = especialidades;
    }

    public List<Atendimento> getAtendimento() {
        return atendimento;
    }

    public void setAtendimento(List<Atendimento> atendimento) {
        this.atendimento = atendimento;
    }

    public PerfilPrestador getPerfilp() {
        return perfilp;
    }

    public void setPerfilp(PerfilPrestador perfilp) {
        this.perfilp = perfilp;
    }

}
