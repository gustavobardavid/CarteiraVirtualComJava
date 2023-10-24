package br.com.caelum.vraptor.controller;

import javax.inject.Inject;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.dao.UsuarioDAO;
import br.com.caelum.vraptor.model.Usuario;

@Path("alterarSenha")
@Controller
public class AlterarSenhaController {
	@Inject Result result;
	@Inject UsuarioDAO dao;
	
	@Get("")
	public void alterarSenha(int id) {
		Usuario usuario = dao.findById(id);
		result.include("usuario", usuario);
	}
	
	@Post("validar")
	public void validarSenha(int Id, String senhaAntiga, String senhaNova) {
		Usuario usuario = dao.findById(Id);
		boolean sucess = usuario.alterarSenha(senhaAntiga, senhaNova);
		if(sucess) {
			dao.update(usuario);			
			result.redirectTo(PerfilController.class).perfil(Id);;
		}else {
			result.redirectTo(this).alterarSenha(Id);
			result.include("error", "Senha antiga errada");
		}
		
	}
}
