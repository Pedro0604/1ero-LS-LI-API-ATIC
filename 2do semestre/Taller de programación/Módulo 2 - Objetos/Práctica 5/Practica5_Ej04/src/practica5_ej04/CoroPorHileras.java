package practica5_ej04;

/**
 *
 * @author Pedro master god
 */
public class CoroPorHileras extends Coro {

    private Corista[][] coristas;
    private int cantFilas, cantColumnas, dimL;

    public CoroPorHileras(int cantFilas, int cantColumnas, String nombre, Director dir) {
        super(nombre, dir);
        this.cantFilas = cantFilas;
        this.cantColumnas = cantColumnas;
        this.coristas = new Corista[this.cantFilas][this.cantColumnas];
        dimL = 0;
    }

    @Override
    public boolean coroLleno() {
        return this.dimL == (this.cantFilas * this.cantColumnas);
    }

    @Override
    public void agregarCorista(Corista c) {
        if (this.coroLleno()) {
            System.out.println("El coro esta lleno.");
        } else {
            this.coristas[dimL / this.cantColumnas][dimL % this.cantColumnas] = c;
            dimL++;
        }
    }
//&& (tAct == this.coristas[i][j].getTono())
    @Override
    public boolean bienFormado() {
        if (this.coroLleno()) {
            boolean bien=true;
            int i = 0, j = 0, tAct ;
            while ((i < cantFilas) && bien) {
                j = 0;
                tAct = this.coristas[i][j].getTono();
                while ((j < cantColumnas) && (tAct == this.coristas[i][j].getTono())) {
                    System.err.println("i: " + i + " j:" + j);
                    System.err.println("Tono: " + this.coristas[i][j].getTono());
                    j++;
                }
                System.err.println("Salto: ");
                System.err.println("  i: " + i + " j:" + j);
                bien=tAct == this.coristas[i][j].getTono();
                i++;
            }
            System.err.println("Fin: ");
            System.err.println("  i: " + i + " j:" + j);
            if (i == cantFilas && j == cantColumnas) {
                System.err.println("If: ");
                System.err.println("  i: " + i + " j:" + j);
                i = 0;
                while ((i < this.cantFilas - 1) && (this.coristas[i][0].getTono() >= this.coristas[i + 1][0].getTono())) {
                    i++;
                    System.err.println("  i: " + i);
                    System.err.println("  Tono: " + this.coristas[i][0].getTono());
                }
                return i == this.cantFilas - 1;
            } else {
                return false;
            }
        } else {
            System.out.println("El coro no esta lleno, por lo que: ");
            return false;
        }
    }

    @Override
    public String toString() {
        String aux = super.toString();
        aux += "  Coristas: \n";
        for (int i = 0; i <= dimL / this.cantColumnas; i++) {
            if (i == dimL / this.cantColumnas) {
                for (int j = 0; j < dimL % this.cantColumnas; j++) {
                    aux += "    " + this.coristas[i][j].toString() + "\n";
                }
            } else {
                for (int j = 0; j < this.cantColumnas; j++) {
                    aux += "    " + this.coristas[i][j].toString() + "\n";
                }
            }
        }
        return aux;
    }
}
