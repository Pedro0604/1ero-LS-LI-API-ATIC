
Program Spadari;

Const 
    dimF =   31;

Type 
    dias =   1..dimF;

    compra =   Record
        cod,cantP:   integer;
        dia:   dias;
        monto:   real;
    End;

    lista =   ^nodoL;

    nodoL =   Record
        dato:   compra;
        sig:   lista;
    End;

    arbol =   ^nodo;

    nodo =   Record
        l:   lista;
        hi,hd:   arbol;
    End;

    //arbol ordenado por cod
Procedure CargarCompra(Var c:compra);
Begin
    {writeln('Ingrese el codigo: ');
    readln(c.cod);}
    c.cod := random(11);
    If (c.cod<>0)Then
        Begin
            {writeln('Ingrese el dia: ');
            readln(c.dia);}
            c.dia := random(31)+1;
            {writeln('Ingrese el monto: ');
            readln(c.monto);}
            c.monto := random(10001);
            {writeln('Ingrese la cantidad de productos: ');
            readln(c.cantP);}
            c.cantP := random(101);
        End;
End;


Procedure AgregarAdelante(Var l:lista;c:compra);

Var 
    nuevo:   lista;
Begin
    new(nuevo);
    nuevo^.sig := Nil;
    nuevo^.dato := c;
    If (l<>Nil)Then
        nuevo^.sig := l;
    l := nuevo;
End;


Procedure CargarNodo(Var a:arbol;c:compra);
Begin
    If (a=Nil)Then
        Begin
            new(a);
            a^.hi := Nil;
            a^.hd := Nil;
            a^.l := Nil;
            AgregarAdelante(a^.l,c);
        End
    Else
        If (c.cod=a^.l^.dato.cod)Then
            Begin
                AgregarAdelante(a^.l,c);
            End
    Else If (c.cod<a^.l^.dato.cod)Then
             CargarNodo(a^.hi,c)
    Else
        CargarNodo(a^.hd,c);
End;


Procedure IncisoA(Var a:arbol);

Var 
    c:   compra;
Begin
    a := Nil;
    CargarCompra(c);
    While (c.cod<>0) Do
        Begin
            CargarNodo(a,c);
            CargarCompra(c);
        End;
End;


Procedure ImprimirCompra(c:compra);
Begin
    write('  Dia: ',c.dia);
    write('  Monto: ',c.monto:1:2);
    writeln('  Cantidad de productos: ',c.cantP);
End;


Procedure ImprimirComprasCliente(l:lista);
Begin
    If (l<>Nil) Then
        writeln('  Cliente nro: ',l^.dato.cod);
    While (l<>Nil) Do
        Begin
            ImprimirCompra(l^.dato);
            l := l^.sig;
        End;
    writeln;
End;


Procedure ImprimirArbol(a:arbol);
Begin
    If (a<>Nil)Then
        Begin
            ImprimirArbol(a^.hi);
            ImprimirComprasCliente(a^.l);
            ImprimirArbol(a^.hd);
        End;
End;


Procedure IncisoB(a:arbol;Var l:lista;cod:integer);
Begin
    If (a<>Nil)Then
        Begin
            If (a^.l^.dato.cod=cod)Then
                Begin
                    l := a^.l;
                End
            Else If (cod<a^.l^.dato.cod)Then
                     IncisoB(a^.hi,l,cod)
            Else
                IncisoB(a^.hd,l,cod);
        End;
End;


Procedure IncisoC(l:lista;maxCantP:integer;Var montoMasPr:real);
Begin
    If (l<>Nil)Then
        Begin
            If (l^.dato.cantP>maxCantP)Then
                Begin
                    maxCantP := l^.dato.cantP;
                    montoMasPr := l^.dato.monto;
                End;
            IncisoC(l^.sig,maxCantP,montoMasPr);
        End;
End;



Var 
    a:   arbol;
    comprasCliente:   lista;
    codigoCliente,maxCantP:   integer;
    montoMasPr:   real;
Begin
    Randomize();
    IncisoA(a);
    ImprimirArbol(a);
    writeln('Ingrese un codigo de cliente: ');
    readln(codigoCliente);
    comprasCliente := Nil;
    IncisoB(a,comprasCliente,codigoCliente);
    If (comprasCliente<>Nil)Then
        Begin
            writeln('Compras cliente ',codigoCliente,': ');
            writeln;
            ImprimirComprasCliente(comprasCliente);
            maxCantP := -1;
            IncisoC(comprasCliente,maxCantP,montoMasPr);
            writeln('El monto de la compra con mayor cantidad de productos del cliente ',codigoCliente,' es: ',
                    montoMasPr
                    :1:2);
        End
    Else
        writeln('El cliente del codigo ',codigoCliente,' no existe');

End.
