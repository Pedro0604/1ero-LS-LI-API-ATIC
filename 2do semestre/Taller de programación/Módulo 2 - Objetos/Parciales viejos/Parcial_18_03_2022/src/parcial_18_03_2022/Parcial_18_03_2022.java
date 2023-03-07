package parcial_18_03_2022;

import PaqueteLectura.GeneradorAleatorio;

/**
 *
 * @author Pedro master god
 */
public class Parcial_18_03_2022 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        int cantParejas = GeneradorAleatorio.generarInt(20);
        Concurso c = new Concurso(cantParejas);

        int dni, edad;
        String nom;
        Participante p1, p2;

        for (int i = 0; i < cantParejas; i++) {
            dni = GeneradorAleatorio.generarInt(50000000);
            nom = GeneradorAleatorio.generarString(15);
            edad = GeneradorAleatorio.generarInt(60) + 15;
            p1 = new Participante(dni, nom, edad);

            dni = GeneradorAleatorio.generarInt(50000000);
            nom = GeneradorAleatorio.generarString(15);
            edad = GeneradorAleatorio.generarInt(60) + 15;
            p2 = new Participante(dni, nom, edad);

            String estilo = GeneradorAleatorio.generarString(20);
            Pareja pareja1 = new Pareja(p1, p2, estilo);

            c.agregarPareja(pareja1);
        }

        Pareja parejaMax = c.mayorDiferenciaEdad();
        System.out.println(c.toString());
        System.out.println("El nombre de los participantes con mayor diferencia de edad es: " + parejaMax.getNombreParticipante1() + " y " + parejaMax.getNombreParticipante2() + ".");
    }

}
