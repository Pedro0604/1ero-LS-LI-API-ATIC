
Program punto1pr4;

Const 
    dimF =   12;

Type 
    dias =   1..31;
    meses =   1..12;

    prestamo =   Record
        isbn,num,cant:   integer;
        dia:   dias;
        mes:   meses;
    End;

    acumulador =   Record
        isbn,cantTotal:   integer;
    End;

    lista =   ^nodo;

    nodo =   Record
        dato:   prestamo;
        sig:   lista;
    End;

    listaAcumulada =   ^nodoAcumulado;

    nodoAcumulado =   Record
        dato:   acumulador;
        sig:   listaAcumulada;
    End;


    vector =   array[meses] Of lista;


Procedure InicializarListas(Var v:vector);

Var 
    i:   integer;
Begin
    For i:=1 To dimF Do
        Begin
            v[i] := Nil;
        End;
End;


Procedure CargarPrestamo(Var p:prestamo);
Begin
 {writeln('Ingrese el ISBN: ');
	readln(p.isbn);}
    p.isbn := random(102)-1;
    If (p.isbn<>-1)Then
        Begin
{writeln('Ingrese el numero de socio: ');
		readln(p.num);}
            p.num := random(100)+1;
  {writeln('Ingrese el dia: ');
		readln(p.dia);
		writeln('Ingrese el mes: ');
		readln(p.mes);}
            p.mes := random(12)+1;
  {writeln('Ingrese la cantidad de dias del prestamo: ');
		readln(p.cant);
        p.cant := random(30)+1;}
        End;
End;


Procedure InsertarOrdenado(Var l:lista;nuevo:lista);

Var 
    ant,act:   lista;
Begin
    ant := l;
    act := l;

    While (act<>Nil) And (act^.dato.isbn<nuevo^.dato.isbn) Do
        Begin
            ant := act;
            act := act^.sig;
        End;

    If (act=ant)Then
        l := nuevo
    Else
        ant^.sig := nuevo;
    nuevo^.sig := act;
End;


Procedure CargarListas(Var v:vector;p:prestamo);

Var 
    nuevo:   lista;
Begin
    new(nuevo);
    nuevo^.sig := Nil;
    nuevo^.dato := p;
    InsertarOrdenado(v[p.mes],nuevo);
End;


Procedure CargarVector(Var v:vector);

Var 
    p:   prestamo;
Begin
    InicializarListas(v);
    CargarPrestamo(p);
    While (p.isbn<>-1) Do
        Begin
            CargarListas(v,p);
            CargarPrestamo(p);
        End;
End;


Procedure ImprimirPrestamo(p:prestamo);
Begin
    write('    ISBN: ',p.isbn);
    writeln('  Numero de socio: ',p.num);
 {write('  Cantidad de dias del prestamo: ',p.cant);
	write('  Dia: ',p.dia);
	writeln('  Mes:',p.mes);}
End;


Procedure ImprimirLista(l:lista);
Begin
    If (l<>Nil)Then
        Begin
            ImprimirPrestamo(l^.dato);
            ImprimirLista(l^.sig);
        End;
End;


Procedure ImprimirVector(v:vector);

Var 
    i:   integer;
Begin
    writeln('Listas: ');
    For i:=1 To dimF Do
        Begin
            writeln('  Lista del mes ',i,': ');
            If (v[i]=Nil)Then
                Begin
                    writeln('    La lista esta vacia.');
                    writeln;
                End
            Else
                Begin
                    ImprimirLista(v[i]);
                    writeln;
                End;
        End;
End;


Function ListasVacias(v:vector):   boolean;

Var 
    i:   integer;
Begin
    For i:=1 To dimF Do
        Begin
            If (v[i]<>Nil)Then
                ListasVacias := false;
        End;
End;


Procedure AgregarAtras(Var pri,ult:lista;nuevo:lista);
Begin
    If (pri=Nil)Then
        Begin
            pri := nuevo;
        End
    Else
        Begin
            ult^.sig := nuevo;
        End;
    ult := nuevo;
End;


Procedure CargarListaMerge(Var pri,ult,l:lista);

Var 
    nuevo:   lista;
Begin
    new(nuevo);
    nuevo^.sig := Nil;
    nuevo^.dato := l^.dato;
    AgregarAtras(pri,ult,nuevo);
    l := l^.sig;
End;


Function Minimo(v:vector):   integer;

Var 
    i,min,listaMin:   integer;
Begin
    min := 9999;
    For i:=1 To dimF Do
        Begin
            If (v[i]<>Nil) And (v[i]^.dato.isbn<min)Then
                Begin
                    min := v[i]^.dato.isbn;
                    listaMin := i;
                End;
        End;
    Minimo := listaMin;
End;


Procedure Merge(v:vector;Var l:lista);

Var 
    ult:   lista;
Begin
    l := Nil;
    While Not(ListasVacias(v)) Do
        Begin
            CargarListaMerge(l,ult,v[Minimo(v)]);
        End;
End;


Procedure AgregarAtrasAcumulada(Var pri,ult:listaAcumulada;nuevo:listaAcumulada);
Begin
    If (pri=Nil)Then
        Begin
            pri := nuevo;
        End
    Else
        Begin
            ult^.sig := nuevo;
        End;
    ult := nuevo;
End;



Procedure CargarListaAcumulada(Var pri,ult:listaAcumulada;Var isbnActual:integer;cantTotal:integer);

Var 
    nuevo:   listaAcumulada;
Begin
    new(nuevo);
    nuevo^.sig := Nil;
    nuevo^.dato.isbn := isbnActual;
    nuevo^.dato.cantTotal := cantTotal;
    AgregarAtrasAcumulada(pri,ult,nuevo);
End;


Procedure CorteDeControlListaAcumulada(Var v:vector;Var l,ult:listaAcumulada);

Var 
    isbnActual,cantTotal,min:   integer;
Begin
    cantTotal := 0;
    min := Minimo(v);
    isbnActual := v[min]^.dato.isbn;
    While Not(ListasVacias(v)) And (v[min]^.dato.isbn=isbnActual) Do
        Begin
            v[min] := v[min]^.sig;
            cantTotal := cantTotal+1;
            min := Minimo(v);
        End;
    CargarListaAcumulada(l,ult,isbnActual,cantTotal);
End;

Procedure MergeAcumulador(v:vector;Var l:listaAcumulada);

Var 
    ult:   listaAcumulada;
Begin
    l := Nil;
    While Not(ListasVacias(v)) Do
        Begin
            CorteDeControlListaAcumulada(v,l,ult);
        End;
End;


Procedure ImprimirCantidadDePrestamos(a:acumulador);
Begin
    write('    ISBN: ',a.isbn);
    writeln('  Cantidad total de prestamos: ',a.cantTotal);
End;


Procedure ImprimirListaAcumulada (l:listaAcumulada);
Begin
    If (l<>Nil) Then
        Begin
            ImprimirCantidadDePrestamos(l^.dato);
            ImprimirListaAcumulada(l^.sig);
        End;
End;

Var 
    v:   vector;
    l:   lista;
    lAcumulada:   listaAcumulada;
Begin
    Randomize();
    CargarVector(v);
    ImprimirVector(v);
    Merge(v,l);
    writeln('Lista de todos los meses: ');
    ImprimirLista(l);
    writeln;
    MergeAcumulador(v,lAcumulada);
    writeln('Lista de todos los meses acumulada: ');
    ImprimirListaAcumulada(lAcumulada);
End.
