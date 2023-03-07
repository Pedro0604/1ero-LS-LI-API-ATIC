
Program tres;

Type 
    lista =   ^nodo;

    nodo =   Record
        dato:   integer;
        sig:   lista;
    End;


Procedure GenerarLista(Var l:lista);

Var 
    nuevo:   lista;
Begin
    new(nuevo);
    nuevo^.dato := random(101);
    nuevo^.sig := Nil;
    If (nuevo^.dato<>0) Then
        Begin
            If (l<>Nil)Then
                nuevo^.sig := l;
            l := nuevo;
            GenerarLista(l^.sig);
        End;
End;


Procedure ImprimirLista(l:lista);
Begin
    writeln('Lista:');
    While (l<>Nil) Do
        Begin
            write(' ',l^.dato,' ');
            l := l^.sig;
        End;
End;


Function Minimo(a,b:integer):   integer;
Begin
    If (a<b)Then
        Minimo := a
    Else
        Minimo := b;
End;


Function ValorMin(l:lista):   integer;
Begin
    If (l<>Nil)Then
        Begin
            ValorMin := Minimo((ValorMin(l^.sig)),l^.dato);
        End
    Else
        ValorMin := 9999;
End;


Function Maximo(a,b:integer):   integer;
Begin
    If (a>b)Then
        Maximo := a
    Else
        Maximo := b;
End;


Function ValorMax(l:lista):   integer;
Begin
    If (l<>Nil)Then
        Begin
            ValorMax := Maximo((ValorMax(l^.sig)),l^.dato);
        End
    Else
        ValorMax := -1;
End;


Function EstaEnLaLista(l:lista;n:integer):   boolean;
Begin
    If (l<>Nil) Then
        EstaEnLaLista := (EstaEnLaLista(l^.sig,n)) Or (n=l^.dato)
    Else
        EstaEnLaLista := false;
End;



Var 
    l:   lista;
    n :   integer;
Begin
    Randomize();
    l := Nil;
    GenerarLista(l);
    If (l=Nil) Then
        writeln('La lista esta vacia.')
    Else
        Begin
            writeln;
            ImprimirLista(l);
            writeln;
            writeln;
            writeln('El valor minimo de la lista es: ',ValorMin(l),'.');
            writeln;
            writeln('El valor maximo de la lista es: ',ValorMax(l),'.');
            writeln;
            writeln('Introduzca un valor: ');
            readln(n);
            If (EstaEnLaLista(l,n)) Then
                writeln('El valor ',n,' esta en la lista.')
            Else
                writeln('El valor ',n,' no esta en la lista.');
        End;
End.
