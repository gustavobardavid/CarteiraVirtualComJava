package br.com.programize.dao;

import java.util.List;

import javax.persistence.EntityManager;

import br.com.programize.connection.ConnectionFactory;
import br.com.programize.model.ContaCorrente;
import br.com.programize.model.Usuario;

public class ContaCorrenteDAO {
	
	public ContaCorrente save(ContaCorrente contaCorrente) {
		EntityManager em = new ConnectionFactory().getConnection();
		
		try {
			em.getTransaction().begin();
			em.persist(contaCorrente);
			em.getTransaction().commit();
			
		} catch (Exception e) {
			System.err.println(e);
		}finally {
			em.close();
		}
		return contaCorrente;
	}
	
	public ContaCorrente findById(Integer Id) {
		
		EntityManager em = new ConnectionFactory().getConnection();
		ContaCorrente contaCorrente = null;
		
		try {
			contaCorrente = em.find(ContaCorrente.class, Id);
		} catch (Exception e) {
			System.err.println(e);
		}finally {
			em.close();
		}
		return contaCorrente;
	}
	public ContaCorrente update(ContaCorrente contaCorrente) {
	    EntityManager em = new ConnectionFactory().getConnection();

	    try {
	        em.getTransaction().begin();
	        // Verifica se o usuário já existe no banco (se tiver um ID)
	        if (contaCorrente.getId() > 0) {
	            // Atualiza o usuário existente no banco
	            contaCorrente = em.merge(contaCorrente);
	            em.getTransaction().commit();
	        }
	    } catch (Exception e) {
	        System.err.println(e);
	        em.getTransaction().rollback();
	    } finally {
	        em.close();
	    }
	    return contaCorrente;
	}
	public List<ContaCorrente> findAll(){
		EntityManager em = new ConnectionFactory().getConnection();
		List<ContaCorrente> contaCorrentes = null;
		try {
			contaCorrentes = em.createQuery("from ContaCorrente p").getResultList();
		} catch (Exception e) {
			System.err.println(e);
		}finally{
			em.close();
		}
		return contaCorrentes;
	}
	
	public ContaCorrente remove(Integer Id) {
		
		EntityManager em = new ConnectionFactory().getConnection();
		ContaCorrente contaCorrente = null;
		try {
			contaCorrente = em.find(ContaCorrente.class, Id );
			em.getTransaction().begin();
			em.remove(contaCorrente);
			em.getTransaction().commit();
		} catch (Exception e) {
			System.err.println(e);
			em.getTransaction().rollback();
		} finally {
			em.close();
		}
		return contaCorrente;
	}

}
