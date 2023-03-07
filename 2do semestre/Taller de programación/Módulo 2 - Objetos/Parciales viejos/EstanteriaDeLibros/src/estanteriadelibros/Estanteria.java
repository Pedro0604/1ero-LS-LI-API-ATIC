package estanteriadelibros;

/**
 *
 * @author Pedro master god
 */
public class Estanteria {

    private Libro[][] estantes;
    private int cantEstantes, cantLibros;

    public Estanteria(int cantEstantes, int cantLibros) {
        this.cantEstantes = cantEstantes;
        this.cantLibros = cantLibros;
        this.estantes = new Libro[cantEstantes][cantLibros];

    }

    public int getCantEstantes() {
        return cantEstantes;
    }

    public int getCantLibros() {
        return cantLibros;
    }

    public void almacenarLibro(Libro l, int est, int lugar) {
        this.estantes[est][lugar] = l;
    }

    public void almacenarLibro(Libro l, int est) {
        int i = 0;
        while (this.estantes[est][i] != null) {
            i++;
        }
        this.estantes[est][i] = l;
    }

    public void almacenarLibro(Libro l) {
        int i = 0, j = 0;
        while ((i < this.cantEstantes - 1) && (this.estantes[i][j] != null)) {
            while ((j < this.cantLibros - 1) && (this.estantes[i][j] != null)) {
                j++;
            }
            if (this.estantes[i][j] != null) {
                i++;
                j = 0;
            }
        }
        this.estantes[i][j] = l;
    }

    public Libro sacarLibro(String titulo) {
        Libro l = null;
        boolean esta = false;
        int i = 0, j;
        while ((i < this.cantEstantes) && !(esta)) {
            j = 0;
            while ((j < this.cantLibros) && !(esta)) {
                if ((this.estantes[i][j] != null) && (this.estantes[i][j].getTitulo().equalsIgnoreCase(titulo))) {
                    esta = true;
                    l = this.estantes[i][j];
                }
                j++;
            }
            i++;
        }
        return l;
    }

    public Libro sacarLibro(int X, int Y) {
        return this.estantes[X - 1][Y - 1];
    }

    public Libro calcular() {
        Libro l = null;
        double pesoMax = -1;
        for (int i = 0; i < this.cantEstantes; i++) {
            for (int j = 0; j < this.cantLibros; j++) {
                if ((this.estantes[i][j] != null) && (this.estantes[i][j].getPeso() > pesoMax)) {
                    pesoMax = this.estantes[i][j].getPeso();
                    l = this.estantes[i][j];
                }
            }
        }

        return l;
    }

    @Override
    public String toString() {
        String aux = "Estanteria{\n  Libros:";
        for (int i = 0; i < this.cantEstantes; i++) {
            aux += "\n   Estante " + i;
            for (int j = 0; j < this.cantLibros; j++) {
                if (this.estantes[i][j] != null) {
                    aux += "\n    " + this.estantes[i][j].toString();
                } else {
                    aux += "\n    Lugar vacio.";
                }
            }
        }
        aux += '}';
        return aux;
    }
}
