package br.com.caelum.vraptor.model;

import javax.persistence.Entity;

import org.hibernate.validator.constraints.NotEmpty;

@Entity
public class Usuario extends Model {


	@NotEmpty(message="Campo cpf não pode estar vazio")
	private String cpf; 
	
	@NotEmpty(message="Campo senha não pode estar vazio")
	private String senha;
	
	@NotEmpty(message="Campo nome não pode ser vazio")
	private String nome;
	
	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getCpf() {
		return cpf;
	}

	public void setCpf(String cpf) {
		this.cpf = cpf;
	}

	public String getSenha() {
		return senha;
	}
	public void setSenha(String senha) {
		this.senha = senha;
	}
	
}
