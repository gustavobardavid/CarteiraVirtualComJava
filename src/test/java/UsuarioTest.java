
import java.util.List;

import br.com.caelum.vraptor.model.Extrato;
import br.com.caelum.vraptor.model.Usuario;

public class UsuarioTest {
	public static void main(String[] args) {
		Usuario usuario = new Usuario();
		List<Extrato> extratos= usuario.getExtratos();
		for (int i = extratos.size() - 1; i > extratos.size() - 3; i--) {
			System.out.println(extratos.get(i).getValor());
		}
	}
}
