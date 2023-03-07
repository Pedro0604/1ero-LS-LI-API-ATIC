package tema4;

import PaqueteLectura.Lector;

/**
 *
 * @author Lucia
 */
public class Ej02Empleados {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Jugador j = new Jugador();
        System.out.println("Ingrese el nombre del jugador: ");
        j.setNombre(Lector.leerString()); 
        System.out.println("Ingrese el sueldo basico del jugador: ");
        j.setSueldoBasico(Lector.leerDouble()); 
        System.out.println("Ingrese la antiguedad del jugador: ");
        j.setAntiguedad(Lector.leerInt()); 
        System.out.println("Ingrese la cantidad de partidos jugados por el jugador: ");
        j.setCantP(Lector.leerInt()); 
        System.out.println("Ingrese la cantidad de partidos ganados por el jugador: ");
        j.setCantG(Lector.leerInt()); 

        Entrenador e = new Entrenador();
        System.out.println("Ingrese el nombre del entrenador: ");
        e.setNombre(Lector.leerString()); 
        System.out.println("Ingrese el sueldo basico del entrenador: ");
        e.setSueldoBasico(Lector.leerDouble()); 
        System.out.println("Ingrese la antiguedad del entrenador: ");
        e.setAntiguedad(Lector.leerInt()); 
        System.out.println("Ingrese la cantidad de campeonatos ganados por el entrenador: ");
        e.setCantC(Lector.leerInt()); 

        System.out.println("Jugador: " + j.toString());
        System.out.println("Entrenador: " + e.toString());
    }

}
