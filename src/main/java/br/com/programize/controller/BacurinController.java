package br.com.programize.controller;

import java.util.Set;

import javax.inject.Inject;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Result;
import br.com.programize.dao.UsuarioDAO;
import br.com.programize.model.Bacurin;
import br.com.programize.model.Usuario;

@Path("bacurin")
@Controller
public class BacurinController {
	@Inject Result result;
	@Inject UsuarioDAO dao;
	@Get("")
	public void bacurin(int id) {
		Usuario usuario = dao.findById(id)	;
		Set<Bacurin> bacurins = usuario.getBacurins();
		result.include("bacurins", bacurins);
		result.include("id", id);
	}
	
	@Post("salvarBacurin")
	public void salvarBacurin(int id, Bacurin bacurin, double valorDeposito, int variacaoConta) {
		Usuario usuario = dao.findById(id);
		if(variacaoConta == 51) {
			usuario.getContaPoupanca().sacar(valorDeposito);
		}else if (variacaoConta == 26) {
			usuario.getContaCorrente().sacar(valorDeposito);
		}
		bacurin.depositar(valorDeposito);
		usuario.addBacurin(bacurin);
		bacurin.setUsuario(usuario);
		dao.update(usuario);
		result.redirectTo(this).bacurin(id);
	}
}
