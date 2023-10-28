package br.com.programize.controller;

import javax.inject.Inject;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Result;
import br.com.programize.dao.UsuarioDAO;
import br.com.programize.model.Usuario;

@Path("pix")
@Controller
public class PixController {
	@Inject UsuarioDAO dao;
	@Inject Result result;
	
	@Get("")
	public void pix () {
		
	}
	
	@Post("validar")
	public void validar(int id, String chave, double valor) {
		Usuario usuario = dao.findById(id);
	
	}
}
