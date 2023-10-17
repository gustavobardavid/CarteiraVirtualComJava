package br.com.caelum.vraptor.model;

import javax.persistence.OneToOne;

import br.com.caelum.vraptor.interfaces.Debitavel;
import br.com.caelum.vraptor.interfaces.Depositavel;


public abstract class Conta extends Model implements Depositavel, Debitavel {
	private String agencia;
	
	private String numConta;
	
	protected double saldo;
	
	private int variacao;
	
	@OneToOne
	private Usuario usuario;
	
	public boolean depositar(double valor){
        //TODO: Verificar problemas no preenchimento
        saldo += valor;
        return true;
    }
	
	public String getAgencia() {
		return agencia;
	}
	public void setAgencia(String agencia) {
		this.agencia = agencia;
	}
	public String getNumConta() {
		return numConta;
	}
	public void setNumConta(String numConta) {
		this.numConta = numConta;
	}
	public double getSaldo() {
		return saldo;
	}
	public void setSaldo(double saldo) {
		this.saldo = saldo;
	}
	public int getVariacao() {
		return variacao;
	}
	public void setVariacao(int variacao) {
		this.variacao = variacao;
	}
	public Usuario getUsuario() {
		return usuario;
	}
	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}
	
}

