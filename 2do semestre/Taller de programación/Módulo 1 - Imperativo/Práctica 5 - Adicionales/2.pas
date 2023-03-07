
Program punto2pr5;

Const 
    iniV =   2010;
    finV =   2018;

Type 
    anos =   iniV..finV;

    auto =   Record
        pat, modelo:   integer;
        ano:   anos;
        marca:   string[20];
    End;

    arbol =   ^nodo;

    nodo =   Record
        dato:   auto;
        hi,hd:   arbol;
    End;

    vector =   array[anos] Of arbol;

Procedure CrearMarca(Var n:String);

Var 
    i:   integer;
Begin
    i := random(7);
    Case i Of 
        0:
             n := 'Volkswagen';
        1:
             n := 'Renault';
        2:
             n := 'BMW';
        3:
             n := 'Audi';
        4:
             n := 'Ford';
        5:
             n := 'Chevrolret';
        6:
             n := 'Rolls Royce';
    End;
End;


Procedure CargarAuto(Var au:auto);
Begin
    au.pat := random(51);
    au.ano := random(9)+2010;
    CrearMarca(au.marca);
    au.modelo := random(11);
End;


Procedure CargarNodo(Var a:arbol;au:auto);
Begin
    If (a=Nil)Then
        Begin
            new(a);
            a^.hi := Nil;
            a^.hd := Nil;
            a^.dato := au;
        End
    Else If (au.pat<a^.dato.pat) Then
             CargarNodo(a^.hi,au)
    Else
        CargarNodo(a^.hd,au);
End;


Procedure CargarArbol(Var a:arbol);

Var 
    au:   auto;
Begin
    a := Nil;
    CargarAuto(au);
    While (au.pat<>0) Do
        Begin
            CargarNodo(a,au);
            CargarAuto(au);
        End;
End;


Procedure ImprimirAuto(au:auto);
Begin
    write('  Patente: ',au.pat);
    write('  Ano de fabricacion: ',au.ano);
    write('  Marca: ',au.marca);
    writeln('  Modelo: ',au.modelo);
End;


Procedure ImprimirArbol(a:arbol);
Begin
    If (a<>Nil) Then
        Begin
            ImprimirArbol(a^.hi);
            ImprimirAuto(a^.dato);
            ImprimirArbol(a^.hd);
        End;
End;


Function CantAutosMarca(a:arbol;marca:String):   integer;
Begin
    If (a<>Nil)Then
        Begin
            If (a^.dato.marca=marca)Then
                CantAutosMarca := CantAutosMarca(a^.hi,marca)+CantAutosMarca(a^.hd,marca)+1
            Else
                CantAutosMarca := CantAutosMarca(a^.hi,marca)+CantAutosMarca(a^.hd,marca);
        End
    Else
        CantAutosMarca := 0;
End;


Procedure InicializarVector(Var v:vector);

Var 
    i:   integer;
Begin
    For i:=iniV To finV Do
        Begin
            v[i] := Nil;
        End;
End;


Procedure CargarVector(a:arbol;Var v:vector);
Begin
    If (a<>Nil)Then
        Begin
            CargarVector(a^.hi,v);
            CargarNodo(v[a^.dato.ano],a^.dato);
            CargarVector(a^.hd,v);
        End;
End;


Procedure CrearVector(a:arbol;Var v:vector);
Begin
    InicializarVector(v);
    CargarVector(a,v);
End;


Procedure ImprimirVector(v:vector);

Var 
    i:   integer;
Begin
    For i:=iniV To finV Do
        Begin
            ImprimirArbol(v[i]);
        End;
End;


Procedure AnoPat(a:arbol;pat:integer;Var AnoDeLaPat:integer);
Begin
    If (a<>Nil)Then
        Begin
            AnoPat(a^.hi,pat,AnoDeLaPat);
            If (a^.dato.pat=pat)Then
                AnoDeLaPat := a^.dato.ano;
            AnoPat(a^.hd,pat,AnoDeLaPat);
        End
End;


Procedure Patente(a:arbol);

Var 
    pat, AnoDeLaPat:   integer;
Begin
    AnoDeLaPat := -1;
    writeln('Introduzca una patente: ');
    readln(pat);
    AnoPat(a,pat,AnoDeLaPat);
    If (AnoDeLaPat=-1) Then
        writeln('El auto con la patente ',pat,' no existe.')
    Else
        writeln('El ano de fabricacion del auto con la patente ',pat,' es: ',AnoDeLaPat,'.');
End;



Var 
    a:   arbol;
    marca:   String[20];
    v:   vector;
Begin
    Randomize();
    CargarArbol(a);
    If (a=Nil)Then
        writeln('El arbol esta vacio.')
    Else
        Begin
            writeln('Autos: ');
            ImprimirArbol(a);
            writeln;



{writeln('Introduzca una marca: ');
            readln(marca);
            writeln('La agencia posee ',CantAutosMarca(a,marca),' autos de la marca ',marca,'.');
            writeln;}
            readln;
            CrearVector(a,v);
            ImprimirVector(v);
            writeln;
            Patente(a);
        End;
End.
