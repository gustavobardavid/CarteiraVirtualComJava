package br.com.programize.controller;

import java.util.ArrayList;
import java.util.List;
import javax.inject.Inject;
import javax.persistence.EntityManager;
import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.validator.Validator;
import br.com.programize.dao.UsuarioDAO;
import br.com.programize.model.Extrato;
import br.com.programize.model.Usuario;
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
	List<Extrato> extratos =  usuarioEncontrado.getExtratos();
		   List<Extrato> extratosInvertidos = new ArrayList<Extrato>();

		   for (int i = extratos.size() - 1; i >= 0; i--) {
		       extratosInvertidos.add(extratos.get(i));
		   }

		   //extratosInvertidos contém a Seta invertida

		   result.include("usuario", usuarioEncontrado);
		   result.include("extratos", extratosInvertidos);
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
	
	@Get("extrato")
	public void extrato(int id){
		result.redirectTo(ExtratoController.class).extrato(id);
	}
	
	@Get("perfil")
	public void perfil (int id) {
		result.redirectTo(PerfilController.class).perfil(id);
	}
	
	@Get("sair")
	public void sair() {
		result.redirectTo(LoginController.class).login();
	}
	
	@Get("pix")
	public void pix(int id) {
		result.redirectTo(PixController.class).pix(id);
	}
	@Get("bacurin")
	public void bacurin(int id) {
		result.redirectTo(BacurinController.class).bacurin(id);
	}
}
