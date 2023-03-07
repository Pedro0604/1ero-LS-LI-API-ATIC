package practica5_ej02;

/**
 *
 * @author Pedro master god
 */
public class Auto {

    private String nombreD;
    private String patente;

    public Auto(String nombreD, String patente) {
        this.nombreD = nombreD;
        this.patente = patente;
    }

    public String getNombreD() {
        return nombreD;
    }

    public void setNombreD(String nombreD) {
        this.nombreD = nombreD;
    }

    public String getPatente() {
        return patente;
    }

    public void setPatente(String patente) {
        this.patente = patente;
    }

    @Override
    public String toString() {
        return "Auto{" + "nombreD=" + nombreD + ", patente=" + patente + '}';
    }
}
