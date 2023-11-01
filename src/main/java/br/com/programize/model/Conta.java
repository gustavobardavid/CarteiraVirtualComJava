package br.com.programize.model;

import java.text.SimpleDateFormat;
import java.util.Date;
//persistência
import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.MappedSuperclass;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
//anotações
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;
//interfaces
import br.com.programize.interfaces.Debitavel;
import br.com.programize.interfaces.Depositavel;
//lombok
import lombok.Getter;
import lombok.Setter;
import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;

//Super classe que agrega atributos comuns às contas
//@Audited(withModifiedFlag=true)
@MappedSuperclass
@Getter
@Setter
public abstract class Conta implements Depositavel, Debitavel {
	
	private String agencia;
	
	private int numConta;
	
	protected double saldo;
	
	private int variacao;
	
	
	@Column
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	protected int id;

	@Column(updatable=false)
	@Temporal(TemporalType.TIMESTAMP)
	@CreationTimestamp
	protected Date created;
	
	@Column(updatable=true)
	@Temporal(TemporalType.TIMESTAMP)
	@UpdateTimestamp
	protected Date updated;

	@Column
	protected boolean ativo = true;
	
	@Column
	protected String motivoInativacao;
	
	@PrePersist
    protected void onCreate() {
		updated = created = new Date();
    }

    @PreUpdate
    protected void onUpdate() {
    	updated = new Date();
    }
	
	/**
	 * retorna um timestamp de criacao do modelo no formato
	 * dd/MM/yyyy HH:mm
	 * @return
	 */
	public String getCreatedFormated() {
		return new SimpleDateFormat("dd/MM/yyyy HH:mm").format(getCreated());
	}
	
	/**
	 * retona a data de criacao no formato
	 * dd/MM/yyyy
	 * @return
	 */
	public String getCreatedDateFormated() {
		return new SimpleDateFormat("dd/MM/yyyy").format(getCreated());
	}
	
	/**
	 * retorna a hora de criacao do modelo formatado em
	 * HH:mm
	 * @return
	 */
	public String getCreatedTimeFormated() {
		return new SimpleDateFormat("HH:mm").format(getCreated());
	}
	
	/**
	 * retorna um timestamp com a atualização do modelo no formato 
	 * dd/MM/yyyy HH:mm
	 * @return
	 */
	public String getUpdatedFormated() {
		return new SimpleDateFormat("dd/MM/yyyy HH:mm").format(getUpdated());
	}
	
	/**
	 * retorna a data de atualização do modelo no formato 
	 * dd/MM/yyyy
	 * @return
	 */
	public String getUpdatedDateFormated() {
		return new SimpleDateFormat("dd/MM/yyyy").format(getUpdated());
	}
	
	/**
	 * retorna a hora de atualização do modelo no formato 
	 * HH:mm
	 * @return
	 */
	public String getUpdatedTimeFormated() {
		return new SimpleDateFormat("HH:mm").format(getUpdated());
	}
	//retorna ano seguido do mês (para codigo)
	 public String getYearMonth() {
	        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMM");
	        return sdf.format(getCreated());
	}
	 
	public boolean depositar(double valor){
        //TODO: Verificar problemas no preenchimento
        saldo += valor;
        return true;
    }


	public Conta(String agencia, int numConta, double saldo, int variacao) {
		super();
		this.agencia = agencia;
		this.numConta = numConta;
		this.saldo = saldo;
		this.variacao = variacao;
	}

	public Conta() {
		//Construtor padrão sem argumentos
	}
	
}

