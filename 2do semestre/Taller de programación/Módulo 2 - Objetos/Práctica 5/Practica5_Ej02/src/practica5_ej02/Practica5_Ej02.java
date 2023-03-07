package practica5_ej02;

import PaqueteLectura.Lector;

/**
 *
 * @author Pedro master god
 */
public class Practica5_Ej02 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Estacionamiento e = new Estacionamiento("Parkox", "69th st 420", 69, 420, 3, 3);
        String nom, pat;
        int pi, pl;
        for (int i = 0; i < 2; i++) {
            System.out.println("Ingrese su nombre: ");
            nom = Lector.leerString();
            System.out.println("Ingrese la patente de su auto: ");
            pat = Lector.leerString();
            Auto a = new Auto(nom, pat);
            System.out.println("Ingrese el piso donde desea estacionar su auto: ");
            pi = Lector.leerInt();
            System.out.println("Ingrese la plaza donde desea estacionar su auto: ");
            pl = Lector.leerInt();
            e.estacionar(a, pi, pl);
        }
        System.out.println(e.toString());
        System.out.println("La cantidad de autos en la plaza 1 es de: " + e.cantPorPlaza(1) + ".");
        System.out.println("Ingrese la patente a buscar: ");
        System.out.println(e.infoPatente(Lector.leerString()));
    }
}
