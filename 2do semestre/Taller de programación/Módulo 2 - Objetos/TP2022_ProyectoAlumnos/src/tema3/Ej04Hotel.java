package tema3;

import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;

/**
 *
 * @author Pedro master god
 */
public class Ej04Hotel {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        Hotel h = new Hotel(20);
        Cliente cl;
        String nom;
        int ed, dni;
        System.out.println("Ingrese la habitación del cliente: ");
        int hab = Lector.leerInt();
        while (hab != 0) {
            System.out.println("Ingrese el nombre del cliente: ");
            nom = Lector.leerString();
            System.out.println("Ingrese la edad del cliente: ");
            ed = Lector.leerInt();
            System.out.println("Ingrese el DNI del cliente: ");
            dni = Lector.leerInt();
            cl = new Cliente(nom, ed, dni);
            h.ocupar(cl, hab);
            System.out.println("Ingrese la habitación del cliente: ");
            hab = Lector.leerInt();
        }
        System.out.println(h.toString());
        System.out.println("Ingrese un monto para aumentar el precio de las habitaciones: ");
        h.aumentar(Lector.leerDouble());
        System.out.println(h.toString());
    }

}
