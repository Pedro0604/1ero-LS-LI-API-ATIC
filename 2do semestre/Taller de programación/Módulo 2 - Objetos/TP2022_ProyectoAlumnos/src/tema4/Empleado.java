package tema4;

/**
 *
 * @author Lucia
 */
public abstract class Empleado {

    private String nombre;
    private double sueldoBasico;
    private int antiguedad;

    public Empleado(String n, double s, int a) {
        setNombre(n);
        setSueldoBasico(s);
        setAntiguedad(a);
    }
    
    public Empleado(){
    }
    
    public void setNombre(String n){
        this.nombre=n;
    }
    
    public void setSueldoBasico(double s){
        this.sueldoBasico=s;
    }
    
    public void setAntiguedad(int a){
        this.antiguedad=a;
    }
    
    public String getNombre(){
        return this.nombre;
    }
    
    public double getSueldoBasico(){
        return this.sueldoBasico;
    }
    
    public int getAntiguedad(){
        return this.antiguedad;
    }
    
    public abstract double calcularEfectividad();
    
    public double calcularSueldoACobrar(){
        double aux=this.getSueldoBasico()
                +0.1*this.getSueldoBasico()
                *this.getAntiguedad();
        return aux;
    }
           
    public String toString(){
        String aux="Nombre: "+this.nombre
                +" Sueldo a cobrar: "+this.calcularSueldoACobrar()
                +" Efectividad: "+this.calcularEfectividad();
        return aux;
    }
}
