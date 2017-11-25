/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

/**
 *
 * @author Lucas
 */
@Entity
public class Gerente {
    
    @Id
    @GeneratedValue
    private int id;
    private String cpf;
    private String nome;
    private String email;
    private String data_nascimento;
    private String senha;
    private boolean sexo; //true=feminino

    public Gerente(String cpf, String nome, String email, String data_nascimento, String senha, boolean sexo) {
        this.cpf = cpf;
        this.nome = nome;
        this.email = email;
        this.data_nascimento = data_nascimento;
        this.senha = senha;
        this.sexo = sexo;
    }

    public Gerente() {
    }

   

    public String getCpf() {
        return cpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    

    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getData_nascimento() {
        return data_nascimento;
    }

    public void setData_nascimento(String data_nascimento) {
        this.data_nascimento = data_nascimento;
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
