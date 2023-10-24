package br.com.caelum.vraptor.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.dao.UsuarioDAO;
import br.com.caelum.vraptor.model.Extrato;
import br.com.caelum.vraptor.model.Usuario;

@Path("extrato")
@Controller
public class ExtratoController {
	@Inject Result result;
	@Inject UsuarioDAO dao;
	
	@Get("")
	public void extrato(int id) {
		Usuario usuario = dao.findById(id);
		List<Extrato> extratos = usuario.getExtratos();
		List<Extrato> extratosInvertidos = new ArrayList<Extrato>();
		for (int i = extratos.size() - 1; i >= 0; i--) {
		       extratosInvertidos.add(extratos.get(i));
		}
		//extratosInvertidos contém a lista invertida
		result.include("extratos", extratosInvertidos);
	}
}
