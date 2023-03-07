
Program punto3pr4;

Const 
    dimF =   4;

Type 
    sucursales =   1..dimF;
    dias =   1..31;
    meses =   1..12;
    anos =   2000..2022;

    fecha =   Record
        dia:   dias;
        mes:   meses;
        ano:   anos;
    End;

    venta =   Record
        f:   fecha;
        prodCod,sucCod,cantV:   integer;
    End;

    lista =   ^nodo;

    nodo =   Record
        dato:   venta;
        sig:   lista;
    End;

    vector =   array[sucursales] Of lista;

    ventaAcumulador =   Record
        cantidadTotalV,prodCod:   integer;
    End;

    listaAcumulador =   ^nodoAcumulador;

    nodoAcumulador =   Record
        dato:   ventaAcumulador;
        sig:   listaAcumulador;
    End;


Procedure InicializarVector(Var v:vector);

Var 
    i:   integer;
Begin
    For i:=1 To dimF Do
        Begin
            v[i] := Nil;
        End;
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
                    f.dia := random(11)+1;
                End;
        End;
End;


Procedure CargarVenta(Var v:venta);
Begin
    writeln('Ingrese el codigo de sucursal: ');
    readln(v.sucCod);
    {v.sucCod := random(5);}
    If (v.sucCod<>0)Then
        Begin
            {writeln('Ingrese el codigo de producto: ');
            readln(v.prodCod);}
            v.prodCod := random(101);
            {writeln('Ingrese la cantidad de ventas: ');
            readln(v.cantV);}
            v.cantV := random(51);
            CargarFecha(v.f);
        End;
End;


Procedure InsertarOrdenado(Var l:lista;nuevo:lista);

Var 
    ant,act:   lista;
Begin
    ant := l;
    act := l;
    While (act<>Nil) And (nuevo^.dato.prodCod>act^.dato.prodCod) Do
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



Procedure CargarNodo(Var l:lista;Var vt:venta);

Var 
    nuevo:   lista;
Begin
    new(nuevo);
    nuevo^.sig := Nil;
    nuevo^.dato := vt;
    InsertarOrdenado(l,nuevo);
End;


Procedure CargarVector(Var v:vector);

Var 
    vt:   venta;
Begin
    InicializarVector(v);
    CargarVenta(vt);
    While (vt.sucCod<>0) Do
        Begin
            CargarNodo(v[vt.sucCod],vt);
            CargarVenta(vt);
        End;
End;


Procedure ImprimirVenta(v:venta);
Begin
    write('    Codigo de producto: ',v.prodCod);
    write('  Cantidad vendida: ',v.cantV);
    write('  Sucursal: ',v.sucCod);
    write('  Fecha: ',v.f.dia,'/',v.f.mes,'/',v.f.ano);
    writeln;
End;


Procedure ImprimirLista(l:lista);
Begin
    While (l<>Nil) Do
        Begin
            ImprimirVenta(l^.dato);
            l := l^.sig;
        End;
End;


Procedure ImprimirVector(v:vector);

Var 
    i:   integer;
Begin
    writeln('Ventas: ');
    For i:=1 To dimF Do
        Begin
            If (v[i]=Nil)Then
                writeln('La lista de la sucursal numero ',i,' esta vacia.')
            Else
                Begin
                    writeln('  Ventas de la sucursal numero ',i,': ');
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
    minProdCod,min,i:   integer;
Begin
    minProdCod := 9999;
    For i:=1 To dimF Do
        Begin
            If (v[i]<>Nil) And (v[i]^.dato.prodCod<minProdCod)Then
                Begin
                    minProdCod := v[i]^.dato.prodCod;
                    min := i;
                End;
        End;
    Minimo := min;
End;


Procedure AgregarAtrasAcumulador(Var pri,ult:listaAcumulador;nuevo:listaAcumulador);
Begin
    If (pri=Nil)Then
        Begin
            pri := nuevo;
        End
    Else
        Begin
            ult^.sig := nuevo;
        End;
    ult := nuevo;
End;


Procedure CargarListaMergeAcumulador(Var l,ult:listaAcumulador;prodCodActual,cantTotal:integer);

Var 
    nuevo:   listaAcumulador;
Begin
    new(nuevo);
    nuevo^.sig := Nil;
    nuevo^.dato.prodCod := prodCodActual;
    nuevo^.dato.cantidadTotalV := cantTotal;
    AgregarAtrasAcumulador(l,ult,nuevo);
End;


Procedure MergeAcumulador(v:vector;Var l:listaAcumulador);

Var 
    ult:   listaAcumulador;
    prodCodActual, cantTotal, min:   integer;
Begin
    l := Nil;
    While Not(ListasVacias(v)) Do
        Begin
            min := Minimo(v);
            prodCodActual := v[min]^.dato.prodCod;
            cantTotal := 0;

            While (Not(ListasVacias(v))) And (prodCodActual = v[min]^.dato.prodCod) Do
                Begin
                    cantTotal := cantTotal+v[min]^.dato.cantV;
                    v[min] := v[min]^.sig;
                    min := Minimo(v);
                End;
            CargarListaMergeAcumulador(l,ult,prodCodActual,cantTotal);
        End;
End;


Procedure ImprimirVentaAcumulador(v:ventaAcumulador);
Begin
    write('    Codigo de producto: ',v.prodCod);
    write('  Cantidad total vendida: ',v.cantidadTotalV);
    writeln;
End;


Procedure ImprimirListaAcumulador(l:listaAcumulador);
Begin
    While (l<>Nil) Do
        Begin
            ImprimirVentaAcumulador(l^.dato);
            l := l^.sig;
        End;
End;



Var 
    v:   vector;
    l:   listaAcumulador;
Begin
    Randomize();
    CargarVector(v);
    ImprimirVector(v);
    MergeAcumulador(v,l);
    writeln('Lista merge acumulador: ');
    ImprimirListaAcumulador(l);
End.
