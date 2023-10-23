package br.com.caelum.vraptor.model;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class Extrato extends Model {
	
	private double valor;
	
	private String tipo;
	
	private String destino;
	
	// Definindo o relacionamento muitos para um com a entidade Usuario
	@ManyToOne
	@JoinColumn(name = "usuario_id")
	private Usuario usuario;	

	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

	public double getValor() {
		return valor;
	}

	public void setValor(double valor) {
		this.valor = valor;
	}

	public String getTipo() {
		return tipo;
	}

	public void setTipo(String tipo) {
		this.tipo = tipo;
	}
	
	public String getDestino() {
		return destino;
	}
	
	public void setDestino(String destino) {
		this.destino = destino;
	}
	
}
