package tema4;

/**
 *
 * @author Pedro master god
 */
public class VisorFigurasModificado {

    private int guardadas;
    private int capacidadMaxima;
    private Figura[] vector;

    public VisorFigurasModificado() {
        this.capacidadMaxima = 5;
        this.vector = new Figura[this.capacidadMaxima];
    }

    public void guardar(Figura f) {
        if (this.quedaEspacio()) {
            this.vector[this.guardadas] = f;
            this.guardadas++;
        } else {
            System.out.println("No hay más espacio para figuras.");
        }
    }

    public boolean quedaEspacio() {
        if (this.getGuardadas() < this.capacidadMaxima) {
            return true;
        } else {
            return false;
        }
    }

    public void mostrar() {
        String aux = "Figuras guardadas: \n";
        for (int i = 0; i < this.getGuardadas(); i++) {
            aux += "  " + this.vector[i].toString();
            aux += ". \n";
        }
        System.out.println(aux);
    }

    public int getGuardadas() {
        return guardadas;
    }
}
