package br.com.programize.dao;

import java.util.List;

import javax.persistence.EntityManager;

import br.com.programize.connection.ConnectionFactory;
import br.com.programize.model.ContaCorrente;
import br.com.programize.model.ContaPoupanca;

public class ContaPoupancaDAO {
	
	public ContaPoupanca save(ContaPoupanca contaPoupanca) {
		EntityManager em = new ConnectionFactory().getConnection();
		
		try {
			em.getTransaction().begin();
			em.persist(contaPoupanca);
			em.getTransaction().commit();
			
		} catch (Exception e) {
			System.err.println(e);
		}finally {
			em.close();
		}
		return contaPoupanca;
	}
	
	public ContaPoupanca findById(Integer Id) {
		
		EntityManager em = new ConnectionFactory().getConnection();
		ContaPoupanca contaPoupanca = null;
		
		try {
			contaPoupanca = em.find(ContaPoupanca.class, Id);
		} catch (Exception e) {
			System.err.println(e);
		}finally {
			em.close();
		}
		return contaPoupanca;
	}
	
	public List<ContaPoupanca> findAll(){
		EntityManager em = new ConnectionFactory().getConnection();
		List<ContaPoupanca> contaPoupancas = null;
		try {
			contaPoupancas = em.createQuery("from ContaPoupanca p").getResultList();
		} catch (Exception e) {
			System.err.println(e);
		}finally{
			em.close();
		}
		return contaPoupancas;
	}
	
	public ContaPoupanca update(ContaPoupanca contaPoupanca) {
	    EntityManager em = new ConnectionFactory().getConnection();

	    try {
	        em.getTransaction().begin();
	        // Verifica se o usuário já existe no banco (se tiver um ID)
	        if (contaPoupanca.getId() > 0) {
	            // Atualiza o usuário existente no banco
	            contaPoupanca = em.merge(contaPoupanca);
	            em.getTransaction().commit();
	        }
	    } catch (Exception e) {
	        System.err.println(e);
	        em.getTransaction().rollback();
	    } finally {
	        em.close();
	    }
	    return contaPoupanca;
	}
	
	public ContaPoupanca remove(Integer Id) {
		
		EntityManager em = new ConnectionFactory().getConnection();
		ContaPoupanca contaPoupanca = null;
		try {
			contaPoupanca = em.find(ContaPoupanca.class, Id );
			em.getTransaction().begin();
			em.remove(contaPoupanca);
			em.getTransaction().commit();
		} catch (Exception e) {
			System.err.println(e);
			em.getTransaction().rollback();
		} finally {
			em.close();
		}
		return contaPoupanca;
	}

}
