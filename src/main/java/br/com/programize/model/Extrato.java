package br.com.programize.model;
import lombok.Getter;
import lombok.Setter;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Getter
@Setter
@Entity
public class Extrato extends Model {
	
	private double valor;
	
	private String tipo;
	
	private int destino;
	
	// Definindo o relacionamento muitos para um com a entidade Usuario
	@ManyToOne
	@JoinColumn(name = "usuario_id")
	private Usuario usuario;
}
