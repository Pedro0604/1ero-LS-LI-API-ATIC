/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema2;

import PaqueteLectura.GeneradorAleatorio;

/**
 *
 * @author Lucia
 */
public class Ej02vectorP {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        Persona[] v = new Persona[15];
        int i = 0;
        int e, d;
        Persona p;
        String n;
        e = GeneradorAleatorio.generarInt(80);
        while (i < 15){
            d = GeneradorAleatorio.generarInt(50000000);
            n = GeneradorAleatorio.generarString(10);
            p = new Persona(n, d, e);
            v[i] = p;
            e = GeneradorAleatorio.generarInt(80);
            i++;
        }
        for (i = 0; i < 15; i++) {
            System.out.println(v[i].toString());
        }
        int cant = 0;
        for (i = 0; i < 15; i++) {
            if (v[i].getEdad() > 65) {
                cant++;
            }
        }
        System.out.println("La cantidad de personas mayores a 65 años es: " + cant);
        Persona pmin = new Persona("No hay personas", 99999999, -1);
        for (i = 0; i < 15; i++) {
            if (v[i].getDNI() < pmin.getDNI()) {
                pmin = v[i];
            }
        }
        System.out.println("La persona con menor DNI es: " + pmin.toString());
    }
}
