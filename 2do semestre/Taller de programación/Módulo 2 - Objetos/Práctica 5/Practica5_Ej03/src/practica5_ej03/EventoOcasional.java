package practica5_ej03;

/**
 *
 * @author Pedro master god
 */
public class EventoOcasional extends Recital{
    private String motivo,nombreContratante;
    private int dia;

    public EventoOcasional(String motivo, String nombreContratante, int dia, String nombreBanda, int cantTemas) {
        super(nombreBanda, cantTemas);
        this.motivo = motivo;
        this.nombreContratante = nombreContratante;
        this.dia = dia;
    }

    public String getMotivo() {
        return motivo;
    }

    public void setMotivo(String motivo) {
        this.motivo = motivo;
    }

    public String getNombreContratante() {
        return nombreContratante;
    }

    public void setNombreContratante(String nombreContratante) {
        this.nombreContratante = nombreContratante;
    }

    public int getDia() {
        return dia;
    }

    public void setDia(int dia) {
        this.dia = dia;
    }

    @Override
    public void actuar() {
        if(this.motivo.equalsIgnoreCase("a beneficio")){
            System.out.println("Recuerden colaborar con "+this.nombreContratante+"!!!");
        }
        else if (this.motivo.equalsIgnoreCase("show de tv")){
            System.out.println("Saludos amigos televidentes!!!");
        }
        else{
            System.out.println("Un feliz cumpleaños para "+this.nombreContratante+"!!!");
        }
        super.actuar();
    }

    @Override
    public double calcularCosto() {
        if(this.motivo.equalsIgnoreCase("a beneficio")){
            return 0;
        }
        else if (this.motivo.equalsIgnoreCase("show de tv")){
            return 50000;
        }
        else{
            return 150000;
        }
    }
}
