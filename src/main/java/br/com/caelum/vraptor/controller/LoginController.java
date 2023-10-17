package br.com.caelum.vraptor.controller;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;

@Path("login")
@Controller
public class LoginController {

	@Get("")
	public void login() {
		
	}
	
	@Post("validausuario")
	public void validarUsuario() {
		
	}
	
}
