package br.com.caelum.vraptor.controller;

import java.util.List;

import javax.inject.Inject;
import javax.persistence.EntityManager;
import javax.validation.Valid;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.dao.UsuarioDAO;
import br.com.caelum.vraptor.model.Usuario;
import br.com.caelum.vraptor.validator.Validator;

@Path("login")
@Controller
public class LoginController {
	@Inject EntityManager em;
	@Inject Result result;
	@Inject UsuarioDAO dao;
	@Inject Validator validator;
	
	@Get("")
	public void login() {
		
	}	
}
