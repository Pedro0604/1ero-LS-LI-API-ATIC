package practica5_ej03;

/**
 *
 * @author Pedro master god
 */
public abstract class Recital {

    private String nombreBanda;
    private String[] temas;
    private int cantTemas, dimL;

    public Recital(String nombreBanda, int cantTemas) {
        this.nombreBanda = nombreBanda;
        this.cantTemas = cantTemas;
        this.temas = new String[cantTemas];
        this.dimL = 0;
    }

    public String getNombreBanda() {
        return nombreBanda;
    }

    public void setNombreBanda(String nombreBanda) {
        this.nombreBanda = nombreBanda;
    }

    public int getCantTemas() {
        return cantTemas;
    }

    public void setCantTemas(int cantTemas) {
        this.cantTemas = cantTemas;
    }

    public void agregarTema(String tema) {
        if (dimL < cantTemas) {
            this.temas[dimL] = tema;
            dimL++;
        }
        else{
            System.err.println("Cantidad maxima de temas alcanzada.");
        }
    }
    
    public void actuar(){
        String aux="";
        for(int i=0;i<this.cantTemas;i++){
            aux+="  y ahora tocaremos: "+this.temas[i]+".\n";
        }
        System.out.println(aux);
    }
    
    public abstract double calcularCosto();
}
