
Program seis;
Procedure Decimal_Binario(n:int32);
Begin
    If (n>=2)Then
        Begin
            Decimal_Binario(n Div 2);
            write(n Mod 2);
        End
    Else
        write(n);
End;

Var 
    n:   int32;
Begin
    writeln('Ingrese un numero: ');
    readln(n);
    writeln('El numero en binario es: ');
    write('  ');
    Decimal_Binario(n);
End.
