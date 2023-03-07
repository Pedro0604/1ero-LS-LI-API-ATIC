package estanteriadelibros;

/**
 *
 * @author Pedro master god
 */
public class Libro {

    private String titulo, nombre;
    private double peso;

    public Libro(String titulo, String nombre, double peso) {
        this.titulo = titulo;
        this.nombre = nombre;
        this.peso = peso;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public double getPeso() {
        return peso;
    }

    public void setPeso(double peso) {
        this.peso = peso;
    }

    @Override
    public String toString() {
        return "Libro{" + "titulo=" + titulo + ", nombre=" + nombre + ", peso=" + peso + '}';
    }
}
