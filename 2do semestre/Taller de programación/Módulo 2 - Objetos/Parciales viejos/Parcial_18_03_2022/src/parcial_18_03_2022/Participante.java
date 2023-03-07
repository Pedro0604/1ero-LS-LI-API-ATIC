package parcial_18_03_2022;

/**
 *
 * @author Pedro master god
 */
public class Participante {
    private int dni;
    private String nombre;
    private int edad;

    public Participante(int dni, String nombre, int edad) {
        this.dni = dni;
        this.nombre = nombre;
        this.edad = edad;
    }

    public int getEdad() {
        return edad;
    }

    public int getDni() {
        return dni;
    }

    public String getNombre() {
        return nombre;
    }

    @Override
    public String toString() {
        return "Participante{" + "dni=" + dni
                + ", nombre=" + nombre + ", edad=" + edad + '}';
    }
}
