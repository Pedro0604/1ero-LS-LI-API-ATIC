program untitled;
var
  num,min1,min2:integer;
BEGIN
  min1:=30000;
  min2:=30000;
  read(num);
  while (num<>0) do
    begin
      if (num<min1) and (min2<=min1) then
          min1:=num
      else if (num<min2) then
        min2:=num;
        read(num);
    end;
  write('Los dos numeros minimos leidos fueron el ',min1,' y el ',min2);
END.

