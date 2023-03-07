/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema4;

/**
 *
 * @author Lucia
 */
public class Triangulo extends Figura {

    private double lado1;
    private double lado2;
    private double lado3;

    //public Triangulo() {
    //}

    public Triangulo(double l1, double l2, double l3, String colorRelleno, String colorLinea) {
        super(colorRelleno, colorLinea);
        lado1 = l1;
        lado2 = l2;
        lado3 = l3;
    }

    public double getLado1() {
        return lado1;
    }

    public double getLado2() {
        return lado2;
    }

    public double getLado3() {
        return lado3;
    }

    public void setLado1(double l1) {
        lado1 = l1;
    }

    public void setLado2(double l2) {
        lado2 = l2;
    }

    public void setLado3(double l3) {
        lado3 = l3;
    }

    @Override
    public double calcularPerimetro() {
        double per;
        per = lado1 + lado2 + lado3;
        return per;
    }

    @Override
    public double calcularArea() {
        double area, s;
        s = (lado1 + lado2 + lado3) / 2;
        area = Math.sqrt(s * (s - lado1) * (s - lado2) * (s - lado3));
        return area;
    }

    @Override
    public String toString() {
        String aux = "Lado 1: " + this.lado1
                + " Lado 2: " + this.lado2
                + " Lado 3: " + this.lado3
                + super.toString();
        return aux;
    }
}
