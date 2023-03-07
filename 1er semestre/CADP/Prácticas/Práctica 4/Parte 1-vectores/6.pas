
Program sumador;

Type 
    num =   array[1..100] Of integer;
Procedure rellenar(Var num1:num);

Var 
    i:   integer;
Begin
    For i:=1 To 100 Do
        Begin
            num1[i] := random(1000);
            writeln('pos:',i,' ',num1[i]);
        End;
End;
Procedure maxMin(num1:num;Var posMax,posMin,max,min:integer);

Var 
    i:   integer;
Begin
    For i:=1 To 100 Do
        Begin
            If (num1[i]>max)Then
                Begin
                    posMax := i;
                    max := num1[i];
                End;
            If (num1[i]<min)Then
                Begin
                    posMin := i;
                    min := num1[i];
                End;
        End;
End;
Procedure intercambio(Var num1:num;posMax,posMin:integer);

Var 
    aux:   integer;
Begin
    aux := num1[posMax];
    num1[posMax] := num1[posMin];
    num1[posMin] := aux;
End;
Procedure leer(num1:num);

Var 
    i:   integer;
Begin
    For i:=1 To 100 Do
        writeln('pos:',i,' ',num1[i]);
End;

Var 
    num1:   num;
    max,min,posMin,posMax:   integer;
Begin
    max := -1;
    min := 32767;
    randomize();
    rellenar(num1);
    maxMin(num1,posMax,posMin,max,min);
    intercambio(num1,posMax,posMin);
    leer(num1);
    writeln('El elemento máximo ',max,' que se encontraba en la posición ',
            posMax,' fue intercambiado con el elemento mínimo ',min,
            ' que se encontraba en la posición ',posMin);
End.
