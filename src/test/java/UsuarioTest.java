

public class UsuarioTest {
	public static void main(String[] args) {
		 // Gerar um número de ponto flutuante aleatório no intervalo [0.0, 1.0)
        int numeroAleatorio = (int) Math.random();
        System.out.println("Número aleatório (double): " + numeroAleatorio);
        
        // Você pode ajustar o intervalo multiplicando e adicionando valores, por exemplo:
        int numeroNoIntervalo = (int) ( Math.random() * 1000);
        System.out.println("Número no intervalo: " + numeroNoIntervalo);
	}
}
