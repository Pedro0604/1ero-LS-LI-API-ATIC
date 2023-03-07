package tema4;

import PaqueteLectura.Lector;

/**
 *
 * @author Lucia
 */
public class Ej03BarrioCerrado {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
         Persona p=new Persona();
         System.out.println("Ingrese el nombre: ");
         p.setNombre(Lector.leerString());
         System.out.println("Ingrese el DNI: ");
         p.setDNI(Lector.leerInt());
         System.out.println("Ingrese la edad: ");
         p.setEdad(Lector.leerInt());
         
         Trabajador t=new Trabajador();
         System.out.println("Ingrese el nombre: ");
         t.setNombre(Lector.leerString());
         System.out.println("Ingrese el DNI: ");
         t.setDNI(Lector.leerInt());
         System.out.println("Ingrese la edad: ");
         t.setEdad(Lector.leerInt());
         System.out.println("Ingrese el trabajo: ");
         t.setTrabajo(Lector.leerString());
         
         System.out.println("Persona: "+p.toString());
         System.out.println("Trabajador: "+t.toString());
    }
    
}
