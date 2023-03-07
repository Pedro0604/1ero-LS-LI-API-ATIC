
program untitled;
var
  x,y,z:integer;
BEGIN
  writeln('Introduzca 3 numeros');
  read(x);
  read(y);
  read(z);
  if (x>y)and(x>z)then
    begin
      if (y>z) then
        write (x,y,z)
      else
        write (x,z,y);
    end
  else if (y>x)and(y>z)then
    begin
      if (x>z) then
        write (y,x,z)
      else
        write (y,z,x);
    end
  else if (z>x)and(z>y)then
    begin
      if (x>y) then
        write (z,x,y)
      else
        write (z,y,x);
    end;

END.

