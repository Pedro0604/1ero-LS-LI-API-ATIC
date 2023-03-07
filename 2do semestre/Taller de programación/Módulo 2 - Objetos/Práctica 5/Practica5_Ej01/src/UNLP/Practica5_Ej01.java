package UNLP;

import PaqueteLectura.*;

/**
 *
 * @author Pedro master god
 */
public class Practica5_Ej01 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        System.out.println("Ingrese el nombre del proyecto: ");
        String nom = Lector.leerString();
        System.out.println("Ingrese el codigo del proyecto: ");
        int cod = Lector.leerInt();
        System.out.println("Ingrese el nombre del director del proyecto: ");
        String nomD = Lector.leerString();
        Proyecto pr = new Proyecto(nom, cod, nomD);

        int cat;
        String esp, motivo;
        double monto;
        for (int i = 0; i < 3; i++) {
            System.out.println("Ingrese el nombre del investigador: ");
            nom = Lector.leerString();
            System.out.println("Ingrese la categoria del investigador: ");
            cat = Lector.leerInt();
            System.out.println("Ingrese la especialidad del investigador: ");
            esp = Lector.leerString();
            Investigador inv = new Investigador(nom, cat, esp);
            
            for (int j = 0; j < 2; j++) {
                System.out.println("Agrege un monto al subsidio: ");
                monto = Lector.leerDouble();
                System.out.println("Agrege un motivo al subsidio: ");
                motivo = Lector.leerString();
                Subsidio sub=new Subsidio(monto,motivo);
                inv.agregarSubsidio(sub);
            }
            pr.agregarInvestigador(inv);
        }
        System.out.println("Ingrese un nombre de un investigador para otorgar todos sus subsidios: ");
        nom=Lector.leerString();
        pr.otorgarTodos(nom);
        
        System.out.println(pr.toString());
    }

}
