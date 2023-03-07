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
public class Ej03Mujercitas {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Estante est = new Estante();
        Libro l;
        
        System.out.println("Ingrese el autor del libro");
        String a = Lector.leerString();
        while (!(est.estanteLleno()) && !(a.equals("z"))) {
            l = new Libro();
            l.setPrimerAutor(a);
            System.out.println("Ingrese el titulo del libro");
            l.setTitulo(Lector.leerString());
            est.addLibro(l);
            System.out.println("Ingrese el autor del libro");
            a = Lector.leerString();
        }
        
        if (est.estanteLleno()) {
            System.out.println("El estante está lleno");
        }
        
        System.out.println(est.toString());
        if (est.libroConTitulo("Mujercitas")!=null){
        System.out.println("El autor del libro de título Mujercitas es: "+est.libroConTitulo("Mujercitas").getPrimerAutor()+".");
        }
        else{
            System.out.println("El libro Mujercitas no existe.");
        }
    }

}
