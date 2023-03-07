
Program prueba;

Type 
    arbol =   ^nodo;
    nodo =   Record
        dato:   integer;
        hi,hd:   arbol;
    End;

    listaNivel =   ^nodoLNivel;
    nodoLNivel =   Record
        info:   arbol;
        sig:   listaNivel;
    End;

    lista =   ^nodoL;
    nodoL =   Record
        dato:   integer;
        sig:   lista;
    End;

Procedure CargarNodo(Var a:arbol;n:integer);
Begin
    If (a=Nil)Then
        Begin
            new(a);
            a^.hi := Nil;
            a^.hd := Nil;
            a^.dato := n;
        End
    Else If (n<a^.dato)Then
             CargarNodo(a^.hi,n)
    Else
        CargarNodo(a^.hd,n);
End;



Procedure ImprimirArbol(a:arbol);
Begin
    If (a<>Nil)Then
        Begin
            ImprimirArbol(a^.hi);
            writeln('n:',a^.dato);
            ImprimirArbol(a^.hd);
        End;
End;


Procedure CargarArbol(Var a:arbol);

Var 
    n:   integer;
Begin
    a := Nil;
    n := random(1001);
    While (n<>0) Do
        Begin
            CargarNodo(a,n);
            n := random(1001);
        End;
    ImprimirArbol(a);
End;


Procedure RecorrerAlFinalIzq(Var a:arbol);
Begin
    If (a<>Nil)Then
        Begin
            If (a^.hi<>Nil)Then
                RecorrerAlFinalIzq(a^.hi);
        End;
End;


Procedure Eliminar(Var a:arbol;n:integer);

Var 
    aux,aux2:   arbol;
Begin
    If (a<>Nil)Then
        Begin
            If (n>a^.dato)Then
                Eliminar(a^.hd,n)
            Else If (n<a^.dato)Then
                     Eliminar(a^.hi,n)
            Else
                Begin
                    If (a^.hi=Nil)Then
                        Begin
                            aux := a;
                            a := a^.hd;
                            dispose(aux);
                        End
                    Else If (a^.hd=Nil)Then
                             Begin
                                 aux := a;
                                 a := a^.hi;
                                 dispose(aux);
                             End
                    Else
                        Begin
                            aux := a;
                            aux2 := a^.hi;
                            a := a^.hd;
                            dispose(aux);
                            aux := a;
                            RecorrerAlFinalIzq(aux);
                            aux^.hi := aux2;
                        End
                End;
        End;
End;


Function ContarElementos (l: listaNivel):   integer;

Var c:   integer;
Begin
    c := 0;
    While (l <> Nil) Do
        Begin
            c := c+1;
            l := l^.sig;
        End;
    contarElementos := c;
End;


Procedure AgregarAtras (Var l, ult: listaNivel; a:arbol);

Var nue:   listaNivel;

Begin
    new (nue);
    nue^.info := a;
    nue^.sig := Nil;
    If l= Nil Then l := nue
    Else ult^.sig := nue;
    ult := nue;
End;


Procedure Imprimirpornivel(a: arbol);

Var 
    l, aux, ult:   listaNivel;
    nivel, cant, i:   integer;
Begin
    l := Nil;
    If (a <> Nil)Then
        Begin
            nivel := 0;
            agregarAtras (l,ult,a);
            While (l<> Nil) Do
                Begin
                    nivel := nivel + 1;
                    cant := contarElementos(l);
                    write ('Nivel ', nivel, ': ');
                    For i:= 1 To cant Do
                        Begin
                            write (l^.info^.dato, ' - ');
                            If (l^.info^.HI <> Nil) Then agregarAtras (l,ult,l^.info^.HI);
                            If (l^.info^.HD <> Nil) Then agregarAtras (l,ult,l^.info^.HD);
                            aux := l;
                            l := l^.sig;
                            dispose (aux);
                        End;
                    writeln;
                End;
        End;
End;


Procedure BorrarElemento(Var a:arbol);

Var 
    n:   integer;
Begin
    writeln('El a borrar: ');
    readln(n);
    Eliminar(a,n);
    ImprimirArbol(a);
End;


Procedure InsertarOrdenado (Var l: lista; n: integer);

Var 
    ant, nue, act:   lista;
Begin
    new (nue);
    nue^.dato := n;
    act := l;
    ant := l;
    While (act <> Nil) And (act^.dato<n) Do
        Begin
            ant := act;
            act := act^.sig;
        End;
    If (ant = act) Then
        l := nue
    Else
        ant^.sig := nue;
    nue^.sig := act;
End;



Procedure ImprimirLista(a:lista);
Begin
    While (a<>Nil) Do
        Begin
            writeln('n:',a^.dato);
            a := a^.sig;
        End;
End;


Procedure CargarLista(Var a:lista);

Var 
    n:   integer;
Begin
    a := Nil;
    n := random(101);
    While (n<>0) Do
        Begin
            InsertarOrdenado(a,n);
            n := random(101);
        End;
    ImprimirLista(a);
End;



Var 
    a:   arbol;
    l:   lista;
Begin
    Randomize();
    {CargarArbol(a);
    BorrarElemento(a);
    Imprimirpornivel(a);}
    CargarLista(l);
End.
