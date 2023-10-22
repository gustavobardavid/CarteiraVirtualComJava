package br.com.caelum.vraptor.controller;

import javax.inject.Inject;
import javax.persistence.EntityManager;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.dao.UsuarioDAO;
import br.com.caelum.vraptor.model.Usuario;
import br.com.caelum.vraptor.validator.Validator;

@Path("depositar")
@Controller
public class DepositarController {
	
	@Inject Result result;
	@Inject EntityManager em;
	@Inject UsuarioDAO dao;
	@Inject Validator validator;
	
	@Get("")
	public void depositar(Usuario usuario) {
		result.include("usuario", usuario);
	}
	
	@Post("realizarDeposito")
	public void realizarDeposito(double valorDeposito, int variacaoConta, int usuarioId) {
		Usuario usuario = null;
		usuario = dao.findById(usuarioId);
		
		if(variacaoConta == 26) {
			usuario.getContaCorrente().depositar(valorDeposito);
		}
		else if (variacaoConta == 51) {
			usuario.getContaPoupanca().depositar(valorDeposito);
		}
		dao.update(usuario);
		result.redirectTo(HomeController.class).home(usuario);
	}
}
