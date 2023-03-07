
Program cinco;

Const 
    dimF =   20;

Type 
    indice =   -1..dimF;

    vector =   array[1..dimF] Of integer;


Procedure GenerarVector(Var v:vector; i:indice);
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


Procedure OrdenarVector(Var v:vector);

Var 
    i,j,p:   integer;
    item:   integer;
Begin
    For i:=1 To dimF-1 Do
        Begin
            p := i;
            For j:=i+1 To dimF Do
                Begin
                    If (v[j]<v[p]) Then
                        p := j;
                End;
            item := v[i];
            v[i] := v[p];
            v[p] := item;
        End;
End;


Procedure BusquedaDicotomica(v:vector; ini,fin:indice ;dato:integer ;Var pos:indice);
Begin
    If (ini<=fin)Then
        Begin
            If (dato=v[(ini+fin)Div 2]) Then
                pos := (ini+fin)Div 2;
            If (dato<v[(ini+fin)Div 2]) Then
                BusquedaDicotomica(v,ini,((ini+fin)Div 2)-1,dato,pos);
            If (dato>v[(ini+fin)Div 2]) Then
                BusquedaDicotomica(v,((ini+fin)Div 2)+1,fin,dato,pos);
        End
    Else
        pos := -1;
End;



Var 
    v:   vector;
    i,ini,fin,pos:   indice;
    dato:   integer;
Begin
    Randomize();
    i := 1;
    GenerarVector(v,i);
    ImprimirVector(v);
    writeln;
    OrdenarVector(v);
    ImprimirVector(v);
    writeln;
    ini := 1;
    fin := dimF;
    pos := -1;
    writeln('Ingrese un valor: ');
    readln(dato);
    writeln;
    BusquedaDicotomica(v,ini,fin,dato,pos);
    If (pos=-1) Then
        writeln('El valor no se encuentra en el vector.')
    Else
        writeln('El valor se encuentra en la posicion ',pos,' del vector.');
End.
