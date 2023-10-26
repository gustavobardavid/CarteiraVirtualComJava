package br.com.programize.model;
import javax.persistence.Entity;
import lombok.Getter;
import lombok.Setter;
import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;

@Getter
@Setter
@Entity
public class ContaCorrente extends Conta {
	
	private double taxaManutencao;
	
	private double limiteCredito;
	
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
	     }else {
	    	 return false;
	     }
	 }
	    
	  public boolean aplicarTaxa(){
	      saldo -= taxaManutencao;
	      return true;
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
}
