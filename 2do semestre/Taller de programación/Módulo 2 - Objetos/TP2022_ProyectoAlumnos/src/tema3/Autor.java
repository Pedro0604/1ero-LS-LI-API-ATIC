/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema3;

/**
 *
 * @author Lucia
 */
public class Autor {
    private String nombre;
    private String bibliografia;
    private String origen;
    
    
    public Autor(String nombre,String bibl,String or){
        this.nombre=nombre;
        bibliografia=bibl;
        origen=or;
    }
    
    public Autor(){
    }
    
    
    public String getNombre(){
        return nombre;
    }
    
    public String getBibliografia(){
        return bibliografia;
    }
    
    public String getOrigen(){
        return origen;
    }
    
    
    public void setNombre(String n){
        nombre=n;
    }
    
    public void setBibliografia(String b){
        bibliografia=b;
    }
    
    public void setOrigen(String o){
        origen=o;
    }
    
    @Override
    public String toString(){
        return ("El autor "+nombre+" nacido en "+origen+"-"+bibliografia);
    }
}
