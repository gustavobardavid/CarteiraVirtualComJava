package br.com.programize.controller;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.Random;

import javax.inject.Inject;
import javax.persistence.EntityManager;
import javax.validation.Valid;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.validator.Validator;
import br.com.programize.dao.ContaCorrenteDAO;
import br.com.programize.dao.ContaPoupancaDAO;
import br.com.programize.dao.ExtratoDAO;
import br.com.programize.dao.UsuarioDAO;
import br.com.programize.model.ContaCorrente;
import br.com.programize.model.ContaPoupanca;
import br.com.programize.model.Extrato;
import br.com.programize.model.Usuario;

@Path("cadastrarUsuario")
@Controller
public class CadastrarUsuarioController {
	@Inject Validator validator;
	@Inject EntityManager em;
	@Inject Result result;
	@Inject UsuarioDAO usuarioDAO;
	@Inject ContaCorrenteDAO contaCorrenteDAO;
	@Inject ContaPoupancaDAO contaPoupancaDAO;
	@Inject ExtratoDAO extratoDAO;
	
	@Get("")
	public void cadastrarUsuario() {
		
	}
	
	@Post("salvausuario")
	public void salvarUsuario(@Valid Usuario usuario) {
		 // Valida o modelo Usuario e, em caso de erro, redireciona 
	    validator.onErrorRedirectTo(this).cadastrarUsuario();
	    int numeroContaAleatorio = (int) ( Math.random() * 1000);
	    // Cria uma nova conta corrente para o usuário
	    ContaCorrente contaCorrente = new ContaCorrente("0920-1", numeroContaAleatorio, 0, 26, 0.10, 100);
	    // Cria uma nova conta poupança para o usuário
	    ContaPoupanca contaPoupanca = new ContaPoupanca("0920-1", numeroContaAleatorio, 0, 51, 0.10);
	    // Associe a conta corrente ao usuário
	    usuario.setContaCorrente(contaCorrente);
	    // Associe a conta poupança ao usuário
	    usuario.setContaPoupanca(contaPoupanca);
	    //cria uma nova instancia de extrato
	    Extrato extrato = new Extrato();
	    //seta os valores inicias
	    extrato.setTipo("Abriu a conta");
	    extrato.setValor(0);
	    //atribui o usuario
	    extrato.setUsuario(usuario);
	    // Cria um novo array de extratos
	    ArrayList<Extrato> extratos = new ArrayList<Extrato>();
	    //associa o array de extratos para o usuario
	    usuario.setExtratos(extratos);
	    //adiciona o primeiro extrato
	    usuario.addExtrato(extrato);
	    // Salva a conta corrente no banco
	    contaCorrenteDAO.save(contaCorrente);
	    // Salva a conta poupanca no banco
	    contaPoupancaDAO.save(contaPoupanca);
	    // Salva o usuário no banco
	    usuarioDAO.save(usuario);
	    //salva o extrato no banco
	    extratoDAO.save(extrato);
	    
	    // Se tudo ocorrer bem, redireciona para a tela de login
	    result.redirectTo(LoginController.class).login();
	}
}
