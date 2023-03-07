/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema1;

//Paso 1. importar la funcionalidad para generar datos aleatorios
import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;

public class Ej03Matrices {

    public static void main(String[] args) {
        //Paso 2. iniciar el generador aleatorio     
        GeneradorAleatorio.iniciar();
        //Paso 3. definir la matriz de enteros de 5x5 e iniciarla con nros. aleatorios 
        int[][] m = new int[5][5];
        int i, j;
        for (i = 0; i < 5; i++) {
            for (j = 0; j < 5; j++) {
                m[i][j] = GeneradorAleatorio.generarInt(31);
            }
        }
        //Paso 4. mostrar el contenido de la matriz en consola

        for (i = 0; i < 5; i++) {
            for (j = 0; j < 5; j++) {
                System.out.println("La fila " + i + " columna " + j + " de la matriz tiene el valor: " + m[i][j]);
            }
        }
        //Paso 5. calcular e informar la suma de los elementos de la fila 1
        int suma = 0;
        for (i = 0; i < 5; i++) {
            suma = suma + m[1][i];
        }
        System.out.println();
        System.out.println("La suma de los elementos de la fila 1 es: " + suma);
        System.out.println();
        //Paso 6. generar un vector de 5 posiciones donde cada posición j
        //contiene la suma de los elementos de la columna j de la matriz. 
        //Luego, imprima el vector.
        int[] v = new int[5];
        for (j = 0; j < 5; j++) {
            v[j] = 0;
        }
        for (j = 0; j < 5; j++) {
            for (i = 0; i < 5; i++) {
                v[j] = v[j] + m[i][j];
            }
        }
        for (j = 0; j < 5; j++) {
            System.out.println("La suma de los valores de la columna " + j + " de la matriz es de: " + v[j]);
        }
        //Paso 7. lea un valor entero e indique si se encuentra o no en la matriz.
        //En caso de encontrarse indique su ubicación (fila y columna)
        // y en caso contrario imprima "No se encontró el elemento".
        int n, f=-1,c = -1;
        boolean esta = false;
        System.out.println("Ingrese un valor entero: ");
        n = Lector.leerInt();
        for (i = 0; i < 5; i++) {
            for (j = 0; j < 5; j++) {
                if (m[i][j] == n) {
                    esta = true;
                    f = i;
                    c = j;
                }
            }
        }
        System.out.println();
        if (esta) {
            System.out.println("El valor se encuentra en la fila " + f + " columna " + c + " de la matriz.");
        } else {
            System.out.println("No se encontró el elemento");
        }
    }
}
