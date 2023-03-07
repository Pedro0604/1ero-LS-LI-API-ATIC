
Program cuatro;

Const 
    dimF =   5;

Type 
    vector =   array[1..dimF] Of integer;


Procedure GenerarVector(Var v:vector; i:integer);
Begin
    If (i<=dimF)Then
        Begin
            v[i] := random(101);
            GenerarVector(v,i+1);
        End;
End;


Procedure ImprimirVector(v:vector);

Var 
    i:   integer;
Begin
    writeln('Vector:');
    For i:=1 To dimF Do
        write('  ',v[i]);
End;


Function Maximo(v:vector;i:integer):   integer;

Var 
    sig:   integer;
Begin
    If (i<dimF)Then
        Begin
            sig := Maximo(v,i+1);
            If (sig>v[i])Then
                Maximo := sig
            Else
                Maximo := v[i];
        End
    Else
        Maximo := v[i];
End;


Function suma(v:vector;i:integer):   integer;
Begin
    If (i<dimF)Then
        Begin
            suma := v[i] + suma(v,i+1);
        End
    Else
        suma := v[i];
End;



Var 
    v:   vector;
    i:   integer;

Begin
    Randomize();
    i := 1;
    GenerarVector(v,i);
    ImprimirVector(v);
    writeln;
    writeln('El valor maximo del vector es: ',Maximo(v,i));
    writeln('La suma de todos los valores del vector es de: ',suma(v,i));
End.
