/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sprhib.model;

import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;


/**
 * PROVALVEMENTE TEM ALGUM ERRO
 * @author Fedacz
 */
@Entity
public class Area {
    @Id @GeneratedValue(strategy= GenerationType.IDENTITY)
    private int codArea;
    private String nomeArea;
    private String descArea;
    private String localArea;
    private String tipoArea;
    @ManyToOne
    @JoinColumn(name="codUsuario")
    private Usuario usuario;
    @OneToMany(mappedBy = "area", targetEntity = Temperatura.class,fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    private List<Temperatura> temperaturas;
    @OneToMany(mappedBy = "area", targetEntity = Tipo.class,fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    private List<Tipo> tipos;

    public Area() {
    }
    


    public Area(String nomeArea, String descArea, String localArea, String tipoArea) {   
        this.nomeArea = nomeArea;
        this.descArea = descArea;
        this.localArea = localArea;
        this.tipoArea = tipoArea;
    }

    public Area(String nomeArea, String descArea, String localArea, String tipoArea, Usuario usuario) {
        this.nomeArea = nomeArea;
        this.descArea = descArea;
        this.localArea = localArea;
        this.tipoArea = tipoArea;
        this.usuario = usuario;
    }

  
    
    

    

    /**
     * @return the codArea
     */
    public int getCodArea() {
        return codArea;
    }

    /**
     * @param codArea the codArea to set
     */
    public void setCodArea(int codArea) {
        this.codArea = codArea;
    }

    /**
     * @return the codUsuario
     */
   

    /**
     * @return the nomeArea
     */
    public String getNomeArea() {
        return nomeArea;
    }

    /**
     * @param nomeArea the nomeArea to set
     */
    public void setNomeArea(String nomeArea) {
        this.nomeArea = nomeArea;
    }

    /**
     * @return the descArea
     */
    public String getDescArea() {
        return descArea;
    }

    /**
     * @param descArea the descArea to set
     */
    public void setDescArea(String descArea) {
        this.descArea = descArea;
    }

    /**
     * @return the localArea
     */
    public String getLocalArea() {
        return localArea;
    }

    /**
     * @param localArea the localArea to set
     */
    public void setLocalArea(String localArea) {
        this.localArea = localArea;
    }

    /**
     * @return the tipoArea
     */
    public String getTipoArea() {
        return tipoArea;
    }

    /**
     * @param tipoArea the tipoArea to set
     */
    public void setTipoArea(String tipoArea) {
        this.tipoArea = tipoArea;
    }

    /**
     * @return the usuario
     */
    public Usuario getUsuario() {
        return usuario;
    }

    /**
     * @param usuario the usuario to set
     */
    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }
    
}
