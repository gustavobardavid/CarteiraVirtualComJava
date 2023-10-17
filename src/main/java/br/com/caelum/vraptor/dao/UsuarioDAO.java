package br.com.caelum.vraptor.dao;

import java.util.List;


import javax.persistence.EntityManager;

import br.com.caelum.vraptor.connection.ConnectionFactory;
import br.com.caelum.vraptor.model.Usuario;
public class UsuarioDAO {
	
	public Usuario save(Usuario Usuario) {
		EntityManager em = new ConnectionFactory().getConnection();
		
		try {
			em.getTransaction().begin();
			em.persist(Usuario);
			em.getTransaction().commit();
			
		} catch (Exception e) {
			System.err.println(e);
		}finally {
			em.close();
		}
		return Usuario;
	}
	
	public Usuario findById(Integer Id) {
		
		EntityManager em = new ConnectionFactory().getConnection();
		Usuario Usuario = null;
		
		try {
			Usuario = em.find(Usuario.class, Id);
		} catch (Exception e) {
			System.err.println(e);
		}finally {
			em.close();
		}
		return Usuario;
	}
	
	public List<Usuario> findAll(){
		EntityManager em = new ConnectionFactory().getConnection();
		List<Usuario> Usuarios = null;
		try {
			Usuarios = em.createQuery("from Usuario p").getResultList();
		} catch (Exception e) {
			System.err.println(e);
		}finally{
			em.close();
		}
		return Usuarios;
	}
	
	public Usuario remove(Integer Id) {
		
		EntityManager em = new ConnectionFactory().getConnection();
		Usuario Usuario = null;
		try {
			Usuario = em.find(Usuario.class, Id );
			em.getTransaction().begin();
			em.remove(Usuario);
			em.getTransaction().commit();
		} catch (Exception e) {
			System.err.println(e);
			em.getTransaction().rollback();
		} finally {
			em.close();
		}
		return Usuario;
	}
}
