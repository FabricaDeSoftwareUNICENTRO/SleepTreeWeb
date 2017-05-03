/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sprhib.model;

import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Embeddable;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;


/**
 *
 * @author Fedacz
 */
@Entity

public class Tipo {
    @Id @GeneratedValue(strategy= GenerationType.IDENTITY)
    private int codTipo;
    private String nome;
    @ManyToOne
    @JoinColumn(name="codArea")
    private Area area;
    @OneToMany(mappedBy = "tipo", targetEntity = Unidade.class,fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    private List<Unidade> unidades;

    public Tipo(String nome) {
       
        this.nome = nome;
        
    }
    
    

    /**
     * @return the codTipo
     */
    public int getCodTipo() {
        return codTipo;
    }

    /**
     * @param codTipo the codTipo to set
     */
    public void setCodTipo(int codTipo) {
        this.codTipo = codTipo;
    }

    /**
     * @return the nome
     */
    public String getNome() {
        return nome;
    }

    /**
     * @param nome the nome to set
     */
    public void setNome(String nome) {
        this.nome = nome;
    }

    /**
     * @return the area
     */
    public Area getArea() {
        return area;
    }

    /**
     * @param area the area to set
     */
    public void setArea(Area area) {
        this.area = area;
    }

    /**
     * @return the unidades
     */
    public List<Unidade> getUnidades() {
        return unidades;
    }

    /**
     * @param unidades the unidades to set
     */
    public void setUnidades(List<Unidade> unidades) {
        this.unidades = unidades;
    }
   
    
}
