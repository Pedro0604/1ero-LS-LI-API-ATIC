
Program punto3pr5;

Const 
    dimF =   10;

Type 
    rubros =   1..dimF;

    producto =   Record
        cod,stock:   integer;
        rubro:   rubros;
        precioU:   real;
    End;

    arbol =   ^nodo;

    nodo =   Record
        dato:   producto;
        hi,hd:   arbol;
    End;

    vector =   array[rubros] Of arbol;


Procedure InicializarVector(Var v:vector);

Var 
    i:   integer;
Begin
    For i:=1 To dimF Do
        Begin
            v[i] := Nil;
        End;
End;


Procedure CargarProducto(Var p:producto);
Begin
    {writeln('Introduzca el codigo del producto:');
    readln(p.cod);}
    p.cod := random(102)-1;
    If (p.cod<>-1)Then
        Begin
            {writeln('Introduzca el stock del producto:');
            readln(p.stock);}
            p.stock := random(101);
            {writeln('Introduzca el rubro del producto:');
            readln(p.rubro);}
            p.rubro := random(10)+1;
            {writeln('Introduzca el precio unitario del producto:');
            readln(p.precioU);}
        End;
End;


Procedure CargarNodo(Var a:arbol;p:producto);
Begin
    If (a=Nil)Then
        Begin
            new(a);
            a^.dato := p;
            a^.hi := Nil;
            a^.hd := Nil;
        End
    Else If (p.cod<a^.dato.cod) Then
             CargarNodo(a^.hi,p)
    Else
        CargarNodo(a^.hd,p);
End;


Procedure CargarVector(Var v:vector);

Var 
    p:   producto;
Begin
    InicializarVector(v);
    CargarProducto(p);
    While (p.cod<>-1) Do
        Begin
            CargarNodo(v[p.rubro],p);
            CargarProducto(p);
        End;
End;


Procedure ImprimirProducto(p:producto);
Begin
    write('    Codigo del producto: ',p.cod);
    write('  Stock del producto: ',p.stock);
    {write('  Precio unitario del producto: ',p.precioU);}
    writeln('  Rubro del producto: ',p.rubro);
End;


Procedure ImprimirArbol(a:arbol);
Begin
    If (a<>Nil) Then
        Begin
            ImprimirArbol(a^.hi);
            ImprimirProducto(a^.dato);
            ImprimirArbol(a^.hd);
        End;
End;


Procedure ImprimirVector(v:vector);

Var 
    i:   integer;
Begin
    writeln('Productos:');
    For i:=1 To dimF Do
        Begin
            If (v[i]=Nil)Then
                Begin
                    writeln('EL rubro ',i,' esta vacio.');
                    writeln;
                End
            Else
                Begin
                    writeln('  Rubro ',i,':');
                    ImprimirArbol(v[i]);
                    writeln;
                End;
        End;
    writeln;
End;


Function Existe(a:arbol;cod:integer):   boolean;
Begin
    If (a<>Nil)Then
        Begin
            Existe := (a^.dato.cod=cod) Or (Existe(a^.hi,cod)) Or (Existe(a^.hd,cod));
        End
    Else
        Existe := false;
End;



Procedure ExisteElCodigo(v:vector);

Var 
    rubro:   rubros;
    cod:   integer;
Begin
    writeln('Introduzca un codigo de producto:');
    readln(cod);
    writeln('Introduzca un rubro:');
    readln(rubro);
    If (Existe(v[rubro],cod)) Then
        writeln('El codigo de producto ',cod,' existe en el rubro ',rubro,'.')
    Else
        writeln('El codigo de producto ',cod,' no existe en el rubro ',rubro,'.');
    writeln;
    writeln;
End;


Procedure ProdMaxCod(a:arbol;Var p:producto);
Begin
    If (a<>Nil)Then
        Begin
            ProdMaxCod(a^.hd,p);
            If (a^.hd=Nil) Then
                p := a^.dato;
        End;
End;


Procedure InfoMayorCodigo(v:vector);

Var 
    i:   integer;
    p:   producto;
Begin
    writeln('Informacion del producto con el maximo codigo: ');
    For i:=1 To dimF Do
        Begin
            If (v[i]=Nil)Then
                Begin
                    writeln('EL rubro ',i,' esta vacio.');
                    writeln;
                End
            Else
                Begin
                    ProdMaxCod(v[i],p);
                    writeln('  Rubro ',i,': ');
                    write('    Codigo del producto: ',p.cod);
                    writeln('  Stock del producto: ',p.stock);
                    writeln;
                End;
        End;
    writeln;
End;


Function CantProd(a:arbol;v1,v2:integer):   integer;
Begin
    If (a<>Nil)Then
        Begin
            If (a^.dato.cod>v1)And(a^.dato.cod<v2)Then
                CantProd := CantProd(a^.hi,v1,v2)+CantProd(a^.hd,v1,v2)+1
            Else If (a^.dato.cod<=v1)Then
                     CantProd := CantProd(a^.hd,v1,v2)
            Else
                CantProd := CantProd(a^.hi,v1,v2);
        End
    Else
        CantProd := 0;
End;


Procedure CantidadEntreDosValores(v:vector);

Var 
    i,v1,v2:   integer;
Begin
    writeln('Introduzca el limite inferior: ');
    readln(v1);
    writeln('Introduzca el limite inferior: ');
    readln(v2);
    writeln('Cantidad de productos con codigos entre el valor ',v1,' y el valor ',v2,': ');
    For i:=1 To dimF Do
        Begin
            If (v[i]=Nil)Then
                Begin
                    writeln('EL rubro ',i,' esta vacio.');
                    writeln;
                End
            Else
                Begin
                    writeln('  La cantidad de productos del rubro ',i,' con codigos entre el valor ',v1,' y el valor ',
                            v2,' es de: ',
                            CantProd(v[i],v1,v2),'.');
                    writeln;
                End;
        End;
    writeln;
End;



Var 
    v:   vector;
Begin
    Randomize();
    CargarVector(v);
    ImprimirVector(v);
    ExisteElCodigo(v);
    InfoMayorCodigo(v);
    CantidadEntreDosValores(v);
End.
