package br.com.caelum.vraptor.controller;

import javax.inject.Inject;
import javax.persistence.EntityManager;
import javax.validation.Valid;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.dao.ContaCorrenteDAO;
import br.com.caelum.vraptor.dao.ContaPoupancaDAO;
import br.com.caelum.vraptor.dao.UsuarioDAO;
import br.com.caelum.vraptor.model.ContaCorrente;
import br.com.caelum.vraptor.model.ContaPoupanca;
import br.com.caelum.vraptor.model.Usuario;
import br.com.caelum.vraptor.validator.Validator;

@Path("cadastrarUsuario")
@Controller
public class CadastrarUsuarioController {
	@Inject Validator validator;
	@Inject EntityManager em;
	@Inject Result result;
	@Inject UsuarioDAO usuarioDAO;
	@Inject ContaCorrenteDAO contaCorrenteDAO;
	@Inject ContaPoupancaDAO contaPoupancaDAO;
	
	@Get("")
	public void cadastrarUsuario() {
		
	}
	
	@Post("salvausuario")
	public void salvarUsuario(@Valid Usuario usuario) {
		 // Valida o modelo Usuario e, em caso de erro, redireciona 
	    validator.onErrorRedirectTo(this).cadastrarUsuario();
	    
	    // Cria uma nova conta corrente para o usuário
	    ContaCorrente contaCorrente = new ContaCorrente("0920-1", "26-946-x", 0, 26, 0.10, 100);
	    
	    // Cria uma nova conta poupança para o usuário
	    ContaPoupanca contaPoupanca = new ContaPoupanca("0920-1", "26-946-X", 0, 51, 0.10);
	    
	    // Associe a conta corrente ao usuário
	    usuario.setContaCorrente(contaCorrente);
	   
	    // Associe a conta poupança ao usuário
	    usuario.setContaPoupanca(contaPoupanca);
	    
	    // Salva a conta corrente no banco
	    contaCorrenteDAO.save(contaCorrente);
	    
	    // Salva a conta poupanca no banco
	    contaPoupancaDAO.save(contaPoupanca);
	    
	    // Salva o usuário no banco
	    usuarioDAO.save(usuario);
	    
	    // Se tudo ocorrer bem, redireciona para a tela de login
	    result.redirectTo(LoginController.class).login();
	}
}
