package practica5_ej04;

/**
 *
 * @author Pedro master god
 */
public abstract class Coro {

    private String nombre;
    private Director dir;

    public Coro(String nombre, Director dir) {
        this.nombre = nombre;
        this.dir = dir;
    }

    public abstract boolean coroLleno();

    public abstract void agregarCorista(Corista c);

    public abstract boolean bienFormado();

    @Override
    public String toString() {
        String aux = "";
        aux += "Coro: " + this.nombre + "\n  " + this.dir.toString() + "\n";
        return aux;
    }
}
