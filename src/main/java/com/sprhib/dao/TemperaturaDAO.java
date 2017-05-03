/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sprhib.dao;

import com.sprhib.model.Temperatura;
import java.util.List;

/**
 *
 * @author joao
 */
public interface TemperaturaDAO {
    public void addTemperatura(Temperatura temperatura);
	public void updateTemperatura(Temperatura temperatura);
	public Temperatura getTemperatura(int id);
	public void deleteTemperatura(int id);
	public List<Temperatura> getTemperaturas();
}
