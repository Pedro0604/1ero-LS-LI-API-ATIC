
Program SpadariPedro;

Type 
    niveles =   1..4;

    infectado =   Record
        dni:   int32;
        nombre:   string[30];
        sint:   niveles;
        cod:   integer;
    End;

    arbol =   ^nodo;
    nodo =   Record
        dato:   infectado;
        hi,hd:   arbol;
    End;

    lista =   ^nodoL;
    nodoL =   Record
        dato:   infectado;
        sig:   lista;
    End;


Procedure CargarInfectado(Var i:infectado);
Begin
    i.dni := random(21);
    If (i.dni<>0)  Then
        Begin
            i.sint := random(4)+1;
            i.cod := random(11);
        End;
End;


Procedure AgregarNodo(Var a:arbol;i:infectado);
Begin
    If (a=Nil)Then
        Begin
            new(a);
            a^.hd := Nil;
            a^.hi := Nil;
            a^.dato := i;
        End
    Else If (i.dni<a^.dato.dni)Then
             AgregarNodo(a^.hi,i)
    Else
        AgregarNodo(a^.hd,i);
End;


Procedure Inciso1(Var a:arbol);

Var 
    i:   infectado;
Begin
    a := Nil;
    CargarInfectado(i);
    While (i.dni<>0) Do
        Begin
            AgregarNodo(a,i);
            CargarInfectado(i);
        End;
End;


Procedure ImprimirInfectado(i:infectado);
Begin
    writeln('  DNI: ',i.dni,'  Sintomas: ',i.sint,'  Ciudad: ',i.cod);
    writeln;
End;


Procedure ImprimirArbol(a:arbol);
Begin
    If (a<>Nil)Then
        Begin
            ImprimirArbol(a^.hi);
            ImprimirInfectado(a^.dato);
            ImprimirArbol(a^.hd);
        End;
End;


Procedure InfoMasAdulto(a:arbol;Var masAd:infectado);
Begin
    If (a<>Nil)Then
        Begin
            If (a^.hi=Nil)Then
                masAd := a^.dato
            Else
                InfoMasAdulto(a^.hi,masAd);
        End;
End;


Procedure Inciso2(a:arbol);

Var 
    masAd:   infectado;
Begin
    InfoMasAdulto(a,masAd);
    writeln('La informacion del infectado mas adulto es: ');
    ImprimirInfectado(masAd);
    writeln;
End;


Procedure AgregarAdelante(Var l:lista;i:infectado);

Var 
    nuevo:   lista;
Begin
    new(nuevo);
    nuevo^.dato := i;
    nuevo^.sig := l;
    l := nuevo;
End;


Procedure CrearLista(a:arbol;Var l:lista;cod:integer);
Begin
    If (a<>Nil)Then
        Begin
            CrearLista(a^.hi,l,cod);
            If (a^.dato.cod=cod)Then
                AgregarAdelante(l,a^.dato);
            CrearLista(a^.hd,l,cod);
        End;
End;


Procedure ImprimirLista(l:lista);
Begin
    While (l<>Nil) Do
        Begin
            ImprimirInfectado(l^.dato);
            l := l^.sig;
        End;
    writeln;
End;


Procedure Inciso3(a:arbol;Var l:lista);

Var 
    ciudCod:   integer;
Begin
    writeln('Ingrese un codigo de ciudad: ');
    readln(ciudCod);
    CrearLista(a,l,ciudCod);
    writeln;
    writeln('Lista de infectados de la ciudad de codigo ',ciudCod,': ');
    ImprimirLista(l);
End;



Var 
    a:   arbol;
    l:   lista;
Begin
    Randomize();
    Inciso1(a);
    writeln('Infectados:');
    ImprimirArbol(a);
    writeln;
    Inciso2(a);
    Inciso3(a,l);
End.
