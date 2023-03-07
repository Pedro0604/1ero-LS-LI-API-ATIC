program diez;
  procedure digitos (num:integer;var cantD,suma:integer);
begin
  while (num<>0) do
    begin
      suma:=suma+num MOD 10;
      num:=num DIV 10;
      cantD:=cantD+1;
    end;
end;
var
  num,total,suma,cantD:integer;
begin
  total:=0;
  repeat
    suma:=0;
    cantD:=0;
    read(num);
    digitos(num,cantD,suma);
    total:=total+cantD;
  until (suma=10);
writeln(total);
end.
