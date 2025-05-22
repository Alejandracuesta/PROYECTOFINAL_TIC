package pacman;

import javax.swing.*;
import java.awt.*;
import java.awt.event.*;

public class PacMan extends JPanel implements ActionListener {
    private Timer timer;
    private int pacmanX = 50, pacmanY = 50, pacmanSpeed = 5;
    private Direction direction = Direction.RIGHT;

    private enum Direction {
        UP, DOWN, LEFT, RIGHT
    }

    public PacManGame() {
        setFocusable(true);
        setBackground(Color.BLACK);
        setPreferredSize(new Dimension(400, 400));
        addKeyListener(new KeyAdapter() {
            public void keyPressed(KeyEvent e) {
                switch (e.getKeyCode()) {
                    case KeyEvent.VK_UP -> direction = Direction.UP;
                    case KeyEvent.VK_DOWN -> direction = Direction.DOWN;
                    case KeyEvent.VK_LEFT -> direction = Direction.LEFT;
                    case KeyEvent.VK_RIGHT -> direction = Direction.RIGHT;
                }
            }
        });

        timer = new Timer(100, this);
        timer.start();
    }

    public void actionPerformed(ActionEvent e) {
        switch (direction) {
            case UP -> pacmanY -= pacmanSpeed;
            case DOWN -> pacmanY += pacmanSpeed;
            case LEFT -> pacmanX -= pacmanSpeed;
            case RIGHT -> pacmanX += pacmanSpeed;
        }
        repaint();
    }

    protected void paintComponent(Graphics g) {
        super.paintComponent(g);
        g.setColor(Color.YELLOW);
        g.fillArc(pacmanX, pacmanY, 30, 30, 45, 270);
    }

    public static void main(String[] args) {
        JFrame frame = new JFrame("Pac-Man");
        PacManGame game = new PacManGame();
        frame.add(game);
        frame.pack();
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setVisible(true);
    }
}
