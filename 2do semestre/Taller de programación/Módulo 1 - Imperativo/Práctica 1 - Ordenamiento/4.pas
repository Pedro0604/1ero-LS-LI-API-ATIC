
Program cuatro;

Const 
    cantR =   8;
    dimF =   30;

Type 
    rubros =   1..8;
    producto =   Record
        prodCod:   integer;
        rubCod:   integer;
        precio:   real;
    End;

    lista =   ^nodo;

    nodo =   Record
        dato:   producto;
        sig:   lista;
    End;

    vector =   array[rubros] Of lista;
    vectorRubroTres =   array[1..dimF] Of producto;

Procedure InicializarVector(Var v:vector);

Var 
    i:   integer;
Begin
    For i:=1 To cantR Do
        Begin
            v[i] :=   Nil;
        End;

End;

Procedure CargarProducto(Var p:producto);
Begin
    {writeln('Ingrese el precio');
    readln(p.precio);}
    p.precio := random(100);
    If (p.precio<>0) Then
        Begin
            {writeln('Ingrese el prodCod');
            readln(p.prodCod);}
            p.prodCod := random(100);
            {writeln('Ingrese el rubCod');
            readln(p.rubCod);}
            p.rubCod := random(8)+1;
        End;
End;

Procedure GenerarLista(Var v:vector;p:producto);

Var 
    nuevo,act,ant:   lista;
Begin
    new(nuevo);
    nuevo^.sig := Nil;
    nuevo^.dato := p;
    act := v[p.rubCod];
    ant := act;
    While (act<>Nil) And (p.prodCod>act^.dato.prodCod) Do
        Begin
            ant := act;
            act := act^.sig;
        End;
    If (act=ant)Then
        v[p.rubCod] := nuevo
    Else
        Begin
            ant^.sig := nuevo;
            nuevo^.sig := act;
        End;
End;

Procedure CargarVector(Var v:vector);

Var 
    p:   producto;
Begin
    InicializarVector(v);
    CargarProducto(p);
    While (p.precio<>0) Do
        Begin
            GenerarLista(v,p);
            CargarProducto(p);
        End;
End;

Procedure ImprimirProducto(p:producto);
Begin
    writeln('  Codigo de producto: ',p.prodCod,'  Precio: ',p.precio:1:2,'.');
End;

Procedure ImprimirVector(v:vector);

Var 
    i:   integer;
Begin
    For i:=1 To cantR Do
        Begin
            If (v[i]<>Nil) Then
                Begin
                    writeln('Rubro numero ',i,': ');
                End;
            While (v[i]<>Nil) Do
                Begin
                    ImprimirProducto(v[i]^.dato);
                    v[i] := v[i]^.sig;
                End;
        End;
End;

Procedure CargarVectorRubroTres(Var v3:vectorRubroTres; v:vector; Var dimL:integer);

Var 
    l:   lista;
Begin
    l := v[3];
    dimL := 0;
    While (l<>Nil) And (dimL<=dimF) Do
        Begin
            dimL := dimL+1;
            v3[dimL] := l^.dato;
            l := l^.sig;
        End;
End;

Procedure ImprimirVectorRubroTres(v3:vectorRubroTres;dimL:integer);

Var 
    i:   integer;
Begin
    writeln;
    writeln;
    If (dimL=0) Then
        writeln('El vector rubro 3 esta vacio.')
    Else
        writeln('Vector rubro 3:');
    For i:=1 To dimL Do
        Begin
            ImprimirProducto(v3[i]);
        End;
End;

Procedure OrdenarVectorRubroTres(Var v3:vectorRubroTres; dimL:integer);

Var 
    i,j,p:   integer;
    item:   producto;
Begin
    For i:=1 To dimL-1 Do
        Begin
            p := i;
            For j:=i+1 To dimL Do
                Begin
                    If (v3[p].precio>v3[j].precio) Then
                        p := j;
                End;
            item := v3[i];
            v3[i] := v3[p];
            v3[p] := item;
        End;
End;



Var 
    v:   vector;
    v3:   vectorRubroTres;
    dimL:   integer;
Begin
    Randomize();
    CargarVector(v);
    ImprimirVector(v);
    CargarVectorRubroTres(v3,v,dimL);
    ImprimirVectorRubroTres(v3,dimL);
    OrdenarVectorRubroTres(v3,dimL);
    ImprimirVectorRubroTres(v3,dimL);
End.
