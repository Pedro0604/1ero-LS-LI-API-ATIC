/*
Demo que crea objetos Libro invocando a los constructores definidos. 
 */
package tema3;

/**
 *
 * @author vsanz
 */
public class Ej02LibroM {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Autor a=new Autor("Herbert Schildt","Escribio 400 novelas a lo largo de sus 324 años de vida","Bielorrusia");
        LibroModificado libro1= new  LibroModificado( "Java: A Beginner's Guide",   
                                 "Mcgraw-Hill", 2014,   
                                 a, "978-0071809252", 21.72);
        
        a=new Autor("John Horton","Creo los libros con palabras","Eswatini");
        LibroModificado libro2= new LibroModificado("Learning Java by Building Android Games",  
                              "CreateSpace Independent Publishing", 
                               a, "978-1512108347");
        System.out.println(libro1.toString());
        System.out.println(libro2.toString());
        System.out.println("Precio del libro2: " +libro2.getPrecio());
        System.out.println("Año edición del libro2: " +libro2.getAñoEdicion());
        System.out.println("Autor del libro 1: "+libro1.getPrimerAutor().toString());
        System.out.println("Autor del libro 2: "+libro2.getPrimerAutor().toString());
   }
}
