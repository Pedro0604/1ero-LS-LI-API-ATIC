package estanteriadelibros;

import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;

/**
 *
 * @author Pedro master god
 */
public class EstanteriaDeLibros {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        int cantE = 5;
        int cantL = 3;
        Estanteria e = new Estanteria(cantE, cantL);

        String titulo, nombre;
        double peso;
        Libro l;
        int estante, lugar;
        for (int i = 0; i < 7; i++) {
            titulo = GeneradorAleatorio.generarString(15);
            nombre = GeneradorAleatorio.generarString(15);
            peso = GeneradorAleatorio.generarDouble(500);
            l = new Libro(titulo, nombre, peso);

            estante = GeneradorAleatorio.generarInt(cantE);
            lugar = GeneradorAleatorio.generarInt(cantL);
            e.almacenarLibro(l, estante, lugar);
        }
        System.out.println(e.toString());
        System.out.println("Ingrese un titulo para sacar ese libro:");
        titulo = Lector.leerString();
        if (e.sacarLibro(titulo) != null) {
            System.out.println("Libro sacado: " + e.sacarLibro(titulo).toString());
        } else {
            System.out.println("El libro de titulo " + titulo + " no existe.");
        }
        System.out.println("Ingrese un estante para sacar un libro:");
        estante = Lector.leerInt();
        System.out.println("Ingrese un lugar para sacar un libro:");
        lugar = Lector.leerInt();
        if (e.sacarLibro(estante, lugar) != null) {
            System.out.println("Libro sacado: " + e.sacarLibro(estante, lugar).toString());
        } else {
            System.out.println("El estante " + estante + " no contiene ningun libro en la posicion " + lugar + ".");
        }
        System.out.println("Libro mas pesado: " + e.calcular().getTitulo());
    }
}
