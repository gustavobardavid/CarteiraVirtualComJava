package br.com.caelum.vraptor.controller;

import java.util.List;

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

@Path("home")
@Controller
public class HomeController {
	@Inject Result result;
	@Inject EntityManager em;
	@Inject UsuarioDAO dao;
	@Inject Validator validator;
	
	@Post("validausuario")
	@Get
	public void home(Usuario usuario) {
		//procura o usuario no banco
		List<Usuario> usuarios = dao.findAll();
		boolean cpfEncontrado = false;
		Usuario usuarioEncontrado = null;
	    for (Usuario usuarioBanco : usuarios) {
	        if (usuarioBanco.getCpf().equals(usuario.getCpf())) {
	        	cpfEncontrado = true;
		        usuarioEncontrado = usuarioBanco;
	            break; // Sai do loop assim que encontrar um CPF correspondente
	        }
	    }
	   if (cpfEncontrado) {
		   result.include("usuario", usuarioEncontrado);
	   } else {
		   result.redirectTo(LoginController.class).login();
	    }
	}
	
	@Get("transferencia")
	public void transferencia(int id) {
		Usuario usuario = dao.findById(id);
		result.redirectTo(TransferenciaController.class).transferencia(usuario);
	}
	
	@Get("depositar")
	public void depositar(int id){
		Usuario usuario = dao.findById(id);
		result.redirectTo(DepositarController.class).depositar(usuario);
	}
}
