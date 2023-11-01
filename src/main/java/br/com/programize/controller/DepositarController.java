package br.com.programize.controller;

import javax.inject.Inject;
import javax.persistence.EntityManager;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.validator.Validator;
import br.com.programize.dao.ExtratoDAO;
import br.com.programize.dao.UsuarioDAO;
import br.com.programize.model.Extrato;
import br.com.programize.model.Usuario;

@Path("depositar")
@Controller
public class DepositarController {
	
	@Inject Result result;
	@Inject EntityManager em;
	@Inject UsuarioDAO dao;
	@Inject ExtratoDAO daoExtrato;
	@Inject Validator validator;
	
	@Get("")
	public void depositar(Usuario usuario) {
		result.include("usuario", usuario);
	}
	
	@Post("realizarDeposito")
	public void realizarDeposito(double valorDeposito, int variacaoConta, int usuarioId) {
		Usuario usuario = null;
		//busca o usuario no banco
		usuario = dao.findById(usuarioId);
		//deposita na cc caso a escolha seja na cc
		//cria uma nova instancia de extrato
		Extrato extrato = new Extrato();
		extrato.setValor(valorDeposito);
		if(variacaoConta == 26) {
			usuario.getContaCorrente().depositar(valorDeposito);
			//seta o tipo caso o deposito seja na cc
			extrato.setTipo("Depósito Conta Corrente");
		}
		//deposita na cp caso a escolha seja cp
		else if (variacaoConta == 51) {
			usuario.getContaPoupanca().depositar(valorDeposito);
			//seta o tipo caso o deposito seja na poupança
			extrato.setTipo("Depósito Conta Poupança");
		}
		//atribui ao usuario
		usuario.addExtrato(extrato);
		//atribui o usuario ao extrato
		extrato.setUsuario(usuario);
		//atualiza o usuario no banco
		dao.update(usuario);
		//redireciona para o controller
		result.redirectTo(HomeController.class).home(usuario);
	}
}
