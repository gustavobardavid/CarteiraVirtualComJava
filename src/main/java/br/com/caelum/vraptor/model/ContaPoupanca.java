package br.com.caelum.vraptor.model;

import javax.persistence.Entity;

@Entity
public class ContaPoupanca extends Conta {
	
	private double taxaJuros;
	
	public ContaPoupanca(String agencia, String numConta, double saldo, int variacao, double taxaJuros) {
		super(agencia, numConta, saldo, variacao);
		this.taxaJuros = taxaJuros;
	}
	
	 public ContaPoupanca() {
	        // Construtor padrão sem argumentos
	    }

	public boolean sacar(double valor) {
	        //TODO: verificar as restrições
	        if(valor <= saldo){
	            saldo -= valor;
	            return true;
	        }else{
	            return false;
	        }
	}
	
    public boolean transferir(Conta destino, double valor) {
        if (valor <= getSaldo()) {
            this.sacar(valor);
            destino.depositar(valor);
            return true;
        } else {
            return false;
        }
    }
}
