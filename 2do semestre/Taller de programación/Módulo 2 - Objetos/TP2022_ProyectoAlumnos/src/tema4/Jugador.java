/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema4;

/**
 *
 * @author Lucia
 */
public class Jugador extends Empleado {

    private int cantP, cantG;

    public Jugador(String nom, double suel, int ant, int cantP, int cantG) {
        super(nom, suel, ant);
        setCantP(cantP);
        setCantG(cantG);
    }
    
    public Jugador(){        
    }

    public void setCantP(int cP) {
        this.cantP = cP;
    }

    public void setCantG(int cG) {
        this.cantG = cG;
    }

    public int getCantP() {
        return this.cantP;
    }

    public int getCantG() {
        return this.cantG;
    }
    
    @Override
    public double calcularEfectividad(){
        return ((double)cantG/cantP);
    }
    
    @Override
    public double calcularSueldoACobrar(){
        double aux=super.calcularSueldoACobrar();
        if(this.calcularEfectividad()>0.5){
            aux+=this.getSueldoBasico();
        }
        return aux;
    }
    
    @Override
    public String toString(){
        String aux=super.toString()
                +" Cantidad de partidos jugados: "+this.cantP
                +" Cantidad de goles: "+this.cantG;
       return aux;
    }
}
