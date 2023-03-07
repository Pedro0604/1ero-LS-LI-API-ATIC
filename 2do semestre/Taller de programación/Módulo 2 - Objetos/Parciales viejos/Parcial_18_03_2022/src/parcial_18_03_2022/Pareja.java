package parcial_18_03_2022;

/**
 *
 * @author Pedro master god
 */
public class Pareja {
    private Participante participante1, participante2;
    private String estilo;

    public Pareja(Participante participante1, Participante participante2, String estilo) {
        this.participante1 = participante1;
        this.participante2 = participante2;
        this.estilo = estilo;
    }
    
    public int diferenciaEdad(){
        int aux;
        aux=this.participante1.getEdad()-this.participante2.getEdad();
        if(aux<0){
            aux=-aux;
        }
        return aux;
    }

    public String getEstilo() {
        return estilo;
    }
    
    public String getNombreParticipante1() {
        return participante1.getNombre();
    }
    
    public String getNombreParticipante2() {
        return participante2.getNombre();
    }

    @Override
    public String toString() {
        String aux= "Pareja{" + "estilo=" + estilo 
                + "Participantes: \n    "+this.participante1.toString()
                +"\n    "+this.participante2.toString()+'}';
        return aux;
    }
}
