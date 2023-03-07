program untitled;
var
  x,y:real;
BEGIN
  writeln('Introduzca un numero');
  read(x);
  writeln('Introduzca otro numero');
  read(y);
  while (y<>2*x) do
    read(y);
END.
