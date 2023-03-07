package practica5_ej04;

/**
 *
 * @author Pedro master god
 */
public class CoroSemicircular extends Coro {

    private Corista[] coristas;
    private int cantCoristas, dimL;

    public CoroSemicircular(int cantCoristas, String nombre, Director dir) {
        super(nombre, dir);
        this.cantCoristas = cantCoristas;
        this.coristas = new Corista[this.cantCoristas];
        dimL = 0;
    }

    @Override
    public boolean coroLleno() {
        return this.dimL == this.cantCoristas;
    }

    @Override
    public void agregarCorista(Corista c) {
        if (this.coroLleno()) {
            System.out.println("El coro esta lleno.");
        } else {
            this.coristas[this.dimL] = c;
            this.dimL++;
        }
    }

    @Override
    public boolean bienFormado() {
        if (this.coroLleno()) {
            int i = 0;
            while ((i < this.cantCoristas - 1) && (this.coristas[i].getTono() >= this.coristas[i + 1].getTono())) {
                i++;
            }
            return i == this.cantCoristas - 1;
        } else {
            System.out.println("El coro no esta lleno, por lo que ");
            return false;
        }
    }

    @Override
    public String toString() {
        String aux = super.toString();
        aux += "  Coristas: \n";
        for (int i = 0; i < dimL; i++) {
            aux += "    " + this.coristas[i].toString() + "\n";
        }
        return aux;
    }

}
