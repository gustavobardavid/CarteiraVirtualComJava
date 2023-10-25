package br.com.caelum.vraptor.model;

import javax.persistence.Entity;

@Entity
public class ContaCorrente extends Conta {
	
	private double taxaManutencao;
	
	private double limiteCredito;

	public double getTaxaManutencao() {
		return taxaManutencao;
	}

	public ContaCorrente(String agencia, int numConta, double saldo, int variacao, double taxaManutencao,
			double limiteCredito) {
		super(agencia, numConta, saldo, variacao);
		this.taxaManutencao = taxaManutencao;
		this.limiteCredito = limiteCredito;
	}

    public ContaCorrente() {
        // Construtor padrão sem argumentos
    }
	public void setTaxaManutencao(double taxaManutencao) {
		this.taxaManutencao = taxaManutencao;
	}
	
	public boolean sacar(double valor){
	        //TODO: Verificar as restrições
	        if(valor <= saldo+ limiteCredito){
	            saldo -= valor;
	            return true;
	        }else{
	            return false;
	        }
	 }
	    
	 public boolean transferir(Conta destino, double valor) {
	        if (valor <= getSaldo() + limiteCredito) {
	            this.sacar(valor);
	            destino.depositar(valor);
	            return true;
	        } else {
	            return false;
	        }
	  }
	    
	    public boolean aplicarTaxa(){
	        saldo -= taxaManutencao;
	        return true;
	    }
}
