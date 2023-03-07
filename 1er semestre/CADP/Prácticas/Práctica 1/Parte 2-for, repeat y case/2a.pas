program untitled;
var
  i, num,max,orden: integer;
BEGIN
  max:=-9999;
  for i:=1 to 10 do
    begin
      read (num);
      if (num>max) then
        begin
          max:=num;
          orden:=i;
        end;
    end;
  writeln('El mayor numero leido fue el ',max,' que estaba ubicado en la posicion numero ',orden);
END.
