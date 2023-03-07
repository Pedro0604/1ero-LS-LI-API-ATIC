package practica5_ej04;

import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;

/**
 *
 * @author Pedro master god
 */
public class Practica5_Ej04 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        int cantCor = GeneradorAleatorio.generarInt(10);
        String nomCoro = GeneradorAleatorio.generarString(15);
        String nomD = GeneradorAleatorio.generarString(15);
        int DNI, edad, antiguedad;
        DNI = GeneradorAleatorio.generarInt(40000000);
        edad = GeneradorAleatorio.generarInt(60) + 30;
        antiguedad = GeneradorAleatorio.generarInt(40);
        Director dir = new Director(nomD, DNI, edad, antiguedad);
        CoroSemicircular CS = new CoroSemicircular(cantCor, nomCoro, dir);

        int cantF = 3;//GeneradorAleatorio.generarInt(5);
        int cantCol = 3;//GeneradorAleatorio.generarInt(5);
        nomCoro = GeneradorAleatorio.generarString(15);
        nomD = GeneradorAleatorio.generarString(15);
        DNI = GeneradorAleatorio.generarInt(40000000);
        edad = GeneradorAleatorio.generarInt(60) + 30;
        antiguedad = GeneradorAleatorio.generarInt(40);
        dir = new Director(nomD, DNI, edad, antiguedad);
        CoroPorHileras CH = new CoroPorHileras(cantF, cantCol, nomCoro, dir);

        String nombreCorista;
        int tono;
        Corista c;
        for (int i = 0; i < cantCor; i++) {
            nombreCorista = GeneradorAleatorio.generarString(10);
            DNI = GeneradorAleatorio.generarInt(40000000);
            edad = GeneradorAleatorio.generarInt(60) + 30;
            tono = GeneradorAleatorio.generarInt(14);
            c = new Corista(nombreCorista, DNI, edad, tono);
            CS.agregarCorista(c);
        }

        for (int i = 0; i < cantF; i++) {
            for (int j = 0; j < cantCol; j++) {
                nombreCorista = GeneradorAleatorio.generarString(10);
                DNI = GeneradorAleatorio.generarInt(40000000);
                edad = GeneradorAleatorio.generarInt(60) + 30;
            tono = Lector.leerInt();//GeneradorAleatorio.generarInt(14);
                c = new Corista(nombreCorista, DNI, edad, tono);
                CH.agregarCorista(c);
            }
        }

        System.out.println("Semicircular: " + CS.toString());
        if (CS.coroLleno()) {
            System.out.println("Esta lleno");
        } else {
            System.out.println("No esta lleno");
        }
        if (CS.bienFormado()) {
            System.out.println("Esta bien formado\n");
        } else {
            System.out.println("No esta bien formado\n");
        }

        System.out.println("Por hileras: " + CH.toString());
        if (CH.coroLleno()) {
            System.out.println("Esta lleno");
        } else {
            System.out.println("No esta lleno");
        }
        if (CH.bienFormado()) {
            System.out.println("Esta bien formado");
        } else {
            System.out.println("No esta bien formado");
        }
    }

}
