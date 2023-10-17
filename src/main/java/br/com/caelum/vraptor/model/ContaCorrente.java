package br.com.caelum.vraptor.model;

public class ContaCorrente extends Conta {
	
	private double taxaManutencao;
	
	private double limiteCredito;

	public double getTaxaManutencao() {
		return taxaManutencao;
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
