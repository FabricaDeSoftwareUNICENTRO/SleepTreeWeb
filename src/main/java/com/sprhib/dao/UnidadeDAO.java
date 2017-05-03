/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sprhib.dao;

import com.sprhib.model.Unidade;
import java.util.List;

/**
 *
 * @author joao
 */
public interface UnidadeDAO {
    public void addUnidade(Unidade unidade);
    public void updateUnidade(Unidade unidade);
    public Unidade getUnidade(int id);
    public void deleteUnidade(int id);
    public List<Unidade> getUnidade();
}
