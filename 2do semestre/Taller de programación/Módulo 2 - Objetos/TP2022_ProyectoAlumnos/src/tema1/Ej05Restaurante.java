/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema1;

import PaqueteLectura.Lector;

/**
 *
 * @author Lucia
 */
public class Ej05Restaurante {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        int[][] cl = new int[5][4];
        int i, j;
        for (i = 0; i < 5; i++) {
            for (j = 0; j < 4; j++) {
                switch (j) {
                    case 0:
                        System.out.println("Ingrese su calificación para la atención al cliente: ");
                        break;
                    case 1:
                        System.out.println("Ingrese su calificación para la calidad de la comida: ");
                        break;
                    case 2:
                        System.out.println("Ingrese su calificación para el precio: ");
                        break;
                    case 3:
                        System.out.println("Ingrese su calificación para el ambiente: ");
                        break;
                }
                cl[i][j] = Lector.leerInt();
            }
        }
        int suma;
        for (j = 0; j < 4; j++) {
            suma = 0;
            for (i = 0; i < 5; i++) {
                suma = suma + cl[i][j];
            }
            switch (j) {
                case 0:
                    System.out.println("El promedio de puntaje para la atención al cliente es: " + ((double)suma / 5));
                    break;
                case 1:
                    System.out.println("El promedio de puntaje para la calidad de la comida es: " + ((double)suma / 5));
                    break;
                case 2:
                    System.out.println("El promedio de puntaje para el precio es: " + ((double)suma / 5));
                    break;
                case 3:
                    System.out.println("El promedio de puntaje para el ambiente es: " + ((double)suma / 5));
                    break;
            }
        }
    }

}
