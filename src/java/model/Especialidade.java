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
import javax.persistence.ManyToMany;
import javax.persistence.OneToOne;

/**
 *
 * @author Lucas
 */
@Entity
public class Especialidade {
    @Id
    @GeneratedValue
    private int id;
    private String nome;
   
    @ManyToMany (mappedBy = "especialidades", cascade= CascadeType.ALL)
     private List<Prestador>  prest;

    

    public Especialidade(String nome) {
        this.prest = new ArrayList<>();
        this.nome = nome;
        
    }

    public Especialidade() {
    }

  

    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public List<Prestador> getPrest() {
        return prest;
    }

    public void setPrest(List<Prestador> prest) {
        this.prest = prest;
    }

    
    
    

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }
    
}
