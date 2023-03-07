package practica5_ej03;

/**
 *
 * @author Pedro master god
 */
public class Fecha {
    private String ciudad;
    private int dia;

    public Fecha(String ciudad, int dia) {
        this.ciudad = ciudad;
        this.dia = dia;
    }

    public String getCiudad() {
        return ciudad;
    }

    public void setCiudad(String ciudad) {
        this.ciudad = ciudad;
    }

    public int getDia() {
        return dia;
    }

    public void setDia(int dia) {
        this.dia = dia;
    }
    
}
