package parcial_18_03_2022;

/**
 *
 * @author Pedro master god
 */
public class Concurso {
    private Pareja[] parejas;
    private int cantP,dimL;

    public Concurso(int cantP) {
        this.cantP = cantP;
        this.parejas=new Pareja[cantP];
    }
    
    public void agregarPareja(Pareja p){
        this.parejas[dimL]=p;
        dimL++;
    }
    
    public Pareja mayorDiferenciaEdad(){
        Pareja pMax=null;
        int difMax=-1;
        for (int i=0;i<dimL;i++){
            if(this.parejas[i].diferenciaEdad()>difMax){
                difMax=this.parejas[i].diferenciaEdad();
                pMax=this.parejas[i];
            }
        }
        return pMax;
    }

    @Override
    public String toString() {
        String aux= "Concurso{" + "cantP=" + cantP;
        for (int i=0;i<dimL;i++){
            aux+="\n  "+this.parejas[i].toString();
        }
        aux+="}";
        return aux;
    }
    
    
}
