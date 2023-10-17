package br.com.caelum.vraptor.model;

public class Usuario extends Model {
	
	private String login;
	
	private String senha;

	public String getLogin() {
		return login;
	}
	public void setLogin(String login) {
		this.login = login;
	}
	public String getSenha() {
		return senha;
	}
	public void setSenha(String senha) {
		this.senha = senha;
	}
	
}
