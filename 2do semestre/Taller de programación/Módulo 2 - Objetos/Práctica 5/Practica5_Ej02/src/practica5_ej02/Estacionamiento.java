package practica5_ej02;

/**
 *
 * @author Pedro master god
 */
public class Estacionamiento {

    private String nombre, direccion;
    private int horaA, horaC;
    private Auto[][] autos;
    private int cantPisos, cantPlazas;

    public Estacionamiento(String nombre, String direccion) {
        this.nombre = nombre;
        this.direccion = direccion;
        this.horaA = 8;
        this.horaC = 21;
        this.autos = new Auto[5][10];
        this.cantPisos = 5;
        this.cantPlazas = 10;
    }

    public Estacionamiento(String nombre, String direccion, int horaA, int horaC, int numPisos, int numPlazas) {
        this.nombre = nombre;
        this.direccion = direccion;
        this.horaA = horaA;
        this.horaC = horaC;
        this.autos = new Auto[numPisos][numPlazas];
        this.cantPisos = numPisos;
        this.cantPlazas = numPlazas;
    }

    public int getCantPisos() {
        return cantPisos;
    }

    public int getCantPlazas() {
        return cantPlazas;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public int getHoraA() {
        return horaA;
    }

    public void setHoraA(int horaA) {
        this.horaA = horaA;
    }

    public int getHoraC() {
        return horaC;
    }

    public void setHoraC(int horaC) {
        this.horaC = horaC;
    }

    public void estacionar(Auto A, int X, int Y) {
        this.autos[X - 1][Y - 1] = A;
    }

    public String infoPatente(String pat) {
        int i = 0, j;
        while (i < this.cantPisos) {
            j = 0;
            while (j < this.cantPlazas) {
                if ((this.autos[i][j] != null) && (this.autos[i][j].getPatente().equalsIgnoreCase(pat))) {
                    return ("El auto de patente " + pat + " se encuentra en el piso " + (i + 1) + ", plaza " + (j + 1) + ".");
                }
                j++;
            }
            i++;
        }
        return "Auto inexistente.";
    }

    @Override
    public String toString() {
        String aux = "Estacionamiento:\n";
        for (int i = 0; i < this.cantPisos; i++) {
            aux += "  Piso " + (i + 1) + ":\n";
            for (int j = 0; j < this.cantPlazas; j++) {
                aux += "    Plaza " + (j + 1) + ": ";
                if (this.autos[i][j] == null) {
                    aux += "Libre.";
                } else {
                    aux += this.autos[i][j].toString();
                }
                aux += "\n";
            }
            aux += "\n";
        }
        return aux;
    }

    public int cantPorPlaza(int Y) {
        int cant = 0;
        for (int i = 0; i < this.cantPisos; i++) {
            if (this.autos[i][Y - 1] != null) {
                cant++;
            }
        }
        return cant;
    }
}
