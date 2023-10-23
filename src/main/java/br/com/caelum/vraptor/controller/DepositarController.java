package br.com.caelum.vraptor.controller;

import javax.inject.Inject;
import javax.persistence.EntityManager;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.dao.ExtratoDAO;
import br.com.caelum.vraptor.dao.UsuarioDAO;
import br.com.caelum.vraptor.model.Extrato;
import br.com.caelum.vraptor.model.Usuario;
import br.com.caelum.vraptor.validator.Validator;

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
		if(variacaoConta == 26) {
			usuario.getContaCorrente().depositar(valorDeposito);
		}
		//deposita na cp caso a escolha seja cp
		else if (variacaoConta == 51) {
			usuario.getContaPoupanca().depositar(valorDeposito);
		}
		//cria uma nova instancia de extrato
		Extrato extrato = new Extrato();
		//seta os valores
		extrato.setValor(valorDeposito);
		extrato.setTipo("deposito");
		//atribui ao usuario
		usuario.addExtrato(extrato);
		//atualiza o usuario no banco
		dao.update(usuario);
		daoExtrato.save(extrato);
		//redireciona para o controller
		result.redirectTo(HomeController.class).home(usuario);
	}
}
