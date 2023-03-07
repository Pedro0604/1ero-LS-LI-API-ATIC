package tema3;

/**
 *
 * @author Pedro master god
 */
public class Circulo {
    private double radio;
    private String colorRelleno;
    private String colorLinea;
    
    public Circulo(){
    }
    
    public Circulo(double r,String cR,String cL){
        radio=r;
        colorRelleno=cR;
        colorLinea=cL;
    }
    
    public double getRadio(){
        return radio;
    }
    
    public String getColorRelleno(){
        return colorRelleno;
    }
    
    public String getColorLinea(){
        return colorLinea;
    }
    
    public void setRadio(double r){
        radio=r;
    }
    
    public void setColorRelleno(String c){
        colorRelleno=c;
    }
    
    public void setColorLinea(String c){
        colorLinea=c;
    }
    
    public double calcularPerimetro(){
        return (2*Math.PI*radio);
    }
    
    public double calcularArea(){
        return (Math.PI*(Math.pow(radio, 2)));
    }
}
