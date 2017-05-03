/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sprhib.dao;

import com.sprhib.model.Temperatura;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 *
 * @author joao
 */
@Repository
public class TemperaturaDAOImpl implements TemperaturaDAO {

    @Autowired
    private SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();

    private Session getCurrentSession() {
        return sessionFactory.getCurrentSession();
    }

    @Override
    public void addTemperatura(Temperatura temperatura) {
        Session session = sessionFactory.openSession();
        try {
            session.beginTransaction();
            session.save(temperatura);
            session.getTransaction().commit();
        } catch (RuntimeException e) {

        } finally {
            session.flush();
            session.close();
            sessionFactory.close();
        }
    }

    @Override
    public void updateTemperatura(Temperatura temperatura) {
        Temperatura temperaturaToUpdate = getTemperatura(temperatura.getCodTemp());
        temperaturaToUpdate.setArea(temperatura.getArea());
        temperaturaToUpdate.setCodTemperatura(temperatura.getCodTemperatura());
        temperaturaToUpdate.setHora6(temperatura.getHora6());
        temperaturaToUpdate.setHora15(temperatura.getHora15());
        temperaturaToUpdate.setHora21(temperatura.getHora21());

        getCurrentSession().update(temperaturaToUpdate);
    }

    @Override
    public Temperatura getTemperatura(int id) {
        Temperatura temperatura = (Temperatura) getCurrentSession().get(Temperatura.class, id);
        return temperatura;
    }

    @Override
    public void deleteTemperatura(int id) {
        Temperatura temperatura = getTemperatura(id);
        if (temperatura != null) {
            getCurrentSession().delete(temperatura);
        }
    }

    @SuppressWarnings("unchecked")
    @Override
    public List<Temperatura> getTemperaturas() {
        Session session = sessionFactory.openSession();
        return session.createQuery("from Temperatura").list();
    }

    // Pegar uma temperatura atraves de uma área
    
}
