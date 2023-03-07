package UNLP;

/**
 *
 * @author Pedro master god
 */
public class Investigador {

    private String nombre, especialidad;
    private int categoria, cantSub;
    private Subsidio[] subsidios;

    public Investigador(String nombre, int categoria, String especialidad) {
        this.nombre = nombre;
        this.especialidad = especialidad;
        this.categoria = categoria;
        this.subsidios = new Subsidio[5];
        this.cantSub = 0;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getEspecialidad() {
        return especialidad;
    }

    public void setEspecialidad(String especialidad) {
        this.especialidad = especialidad;
    }

    public int getCategoria() {
        return categoria;
    }

    public void setCategoria(int categoria) {
        this.categoria = categoria;
    }

    public int getCantSub() {
        return cantSub;
    }

    public void setCantSub(int cantSub) {
        this.cantSub = cantSub;
    }

    public Subsidio[] getSubsidios() {
        return subsidios;
    }

    public void setSubsidios(Subsidio[] subsidios) {
        this.subsidios = subsidios;
    }

    public void agregarSubsidio(Subsidio unSubsidio) {
        if (this.cantSub < 5) {
            this.subsidios[cantSub] = unSubsidio;
            this.cantSub++;
        } else {
            System.out.println("El investigador tiene la cantidad maxima de subsidios.");
        }
    }

    public double dineroTotalSubsidios() {
        double monto = 0;
        for (int i = 0; i < this.cantSub; i++) {
            monto += this.subsidios[i].getMonto();
        }
        return monto;
    }

    @Override
    public String toString() {
        return "Investigador{" + "nombre=" + nombre + ", especialidad=" + especialidad + ", categoria=" + categoria + ", dineroTotalSubsidios=" + dineroTotalSubsidios() + '}';
    }
}
