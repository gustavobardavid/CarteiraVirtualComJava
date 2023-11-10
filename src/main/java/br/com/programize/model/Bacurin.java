package br.com.programize.model;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import lombok.*;

@Getter
@Setter
@Entity
public class Bacurin extends Model {
	private String nome;
	private double saldo;
	private double meta;
	// Definindo o relacionamento muitos para um com a entidade Usuario
	@ManyToOne
	@JoinColumn(name = "usuario_id")
	private Usuario usuario;
	
	public void depositar(double valor) {
		this.saldo += valor;
	}
}
