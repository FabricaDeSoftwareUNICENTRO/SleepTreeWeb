package com.sprhib.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sprhib.model.Usuario;
import org.hibernate.cfg.Configuration;

@Repository
public class UsuarioDAOImpl implements UsuarioDAO {

    @Autowired
    private SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();

    private Session getCurrentSession() {
        return sessionFactory.getCurrentSession();
    }

    @Override
    public void addUsuario(Usuario usuario) {
//         sessionFactory = new Configuration().configure().buildSessionFactory();
        Session session = sessionFactory.openSession();
        try {
            session.beginTransaction();
            session.save(usuario);
            session.getTransaction().commit();
        } catch (RuntimeException e) {
            
        } finally {
            session.flush();
            session.close();
            sessionFactory.close();
        }
    }

    @Override
    public void updateUsuario(Usuario usuario) {
        Usuario usuarioToUpdate = getUsuario(usuario.getCodUsuario());
        usuarioToUpdate.setNome(usuario.getNome());
        usuarioToUpdate.setEmail(usuario.getEmail());
        usuarioToUpdate.setProfissao(usuario.getProfissao());
        usuarioToUpdate.setSenha(usuario.getSenha());
        usuarioToUpdate.setUltimoLogin(usuario.getUltimoLogin());
        usuarioToUpdate.setLogado(usuario.isLogado());
        
        getCurrentSession().update(usuarioToUpdate);

    }

    @Override
    public Usuario getUsuario(int id) {
        Usuario usuario = (Usuario) getCurrentSession().get(Usuario.class, id);
        return usuario;
    }

    @Override
    public void deleteUsuario(int id) {
        Usuario usuario = getUsuario(id);
        if (usuario != null) {
            getCurrentSession().delete(usuario);
        }
    }

    @SuppressWarnings("unchecked")
    @Override
    public List<Usuario> getUsuarios() {
        Session session = sessionFactory.openSession();
        return session.createQuery("from Usuario").list();
    }
    
//     TESTANDO AS IMPLEMENTAÇÕES DO DAO, ADD E GETUSUARIOS FUNCIONANDO NORMAL.
    public static void main(String[] args) {
        UsuarioDAOImpl userDAO = new UsuarioDAOImpl();
        List<Usuario> users = userDAO.getUsuarios();
        for (Usuario user : users) {
            System.out.println(user.getNome());
        }
//        Usuario u = new Usuario("Kiko2", "kikiquinho", "lipo@kso.co", "penetrador");
//        userDAO.addUsuario(u);
    }

}
