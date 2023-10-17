package br.com.caelum.vraptor.model;

public class ContaPoupanca extends Conta {
	private double taxaJuros;
	
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
