package br.com.caelum.vraptor.model;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

import org.hibernate.validator.constraints.NotEmpty;

@Entity
public class Usuario extends Model {


	@NotEmpty(message="Campo cpf não pode estar vazio")
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
	
	public List<Extrato> getExtratos() {
		return extratos;
	}
	
	public boolean alterarSenha(String senhaAntiga, String senhaNova) {
		if(this.senha.equals(senhaAntiga)) {
			this.senha = senhaNova;
			return true;
		}
		return false;
	}
	
	public void setExtratos(List<Extrato> extratos) {
		this.extratos = extratos;
	}
	
	public boolean addExtrato(Extrato extrato) {
		this.extratos.add(extrato);
		return true;
	}

	public ContaCorrente getContaCorrente() {
		return contaCorrente;
	}

	public void setContaCorrente(ContaCorrente contaCorrente) {
		this.contaCorrente = contaCorrente;
	}

	public ContaPoupanca getContaPoupanca() {
		return contaPoupanca;
	}

	public void setContaPoupanca(ContaPoupanca contaPoupanca) {
		this.contaPoupanca = contaPoupanca;
	}

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

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getCidade() {
		return cidade;
	}

	public void setCidade(String cidade) {
		this.cidade = cidade;
	}

	public String getTelefone() {
		return telefone;
	}

	public void setTelefone(String telefone) {
		this.telefone = telefone;
	}
	
}
