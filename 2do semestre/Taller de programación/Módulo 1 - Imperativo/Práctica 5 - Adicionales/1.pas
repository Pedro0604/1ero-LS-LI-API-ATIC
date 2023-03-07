
Program punto1pr5;

Const 
    dimF =   300;

Type 

    oficina =   Record
        id,dni:   int32;
        valorExp:   real;
    End;

    vector =   array[1..dimF] Of oficina;

Procedure CargarOficina(Var o:oficina);
Begin
    {writeln('Ingrese el id de la oficina: ');
    readln(o.id);}
    o.id := random(302)-1;
    If (o.id<>-1)Then
        Begin
            {writeln('Ingrese el DNI del propietario: ');
            readln(o.dni);}
            o.dni := random(1001);
            {writeln('Ingrese el valor de las expensas: ');
            readln(o.valorExp);}
            o.valorExp := random(10001);
        End;
End;


Procedure CargarVector(Var v:vector;Var dimL:integer);

Var 
    o:   oficina;
Begin
    dimL := 0;
    CargarOficina(o);
    While (dimL<dimF) And (o.id<>-1) Do
        Begin
            dimL := dimL+1;
            v[dimL] := o;
            CargarOficina(o);
        End;
End;


Procedure ImprimirOficina(o:oficina);
Begin
    writeln('  Id de la oficina: ',o.id);
    writeln('  DNI del propietario: ',o.dni);
    writeln('  Valor de las expensas: ',o.valorExp:1:2);
    writeln;
End;


Procedure ImprimirVector(v:vector;dimL:integer);

Var 
    i:   integer;
Begin
    writeln('Oficinas: ');
    For i:=1 To dimL Do
        Begin
            ImprimirOficina(v[i]);
        End;
    writeln;
End;


Procedure OrdenarVector(Var v:vector;dimL:integer);

Var 
    i,j,p:   integer;
    item:   oficina;
Begin
    For i:=1 To dimL-1 Do
        Begin
            p := i;
            For j:=i+1 To dimL Do
                Begin
                    If (v[j].id<v[p].id)Then
                        p := j;
                End;
            item := v[p];
            v[p] := v[i];
            v[i] := item;
        End;
End;


Function BusquedaDicotomica(v:vector;dimL,id:integer):   boolean;

Var 
    ini,fin,medio:   integer;
Begin
    ini := 1;
    fin := dimL;
    medio := (ini+fin)Div 2;
    While (ini<=fin) And (v[medio].id<>id) Do
        Begin
            If (id<v[medio].id)Then
                fin := medio-1
            Else
                ini := medio+1;
            medio := (ini+fin)Div 2;
        End;
    BusquedaDicotomica := (v[medio].id=id);
End;


Function MontoTotalExpensas(v:vector;dimL:integer):   real;
Begin
    If (dimL>0)Then
        Begin
            MontoTotalExpensas := MontoTotalExpensas(v,dimL-1)+v[dimL].valorExp;
        End
    Else
        MontoTotalExpensas := 0;
End;



Var 
    v:   vector;
    dimL, id:   integer;
Begin
    Randomize();
    CargarVector(v,dimL);
    ImprimirVector(v,dimL);

    OrdenarVector(v,dimL);
    writeln('Vector ordenado: ');
    ImprimirVector(v,dimL);

    writeln('Ingrese un id para buscarlo: ');
    readln(id);
    If (BusquedaDicotomica(v,dimL,id))Then
        writeln('El id ',id,' se encuentra en el vector.')
    Else
        writeln('El id ',id,' no se encuentra en el vector.');
    writeln;

    writeln('El monto total de las expensas es de: ',MontoTotalExpensas(v,dimL):   1:   2,'.');
End.
