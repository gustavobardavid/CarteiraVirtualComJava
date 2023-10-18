package br.com.caelum.vraptor.dao;

import java.util.List;

import javax.persistence.EntityManager;

import br.com.caelum.vraptor.connection.ConnectionFactory;
import br.com.caelum.vraptor.model.ContaCorrente;

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
