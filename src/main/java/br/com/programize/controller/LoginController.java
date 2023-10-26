package br.com.programize.controller;

import java.util.List;

import javax.inject.Inject;
import javax.persistence.EntityManager;
import javax.validation.Valid;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.validator.Validator;
import br.com.programize.dao.UsuarioDAO;
import br.com.programize.model.Usuario;

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
