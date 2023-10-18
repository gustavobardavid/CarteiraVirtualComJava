package br.com.caelum.vraptor.controller;

import javax.inject.Inject;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.model.Usuario;

@Path("home")
@Controller
public class HomeController {
	@Inject Result result;
	
	@Get("")
	public void home(Usuario usuario) {
		result.include("usuario", usuario);
	}
}
