
Program dosPracticatres;

Type 
    dias =   1..31;
    meses =   1..12;
    anos =   2000..2022;

    fecha =   Record
        dia:   dias;
        mes:   meses;
        ano:   anos;
    End;

    venta =   Record
        cod:   int32;
        f:   fecha;
        cant:   int32;
    End;

    venta2 =   Record
        cod:   int32;
        cant:   int32;
    End;

    arbol =   ^nodo;

    nodo =   Record
        dato:   venta;
        hi,hd:   arbol;
    End;

    arbol2 =   ^nodo2;

    nodo2 =   Record
        dato:   venta2;
        hi,h2:   arbol2;
    End;


Procedure CargarFecha(Var f:fecha);
Begin
    {writeln('Ingrese el ano de la venta: ');
    readln(f.ano);}
    f.ano := random(23)+2000;
    If (f.ano<>2022)Then
        Begin
             {writeln('Ingrese el mes de la venta: ');
             readln(f.dia);}
            f.dia := random(31)+1;
             {writeln('Ingrese el mes de la venta: ');
             readln(f.mes);}
            f.mes := random(12)+1;
        End
    Else
        Begin
             {writeln('Ingrese el mes de la venta: ');
             readln(f.mes);}
            f.mes := random(9)+1;
            If (f.mes<>9) Then
                Begin
                    {writeln('Ingrese el mes de la venta: ');
                    readln(f.dia);}
                    f.dia := random(31)+1;
                End
            Else
                Begin
                     {writeln('Ingrese el mes de la venta: ');
                    readln(f.dia);}
                    f.dia := random(8)+1;
                End;
        End;
End;

Procedure CargarVenta(Var v:venta);
Begin
    {writeln('Ingrese codigo de producto: ');
    readln(v.cod);}
    v.cod := random(11);
    If (v.cod<>0) Then
        Begin
            {CargarFecha(v.f);}
            {writeln('Ingrese cantidad de unidades vendidas: ');
            readln(v.cant);}
            v.cant := random(100)+1;
        End;
End;


Procedure CargarNodo(Var a:arbol;v:venta);
Begin
    If (a=Nil)Then
        Begin
            new(a);
            a^.hd := Nil;
            a^.hi := Nil;
            a^.dato := v;
        End
    Else If (v.cod<a^.dato.cod)Then
             cargarNodo(a^.hi,v)
    Else
        cargarNodo(a^.hd,v);
End;


Procedure CargarArbol1(Var a:arbol1);
Begin
    a := Nil;
    CargarVenta(v);
    While (v.cod<>0) Do
        Begin
            CargarNodo(a,v);
            CargarVenta(v);
        End;
End;


Procedure CargarArbol2(a:arbol Var a2:arbol2);
Begin

End;


Procedure CargarArboles(Var a:arbol;Var a2:arbol2);

Var 
    v:   venta;
Begin
    CargarArbol1(a);
    a2 := Nil;
    CargarArbol2(a,a2);
End;


Procedure ImprimirVenta(v:venta);
Begin
    write('  Codigo de producto: ',v.cod);
    write('  Cantidad de ventas: ',v.cant);
    {writeln('  Fecha: ',v.f.dia,'/',v.f.mes,'/',v.f.ano);}
    writeln;
End;


Procedure ImprimirArbol(a:arbol);
Begin
    If (a<>Nil)Then
        Begin
            ImprimirArbol(a^.hi);
            ImprimirVenta(a^.dato);
            ImprimirArbol(a^.hd);
        End;
End;



Var 
    a:   arbol;
    a2:   arbol2;
Begin
    Randomize();
    CargarArboles(a,a2);
    If (a=Nil)Then
        writeln('El arbol esta vacio.')
    Else
        Begin
            writeln('Ventas: ');
            ImprimirArboles(a,a2);
            writeln;
        End;
End.
