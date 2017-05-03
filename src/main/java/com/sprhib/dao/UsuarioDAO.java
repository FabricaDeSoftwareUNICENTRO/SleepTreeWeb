package com.sprhib.dao;

import java.util.List;

import com.sprhib.model.Usuario;

public interface UsuarioDAO {
	
	public void addUsuario(Usuario usuario);
	public void updateUsuario(Usuario usuario);
	public Usuario getUsuario(int id);
	public void deleteUsuario(int id);
	public List<Usuario> getUsuarios();

}
