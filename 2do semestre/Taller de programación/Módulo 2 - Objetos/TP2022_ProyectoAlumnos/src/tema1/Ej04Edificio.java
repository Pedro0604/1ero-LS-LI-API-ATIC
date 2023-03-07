/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema1;

import PaqueteLectura.Lector;

/**
 *
 * @author Lucia
 */
public class Ej04Edificio {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        int[][] ed = new int[8][4];
        int p, o;
        System.out.println("Ingrese el número de piso: ");
        p = Lector.leerInt();
        while (p > 9) {
            System.out.println("Piso inexistente, ingrese el numero nuevamente: ");
            p = Lector.leerInt();
        }
        while (p != 9) {
            System.out.println("Ingrese el número de oficina: ");
            o = Lector.leerInt();
            while (o > 4) {
                System.out.println("Oficina inexistente, ingrese el numero nuevamente: ");
                o = Lector.leerInt();
            }
            ed[p - 1][o - 1]++;
            System.out.println("Ingrese el número de piso: ");
            p = Lector.leerInt();
            while (p > 9) {
                System.out.println("Piso inexistente, ingrese el numero nuevamente: ");
                p = Lector.leerInt();
            }
        }
        for (p = 0; p < 8; p++) {
            System.out.println("Piso " + (p + 1) + ": ");
            for (o = 0; o < 4; o++) {
                System.out.println("  Oficina " + (o + 1) + " cantidad de personas: " + ed[p][o]);
            }
        }
    }

}
