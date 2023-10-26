package br.com.programize.controller;

import javax.inject.Inject;
import javax.persistence.EntityManager;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.validator.Validator;
import br.com.programize.dao.UsuarioDAO;
import br.com.programize.model.Usuario;

@Path("perfil")
@Controller
public class PerfilController {
	@Inject Result result;
	@Inject EntityManager em;
	@Inject UsuarioDAO dao;
	@Inject Validator validator;
	
	@Get("")
	public void perfil(int id) {
		Usuario usuario = dao.findById(id);
		result.include("usuario", usuario);
	}
}
