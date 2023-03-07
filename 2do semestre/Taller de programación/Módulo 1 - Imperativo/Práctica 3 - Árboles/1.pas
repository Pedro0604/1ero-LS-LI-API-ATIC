
Program unoPracticatres;

Type 
    socio =   Record
        num:   int32;
        nombre:   string[20];
        edad:   integer;
    End;

    arbol =   ^nodo;

    nodo =   Record
        dato:   socio;
        hi,hd:   arbol;
    End;

Procedure CrearNombre(Var n:String; j:integer);

Var 
    i:   integer;
Begin
    i := random(16);
    Case i Of 
        0..2:
                Begin
                    n := n + 'a';
                    If (j<18)Then
                        CrearNombre(n,j+1);
                End;
        3..5:
                Begin
                    n := n + 'e';
                    If (j<18)Then
                        CrearNombre(n,j+1);
                End;
        6..8:
                Begin
                    n := n + 'i';
                    If (j<18)Then
                        CrearNombre(n,j+1);
                End;
        9..11:
                 Begin
                     n := n + 'o';
                     If (j<18)Then
                         CrearNombre(n,j+1);
                 End;
        12..14:
                  Begin
                      n := n + 'u';
                      If (j<18)Then
                          CrearNombre(n,j+1);
                  End;
    End;
End;

Procedure CargarSocio(Var s:socio);

Var 
    j:   integer;
Begin
    s.nombre := 'Pe';
    {writeln('Introduzca el numero de socio: ');
    readln(s.num);}
    s.num := random(101);
    If (s.num<>0) Then
        Begin
            {writeln('Introduzca el nombre del socio: ');
            readln(s.nombre);}
            j := 1;
            CrearNombre(s.nombre,j);
            {writeln('Introduzca la edad del socio: ');
            readln(s.edad);}
            s.edad := random(106)+12;
        End;
End;


Procedure CargarNodo(Var a:arbol;s:socio);
Begin
    If (a=Nil)Then
        Begin
            new(a);
            a^.dato := s;
            a^.hi := Nil;
            a^.hd := Nil;
        End
    Else If (s.num<a^.dato.num) Then
             CargarNodo(a^.hi,s)
    Else
        CargarNodo(a^.hd,s);
End;


Procedure CargarArbol(Var a:arbol);

Var 
    s:   socio;
Begin
    a := Nil;
    CargarSocio(s);
    While (s.num<>0) Do
        Begin
            CargarNodo(a,s);
            CargarSocio(s);
        End;
End;


Procedure ImprimirSocio(s:socio);
Begin
    write('  Numero de socio: ',s.num);
    write('  Nombre del socio: ',s.nombre);
    writeln('  Edad del socio: ',s.edad);
End;


Procedure ImprimirArbol(a:arbol);
Begin
    If (a<>Nil)Then
        Begin
            ImprimirArbol(a^.hi);
            ImprimirSocio(a^.dato);
            ImprimirArbol(a^.hd);
        End;
End;


Function NumeroDeSocioMasGrande(a:arbol):   integer;
Begin
    If (a<>Nil)Then
        Begin
            If (a^.hd<>Nil)Then
                NumeroDeSocioMasGrande := NumeroDeSocioMasGrande(a^.hd)
            Else
                NumeroDeSocioMasGrande := a^.dato.num;
        End;
End;


Procedure DatosNumeroDeSocioMasChico(a:arbol; Var s:socio);
Begin
    If (a<>Nil) Then
        Begin
            If (a^.hi<>Nil) Then
                DatosNumeroDeSocioMasChico(a^.hi,s)
            Else
                s := a^.dato;
        End;
End;


Procedure SocioMasChico(a:arbol);

Var 
    s:   socio;
Begin
    writeln;
    DatosNumeroDeSocioMasChico(a,s);
    writeln('El socio con el numero de socio mas chico es: ');
    writeln;
    ImprimirSocio(s);
    writeln;
End;


Procedure MayorEdad(edadActual,numActual:integer;Var edadMax,numMax:integer);
Begin
    If (edadActual>edadMax)Then
        Begin
            edadMax := edadActual;
            numMax := numActual;
        End;
End;


Procedure NumeroDelSocioMasViejo (a:arbol;Var edadMax,numMax:integer);
Begin
    If (a<>Nil)Then
        Begin
            NumeroDelSocioMasViejo(a^.hi,edadMax,numMax);
            MayorEdad(a^.dato.edad,a^.dato.num,edadMax,numMax);
            NumeroDelSocioMasViejo(a^.hd,edadMax,numMax);
        End
End;


Procedure SocioMasViejo (a:arbol);

Var 
    numMax,edadMax:   integer;
Begin
    edadMax := -1;
    numMax := -1;
    NumeroDelSocioMasViejo(a,edadMax,numMax);
    writeln('El numero de socio del socio mas viejo es: ',numMax);
    writeln;
End;


Procedure EdadMasUno(a:arbol);
Begin
    If (a<>Nil)Then
        Begin
            EdadMasUno(a^.hi);
            a^.dato.edad := a^.dato.edad+1;
            EdadMasUno(a^.hd);
        End;
End;


Procedure AumentarEdad(a:arbol);
Begin
    EdadMasUno(a);
   {writeln('Socios mas culones: ');
    ImprimirArbol(a);
    writeln;}
End;


Function EstaElNumero(a:arbol;v:integer):   boolean;
Begin
    If (a<>Nil)Then
        Begin
            EstaElNumero := (a^.dato.num=v) Or (EstaElNumero(a^.hi,v)) Or (EstaElNumero(a^.hd,v));
        End
    Else
        EstaElNumero := false;
End;


Procedure ExisteElNumero(a:arbol);

Var 
    v:   integer;
Begin
    writeln('Ingrese un numero: ');
    readln(v);
    If (EstaElNumero(a,v)) Then
        writeln('El socio con el numero de socio ',v,' existe.')
    Else
        writeln('El socio con el numero de socio ',v,' no existe.');
    writeln;
End;


Function EstaElNombre(a:arbol;nom:String):   boolean;
Begin
    If (a<>Nil)Then
        Begin
            EstaElNombre := (a^.dato.nombre=nom) Or (EstaElNombre(a^.hi,nom)) Or (EstaElNombre(a^.hd,nom));
        End
    Else
        EstaElNombre := false;
End;


Procedure ExisteElNombre(a:arbol);

Var 
    nom:   string[30];
Begin
    writeln('Ingrese un nombre: ');
    readln(nom);
    If (EstaElNombre(a,nom)) Then
        writeln('El socio con el nombre ',nom,' existe.')
    Else
        writeln('El socio con el nombre ',nom,' no existe.');
    writeln;

End;


Function CantidadDeSocios(a:arbol):   int32;
Begin
    If (a<>Nil)Then
        Begin
            CantidadDeSocios := (CantidadDeSocios(a^.hi))+(CantidadDeSocios(a^.hd))+1;
        End
    Else
        CantidadDeSocios := 0;
End;


Function SumaEdades(a:arbol):   int32;
Begin
    If (a<>Nil)Then
        Begin
            SumaEdades := (SumaEdades(a^.hi))+(SumaEdades(a^.hd))+a^.dato.edad;
        End
    Else
        SumaEdades := 0;
End;


Procedure ImprimirSociosEnOrdenCreciente(a:arbol);
Begin
    If (a<>Nil)Then
        Begin
            ImprimirSociosEnOrdenCreciente(a^.hi);
            Writeln('  ',a^.dato.num);
            ImprimirSociosEnOrdenCreciente(a^.hd);
        End;
End;


Procedure SociosEnOrdenCreciente(a:arbol);
Begin
    writeln('Numeros de socio en orden creciente: ');
    ImprimirSociosEnOrdenCreciente(a);
    writeln;
End;


Procedure ImprimirSociosParesEnOrdenDecreciente(a:arbol);
Begin
    If (a<>Nil)Then
        Begin
            ImprimirSociosParesEnOrdenDecreciente(a^.hd);
            If (a^.dato.num Mod 2=0)Then
                writeln('  ',a^.dato.num);
            ImprimirSociosParesEnOrdenDecreciente(a^.hi);
        End;
End;


Procedure SociosParesEnOrdenDecreciente(a:arbol);
Begin
    writeln('Numeros de socio pares en orden decreciente: ');
    ImprimirSociosParesEnOrdenDecreciente(a);
    writeln;
End;



Var 
    a:   arbol;
    cantS:   int32;
Begin
    Randomize();
    CargarArbol(a);
    If (a=Nil) Then
        writeln('El arbol esta vacio.')
    Else
        Begin
            {writeln('Socios: ');
            ImprimirArbol(a);
            writeln;}
            writeln('El numero de socio mas grande es: ',NumeroDeSocioMasGrande(a));
            SocioMasChico(a);
            SocioMasViejo(a);
            AumentarEdad(a);
            ExisteElNumero(a);
            ExisteElNombre(a);
            CantS := CantidadDeSocios(a);
            writeln('La cantidad total de socios es: ',CantS);
            writeln;
            writeln('La edad promedio de los socios es: ',(SumaEdades(a)/CantS):   1:   2);
            writeln;
            SociosEnOrdenCreciente(a);
            SociosParesEnOrdenDecreciente(a);
        End;
End.
