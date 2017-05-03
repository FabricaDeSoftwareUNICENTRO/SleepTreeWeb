/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sprhib.model;

import java.util.GregorianCalendar;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;


/**
 *
 * @author joao
 */

@Entity
@Table(name = "usuario")
public class Usuario {  
    @Id @GeneratedValue(strategy= GenerationType.IDENTITY)
    private int codUsuario;
    private String nome;
    private String senha;
    private String email;
    private String profissao;
    private boolean logado;
    private GregorianCalendar ultimoLogin;
    @OneToMany(mappedBy = "usuario", targetEntity = Area.class,fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    private List<Area> areas;

    public Usuario() {
    }

  
    
    

    public Usuario(String nome, String senha, String email, String profissao) {
        this.nome = nome;
        this.senha = senha;
        this.email = email;
        this.profissao = profissao;
    }

    
    

    /**
     * @return the codUsuario
     */
    public int getCodUsuario() {
        return codUsuario;
    }

    /**
     * @param codUsuario the codUsuario to set
     */
    public void setCodUsuario(int codUsuario) {
        this.codUsuario = codUsuario;
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
     * @return the senha
     */
    public String getSenha() {
        return senha;
    }

    /**
     * @param senha the senha to set
     */
    public void setSenha(String senha) {
        this.senha = senha;
    }

    /**
     * @return the email
     */
    public String getEmail() {
        return email;
    }

    /**
     * @param email the email to set
     */
    public void setEmail(String email) {
        this.email = email;
    }

    /**
     * @return the profissao
     */
    public String getProfissao() {
        return profissao;
    }

    /**
     * @param profissao the profissao to set
     */
    public void setProfissao(String profissao) {
        this.profissao = profissao;
    }

    /**
     * @return the logado
     */
    public boolean isLogado() {
        return logado;
    }

    /**
     * @param logado the logado to set
     */
    public void setLogado(boolean logado) {
        this.logado = logado;
    }

    /**
     * @return the ultimoLogin
     */
    public GregorianCalendar getUltimoLogin() {
        return ultimoLogin;
    }

    /**
     * @param ultimoLogin the ultimoLogin to set
     */
    public void setUltimoLogin(GregorianCalendar ultimoLogin) {
        this.ultimoLogin = ultimoLogin;
    }

    /**
     * @return the areas
     */
    public List<Area> getAreas() {
        return areas;
    }

    /**
     * @param areas the areas to set
     */
    public void setAreas(List<Area> areas) {
        this.areas = areas;
    }

}
