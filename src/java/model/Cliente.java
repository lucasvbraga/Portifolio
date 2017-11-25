/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.ArrayList;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

/**
 *
 * @author Lucas
 */
@Entity
public class Cliente {

    @Id
    @GeneratedValue
    private int id;
    private String cpf;
    private String nome;
    private String data_nascimento;
    private String email;
    private String senha;
    private String data;
    private boolean sexo; //true=feminino / false==masculino

    @OneToOne
    private PerfilCliente perfilc;

    @OneToMany(mappedBy = "cliente", cascade = CascadeType.ALL)    
    private List<Atendimento> atendimento ;

    public Cliente(String cpf, String nome, String data_nascimento, String email, String senha, String data, boolean sexo, PerfilCliente perfilc, List<Atendimento> atendimento) {
        this.cpf = cpf;
        this.nome = nome;
        this.data_nascimento = data_nascimento;
        this.email = email;
        this.senha = senha;
        this.data = data;
        this.sexo = sexo;
        this.perfilc = perfilc;
        this.atendimento = atendimento;
    }

    
    
    

    public Cliente() {
    }

    public String getData() {
        return data;
    }

    public void setData(String data) {
        this.data = data;
    }

    
    public List<Atendimento> getAtendimento() {
        return atendimento;
    }

    public void setAtendimento(List<Atendimento> atendimento) {
        this.atendimento = atendimento;
    }
    
    public PerfilCliente getPerfilc() {
        return perfilc;
    }

    public void setPerfilc(PerfilCliente perfilc) {
        this.perfilc = perfilc;
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

    public String getData_nascimento() {
        return data_nascimento;
    }

    public void setData_nascimento(String data_nascimento) {
        this.data_nascimento = data_nascimento;
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

    public boolean isSexo() {
        return sexo;
    }

    public void setSexo(boolean sexo) {
        this.sexo = sexo;
    }

}
