program untitled;
var
  i, num, suma: integer;
BEGIN
  suma:=0;
  for i:=1 to 10 do
    begin
      read (num);
      suma:=suma+num;
    end;
  write('La suma de los 10 numeros es igual a: ',suma)
END.
