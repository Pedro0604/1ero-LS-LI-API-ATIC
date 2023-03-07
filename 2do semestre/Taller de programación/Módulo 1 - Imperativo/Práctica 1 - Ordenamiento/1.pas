

{Implementar un programa que procese la información de las ventas de productos de un comercio (como máximo 20). 
De cada venta se conoce código del producto (entre 1 y 15) y cantidad vendida (como máximo 99 unidades). 
El ingreso de las ventas finaliza con el código 0 (no se procesa).

a. Almacenar la información de las ventas en un vector. El código debe generarse automáticamente (random) y la edad se debe leer. 
b. Mostrar el contenido del vector resultante.
c. Ordenar el vector de ventas por código.
d. Mostrar el contenido del vector resultante.
e. Eliminar del vector ordenado las ventas con código de producto entre dos valores que se ingresan como parámetros. 
f. Mostrar el contenido del vector resultante.
g. Generar una lista ordenada por código de producto de menor a mayor a partir del vector resultante del inciso e., sólo para los códigos pares.
h. Mostrar la lista resultante.}

Program Clase1MI;

Const dimF =   20;

Type rango1 =   0..15;
    rango2 =   1..99;
    rango3 =   0..dimF;

    venta =   Record
        codigoP:   rango1;
        cantidad:   rango2;
    End;

    vector =   array [1..dimF] Of venta;

    lista =   ^nodo;
    nodo =   Record
        dato:   venta;
        sig:   lista;
    End;

Procedure AlmacenarInformacion (Var v: vector; Var dimL: rango3);

Procedure LeerVenta (Var v: venta);
Begin
    Randomize;
    write ('Codigo de producto: ');
    v.codigoP := random(16);
    writeln (v.codigoP);
    If (v.codigoP <> 0)
        Then
        Begin
            write ('Ingrese cantidad (entre 1 y 99): ');
            readln (v.cantidad);
        End;
End;

Var unaVenta:   venta;
Begin
    dimL := 0;
    LeerVenta (unaVenta);
    While (unaVenta.codigoP <> 0)  And ( dimL < dimF ) Do
        Begin
            dimL := dimL + 1;
            v[dimL] := unaVenta;
            LeerVenta (unaVenta);
        End;
End;

Procedure ImprimirVector (v: vector; dimL: rango3);

Var 
    i:   integer;
Begin
    write ('         -');
    For i:= 1 To dimL Do
        write ('-----');
    writeln;
    write ('  Codigo:| ');
    For i:= 1 To dimL Do
        Begin
            If (v[i].codigoP <= 9)Then
                write ('0');
            write(v[i].codigoP, ' | ');
        End;
    writeln;
    writeln;
    write ('Cantidad:| ');
    For i:= 1 To dimL Do
        Begin
            If (v[i].cantidad <= 9)Then
                write ('0');
            write(v[i].cantidad, ' | ');
        End;
    writeln;
    write ('         -');
    For i:= 1 To dimL Do
        write ('-----');
    writeln;
    writeln;
End;

Procedure Ordenar (Var v: vector; dimL: rango3);

Var i, j, pos:   rango3;
    item:   venta;

Begin
    For i:= 1 To dimL - 1 Do
        Begin {busca el mínimo y guarda en pos la posición}
            pos := i;
            For j := i+1 To dimL Do
                If (v[j].codigoP < v[pos].codigoP) Then pos := j;

   {intercambia v[i] y v[pos]}
            item := v[pos];
            v[pos] := v[i];
            v[i] := item;
        End;
End;
Procedure Eliminar (Var v: vector; Var dimL: rango3; valorInferior, valorSuperior: rango1);

Var 
    i,j,k,l:   rango3;
Begin
    i := 1;
    While (v[i].codigoP<valorInferior) Do
        Begin
            i := i+1;
        End;
    j := i;
    While (v[j].codigoP<=valorSuperior) Do
        Begin
            j := j+1;
        End;
    l := j;
    For k:=i To j-1 Do
        Begin
            v[k] := v[l];
            l := l+1;
            dimL := dimL-1;
        End;

End;



Function BuscarPosicion (v: vector; dimL: rango3; elemABuscar: rango1):   rango3;

Var pos:   rango3;
Begin
    pos := 1;
    While (pos <= dimL) And (elemABuscar > v[pos].codigoP) Do
        pos := pos + 1;
    If (pos > dimL) Then BuscarPosicion := 0
    Else BuscarPosicion := pos;
End;

Function BuscarPosicionDesde (v: vector; dimL, pos : integer; elemABuscar: rango1):   rango3;
Begin
    While (pos <= dimL) And (elemABuscar >= v[pos].codigoP) Do
        pos := pos + 1;
    If (pos > dimL) Then BuscarPosicionDesde := dimL
    Else BuscarPosicionDesde := pos - 1;
End;
Procedure o(Var v:vector;Var dimL:rango3;Var valorInferior, valorSuperior:rango1);

Var 
    posInferior, posSuperior, cant, i:   rango3;
Begin
    posInferior := BuscarPosicion (v, dimL, valorInferior);
    If (posInferior <> 0)
        Then
        Begin
            posSuperior := BuscarPosicionDesde (v, dimL, posInferior, valorSuperior);
            cant := 0;
            For i:= posInferior To posSuperior Do
                cant := cant + 1;

            For i:= posInferior To dimL-cant Do
                Begin
                    v[posInferior] := v[posinferior + cant];

                    dimL := dimL-cant;
                End;
        End;
End;
Function Cumple (num: rango1):   boolean;

Var 
    ok:   boolean;
Begin
    ok := false;
    If ( num Mod 2= 0) Then
        ok := true;
    Cumple := ok;
End;

Procedure AgregarAdelante (Var L: lista; elem: venta);

Var 
    aux:   lista;
Begin
    new(aux);
    aux^.dato := elem;
    aux^.sig := L;
    L := aux;
End;
Procedure GenerarLista (v: vector; dimL: rango3; Var L: lista);

Var i:   rango3;
Begin
    L := Nil;
    For i:= dimL Downto 1 Do
        If (Cumple (v[i].codigoP)) Then AgregarAdelante (L, v[i]);
End;

Procedure ImprimirLista (l: lista);
Begin
    While (l<>Nil) Do
        Begin
            writeln('Codigo: ',l^.dato.codigoP);
            writeln('Cantidad: ',l^.dato.cantidad);
            writeln();
            writeln();
            l := l^.sig;
        End;
End;

Var v:   vector;
    dimL:   rango3;
    valorInferior, valorSuperior:   rango1;
    L:   lista;

Begin
    AlmacenarInformacion (v, dimL);
    writeln;
    If (dimL = 0) Then writeln ('--- Vector sin elementos ---')
    Else
        Begin
            writeln ('--- Vector ingresado --->');
            writeln;
            ImprimirVector (v, dimL);
            writeln;
            writeln ('--- Vector ordenado --->');
            writeln;
            Ordenar (v, dimL);
            ImprimirVector (v, dimL);
            write ('Ingrese valor inferior: ');
            readln (valorInferior);
            write ('Ingrese valor superior: ');
            readln (valorSuperior);
            Eliminar (v, dimL, valorInferior, valorSuperior);
            If (dimL = 0) Then writeln ('--- Vector sin elementos, luego de la eliminacion ---')
            Else
                Begin
                    writeln;
                    writeln ('--- Vector luego de la eliminacion --->');
                    writeln;
                    ImprimirVector (v, dimL);
                    GenerarLista (v, dimL, L);
                    If (L = Nil) Then writeln ('--- Lista sin elementos ---')
                    Else
                        Begin
                            writeln;
                            writeln ('--- Lista obtenida --->');
                            writeln;
                            ImprimirLista (L);
                        End;
                End;
        End;

End.
