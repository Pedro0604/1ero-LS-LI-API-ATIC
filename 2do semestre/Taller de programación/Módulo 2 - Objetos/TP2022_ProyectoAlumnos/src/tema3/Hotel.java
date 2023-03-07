package tema3;

/**
 *
 * @author Pedro master god
 */
public class Hotel {

    private Habitacion[] h;
    private int cantHab = 0;

    public Habitacion getHabitacion(int n) {
        return h[n - 1];
    }

    public int getCantHab() {
        return cantHab;
    }

    public Hotel(int n) {
        h = new Habitacion[n];
        cantHab = n;
        for (int i = 0; i < n; i++) {
            h[i] = new Habitacion();
        }
    }

    public void ocupar(Cliente c, int n) {
        h[n - 1].setCliente(c);
        h[n - 1].setOcupacion(true);
    }

    public void aumentar(double m) {
        double c;
        for (int i = 0; i < cantHab; i++) {
            c = h[i].getCosto();
            h[i].setCosto(c + m);
        }
    }

    @Override
    public String toString() {
        String aux = "Hotel:\n";
        for (int i = 0; i < cantHab; i++) {
            aux += "  Habitacion " + (i + 1) + ": " + h[i].toString() + ".\n";
        }
        return aux;
    }
}
