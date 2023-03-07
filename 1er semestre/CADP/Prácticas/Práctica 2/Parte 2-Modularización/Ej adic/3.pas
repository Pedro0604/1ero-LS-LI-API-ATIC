program Hello;
type
  codigos=1..200;
procedure minMax(codigo:codigos;precio:integer;var CB1,CB2:codigos;var min1,min2:integer);
begin
  if (precio<min1) then begin
    min2:=min1;
    min1:=precio;
    CB2:=CB1;
    CB1:=codigo;
  end
  else if (precio<min2) then begin
    min2:=precio;
    CB2:=codigo;
  end;
end;
var
  codigo,CB1,CB2:codigos;
  precio,i,min1,min2,cantP16Par:integer;
begin
  cantP16Par:=0;
  min1:=32000;
  min2:=32000;
  for i:=1 to 200 do begin
    read(codigo);
    read(precio);
    minMax(codigo,precio,CB1,CB2,min1,min2);
    if (precio>16) and (codigo mod 2=0) then
      cantP16Par:=cantP16Par+1;
  end;
  writeln('Los codigos de los dos productos mas baratos son: ',CB1,' y ',CB2);
  writeln('La cantidad de productos de mas de 16 pesos con codigo par es de: ',cantP16Par);
end.
