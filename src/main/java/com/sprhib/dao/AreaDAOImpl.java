/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sprhib.dao;

import com.sprhib.model.Area;
import java.util.ArrayList;
import java.util.List;



import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.hibernate.cfg.Configuration;

/**
 *
 * @author joao
 */
@Repository
public class AreaDAOImpl implements AreaDAO{

    @Autowired
    private SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();

    private Session getCurrentSession() {
        return sessionFactory.getCurrentSession();
    }
    
    @Override
    public void addArea(Area area) {
        Session session = sessionFactory.openSession();
        try {
            session.beginTransaction();
            session.save(area);
            session.getTransaction().commit();
        } catch (RuntimeException e) {
            
        } finally {
            session.flush();
            session.close();
            sessionFactory.close();
        }
    }

    @Override
    public void updateArea(Area area) {
        Area areaToUpdate = getArea(area.getCodArea());
        areaToUpdate.setNomeArea((area.getNomeArea()));
        areaToUpdate.setDescArea(area.getDescArea());
        areaToUpdate.setLocalArea(area.getLocalArea());
        areaToUpdate.setTipoArea(area.getTipoArea());
  
        getCurrentSession().update(areaToUpdate);
    }

    @Override
    public Area getArea(int id) {
        Area area = (Area) getCurrentSession().get(Area.class, id);
        return area;
        
    }

    @Override
    public void deleteArea(int id) {
        Area area = getArea(id);
        if (area != null) {
            getCurrentSession().delete(area);
        }
    }

    @Override
    public List<Area> getAreas() {
        Session session = sessionFactory.openSession();
        return session.createQuery("from Area").list();
    }
    
    // criando uma lista para utilizar no JSP
    public ArrayList<Area> areasCombo;

    /**
     * @return the areasCombo
     */
    public ArrayList<Area> getAreasCombo() {
        return areasCombo;
    }
        // TESTANDO AS IMPLEMENTAÇÕES DO DAO, ADD E GETUSUARIOS FUNCIONANDO NORMAL.
//    public static void main(String[] args) {
//        AreaDAOImpl areaDAO = new AreaDAOImpl();
//        List<Area> areas = areaDAO.getAreas();
//        for (Area area : areas) {
//            System.out.println(area.getNomeArea());
//        }
//    }
    
}
