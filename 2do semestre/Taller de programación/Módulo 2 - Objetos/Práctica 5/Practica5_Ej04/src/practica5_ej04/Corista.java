package practica5_ej04;

/**
 *
 * @author Pedro master god
 */
public class Corista {

    private String nombre;
    private int DNI, edad, tono;

    public Corista(String nombre, int DNI, int edad, int tono) {
        this.nombre = nombre;
        this.DNI = DNI;
        this.edad = edad;
        this.tono = tono;
    }

    public int getTono() {
        return tono;
    }

    @Override
    public String toString() {
        return "Corista{" + "nombre=" + nombre + ", DNI=" + DNI + ", edad=" + edad + ", tono=" + tono + '}';
    }
}
