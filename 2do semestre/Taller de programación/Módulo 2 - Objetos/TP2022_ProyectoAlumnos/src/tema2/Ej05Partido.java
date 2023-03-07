/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema2;

import PaqueteLectura.Lector;

/**
 *
 * @author Lucia
 */
public class Ej05Partido {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Partido[] v = new Partido[20];
        int dimL = -1;
        String eV, eL;
        int gV, gL;
        System.out.println("Ingrese el nombre del equipo visitante: ");
        eV = Lector.leerString();
        while ((dimL < 20) && !(eV.equals("ZZZ"))) {
            dimL++;
            System.out.println("Ingrese el nombre del equipo local: ");
            eL = Lector.leerString();
            System.out.println("Ingrese la cantidad de goles del equipo visitante: ");
            gV = Lector.leerInt();
            System.out.println("Ingrese la cantidad de goles del equipo local: ");
            gL = Lector.leerInt();
            v[dimL] = new Partido(eL, eV, gL, gV);
            System.out.println("Ingrese el nombre del equipo visitante: ");
            eV = Lector.leerString();
        }
        int i;
        for (i = 0; i <= dimL; i++) {
            System.out.println(v[i].getLocal() + "-" + v[i].getGolesLocal() + " VS " + v[i].getVisitante() + "-" + v[i].getGolesVisitante());
        }
        int cant = 0;
        for (i = 0; i <= dimL; i++) {
            if (v[i].getGanador().toLowerCase().equals("river")) {
                cant++;
            }
        }
        System.out.println("La cantidad de partidos que gano river es: " + cant + ".");
        cant = 0;
        for (i = 0; i <= dimL; i++) {
            if (v[i].getLocal().toLowerCase().equals("boca")) {
                cant += v[i].getGolesLocal();
            }
        }
        System.out.println("La cantidad de goles que hizo boca de local son: " + cant + ".");
    }
}