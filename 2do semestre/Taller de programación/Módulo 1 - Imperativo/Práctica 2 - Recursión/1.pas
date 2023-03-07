


{Implementar un programa que invoque a los siguientes módulos.

a. Implementar un módulo recursivo que permita leer una secuencia de caracteres terminada en punto y los almacene en un vector con dimensión física igual a 10.
b. Implementar un módulo que imprima el contenido del vector.
c. Implementar un módulo recursivo que imprima el contenido del vector.
d. Implementar un módulo recursivo que permita leer una secuencia de caracteres terminada en punto y retorne la cantidad de caracteres leidos. 
El programa debe informar el valor retornado.
e. Implementar un módulo recursivo que permita leer una secuencia de caracteres terminada en punto y retorne una lista con los caracteres leidos.
f. Implemente un módulo recursivo que reciba la lista generada en d. e imprima los valores de la lista en el mismo orden que están almacenados.
g. Implemente un módulo recursivo que reciba la lista generada en d. e imprima los valores de la lista en orden inverso al que están almacenados.
}

Program Clase2MI;

Const dimF =   10;

Type vector =   array [1..dimF] Of char;
    lista =   ^nodo;
    nodo =   Record
        dato:   char;
        sig:   lista;
    End;


Procedure CargarVector (Var v: vector; Var dimL: integer);

Procedure CargarVectorRecursivo (Var v: vector; Var dimL: integer);

Var caracter:   char;
Begin
    write ('Ingrese un caracter: ');
    readln(caracter);
    If (caracter <> '.' ) And (dimL < dimF)
        Then
        Begin
            dimL := dimL + 1;
            v[dimL] := caracter;
            CargarVectorRecursivo (v, dimL);
        End;
End;

Begin
    dimL := 0;
    CargarVectorRecursivo (v, dimL);
End;

Procedure ImprimirVector (v: vector; dimL: integer);

Var 
    i:   integer;
Begin
    For i:= 1 To dimL Do
        write ('----');
    writeln;
    write (' ');
    For i:= 1 To dimL Do
        Begin
            write(v[i], ' | ');
        End;
    writeln;
    For i:= 1 To dimL Do
        write ('----');
    writeln;
    writeln;
End;

Procedure ImprimirVectorRecursivo(v:vector;dimL,i:integer);
Begin
    If (i<=dimL) Then
        Begin
            write(' ',v[i]);
            ImprimirVectorRecursivo(v,dimL,i+1)
        End;
End;

Function ContarCaracteres():   integer;

Var caracter:   char;
Begin
    write ('Ingrese un caracter: ');
    readln(caracter);
    If (caracter <> '.' )
        Then ContarCaracteres := ContarCaracteres() + 1
    Else ContarCaracteres := 0
End;


Procedure CargarLista (Var l: lista);

Var caracter:   char;
    nuevo:   lista;
Begin
    write ('Ingrese un caracter: ');
    readln(caracter);
    If (caracter <> '.' )
        Then
        Begin
            CargarLista (l);
            new (nuevo);
            nuevo^.dato := caracter;
            nuevo^.sig := l;
            l := nuevo;
        End
    Else l := Nil
End;

Procedure ImprimirListaMismoOrden (l: lista);
Begin
    If (l<> Nil) Then
        Begin
            write (' ', l^.dato);
            ImprimirListaMismoOrden (l^.sig);
        End;
End;

Procedure ImprimirListaOrdenInverso(l:lista);
Begin
    If (l^.sig=Nil)Then
        write(' ', l^.dato)
    Else
        Begin
            ImprimirListaOrdenInverso(l^.sig);
            write(' ', l^.dato);
        End;
End;

Var cont, dimL,i:   integer;
    l:   lista;
    v:   vector;
Begin
    i := 1;
    CargarVector (v, dimL);
    writeln;
    If (dimL = 0) Then writeln ('--- Vector sin elementos ---')
    Else
        Begin
            ImprimirVector (v, dimL);
            ImprimirVectorRecursivo (v, dimL,i);
        End;
    writeln;
    writeln;
    cont := ContarCaracteres();
    writeln;
    writeln;
    writeln('Se ingresaron ',cont,' caracteres');
    writeln;
    writeln;
    CargarLista (l);
    writeln;
    writeln;
    If (l = Nil) Then writeln ('--- Lista sin elementos ---')
    Else
        Begin
            writeln ('--- Orden ingresado ---');
            writeln;
            ImprimirListaMismoOrden (l);
            writeln;
            writeln;
            writeln ('--- Orden inverso ---');
            writeln;
            ImprimirListaOrdenInverso (l);
        End;
End.
