package br.com.programize.controller;

import javax.inject.Inject;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Result;
import br.com.programize.dao.ExtratoDAO;
import br.com.programize.dao.UsuarioDAO;
import br.com.programize.model.Extrato;
import br.com.programize.model.Usuario;

@Path("sucesso")
@Controller
public class SucessoController {
	@Inject UsuarioDAO daoUsuario;
	@Inject ExtratoDAO daoExtrato;
	@Inject Result result;
	@Get("pix")
	public void pix(int idExtrato, int idUsuario) {
		Usuario usuario= daoUsuario.findById(idUsuario);
		Extrato extrato = daoExtrato.findById(idExtrato);
		result.include("extrato", extrato);
		result.include("usuario", usuario);
	}
}
