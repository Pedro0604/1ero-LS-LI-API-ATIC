/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema3;

/**
 *
 * @author Lucia
 */
public class Estante {

    private Libro[] e = new Libro[20];
    private int dimL = 0;

    public Estante() {
    }

    public int cantLibros() {
        return dimL;
    }

    public boolean estanteLleno() {
        return (20 == dimL);
    }
    
    public boolean estanteVacio() {
        return (0 == dimL);
    }

    public void addLibro(Libro l) {
        if (this.estanteLleno()) {
            System.out.println("El estante está lleno.");
        } else {
            this.e[dimL] = l;
            dimL++;
        }
    }

    public Libro libroConTitulo(String t) {
        int i = 0;
        t=t.toLowerCase();
        while ((i < dimL) && !(e[i].getTitulo().toLowerCase().equals(t))) {
            i++;
        }
        if (i < dimL) {
            return e[i];
        } else {
            return null;
        }
    }

    @Override
    public String toString() {
        if(this.estanteVacio()){
            return "El estante está vacío.";
        }
        else{
        String aux="El estante tiene los siguientes libros: ";
        for (int i=0;i<dimL;i++){
            aux+=e[i].toString()+"  |  ";
        }
        return aux;
        }
    }
}
