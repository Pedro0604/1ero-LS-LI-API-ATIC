package tema4;

/**
 *
 * @author Lucia
 */
public class Entrenador extends Empleado{
    private int cantC;
    
    public Entrenador(String nom, double suel, int ant,int cantC){
        super(nom,suel,ant);
        setCantC(cantC);
    }
    
    public Entrenador(){
    }
    
    public void setCantC(int cC){
        this.cantC=cC;
    }
    
    public int getCantC(){
        return this.cantC;
    }
    
    @Override
    public double calcularEfectividad(){
        return ((double)cantC/this.getAntiguedad());
    }
    
    @Override
    public double calcularSueldoACobrar(){
        double aux=super.calcularSueldoACobrar();
        if(cantC>1){
            if(cantC<=4){
                aux+=5000;
            }
            else if(cantC<=10){
                aux+=30000;
            }
            else{
                aux+=50000;
            }
        }
        return aux;
    }
    
    @Override
    public String toString(){
        String aux=super.toString()
                +" Cantidad de campeonatos ganados: "+this.cantC;
        return aux;
    }
}
