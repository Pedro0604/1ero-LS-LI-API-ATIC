
Program dos;

Const 
    dimF =   300;

Type 
    oficina =   Record
        id:   integer;
        dni:   int32;
        exp:   real;
    End;
    vector =   array[1..dimF] Of oficina;

Procedure cargarOficina(Var o:oficina;Var i:int32);
Begin
    o.id := random(10000)-1;
    If o.id<>-1 Then
        Begin
            o.dni := random(49000000)+1000000;
            o.exp := random(9000)+1000;
        End;
End;

Procedure cargarVector(Var v:vector; Var dimL:int32);

Var 
    o:   oficina;
Begin
    dimL := 0;
    cargarOficina(o,dimL);
    While (dimL<dimF) And (o.id<>-1) Do
        Begin
            dimL := dimL+1;
            v[dimL] := o;
            cargarOficina(o,dimL);
        End;
End;

Procedure ImprimirVector (v: vector; dimL: int32);

Var 
    i:   integer;
Begin
    write ('         -');
    For i:= 1 To dimL Do
        write ('-----');
    writeln;
    write ('  Codigo:|    ');
    For i:= 1 To dimL Do
        Begin
            If (v[i].id <= 9) And (v[i].id>-1)Then
                write ('0');
            write(v[i].id, '    |   ');
        End;
    writeln;
    writeln;
    write ('     DNI:| ');
    For i:= 1 To dimL Do
        Begin
            If (v[i].dni <= 9)Then
                write ('0');
            write(v[i].dni, ' | ');
        End;
    writeln;
    writeln;
    write ('Expensas:| ');
    For i:= 1 To dimL Do
        Begin
            If (v[i].exp <= 9)Then
                write ('0');
            write(v[i].exp:1:2, '  | ');
        End;
    writeln;
    write ('         -');
    For i:= 1 To dimL Do
        write ('-----');
    writeln;
    writeln;

End;

Procedure OrdenarPorInsercion(Var v:vector;Var dimL:int32);

Var 
    i,j:   integer;
    o:   oficina;
Begin
    For i:=2 To dimL Do
        Begin
            o := v[i];
            j := i-1;
            While (j>0)And(o.id<v[j].id) Do
                Begin
                    v[j+1] := v[j];
                    j := j-1;
                End;
            v[j+1] := o;
        End;

End;

Procedure OrdenarPorSeleccion(Var v:vector;Var dimL:int32);

Var 
    i,j,p:   integer;
    o:   oficina;
Begin
    For i:=1 To dimL-1 Do
        Begin
            p := i;
            For j:=i To dimL Do
                Begin
                    If (v[p].id>v[j].id) Then
                        p := j;
                End;
            o := v[p];
            v[p] := v[i];
            v[i] := o;
        End;

End;

Var 
    v:   vector;
    dimL:   int32;
    car:   char;
Begin
    Randomize();
    cargarVector(v,dimL);
    ImprimirVector(v,dimL);
    writeln('i o s');
    readln(car);
    If car='i' Then
        Begin
            OrdenarPorInsercion(v,dimL);
            ImprimirVector(v,dimL);
        End
    Else
        Begin
            OrdenarPorSeleccion(v,diml);
            ImprimirVector(v,dimL);
        End;
End.
