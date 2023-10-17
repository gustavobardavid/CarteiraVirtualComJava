package br.com.caelum.vraptor.model;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Usuario {
	
	@Id
	private int cpf; 
	
	private String senha;
	
	private String nome;
	
	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public int getCpf() {
		return cpf;
	}
	
	public void setCpf(int cpf) {
		this.cpf = cpf;
	}
	
	public String getSenha() {
		return senha;
	}
	public void setSenha(String senha) {
		this.senha = senha;
	}
	
}
