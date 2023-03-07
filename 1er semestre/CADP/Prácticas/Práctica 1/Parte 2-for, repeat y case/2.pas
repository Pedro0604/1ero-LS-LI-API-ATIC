program untitled;
var
  i, num,max: integer;
BEGIN
  max:=-9999;
  for i:=1 to 10 do
    begin
      read (num);
      if (num>max) then
        max:=num;
    end;
  writeln('El mayor numero leido fue el ',max);
END.
