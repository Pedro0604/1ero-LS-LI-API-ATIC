/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema3;

import PaqueteLectura.Lector;
/**
 *
 * @author Lucia
 */
public class Ej01Triangulo {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Triangulo t=new Triangulo();
        
        System.out.println("Ingrese el tamaño del lado 1");
        t.setLado1(Lector.leerDouble());
        System.out.println("Ingrese el tamaño del lado 2");
        t.setLado2(Lector.leerDouble());
        System.out.println("Ingrese el tamaño del lado 3");
        t.setLado3(Lector.leerDouble());
        System.out.println("Ingrese el tamaño del color del relleno");
        t.setColorRelleno(Lector.leerString());
        System.out.println("Ingrese el tamaño del color de la linea");
        t.setColorLinea(Lector.leerString());
        
        System.out.println("El triangulo tiene un perimetro de: "+t.calcularPerimetro());
        System.out.println("El triangulo tiene un area de : "+t.calcularArea());
    }
    
}
