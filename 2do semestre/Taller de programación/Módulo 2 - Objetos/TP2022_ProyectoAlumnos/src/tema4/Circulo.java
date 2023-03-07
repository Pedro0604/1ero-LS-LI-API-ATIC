package tema4;

/**
 *
 * @author Pedro master god
 */
public class Circulo extends Figura {

    private double radio;

    //public Circulo(){
    //}
    public Circulo(double r, String cR, String cL) {
        super(cR, cL);
        radio = r;
    }

    public double getRadio() {
        return radio;
    }

    public void setRadio(double r) {
        radio = r;
    }

    @Override
    public double calcularPerimetro() {
        return (2 * Math.PI * radio);
    }

    @Override
    public double calcularArea() {
        return (Math.PI * (Math.pow(radio, 2)));
    }
    
    @Override
    public String toString(){
        String aux="Radio: "+this.radio
                +" "+super.toString();
        return aux;
    }
}
