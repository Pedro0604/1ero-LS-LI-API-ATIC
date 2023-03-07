package tema3;

/**
 *
 * @author Pedro master god
 */
public class Cliente {

    private int dni;
    private String nombre;
    private int edad;

    public void setNombre(String n) {
        nombre = n;
    }

    public void setDni(int d) {
        dni = d;
    }

    public void setEdad(int e) {
        edad = e;
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

    public Cliente(String n, int d, int e) {
        nombre = n;
        dni = d;
        edad = e;
    }

    public Cliente() {
    }

    @Override
    public String toString() {
        String aux = "";
        aux += "Cliente: " + nombre + " " + edad + " años DNI " + dni;
        return aux;
    }
}
