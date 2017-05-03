/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sprhib.dao;

import com.sprhib.model.Unidade;
import com.sprhib.model.Usuario;
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
public class UnidadeDAOImpl implements UnidadeDAO {

    @Autowired
    private SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();

    private Session getCurrentSession() {
        return sessionFactory.getCurrentSession();
    }

    @Override
    public void addUnidade(Unidade unidade) {
        Session session = sessionFactory.openSession();
        try {
            session.beginTransaction();
            session.save(unidade);
            session.getTransaction().commit();
        } catch (RuntimeException e) {

        } finally {
            session.flush();
            session.close();
            sessionFactory.close();
        }
    }

    @Override
    public void updateUnidade(Unidade unidade) {
        Unidade unidadeToUpdate = getUnidade(unidade.getCodUnidade());
        unidadeToUpdate.setTotalUnidade(unidade.getTotalUnidade());
        getCurrentSession().update(unidadeToUpdate);
    }

    @Override
    public Unidade getUnidade(int id) {
        Unidade unidade = (Unidade) getCurrentSession().get(Unidade.class, id);
        return unidade;
    }

    @Override
    public void deleteUnidade(int id) {
        Unidade unidade = getUnidade(id);
        if (unidade != null) {
            getCurrentSession().delete(unidade);
        }
    }
    
    @SuppressWarnings("unchecked")
    @Override
    public List<Unidade> getUnidade() {
        Session session = sessionFactory.openSession();
        return session.createQuery("from Unidade").list();
    }

}
