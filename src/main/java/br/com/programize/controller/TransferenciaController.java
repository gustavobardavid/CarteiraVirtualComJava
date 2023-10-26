package br.com.programize.controller;

import java.util.List;

import javax.inject.Inject;
import javax.persistence.EntityManager;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.validator.Validator;
import br.com.programize.dao.ContaCorrenteDAO;
import br.com.programize.dao.ContaPoupancaDAO;
import br.com.programize.dao.ExtratoDAO;
import br.com.programize.dao.UsuarioDAO;
import br.com.programize.model.ContaCorrente;
import br.com.programize.model.ContaPoupanca;
import br.com.programize.model.Extrato;
import br.com.programize.model.Usuario;

@Path("transferencia")
@Controller
public class TransferenciaController {
	@Inject Result result;
	@Inject EntityManager em;
	@Inject UsuarioDAO dao;
	@Inject ExtratoDAO daoExtrato;
	@Inject Validator validator;
	@Inject ContaCorrenteDAO daoCc;
	@Inject ContaPoupancaDAO daoCp;
	@Get("")
	public void transferencia(Usuario usuario) {
		result.include("usuario", usuario);
	}
	
	@Post("validar")
	public void validarTransferencia(double valor, String agencia, int conta, int variacaoConta, int usuarioId) {
		Usuario remetente = dao.findById(usuarioId);
		Extrato extrato = new Extrato();
		if(variacaoConta == 26) {
			List<ContaCorrente> contasCorrente = daoCc.findAll();
			for (ContaCorrente contaCorrente : contasCorrente) {
				if(contaCorrente.getNumConta() == conta) {
					remetente.getContaCorrente().transferir(contaCorrente, valor);
					extrato.setValor(valor);
					extrato.setTipo("Transfencia para Conta Corrente");
					extrato.setDestino(contaCorrente.getNumConta());
					daoCc.update(contaCorrente);
				}
			}
		}
		else if (variacaoConta == 51) {
			List<ContaPoupanca> contasPoupanca = daoCp.findAll();
			for (ContaPoupanca contaPoupanca : contasPoupanca) {
				if(contaPoupanca.getNumConta() == conta) {
					remetente.getContaPoupanca().transferir(contaPoupanca, valor);
					extrato.setValor(valor);
					extrato.setTipo("Transfencia para Conta Poupanca");
					extrato.setDestino(contaPoupanca.getNumConta());
					daoCp.update(contaPoupanca);
				}
			}
		}
		//atribui ao usuario
		remetente.addExtrato(extrato);
		//atribui o usuario ao extrato
		extrato.setUsuario(remetente);
		//atualiza o usuario no banco
		dao.update(remetente);
		result.redirectTo(HomeController.class).home(remetente);
	}
}
