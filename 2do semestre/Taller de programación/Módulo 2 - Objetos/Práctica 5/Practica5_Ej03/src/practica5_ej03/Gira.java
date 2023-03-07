package practica5_ej03;

/**
 *
 * @author Pedro master god
 */
public class Gira extends Recital{
    private String nombreGira;
    private Fecha[]fechas;
    private int fechaActual,cantFechas,dimL;

    public Gira(String nombreGira, int cantFechas, String nombreBanda, int cantTemas) {
        super(nombreBanda, cantTemas);
        this.nombreGira = nombreGira;
        this.cantFechas = cantFechas;
        this.fechas=new Fecha[cantFechas];
        this.dimL=0;
        this.fechaActual=0;
    }

    public int getCantFechas() {
        return cantFechas;
    }

    public void setCantFechas(int cantFechas) {
        this.cantFechas = cantFechas;
    }

    public String getNombreGira() {
        return nombreGira;
    }

    public void setNombreGira(String nombreGira) {
        this.nombreGira = nombreGira;
    }

    public int getFechaActual() {
        return fechaActual;
    }

    public void setFechaActual(int nextFecha) {
        this.fechaActual = nextFecha;
    }

    public void agregarFecha(Fecha fecha) {
        if (dimL < cantFechas) {
            this.fechas[dimL] = fecha;
            dimL++;
        }
        else{
            System.err.println("Cantidad maxima de fechas alcanzada.");
        }
    }

    @Override
    public void actuar() {
        System.out.println("Buenas noches "+this.fechas[this.fechaActual].getCiudad()+"!!!");
        super.actuar();
        this.fechaActual=fechaActual+1;
    }
    
    @Override
    public double calcularCosto() {
        return (30000*this.cantFechas);
    }
}
