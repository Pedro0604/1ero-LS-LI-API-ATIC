
Program tres;

Const 
    cantG =   8;

Type 
    genero =   1..cantG;

    pelicula =   Record
        pelCod:   integer;
        genCod:   genero;
        pts:   integer;
    End;

    lista =   ^nodo;

    nodo =   Record
        dato:   pelicula;
        sig:   lista;
    End;

    inFin =   Record
        pri:   lista;
        ult:   lista;
    End;

    vector =   array [genero] Of inFin;
    vectorMaximos =   array[genero] Of pelicula;

Procedure inicializarVector(Var v:vector);

Var 
    i:   integer;
Begin
    For i:=1 To cantG Do
        Begin
            v[i].pri :=   Nil;
            v[i].ult :=   Nil;
        End;

End;

Procedure cargarPelicula(Var p:pelicula);
Begin
    {writeln('Ingrese el pelCod');
    readln(p.pelCod);}
    p.pelCod := random(101)-1;
    If (p.pelCod<>-1) Then
        Begin
            {writeln('Ingrese el genCod');
            readln(p.genCod);}
            p.genCod := random(8)+1;
            {writeln('Ingrese los pts');
            readln(p.pts);}
            p.pts := random(101);
        End;

End;

Procedure cargarGenero(Var v:vector; p:pelicula);

Var 
    nuevo:   lista;
Begin
    new(nuevo);
    nuevo^.sig := Nil;
    nuevo^.dato := p;
    If (v[p.genCod].pri=Nil) Then
        v[p.genCod].pri := nuevo
    Else
        v[p.genCod].ult^.sig := nuevo;
    v[p.genCod].ult := nuevo;
End;

Procedure CargarCatalogo(Var v:vector);

Var 
    p:   pelicula;
Begin
    inicializarVector(v);
    cargarPelicula(p);
    While (p.pelCod<>-1) Do
        Begin
            cargarGenero(v,p);
            cargarPelicula(p);
        End;
End;

Procedure ImprimirPelicula(p:pelicula);
Begin
    writeln('  Codigo de pelicula: ',p.pelCod,'  Putaje: ',p.pts,'.');
End;

Procedure ImprimirLista(v:vector);

Var 
    i:   integer;
Begin
    For i:=1 To cantG Do
        Begin
            If (v[i].pri<>Nil) Then
                Begin
                    writeln('Genero numero ',i,': ');
                End;
            While (v[i].pri<>Nil) Do
                Begin
                    ImprimirPelicula(v[i].pri^.dato);
                    v[i].pri := v[i].pri^.sig;
                End;
        End;
End;

Function CalcularMaximo(l:lista):   pelicula;

Var 
    max:   integer;
    maxPel:   pelicula;
Begin
    max := -1;
    While (l<>Nil) Do
        Begin
            If (l^.dato.pts>max) Then
                Begin
                    max := l^.dato.pts;
                    maxPel := l^.dato;
                End;
            l := l^.sig;
        End;
    CalcularMaximo := maxPel;
End;

Procedure Maximos(Var vMax:vectorMaximos; v:vector);

Var 
    i:   integer;
    maxPel:   pelicula;
Begin
    For i:=1 To cantG Do
        Begin
            maxPel := CalcularMaximo(v[i].pri);
            vMax[i] := maxPel;
        End;
End;

Procedure ImprimirVectorMaximos(vMax:vectorMaximos);

Var 
    i:   integer;
Begin
    writeln;
    writeln;
    For i:=1 To cantG Do
        writeln('El codigo de la pelicula con mayor puntaje del genero ',i,' fue: ',vMax[i].pelCod,
                ' con un puntaje de: ',vMax[i].pts,' puntos.');
End;

Procedure OrdenarMaximos(Var v:vectorMaximos);

Var 
    i,j,p:   integer;
    item:   pelicula;
Begin
    For i:=1 To cantG-1 Do
        Begin
            p := i;
            For j:=i+1 To cantG Do
                Begin
                    If (v[j].pts<v[p].pts) Then
                        p := j;
                End;
            item := v[i];
            v[i] := v[p];
            v[p] := item;
        End;
End;

Procedure ImprimirMaxyMin(vMax:vectorMaximos);
Begin
    writeln;
    writeln;
    writeln('El codigo de la pelicula con mayor puntaje de todos los generos fue: ',vMax[8].pelCod,
            ' con un puntaje de: ',vMax[8].pts,' puntos.');
    writeln('El codigo de la pelicula con menor puntaje de todos los mayores puntajes de los generos fue: ',vMax[1].
            pelCod,' con un puntaje de: ',vMax[1].pts,' puntos.');


End;

Var 
    v:   vector;
    vMax:   vectorMaximos;
Begin
    Randomize();
    CargarCatalogo(v);
    {ImprimirLista(v);}
    Maximos(vMax,v);
    {ImprimirVectorMaximos(vMax);}
    OrdenarMaximos(vMax);
    {ImprimirVectorMaximos(vMax);}
    ImprimirMaxyMin(vMax);
End.
