/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema2;

import PaqueteLectura.*;

/**
 *
 * @author Lucia
 */
public class Ej04Casting {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        Persona[][] cast = new Persona[5][8];
        int i, j, d, e;
        Persona p;
        String n;
        for (i = 0; i < 5; i++) {
            for (j = 0; j < 8; j++) {
                e = GeneradorAleatorio.generarInt(80);
                d = GeneradorAleatorio.generarInt(50000000);
                n = GeneradorAleatorio.generarString(10);
                p = new Persona(n, d, e);
                cast[i][j] = p;
            }
        }
        for (i = 0; i < 5; i++) {
            for (j = 0; j < 8; j++) {
                System.out.println("En el día "+i+" turno "+j+" se presento la persona: "+cast[i][j].toString());
            }
        }
    }
}
