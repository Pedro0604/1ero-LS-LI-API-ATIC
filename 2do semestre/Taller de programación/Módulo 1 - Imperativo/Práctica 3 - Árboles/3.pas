
Program tres;

Type 
    alumno =   Record
        legajo :   int32;
        dni :   int32;
        ingr :   integer;
    End;

    arbol =   ^nodo;

    nodo =   Record
        dato:   alumno;
        hi,hd:   arbol;
    End;


Procedure CargarAlumno(Var al:alumno);
Begin
    {writeln('Ingresar el ano de ingreso:');
    readln(al.ingr);}
    al.ingr := random(28)+1995;
    If (al.ingr<>1995) Then
        Begin
            {writeln('Ingresar el numero de legajo:');
            readln(al.legajo);}
            al.legajo := random(900001)+100000;
            {writeln('Ingresar el numero de dni:');
            readln(al.dni);}
            al.dni := random(25000000)+20000000;
        End;
End;


Procedure CargarNodo(Var a:arbol; al:alumno);
Begin
    If (a=Nil)Then
        Begin
            new(a);
            a^.hi := Nil;
            a^.hd := Nil;
            a^.dato := al;
        End
    Else If (al.legajo<a^.dato.legajo) Then
             CargarNodo(a^.hi,al)
    Else
        CargarNodo(a^.hd,al);
End;


Procedure ImprimirAlumno(al:alumno);
Begin
    write('  Legajo: ',al.legajo);
    write('  DNI: ',al.dni);
    writeln('  Ano de ingreso: ',al.ingr);
End;


Procedure CargarArbol(Var a:arbol);

Var 
    al:   alumno;
Begin
    a := Nil;
    CargarAlumno(al);
    While (al.ingr<>1995) Do
        Begin
            If (al.ingr>2010)Then
                Begin
                    CargarNodo(a,al);
                End;
            CargarAlumno(al);
        End;
End;


Procedure ImprimirArbol(a:arbol);
Begin
    If (a<>Nil) Then
        Begin
            ImprimirArbol(a^.hi);
            ImprimirAlumno(a^.dato);
            ImprimirArbol(a^.hd);
        End;
End;


Procedure ImprimirInferior(a:arbol;v1:int32);
Begin
    If (a<>Nil)Then
        Begin
            If (a^.dato.legajo<v1) Then
                Begin
                    ImprimirInferior(a^.hi,v1);
                    write('  DNI: ',a^.dato.dni);
                    writeln('  Ano de ingreso: ',a^.dato.ingr);
                    ImprimirInferior(a^.hd,v1);
                End
            Else
                Begin
                    ImprimirInferior(a^.hi,v1);
                End;
        End;
End;


Procedure LegajoInferior(a:arbol);

Var 
    v1:   int32;
Begin
    writeln('Ingrese un valor: ');
    readln(v1);
    writeln;
    writeln('Informacion de los legajos inferiores al valor ingresado: ');
    ImprimirInferior(a,v1);
    writeln;
End;


Procedure ImprimirEntreValores(a:arbol;v1,v2:int32);
Begin
    If (a<>Nil) Then
        Begin
            If (a^.dato.legajo>v1) And (a^.dato.legajo<v2) Then
                Begin
                    ImprimirEntreValores(a^.hi,v1,v2);
                    write('  DNI: ',a^.dato.dni);
                    writeln('  Ano de ingreso: ',a^.dato.ingr);
                    ImprimirEntreValores(a^.hd,v1,v2);
                End
            Else If (a^.dato.legajo<v1)Then
                     ImprimirEntreValores(a^.hd,v1,v2)
            Else If (a^.dato.legajo>v2) Then
                     ImprimirEntreValores(a^.hi,v1,v2);
        End;
End;


Procedure LegajoEntreValores(a:arbol);

Var 
    v1,v2:   int32;
Begin
    writeln('Ingrese un limite inferior: ');
    readln(v1);
    writeln('Ingrese un limite superior: ');
    readln(v2);
    writeln;
    writeln('Informacion de los legajos entre ambos valores: ');
    ImprimirEntreValores(a,v1,v2);
    writeln;
End;


Function Maximo(a,b:int32):   int32;
Begin
    If (a>b)Then
        Maximo := a
    Else
        Maximo := b;
End;


Function MayorDNI(a:arbol):   int32;
Begin
    If (a<>Nil)Then
        Begin
            MayorDNI := Maximo(Maximo(MayorDNI(a^.hi),MayorDNI(a^.hd)),a^.dato.dni);
        End
    Else
        MayorDNI := -1;
End;


Function EsImpar(a:arbol):   integer;
Begin
    If ((a^.dato.legajo Mod 2)=1)Then
        EsImpar := 1
    Else
        EsImpar := 0;
End;


Function cantAlLegImp(a:arbol):   integer;
Begin
    If (a<>Nil)Then
        Begin
            cantAlLegImp := EsImpar(a)+cantAlLegImp(a^.hi)+cantAlLegImp(a^.hd);
        End
    Else
        cantAlLegImp := 0;
End;



Var 
    a:   arbol;
Begin
    Randomize();
    CargarArbol(a);
    If (a=Nil)Then
        writeln('El arbol esta vacio.')
    Else
        Begin
            writeln('Alumnos: ');
            ImprimirArbol(a);
            writeln;
            {LegajoInferior(a);
            LegajoEntreValores(a);}
            writeln('El DNI mas grande es: ',MayorDNI(a),'.');
            writeln;
            writeln('La cantidad de alumnos con legajo impar es de: ',cantAlLegImp(a));
            writeln;
        End;
End.
