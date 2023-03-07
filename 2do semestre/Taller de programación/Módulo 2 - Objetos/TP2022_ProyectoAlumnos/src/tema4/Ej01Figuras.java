package tema4;

import PaqueteLectura.Lector;

/**
 *
 * @author Lucia
 */
public class Ej01Figuras {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        System.out.println("Ingrese el valor del lado 1:");
        double l1 = Lector.leerDouble();
        System.out.println("Ingrese el valor del lado 2:");
        double l2 = Lector.leerDouble();
        System.out.println("Ingrese el valor del lado 3:");
        double l3 = Lector.leerDouble();
        System.out.println("Ingrese el color del relleno:");
        String cR = Lector.leerString();
        System.out.println("Ingrese el color de la linea:");
        String cL = Lector.leerString();
        Triangulo t = new Triangulo(l1, l2, l3, cR, cL);
        System.out.println("Ingrese el valor del radio:");
        double r = Lector.leerDouble();
        System.out.println("Ingrese el color del relleno:");
        cR = Lector.leerString();
        System.out.println("Ingrese el color de la linea:");
        cL = Lector.leerString();
        Circulo c = new Circulo(r, cR, cL);
        System.out.println("Triangulo: " + t.toString());
        System.out.println("Circulo: " + c.toString());
        t.despintar();
        c.despintar();
        System.out.println("Triangulo: " + t.toString());
        System.out.println("Circulo: " + c.toString());
    }
}
