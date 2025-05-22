package pacman.src;

public class PacManGame {
    public static void main(String[] args) {
        System.out.println("¡Bienvenido a PacMan!");
        // Aquí puedes agregar la lógica del juego o simplemente simularlo
        System.out.println("Juego iniciado...");
        // Simulación simple
        for (int i = 0; i < 5; i++) {
            System.out.println("PacMan se mueve...");
            try {
                Thread.sleep(1000);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
        System.out.println("Juego terminado. ¡Gracias por jugar!");
    }
}
