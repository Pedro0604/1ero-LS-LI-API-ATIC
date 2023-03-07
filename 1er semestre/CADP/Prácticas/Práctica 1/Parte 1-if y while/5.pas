program untitled;
var
  x,y,aux:real;
BEGIN
  writeln('Introduzca un numero');
  read(x);
  writeln('Introduzca otro numero');
  read(y);
  aux:=1;
  while (y<>2*x) and (aux<10) do
    begin
      read(y);
      aux:=aux+1;
    end;
END.

