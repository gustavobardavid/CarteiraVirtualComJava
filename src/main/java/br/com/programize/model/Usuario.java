package br.com.programize.model;
import java.util.List;
import lombok.Getter;
import lombok.Setter;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

import org.hibernate.validator.constraints.NotEmpty;

@Getter
@Setter
@Entity
public class Usuario extends Model {


	@NotEmpty(message="{cpf}")
	private String cpf; 
	
	@NotEmpty(message="Campo senha não pode estar vazio")
	private String senha;
	
	@NotEmpty(message="Campo nome não pode ser vazio")
	private String nome;
	
	private String email;
	
	private String cidade;
	
	private String telefone;
	
	@OneToOne(cascade = CascadeType.MERGE)
	@JoinColumn(name = "conta_corrente_id")
	private ContaCorrente contaCorrente;
	
	// Anotando a coleção que representa o relacionamento um para muitos
    @OneToMany(mappedBy = "usuario", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    private List<Extrato> extratos;
	
	@OneToOne(cascade = CascadeType.MERGE)
	@JoinColumn(name = "conta_poupanca_id")
	private ContaPoupanca contaPoupanca;
	
	public boolean alterarSenha(String senhaAntiga, String senhaNova) {
		if(this.senha.equals(senhaAntiga)) {
			this.senha = senhaNova;
			return true;
		}
		return false;
	}
	public boolean addExtrato(Extrato extrato) {
		this.extratos.add(extrato);
		return true;
	}
}
