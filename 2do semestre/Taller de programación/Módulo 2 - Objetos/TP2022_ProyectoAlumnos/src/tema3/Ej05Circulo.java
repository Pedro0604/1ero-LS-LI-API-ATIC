package tema3;
import PaqueteLectura.Lector;
/**
 *
 * @author Pedro master god
 */
public class Ej05Circulo {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        double r;
        String cR,cL;
        System.out.println("Ingrese el radio del circulo: ");
        r=Lector.leerDouble();
        System.out.println("Ingrese el color del relleno del circulo: ");
        cR=Lector.leerString();
        System.out.println("Ingrese el color de la linea del circulo: ");
        cL=Lector.leerString();
        Circulo c=new Circulo(r,cR,cL);
        System.out.println("El perimetro del circulo es: "+c.calcularPerimetro()+".");
        System.out.println("El area del circulo es: "+c.calcularArea()+".");
    }
    
}
