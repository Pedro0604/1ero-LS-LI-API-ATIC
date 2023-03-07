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
public class Ej01Persona {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Persona yo = new Persona();
        System.out.println("Introduzca el nombre de la persona: ");
        yo.setNombre(Lector.leerString());
        System.out.println("Introduzca el DNI de la persona: ");
        yo.setDNI(Lector.leerInt());
        System.out.println("Introduzca la edad de la persona: ");
        yo.setEdad(Lector.leerInt());
        System.out.println(yo.toString());
    }

}
