package tema3;

import PaqueteLectura.GeneradorAleatorio;

/**
 *
 * @author Pedro master god
 */
public class Habitacion {

    private double costo = GeneradorAleatorio.generarDouble(6000) + 2000;
    private boolean ocupada = false;
    private Cliente cl;

    public void setCosto(double c) {
        costo = c;
    }

    public void setOcupacion(boolean o) {
        ocupada = o;
    }

    public void setCliente(Cliente c) {
        cl = c;
    }

    public double getCosto() {
        return costo;
    }

    public boolean getOcupacion() {
        return ocupada;
    }

    public Cliente getCliente() {
        return cl;
    }

    public Habitacion(Cliente c) {
        cl = c;
    }

    public Habitacion() {
    }

    @Override
    public String toString() {
        String aux = "";
        aux += "$" + costo + " - ";
        if (ocupada) {
            aux += "Ocupada - " + cl.toString();
        } else {
            aux += "Libre";
        }
        return aux;
    }
}
