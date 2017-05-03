/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sprhib.dao;

import com.sprhib.model.Area;
import java.util.List;

/**
 *
 * @author joao
 */
public interface AreaDAO {
        public void addArea(Area area);
	public void updateArea(Area area);
	public Area getArea(int id);
	public void deleteArea(int id);
	public List<Area> getAreas();

}
