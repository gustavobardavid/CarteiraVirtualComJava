package br.com.programize.dao;

import java.util.List;


import javax.persistence.EntityManager;

import br.com.programize.connection.ConnectionFactory;
import br.com.programize.model.Extrato;
public class ExtratoDAO {
	
	public Extrato save(Extrato extrato) {
		EntityManager em = new ConnectionFactory().getConnection();
		
		try {
			em.getTransaction().begin();
			em.persist(extrato);
			em.getTransaction().commit();
			
		} catch (Exception e) {
			System.err.println(e);
		}finally {
			em.close();
		}
		return extrato;
	}
	
	public Extrato findById(Integer Id) {
		
		EntityManager em = new ConnectionFactory().getConnection();
		Extrato extrato = null;
		
		try {
			extrato = em.find(Extrato.class, Id);
		} catch (Exception e) {
			System.err.println(e);
		}finally {
			em.close();
		}
		return extrato;
	}
	
	public List<Extrato> findAll(){
		EntityManager em = new ConnectionFactory().getConnection();
		List<Extrato> extratos = null;
		try {
			extratos = em.createQuery("from Extrato p").getResultList();
		} catch (Exception e) {
			System.err.println(e);
		}finally{
			em.close();
		}
		return extratos;
	}
	
	public Extrato update(Extrato extrato) {
	    EntityManager em = new ConnectionFactory().getConnection();

	    try {
	        em.getTransaction().begin();
	        // Verifica se o usuário já existe no banco (se tiver um ID)
	        if (extrato.getId() > 0) {
	            // Atualiza o usuário existente no banco
	            extrato = em.merge(extrato);
	            em.getTransaction().commit();
	        }
	    } catch (Exception e) {
	        System.err.println(e);
	        em.getTransaction().rollback();
	    } finally {
	        em.close();
	    }
	    return extrato;
	}
	
	public Extrato remove(Integer Id) {
		
		EntityManager em = new ConnectionFactory().getConnection();
		Extrato extrato = null;
		try {
			extrato = em.find(Extrato.class, Id );
			em.getTransaction().begin();
			em.remove(extrato);
			em.getTransaction().commit();
		} catch (Exception e) {
			System.err.println(e);
			em.getTransaction().rollback();
		} finally {
			em.close();
		}
		return extrato;
	}
}
