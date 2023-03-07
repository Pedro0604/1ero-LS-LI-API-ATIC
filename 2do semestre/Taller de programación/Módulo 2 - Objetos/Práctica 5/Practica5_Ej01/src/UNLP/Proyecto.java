package UNLP;

/**
 *
 * @author Pedro master god
 */
public class Proyecto {

    private String nombre, nombreD;
    private int codigo, cantInv;
    private Investigador[] investigadores;

    public Proyecto(String nombre, int codigo, String nombreD) {
        this.nombre = nombre;
        this.nombreD = nombreD;
        this.codigo = codigo;
        this.investigadores = new Investigador[50];
        this.cantInv = 0;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getNombreD() {
        return nombreD;
    }

    public void setNombreD(String nombreD) {
        this.nombreD = nombreD;
    }

    public int getCodigo() {
        return codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    public int getCantInv() {
        return cantInv;
    }

    public void setCantInv(int cantInv) {
        this.cantInv = cantInv;
    }

    public void agregarInvestigador(Investigador unInvestigador) {
        if (this.cantInv < 50) {
            this.investigadores[cantInv] = unInvestigador;
            this.cantInv++;
        } else {
            System.out.println("El proyecto tiene la cantidad maxima de investigadores.");
        }
    }

//    public double dineroTotalOtorgado() {
//        double montoTotal = 0;
//        for (int i = 0; i < this.cantInv; i++) {
//            Investigador invAct = this.investigadores[i];
//            for (int j = 0; j < invAct.getCantSub(); j++) {
//                montoTotal += invAct.getSubsidios()[j].getMonto();
//            }
//        }
//        return montoTotal;
//    }
    public double dineroTotalOtorgado() {
        double montoTotal = 0;
        for (int i = 0; i < this.cantInv; i++) {
            montoTotal += this.investigadores[i].dineroTotalSubsidios();
        }
        return montoTotal;
    }

    public void otorgarTodos(String nombre_completo) {
        int i = 0;
        while ((i < this.cantInv) && (this.investigadores[i].getNombre().equals(nombre_completo))) {
            i++;
        }
        if ((i < this.cantInv) && (this.investigadores[i].getNombre().equals(nombre_completo))) {
            for (int j = 0; j < this.investigadores[i].getCantSub(); j++) {
                this.investigadores[i].getSubsidios()[j].setOtorgado(true);
            }
        }
    }

    @Override
    public String toString() {
        String aux = "Proyecto{" + "nombre=" + nombre + ", nombreD=" + nombreD + ", codigo=" + codigo + ", dineroTotalOtorgado=" + dineroTotalOtorgado() + "\n Investigadores:";
        for (int i = 0; i < this.cantInv; i++) {
            aux += "\n  " + this.investigadores[i].toString();
        }
        aux += "}";
        return aux;
    }
}
