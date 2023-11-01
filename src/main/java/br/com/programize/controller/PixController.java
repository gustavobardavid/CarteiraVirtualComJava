package br.com.programize.controller;

import java.util.List;

import javax.inject.Inject;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Result;
import br.com.programize.dao.UsuarioDAO;
import br.com.programize.model.Extrato;
import br.com.programize.model.Usuario;

@Path("pix")
@Controller
public class PixController {
	@Inject UsuarioDAO dao;
	@Inject Result result;
	
	@Get("")
	public void pix (int id) {
		Usuario usuario= dao.findById(id);
		result.include("usuario",usuario);
	}
	
	@Post("validar")
	public void validar(int id, String chave, double valor, int variacaoConta) {
		Usuario usuarioRemetente = dao.findById(id);
		if (variacaoConta == 26) {
			usuarioRemetente.getContaCorrente().sacar(valor);
		} else if (variacaoConta == 51) {
			usuarioRemetente.getContaPoupanca().sacar(valor);
		}
		List<Usuario> usuarios = dao.findAll();
		for (Usuario usuarioDestinatario : usuarios) {
			if(usuarioDestinatario.getCpf().equals(chave)) {
				usuarioDestinatario.getContaCorrente().depositar(valor);
			}
		}
		Extrato extrato = new Extrato();
		extrato.setTipo("Pix");
		extrato.setValor(valor);
		extrato.setUsuario(usuarioRemetente);
		usuarioRemetente.addExtrato(extrato);
		dao.update(usuarioRemetente);
		result.redirectTo(HomeController.class).home(usuarioRemetente);
	}
}
