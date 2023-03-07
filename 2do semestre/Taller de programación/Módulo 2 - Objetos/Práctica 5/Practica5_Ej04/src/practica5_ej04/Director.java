package practica5_ej04;

/**
 *
 * @author Pedro master god
 */
public class Director {

    private String nombre;
    private int DNI, edad, antiguedad;

    public Director(String nombre, int DNI, int edad, int antiguedad) {
        this.nombre = nombre;
        this.DNI = DNI;
        this.edad = edad;
        this.antiguedad = antiguedad;
    }

    @Override
    public String toString() {
        return "Director{" + "nombre=" + nombre + ", DNI=" + DNI + ", edad=" + edad + ", antiguedad=" + antiguedad + '}';
    }
}
