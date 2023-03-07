package tema4;

/**
 *
 * @author Lucia
 */
public class Trabajador extends Persona{
    private String trabajo;
    
    public Trabajador(String unNombre, int unDNI, int unaEdad,String t){
        super(unNombre,unDNI,unaEdad);
        setTrabajo(t);
    }
    
    public Trabajador(){
    }
    
    public void setTrabajo(String t){
        this.trabajo=t;
    }
    
    public String getTrabajo(){
        return this.trabajo;
    }
    
    @Override
    public String toString(){
        String aux=super.toString()
                +" Soy "+this.trabajo;
        return aux;
    }
}
