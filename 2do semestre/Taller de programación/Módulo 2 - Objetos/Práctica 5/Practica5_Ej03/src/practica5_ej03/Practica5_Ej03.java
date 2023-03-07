package practica5_ej03;

import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;

/**
 *
 * @author Pedro master god
 */
public class Practica5_Ej03 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        String mot, nomC = GeneradorAleatorio.generarString(10), nomB = GeneradorAleatorio.generarString(10);
        int dia = GeneradorAleatorio.generarInt(31), cantT = GeneradorAleatorio.generarInt(10);
        System.out.println("Ingrese el motivo del evento: ");
        mot = Lector.leerString();
        EventoOcasional e = new EventoOcasional(mot, nomC, dia, nomB, cantT);
        for (int i = 0; i < cantT; i++) {
            e.agregarTema(GeneradorAleatorio.generarString(15));
        }

        cantT = GeneradorAleatorio.generarInt(10);
        String nomG = GeneradorAleatorio.generarString(10);
        nomB = GeneradorAleatorio.generarString(10);
        int cantF = GeneradorAleatorio.generarInt(10);
        Gira g = new Gira(nomG, cantF, nomB, cantT);
        for (int i = 0; i < cantT; i++) {
            g.agregarTema(GeneradorAleatorio.generarString(15));
        }
        for (int i = 0; i < cantF; i++) {
            Fecha f = new Fecha(GeneradorAleatorio.generarString(15), GeneradorAleatorio.generarInt(31));
            g.agregarFecha(f);
        }

        System.err.println("CantT ev: "+e.getCantTemas());
        System.out.println("El costo del evento es: " + e.calcularCosto());
        e.actuar();
        
        System.err.println("CantT g: "+g.getCantTemas());
        System.err.println("CantF g: "+g.getCantFechas());
        System.out.println("El costo de la gira es: " + g.calcularCosto());
        for (int i = 0; i < cantF; i++) {
            g.actuar();
        }
    }
}
