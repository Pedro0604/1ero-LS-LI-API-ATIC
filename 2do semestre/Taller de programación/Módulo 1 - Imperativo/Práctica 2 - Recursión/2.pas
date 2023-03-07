
Program dos;

Procedure ImprimirDigitos(n:integer);

Var 
    dig:   integer;
Begin
    If (n<>0) Then
        Begin
            dig := n Mod 10;
            ImprimirDigitos(n Div 10);
            write(' ',dig);
        End;
End;

Var 
    n:   integer;
Begin
    writeln('Introduzca un numero: ');
    readln(n);
    While (n<>0) Do
        Begin
            writeln;
            writeln('Digitos del numero ',n,': ');
            ImprimirDigitos(n);
            writeln;
            writeln('Introduzca un numero: ');
            readln(n);
        End;
End.
