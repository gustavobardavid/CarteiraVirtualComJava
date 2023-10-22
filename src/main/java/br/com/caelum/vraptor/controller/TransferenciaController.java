package br.com.caelum.vraptor.controller;

import javax.inject.Inject;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.model.Usuario;

@Path("transferencia")
@Controller
public class TransferenciaController {
	@Inject Result result;
	@Get("")
	public void transferencia(Usuario usuario) {
		result.include("usuario", usuario);
	}
}
