/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sprhib.model;


import org.hibernate.*;
import org.hibernate.cfg.Configuration;


/**
 *
 * @author Fedacz
 */
public class teste {
    public static void main(String[] args) {

    SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
    Session session = sessionFactory.openSession();
    Usuario u1 = new Usuario("asd", "s", "asd","dsad");
  
    Area a1 = new Area("asa", "d", "f", "ff");
    Area a2 = new Area("adsfdsfdsa", "d", "r", "gg");
    Area a3 = new Area("a5465", "d", "r", "gg");
    Area a4 = new Area("sfdsa", "d", "r", "gg");
    Usuario u2 = new Usuario("sssss", "s", "asd","dsad");
    Temperatura t1 = new Temperatura(25, 4, 5);
    Temperatura t2 = new Temperatura(25, 4, 5);
    Tipo tt1 = new Tipo("utah");
    Unidade un1 = new Unidade(65456);
     
    a1.setUsuario(u1);
    a2.setUsuario(u1);
    a3.setUsuario(u1);
    a4.setUsuario(u2);
    t1.setArea(a1);
    t2.setArea(a2);
    tt1.setArea(a1);
    un1.setTipo(tt1);
    

    
     session.beginTransaction();
     session.save(u1);
     session.save(u2);
    session.save(a1);
    session.save(a2);
    session.save(a3);
    session.save(a4);
    session.save(t1);
    session.save(t2);
    session.save(tt1);
    session.save(un1);
    
    

   session.getTransaction().commit();
session.close();
sessionFactory.close();


    }
    


}
