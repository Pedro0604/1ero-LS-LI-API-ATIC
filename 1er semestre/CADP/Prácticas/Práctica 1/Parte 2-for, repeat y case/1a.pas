program untitled;
var
  i, num, suma,mayores: integer;
BEGIN
  mayores:=0;
  suma:=0;
  for i:=1 to 10 do
    begin
      read (num);
      suma:=suma+num;
      if num>5 then
        mayores:=mayores+1;
    end;
  writeln('La suma de los 10 numeros es igual a: ',suma,'.');
  write('Hubo ',mayores,' numeros mayores que 5','.');
END.
