package tema1;

//Paso 1: Importar la funcionalidad para lectura de datos
import PaqueteLectura.GeneradorAleatorio;
//import PaqueteLectura.Lector;

public class Ej02Jugadores {

    public static void main(String[] args) {
        //Paso 2: Declarar la variable vector de double 
        double[] alturas;
        int dimF = 15;
        //Paso 3: Crear el vector para 15 double 
        alturas = new double[dimF];
        //Paso 4: Declarar indice y variables auxiliares a usar
        int i;
        double suma = 0, prom;
        //Paso 6: Ingresar 15 numeros (altura), cargarlos en el vector, ir calculando la suma de alturas
        GeneradorAleatorio.iniciar();
        for (i = 0; i < 15; i++) {
            System.out.println("Ingrese la altura del jugador: ");
            //alturas[i]=Lector.leerDouble();
            alturas[i] = GeneradorAleatorio.generarDouble(2) + 1.6;
            System.out.println(alturas[i]);
        }
        //Paso 7: Calcular el promedio de alturas, informarlo
        for (i = 0; i < 15; i++) {
            suma = suma + alturas[i];
        }
        prom = suma / dimF;
        System.out.println("La altura promedio de los jugadores es de: " + prom);
        //Paso 8: Recorrer el vector calculando lo pedido (cant. alturas que están por encima del promedio)
        int cant = 0;
        for (i = 0; i < 15; i++) {
            if (alturas[i] > prom) {
                cant++;
            }
        }
        //Paso 9: Informar la cantidad.
        System.out.println("La cantidad de jugadores con alturas por encima del promedio es de: " + cant);
    }

}
