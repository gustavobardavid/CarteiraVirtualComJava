package br.com.programize.model;

import javax.persistence.Entity;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
public class ContaPoupanca extends Conta {
	
	private double taxaJuros;
	
	public ContaPoupanca(String agencia, int numConta, double saldo, int variacao, double taxaJuros) {
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
