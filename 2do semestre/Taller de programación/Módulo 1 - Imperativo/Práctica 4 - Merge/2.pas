
Program punto2pr4;

Const 
    dimF =   8;

Type 
    generos =   1..dimF;

    pelicula =   Record
        pelCod:   integer;
        genCod:   generos;
        promedio:   real;
    End;

    lista =   ^nodo;

    nodo =   Record
        dato:   pelicula;
        sig:   lista;
    End;

    vector =   array[generos] Of lista;


Procedure InicializarListas(Var v:vector);

Var 
    i:   generos;
Begin
    For i:=1 To dimF Do
        Begin
            v[i] := Nil;
        End;
End;


Procedure CargarPelicula(Var p:pelicula);
Begin
    {writeln('Ingrese el codigo de pelicula: ');
    readln(p.pelCod);}
    p.pelCod := random(102)-1;
    If (p.pelCod<>-1) Then
        Begin
            {writeln('Ingrese el genero de pelicula: ');
            readln(p.genCod);}
            p.genCod := random(8)+1;
            {writeln('Ingrese el promedio de la pelicula: ');
            readln(p.promedio);}
            p.promedio := random(100)+1;
        End;
End;


Procedure InsertarOrdenado(Var l:lista;nuevo:lista);

Var 
    ant,act:   lista;
Begin
    ant := l;
    act := l;
    While (act<>Nil) And (nuevo^.dato.pelCod>act^.dato.pelCod) Do
        Begin
            ant := act;
            act := act^.sig;
        End;
    If (act=ant)Then
        Begin
            l := nuevo;
        End
    Else
        ant^.sig := nuevo;
    nuevo^.sig := act;
End;


Procedure CargarLista(Var v:vector;p:pelicula);

Var 
    nuevo:   lista;
Begin
    new(nuevo);
    nuevo^.sig := Nil;
    nuevo^.dato := p;
    InsertarOrdenado(v[p.genCod],nuevo);
End;


Procedure CargarVector(Var v:vector);

Var 
    p:   pelicula;
Begin
    InicializarListas(v);
    CargarPelicula(p);
    While (p.pelCod<>-1) Do
        Begin
            CargarLista(v,p);
            CargarPelicula(p);
        End;
End;


Procedure ImprimirPelicula(p:pelicula);
Begin
    write('    Codigo de pelicula: ',p.pelCod);
    write('  Promedio: ',p.promedio:1:2);
    writeln('  Genero: ',p.genCod);
End;


Procedure ImprimirLista(l:lista);
Begin
    While (l<>Nil) Do
        Begin
            ImprimirPelicula(l^.dato);
            l := l^.sig;
        End;
End;


Procedure ImprimirVector(v:vector);

Var 
    i:   integer;
Begin
    writeln('Peliculas: ');
    For i:=1 To dimF Do
        Begin
            If (v[i]=Nil)Then
                writeln('La lista del genero numero ',i,' esta vacia.')
            Else
                Begin
                    writeln('  Peliculas de genero numero ',i,': ');
                    ImprimirLista(v[i]);
                End;
            writeln;
        End;
End;


Function ListasVacias(v:vector):   boolean;

Var 
    i:   integer;
Begin
    For i:=1 To dimF Do
        Begin
            If (v[i]<>Nil)Then
                ListasVacias := false;
        End;
End;


Function Minimo(v:vector):   integer;

Var 
    i,ListaMin,minPelCod:   integer;
Begin
    minPelCod := 9999;
    For i:=1 To dimF Do
        Begin
            If (v[i]<>Nil) And (v[i]^.dato.pelCod<minPelCod)Then
                Begin
                    minPelCod := v[i]^.dato.pelCod;
                    ListaMin := i;
                End;
        End;
    Minimo := ListaMin;
End;


Procedure AgregarAtras(Var pri,ult:lista;nuevo:lista);
Begin
    If (pri=Nil)Then
        pri := nuevo
    Else
        ult^.sig := nuevo;
    ult := nuevo;
End;


Procedure CargarListaMerge(Var pri,ult,l:lista);

Var 
    nuevo:   lista;
Begin
    new(nuevo);
    nuevo^.sig := Nil;
    nuevo^.dato := l^.dato;
    AgregarAtras(pri,ult,nuevo);
    l := l^.sig;
End;


Procedure Merge(v:vector; Var l:lista);

Var 
    ult:   lista;
Begin
    l := Nil;
    While Not(ListasVacias(v)) Do
        Begin
            CargarListaMerge(l,ult,v[Minimo(v)]);
        End;
    writeln('Lista merge: ');
    ImprimirLista(l);
End;



Var 
    v:   vector;
    l:   lista;
Begin
    Randomize();
    CargarVector(v);
    ImprimirVector(v);
    Merge(v,l);
End.
